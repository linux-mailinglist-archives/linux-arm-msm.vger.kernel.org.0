Return-Path: <linux-arm-msm+bounces-115711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rcj3My4WRWr+6goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:29:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 458336EE1DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:29:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pb8ZsrfQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Mb3MRnSS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115711-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115711-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2929230A15CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB7F481FA2;
	Wed,  1 Jul 2026 13:22:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066BF481253
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:22:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912133; cv=none; b=kimBbSfpRrjGpY+rh+LZgUMXmYMmDU9Yqw9ifpS7rPhwwkYm7/njQ7i9sXLa8YH2bgTZcwFToQHiLdnNoOBEzKncwTZ/qzkQFeuPGjdYHw6PJp96bo1QQeIS0+0xtByTCZTBgYMDXRALprTpL4zuxgfTUQVgQIpIdwI7dBWjh5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912133; c=relaxed/simple;
	bh=fC6o33yVMtcIYR9TGEh2aBJOZuz3UTNnUSTzAlE4OAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soGN+qI7F6yKH0C1hW5XDIslQfgr7stobjkot6EOD3hcsL7QtIAxYNBKolKc/n+KRwqKEY53Q01dMt0S4K4g9fJutyARR4usALQKW1noG1yvkcKRPvhLjcL27kxV42KLv+tkG+r9W4ZlJVVQZOZqdmIRCGjkKfaftRYqDAW7IAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb8ZsrfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mb3MRnSS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9KI8722675
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EtLGdtoQuRHwGrQtERVgenV97LkHCFN0PODLn7CO1Q=; b=pb8ZsrfQ4g1e5br5
	/GWLrG34NMoDh8m7JyLzyPmPcO0D641l3uzdS9TZCUuIWVSv9bdJ0m6VrDZbv946
	FwF0J2RiXr1BrptUz0SNmKELGXRPX18v2k6Xb6lXp6SBhaxuHo3V67bey+B/tTEq
	+1egNH66jSwUyxPkmgnBA+mQ9mC76/3MXID/rRREh+c9NJVEu57FzT075wcOxIk+
	t5x6TQfQKzG2ytsfHVV7+J9xMZtkJM/uR2KV2CrR0084UmNOcHiWgyAH/PsdqyrQ
	/vrQKRCKL11Ixxvoken/SIDiP2w+XQyBlBBqDyHHhXQxSR8B+LnX/Q9YSGvnpxDu
	q5zPRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwc8h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:22:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so1327851cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912130; x=1783516930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EtLGdtoQuRHwGrQtERVgenV97LkHCFN0PODLn7CO1Q=;
        b=Mb3MRnSSZnyANNeis4SfC3lWlMaX3YVdLC1vedItZEK4ILlMjPyaXVNUveKl2o3x7d
         H8SRnHhcOS+N9Bsd1NNKqUtqi0+y4euQ1hQpXUy4e469nB/bp3N3gBtYPc7jVHnvElwO
         hzyAYzyxWvsqY9bqo5H5kUZ1I5Ii+9zwO+qPRmOKTx6mEDGv0a/PiHdHJAE4DzzgWmus
         JNbs8o+ChRG+//UrxNetnYmOEBFciz8Ix0cHQESTgioUXDfxLHKVVIgBsgd2X6iRywG6
         G+GvMX6DBnhhC2vnalCWEq671IGvYn4H1teYg7iBTc7tzLW0pCJrLJsHsmiJdD6g0TB7
         DCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912130; x=1783516930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EtLGdtoQuRHwGrQtERVgenV97LkHCFN0PODLn7CO1Q=;
        b=Qljjgd602g6/ki/dPPUETSzEgwpZ5adaP1HnBe20GmFqcwirIiw5VqdsUXTBQHCea0
         bEebwra5dy+WbcoBgPSA4KHTSYEzS8kYWK5Ye79+vLGM+6y2G/hWQt0UetDvLlcCow+8
         ge2V5EeamLs4E+1GNOs5Vb+/W8NF8ccPTTUCUuEFs/dVKEEalSdtndtMNwASZAAyVZFm
         FEXp6DS9njn120O6UC9uJORXg0/OAqYKQl/0xVKsJ0pr7//ucKnUrb8weQ/hx+yMTv07
         yZG6/c0QP2HwOlnT3PT/Qs0sr6fi688zpqbdJOjiU/sah7mMYoGf9YmvyuuEDPYjgJ84
         bD5A==
