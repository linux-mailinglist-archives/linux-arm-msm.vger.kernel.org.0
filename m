Return-Path: <linux-arm-msm+bounces-104464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O/+NQph62kuMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:24:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33A45E666
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 129F5300D871
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D723C8730;
	Fri, 24 Apr 2026 12:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQM1R4m1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKFPnSmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EAB3C5553
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033406; cv=none; b=SOZP+7DZ71qS21FkPYQLF3vyWo8WdCwNw4Fs/TyJzdzQZuYvDqjuNPa3+f8JBANBE8yIk88dMHACMJ9SDGPplcAZa0tsgpTQyIwPhZ3is3py5GHdKbbe44KfKUiRxFlYApk65bXH9SFsdrXq/Vb2WzxZEU0ORm1P/WsTQiPYxgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033406; c=relaxed/simple;
	bh=dVnzfYNahGsZdHPE4ZftptE+eRQBcaAuFjN3VuEZhOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvxNmDcHUAzJJ59z9TOQi5X+90NsiBTaxDCazqPnr+WkLekpB8/hJR74/JRkY1mrRLhHF6IVoCp7cPDI1CwuEvxeuzPB6M3rI5a4i0YQe3YIFVaxKp8kP6HREQW95oVHo7PrR3AefS8iZCwTV1og6wFH9a3fZFf040Zz04hnUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQM1R4m1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKFPnSmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8ueci2710093
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WKQIL/F651Mu/H5x/G1OQMhd42jvhidBmjzn4/OISw=; b=fQM1R4m1ZklHAzh2
	4LXb7NF1Krk4HpQ50F/K1sFunMWzc7xw/XbB7r0VsIey881YD9DhM3dpKo+TyS2h
	4/hU0KlX84MPFSjWGrP+Vq/FUiFcg4X2WLZxd71BycjsvG88OEqQu9mHQIguKdRj
	Jr2fS6WDKJeLHrBQpMlZeRpZUADG6fvHssCFGW/l1UAOLwiiTkr2V0olsSEnIbZO
	rKA0bcF+PpmStJXDZ726Ukxe0N1RPXii/2rA1iTbKU5r/5QoFPF44A+DEi9ttU5o
	/FQRmP8i2Rlzli+SK1tF0y1f4KAjTV2SFV8cD7xUeqqndi28iNofyZChS5ibBftK
	BYtnXA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9v633-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:23:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b026c4497fso15893606d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033403; x=1777638203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WKQIL/F651Mu/H5x/G1OQMhd42jvhidBmjzn4/OISw=;
        b=DKFPnSmx0qsa7Ry8jbbXuN51JFQA0I6beZB+ehe+NtT4L9s3rRM7tbkUrf4d1HyoeJ
         vHwaS562/qnIU68/X4yOS1B1/E2GiOg2e+3kh6pl3Axyo/1XI3/w1LotVJJiP5XyNX0d
         QckcRkTPQE7hsclmx1QX4sxo0VbQAa/oHqU+EtrMF23gSby6nj/POr5fMVRsG+h9LUjg
         XRagTHubtJBctz70pgI9Jy7n/r4SUm+02Xh3hgvugouf41ne3WrUOmx6+tWiK0YGdp1w
         okMR0+b8pxDQvcwd+/tFmdiSlIA8yruvWL+FZaGdPtu5fELHR6H8fGgSen/L6r5tzEbd
         Qufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033403; x=1777638203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WKQIL/F651Mu/H5x/G1OQMhd42jvhidBmjzn4/OISw=;
        b=ntBDClapX+4V5nqb6omwmaW3AuxMD4k384LbSwXyKxqM1S8cZFWF9uN/QhMO8SGlUN
         Ntwg8cnPozNPsiV+vm5ICqF0DVreUzkV7MaawRJBb/dIT9akBgVrzbsQVtJDTiANPNjm
         n8OXLpHcAYQ5bE3n2uYC9CHtTdBJNhBQaFjKvARyxlyaAWOoIWG/qZJ5jnkR77sM+J0N
         MirPDH2hrWeVdhXWmRdgqsIBWJjDAKQ9yviUruw3hX3cTvu26wP6RZ9HK6hsdhisJCth
         ZPQ5XQO5rXCAbm/irlwy5l8RUwP/eGXDTei1mDmcgbWAziwbyrIhbCDCBPAHQqDJtdmT
         HiQA==
