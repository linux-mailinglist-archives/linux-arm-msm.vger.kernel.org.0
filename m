Return-Path: <linux-arm-msm+bounces-116828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2i9hIreoS2pcYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:08:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D395E7110A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:08:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kzexZGS4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ywkl8g9y;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116828-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116828-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 810693735E8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BCE420874;
	Mon,  6 Jul 2026 12:59:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D594A420864
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:59:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342755; cv=none; b=bKA4OH+t7QWyC3WUn9skU9EVK7UIJZS5S6/9JamJu3WzWuydhWcLadayXqpiSbhdD5LMFAUdl+qHuMO3Os4eolHuVcWDh9HGGvW16xx/VMJQnO1Isf6foJf/nDEJPxvqjbd9w+0aD/A1/MGpqy39X4LufVXExO1Zod+edQ3hKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342755; c=relaxed/simple;
	bh=KKn2zvm2rcNis2D2EbK8Z1sJyEN8duirxQ6xonC8++s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QC2rHrQeW5Gw5MCLrqQbtNr94WnDQlkezXeRGuz9zIDkylmQT/OqDOWOfdRuyFpo2joIG77Kx9vruMl5aBIpvayfJi/Z0XQntOYawOd2jupYbTFTHmzK+So0oSuFU+1YiSYBLfEjxeZBxmm1G6l7e/om+gJHUQ2zXvrx1vDJQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzexZGS4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ywkl8g9y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOH5218528
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06ybIebQ7zSA8svYrNVCDO//0q6cviw7P22l5olh35k=; b=kzexZGS4AWXCW6AB
	SZ82ftvDBbTq6EUo2nfF+Jlce7W52hr1rQSegyzoQwIqofC/GgKRKduRsMQE5dSE
	KSamLpv9aYHeJI1E5h7dts4ABHuODoOdWqeZ8Acbm90Ae1CN0YL9Jay4W+fxdF4/
	N8Tiea8k6LTj6Pjz1Z6Riw1q6K6//2PgpwtHBV7P27yz+NMbThx1DUXz6vBGDEok
	Avy+t4APlromIM1dt1KVGpJ9AhBuupF7A52OhagNPHlTJM1opgQL5UyBBjI0DXDu
	/wdeUBPyddiXxFkN2Qzjy19e9VfIjDP5h/geSN6rZYhBFeN7NOs9IND72Zx4Jmnl
	pEwrEQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs954w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:59:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9924621cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342752; x=1783947552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06ybIebQ7zSA8svYrNVCDO//0q6cviw7P22l5olh35k=;
        b=Ywkl8g9yVBB1TGGoFDF2SKIaenhjAGv9hTn3zp1XhpSxhvYsnhNFRk0YNPFGAGfWYY
         q1y/uCs55ntQnds01Va4c97ZYXmu4SblZH3Zm0YUhRqmNc5s+QEPevJQQ2qu1lHVjWph
         T11BRyc77RGNe+Mvufb/L9ocuTrlVXNpMtwJCUJVQmvn65NznYJwnq/DhE3Wj26p0vsq
         2LFJH89wOVT7XRuMa0nd3FZlTZhRNNjLLriD7A2fGlMjNS6e2TG7W2aenHeW1qsXqFwE
         B7mMlZE2JY/M7YQMa7Q5Ozh0ZfiT4M4qtjpeLBefaCDSKyIypUgfaG55mbrDP9WIFVML
         PU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342752; x=1783947552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06ybIebQ7zSA8svYrNVCDO//0q6cviw7P22l5olh35k=;
        b=LbgMiyQaNs5XwVg55vRP6eq7EcxFUnNW1woXo4KPvDyV5E+JNg+Cj6G+a6sROZiwBQ
         5djPBP71J10e7jbo/j+6+NQINb7dUCUY1l9gdUYAI6vvTZSimDmUNkRKirQRvbqShxEb
         qqpF3nSWuetDHpztXRZ6BsNuOzYBUlStqydRLDoKO9MZTxlQAm8YJa0VbIn9KaPz+QAd
         ohUkNtHgtuFVYTw/uU5joXVH9qTDco5SQNj/zFefBL3bQMyux/Mb6/pwNf9WVDXHoLhk
         IYxC1ysC0yBlHkODox21h8izu1cL6+klp/wNqcYNJzEULP4JdeF5zD7X2qe91LvUhF6s
         2l5g==