X-Forwarded-Encrypted: i=1; AFNElJ9E3lQH3y6N4D8dRlInEKcTuv6H/6rx04ozCmCfHeEWzuCCWesnT16d4lWuu78CfpXq99UvzkQn414dsnEo@vger.kernel.org
X-Gm-Message-State: AOJu0YxgzMOEUDi81CY5dxv0faFH9vKcy67CCxgIi9taJiB2j46BNkJP
	FoKdVjkrOmeH16cwgA5uHqGEisZcqW+A06F746W7w5ZXwcfvOhuZju6Npv2tSyWzGhu4Rmfhzcm
	nhxYDZZPQfAd3ElKblPinpnr8A2Bvh14bFTi2cQSjwV+f3IuMT3u5NyYsULQfM14N8S8acWXhrg
	q1
X-Gm-Gg: AfdE7cmU+wBN+VgSWD/GWoqfiS/YSc+YaVK5mrHVzt8IIFJXdtMXusG+zVmMQqqV71m
	XJMJRLRlLRJ82z/FFGH3qvUAurX360/8wFxKw2h5mOcAiS6q6w+tzHirv6TV4WaYHip1cbC5o+g
	ggUIRGz1LI9D73q+sZCRy+Y2YmnT7GCJq4rcO0ouxSR7ZmCDmhOI/c8OlBQkkcGw092hQJHd57d
	GGBOu7UvgEyIqrZBd0UhakwdgaDPa17yskGSu3iwp19ghRAjsjIKNS++iSqK/ph7nzt7eW+F9WX
	3ldgUmBA3q1nSH1pISOUlgSvIVmD/YBEP8FWr2RMOUYWLooLHE33mjsH6ktSCqL477fctQfXGpD
	U/UosLzKRwT7Fz2vYu9E8FkpVsIxuUxXHzdQ=
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr13436131cf.1.1782912130354;
        Wed, 01 Jul 2026 06:22:10 -0700 (PDT)
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr13435061cf.1.1782912129446;
        Wed, 01 Jul 2026 06:22:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288dbf4b4sm274203066b.28.2026.07.01.06.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:22:08 -0700 (PDT)
Message-ID: <2d0d3df1-31ae-439e-9970-f7d3f589754b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:22:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as
 critical
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-1-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-1-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1S7l2zJyxXqScg0daAaMq8XsuntbIDhV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX6OqrYN92Ivxp
 U+SW177KNWh5+ZilhGqYO0z+7FV6UKPtIIb/KAlgYUxZUgmwwmxc9kGnypya0oTYVyekVqjYaYj
 /69YXa/m1TL+J1YjG5EWQL5pxQdjXTk=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a451483 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=te8iVueUN0VzZH6eLK0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 1S7l2zJyxXqScg0daAaMq8XsuntbIDhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX10gEuwyHLzF7
 GgXlfk0z8Vd/2OItdbsdayhnARjClfPBswyEtMNcyp4tXk/zNp9/85kVN8Ix02c2OzNNlwvZVG2
 AkLF1QBnHQwhhHYas26t2/Q3zsi6EHaxAYwdyqqKnW1FoBpsJZvFL19w9F/wb+yMptGwQxx8YP5
 l5bMlJGPxwPcm9R982onh+Q9jYIdI7uf0DKE5srQonD9VyQN6xv6Jvn+9lFb210u5sOj113syfM
 7ia/oidDdvqAGWdg81TXG8nH2L0wUuImLqgE/qcSgIiztGcCvxu1GgyGzqfl65h5pIvaxfn/qVV
 npA5M/WtIHGmGpZ/MzxN7vjbPRphS90BMqfbyjA0R4zcHPtnujtfzLwd2bSWBy+R1jjRHeoGS5a
 Qa0QD9dDcqcvIe0rk3EnTygg0hfSg7nq4D0vi4DOsjKAtp7CNQ5GrKuBcNi78XGCe3UpRE+AOmd
 rZcl1tMs4ODK4ApA1Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115711-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 458336EE1DF

On 6/23/26 12:54 PM, Taniya Das wrote:
> The PCIe link AHB and XO clocks must remain enabled for proper
> operation. Representing them as clk_branch instances allows them
> to be gated, which is undesirable.
> 
> Remove their clk_branch definitions and register their CBCRs as
> critical clocks instead so they remain enabled.
> 
> This matches the handling of similar always-on clocks in other
> Qualcomm clock drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