X-Gm-Message-State: AOJu0YzKWJa8w0nooxrMPvWZEqdz+ia20ogzkjLQLO5P+WKAiW5++5hk
	d5ShlDUJ1svVKvjkSXzW0HKrIzL0oKBs5tvMCC15XXes+EPMCAxkh3EvGckusV1Wnk7U8HC/T3L
	WwJHzX/7nJ4uj3iNqRVto3PAs8+kXd42lU/jUzQD5HpXQZY+FUecEZlewgav5EibFXuyE
X-Gm-Gg: AeBDieuGKn3paOvnkeLGHsdpCT4+D/uNMCFpJ+/1I0Ci5jj2jyVJaWRojlFcEXtIv+O
	KVGcei1RePloRWIvzWFpBLUcp/+e0GiocFP82xRWqYFeLGp1CyJjK82+oWbBWvwfff3jAR1x5w2
	UjDNxAOnUBgDR8VcwdGcQZTnkAVwm8/SXzgahp2z4O1Pj8WxG1zS+DJxrG3RflSAgSOtKViq/5j
	MYzC3B/jxjQYUOHJ/TUxPp/8A2B0Zrh8i2rwpgcc1h9CGGxA1hub3RLW2EJMOqbJId13r6Uziv5
	UFVoaKj0ijlcRUexxzPLyDA8+BUBG5e/lKlEplUaB6vpYdkl9N/gpGyfKamNJr5ZHii5QUxlClZ
	V7DqDITkdO8Vc8JJOnWJtYyFmC48YVjyAK8CWbu4aKxN4mz1ktleUzV67W3n8wXZvurkDRmoWRm
	kc6dOsEdRh+0G+GA==
X-Received: by 2002:a05:6214:1c05:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8b02818faafmr337500016d6.3.1777033403170;
        Fri, 24 Apr 2026 05:23:23 -0700 (PDT)
X-Received: by 2002:a05:6214:1c05:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8b02818faafmr337499686d6.3.1777033402670;
        Fri, 24 Apr 2026 05:23:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046429sm768141366b.50.2026.04.24.05.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:23:21 -0700 (PDT)
Message-ID: <e3702cc0-4a42-476a-bdf1-6d984e8ad7c8@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:23:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Align
 reserved-memory with latest firmware map
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-9-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-9-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tkc-yrmZ8VKklfTH5bdW_s_5z3kHOpvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfXwOqLo05X6Xzi
 3XPLLKJpnHcoAYQQFCENH8v5NaS4CzUe/xh1r1JY0f8zffm+5PpXs4FaGmpI6TEWTJ9ErhWe2p1
 Gi3CiOkwGVvlgjSygM28S/SiNHz1f5qxq2rc03CNK0axEfkFg4JUdQcB6f703frypwPpQ02DjOU
 xxnHWj1KXvzBQIv6J5Aw1UeDxcaCEH2kflJZkx0PUHB0bO//LDnujMu/H/AwqZwzmIRfFaXYrPu
 YqQpkEdWQLKWfQc0wIQcZCIXFO7jvaX4vI5/xs9M8zPicuSLNkoELRBgf9Ld3SlqUtQyAbJWBI8
 oMv9N63kZTQ4Vq7SPoWEGKppgD9S0ofkOstxXMw6Y8MCVpPnrSd1HRPWgFidlrGwUkXoNx6vs8f
 NRVb8m79EBH4q2Ax3HSFtmWf9WdxfWOVj5yrRdf2ebAImqd1+gyIzUyMumTaAbmo+d+4Qe5JGgl
 aVvov4vI9N3PWGXnk1A==
X-Proofpoint-ORIG-GUID: tkc-yrmZ8VKklfTH5bdW_s_5z3kHOpvD
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb60bb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ksxQWNrZAAAA:8 a=IrLN4Iwa3TR8ocU_hn0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240117
X-Rspamd-Queue-Id: 3E33A45E666
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104464-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[radxa.com,kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/7/26 5:20 PM, Xilin Wu wrote:
> The current board DTS no longer matches the reserved-memory carveouts
> used by the latest official Dragon Q6A firmware. Update the memory map
> to keep the DTS in sync with firmware expectations.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@c6500000 {
> +			reg = <0x0 0xc6500000 0x0 0x800000>;
>  			no-map;

Is this a fixed cutout in your memory map, or is that dynamically allocated?

Konrad