X-Forwarded-Encrypted: i=1; AHgh+RqjFhflABvoHCHeOmWhSXn7ZkmUGVfDW2cqlJx9T1B/zxDqA+6tkTdPTMgCqBDbutM6xz0X3qwzqSixlNPa@vger.kernel.org
X-Gm-Message-State: AOJu0YwsxEQiKh76aMndJ6c/CloSkLNI2Bosqye26Vcnwm+ltZdrF4Yf
	rhJ54aFGi1l4uOmAzFa8qy13ftHHst2r5EFi0A8k0mz64SmPddMq4ZiDhdzK4cJFeomB16k8eap
	6kGXDTwlF1Pl6NR/l8MNwtwLkb6UDEJDkfQEP9XaUCyNxyqbgwXeIjpleS4Qgn32ZLuvn
X-Gm-Gg: AfdE7cmhPmCuFHbedKR9sID9OBJvR5Un+eePTGeihwLm/37+QK7R3RkL+/1UXdw05RB
	2fBcRpBOIEI6+jYC0KRzbfcGAJpzjU+qxSZFS7C5lIP0mXttUpDrM733pECiu2Tna3i4f74QBBt
	QWAWZIh5U4m/gI0qWs/W8b52IcAOB2odEakI9auPcEkaWkCW4gY3a4zts472kArMEUmimud14hI
	9NyLTZ/0zwfpWJGegViN04AUTFzgRFwz56ACM18OUUU2SpbVpGGI0XAg12BVWeLHVonUAxgblhK
	nvBCytQGEG5ntnlZUDEixUFvRNT6jnE3FR1dBrqIQ/DOq2JxUWaraVI/IoiynKrrPcvU9QDcccX
	y1t1NpJWErss9q2nBVh4gN2E49ny7cbPyTEk=
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr96835781cf.3.1783342751291;
        Mon, 06 Jul 2026 05:59:11 -0700 (PDT)
X-Received: by 2002:ac8:7fc3:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c4bdda37cmr96835481cf.3.1783342750772;
        Mon, 06 Jul 2026 05:59:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6055039sm749735666b.4.2026.07.06.05.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:59:09 -0700 (PDT)
Message-ID: <391e87cd-6352-4d38-865f-16f04e4b307e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:59:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-1-56fcd1659ea4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-1-56fcd1659ea4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2UNCJYZbepbihxGrKSCH7346Wnb8eEln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfXwuo4HBhFjI05
 Yda9inVBdHv09bHbw8PV5Fax54Ttp2y4lRkRQ5Qcprm1jQTfhhcozz/2PLAHMGYXZgMUzxFxvvP
 6fS9aNaE+eNAVNw5/RzpVRFCk63Fdx0dYIn9IjQgrk89uIeDVTOR8vL9WrFe8ifBba4VgHYHFWV
 GOpSzVO0UrSu0vWRfm1fdM2kER8Hw+MYE+9KSCY+iwtEJYumCBSx+rtyFULx59Qk8yNbZ1c0hEd
 xm27wrwV965+9RkdFRjq9hJaTRScMKobv3A5Mxy7qIF4MeEqV8xEEgU2kbOyTk+zC0KZAFIkFGR
 ND/I2Xng+NhR8sIYOMknz6ZrspoB8uRTBfB2JL/3mVsNMh3sdQ/Kq7BXSC1lN29sv5n3cgBHGIo
 FXGzgDf7bsBIJdwjNYANWVZ2AZG1j+dfg2teMITlW59FkkhvXHOulzxG5meKKHhwkjjNQn58npE
 PoulNRoJqeMQHG8f6EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX9Fth07kvtbpj
 jbwAyejM0n3aDrpoeEewiRBmNFI9MvSPLxW7CkAX3/KXJDqiRlm6O44l1mDzf1BwmJuK1rkzIOA
 ikbjenNpIMWdYTZWxp08kaaAncyeAn8=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba6a0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VXLAdwoOgdXhmVkI5jAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2UNCJYZbepbihxGrKSCH7346Wnb8eEln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116828-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D395E7110A8

On 7/6/26 8:04 AM, Nabige Aala wrote:
> Add the SoC-level display subsystem nodes for Qualcomm Shikra:
> MDSS wrapper,DPU display controller, DSI host controller, and
> 14nm DSI PHY.
> 
> Qualcomm Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
> compatible strings are used as the primary match with QCM2290 fallbacks
> to reuse the existing driver support.
> 
> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
> from mdss_dsi0_phy.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf1_out: endpoint {

Please keep a \n between the last property and the following
subnodes

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad


