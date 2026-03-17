Return-Path: <linux-arm-msm+bounces-98156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCn3LnRBuWnp9wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:56:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 291132A952F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD0883043BE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664CB3B584D;
	Tue, 17 Mar 2026 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtdhHpSI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFj3K3mQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1193B5830
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748594; cv=none; b=Kg4mXexJDK9WjIGC5kD0qbNSf4WheE0sU3bb5Q/76FXyAHXmPRMal5+D8M5P0tkt1NY5z2JNafIl++Nef2g749ulXRIfZzKZS/JmHMPgzUncHHJdCcPYM22WMCd9YZpNnAi/1MrOcZC1nDi+3tj1D4w5CR2jQS3rWRTgJnip/aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748594; c=relaxed/simple;
	bh=tkDjI1aF4fzeCguvDscLAK11igqRKadwZ/P08uK7b1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fR3VXYzVrPQdVMwUNWDKhQCTq+6e/25tTgO8V2ooCI3J6WMjpo8VaAi/V7GdmYM4a+Aj0dHV7E5vE5cTBhfS+Pzzl4nxhM0BWH5gV/hhjCaFXG03aLBfnepKyuclAs4Gv95Kli3Az5Y9xksuJBvSDVeQAbeo8PK7MhxlPeyrFm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtdhHpSI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFj3K3mQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7RI5D2906068
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 11:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQstqF1j2uBwVpxWNo2ICnhzX2Snteguv2w01pYX+VU=; b=LtdhHpSI7KPG539Y
	ajYpEkqvB25VnWJNsht3r8vBGGsZpuCUV+I8eQ6SmC1nY/gD+AbziKv9bZOymyIG
	gRhvETzNRubwo9ZYiajfawe8Ff7aXKj4PpbfSvP2/HplIH8RgD8BH9csqW6uKGNk
	yNBpsk0IfDdUYLWe3Ui2yynhAuuP2gmEj44I5KV2Q2o5Ih+UhW3YDy/YGdHfMTqQ
	Ddt4sBdZpNaaemKWDxbUcjQJe3sHOCELcGbIjUOyM3FbwR8kM/Q0VbZrNVWs4SW7
	Q5iX3dmyshePyfYZBoovPaQgFZEP+/CPDxq4/Fmpii0WXL429kNZh9mg8UcorjTJ
	LkOdww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxgyne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 11:56:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aecaae9506so11836575ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773748592; x=1774353392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQstqF1j2uBwVpxWNo2ICnhzX2Snteguv2w01pYX+VU=;
        b=cFj3K3mQqx3e8Krl3xz8dTp60Inzv5xU0OaZCaTCPPi/x+1S3EUsh1Fip3cTCa3IEd
         XBqnFl1bGJnFXf27840K/NDm2P0esnCTXKTTOd4oIa1/1lbsXQbOs9lhSKkfHjmaijp5
         qzbYAsEU8Z+FxNYcC05Uw2/ttCUSFdBC5viNvJI+Mfz+uB5t+RRVcGdFY1Y+aTQJqUHo
         HFrW7fJMnjeWlLR7rv9U81p7pJdJkTPYu1aeLA5wQmZKi25lJlsSsitcAaWEzdXfHYpB
         6DQLZX82UMeRuD6S1aHt4zQEdMvjWsmhH4HAtbAFxMGTA0tCcHErsfIPuR1QxZOrzqZk
         Rflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773748592; x=1774353392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQstqF1j2uBwVpxWNo2ICnhzX2Snteguv2w01pYX+VU=;
        b=p3kkagKPAlh/9YE1V/mQDXO0gNGLeD/2u85JVwUR0mtnGzSBWpCo1vO3Dl6UsZkW23
         59nH59zoZUbiGGX9PpRkL7wlaqPbzpUzZOEttD0357NkyByiNr8zr3wykkgxVuWDyC18
         48ovHr78bUjtXo58SsxIberpR+V80ynhRBvaN58zSssk9X9JUC59+yKam7UNJa2wTYBv
         SsDcFavyAA3pwz80+YwdQFeoiqW1OPUsMgLB6W6upJLoGk8O5TH5gVsueCMF5XLdVCQ9
         VdTCiebQwkCPkmqofAc1rB37Wb919RB8zWDLEA9ptd1REQIXy2WGi9t/J1WNVm5iplpt
         CbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN5Mjl1Cn3lQhHwMgApjdEn3GoHBjezkshZ1HkJqGtTj7R4g+2oabypA+XPggSSE4mVodcyb+KqvAyGEN3@vger.kernel.org
X-Gm-Message-State: AOJu0YyLUgUDIHH7Ih4Q1ZMeXmMyhqtfCKnolFJt1JzaQwaRL6oBPER6
	WxQTF6FsFamy864iszYg/EJLGkjIdrLnvuOjgpV1XXBRnAdBRwWtdeXP/SU5KNF9sFxflq6xK83
	GHokFdYyvWwmNBS0SjXBeODOWsKd2/Fp3CLybVkfcOLdbH/oOHLqGneDi3vySB3C0malS
X-Gm-Gg: ATEYQzwdB3cxhvsTv6D/XKw729C8QVHYp9lbNKxjzupkNIEplcCr6wNi+2Sp/3nFVXL
	rh7YNMOYg10Jwn75u+fh1mIO5x/6go1rRi4vgysLWJ3JcI56hUgifhE1lr4T6USxm3P/DiCHAV8
	ZCkv2evW4dBtCIxAWzLxF0pNwYSqC95VvTULVHhOpr8FlpsTtkt4QeSFvnXzKhV019BiZ2ykVMN
	QX3VlCGUS+TsfIfEkYlTLQULp9gCtzMgy2WL4B4C7W62h/rcfJP9a+ubbbPV4Hgx2GIW6q42y9A
	4T9MxrhaI6GspDeQ1sRBajuvpVsVIBTfg1QK+ggG2dSx5N7crp82t53c+XG3CKOnJPs0wmWZQLh
	r+mLPz9kk5E0ojv4J8TCxGQGb7uUg0Q3FfO8XVmuzMyoLgFoseS+xLVIyud9U2Yg=
X-Received: by 2002:a17:903:2cb:b0:2ae:4aa8:cab8 with SMTP id d9443c01a7336-2b0635b80e6mr24465375ad.4.1773748591780;
        Tue, 17 Mar 2026 04:56:31 -0700 (PDT)
X-Received: by 2002:a17:903:2cb:b0:2ae:4aa8:cab8 with SMTP id d9443c01a7336-2b0635b80e6mr24465035ad.4.1773748590844;
        Tue, 17 Mar 2026 04:56:30 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece83b35fsm153479495ad.80.2026.03.17.04.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 04:56:30 -0700 (PDT)
Message-ID: <745be56b-0a5c-4542-a04d-7f6eee8bbc88@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:26:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: purwa-iot-evk: Enable UFS
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
References: <20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260317071311.1696361-2-pradeep.pragallapati@oss.qualcomm.com>
 <sh5vzyw5lxafgjm5kbihirzsqt2dzc7tqdee3sydd37qykclpc@vimbya6opzc5>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <sh5vzyw5lxafgjm5kbihirzsqt2dzc7tqdee3sydd37qykclpc@vimbya6opzc5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a27kK9zR7qASEPFS8sXUQUS23v-HxAiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwNSBTYWx0ZWRfX6EMEo2hXULCF
 sHGhaN5oaWCGl5+3Dz/zV0mRPXMrMHyFQxD+oWz3KRt6HDd9kFHQTG//kdpt9yK4MrlYJuyWknw
 lyiqIkVstaM+kjDq1g6MpZhbBrBdBqQNQGJrOZ73IJ4Vyc5IlDApgeu7xGFmNiNEh5kWHqEhTbz
 YLfSa82AzAufvoTUNlr4CTQfvqDoLNib7FpS3l69O8yUIK6ZTNBnoini8dhLkqo42k81raSYr5v
 VK+scVFJ4e/HaxQBAQcK8d12JorItVvqREpEsHMJfgjiYwVHxMNmdOOq32yRZy1FPXAXzTJ0KB9
 VsLGK5ljiJPJXfuBYuVy745/7grS3DuN4VXq4pI0WYsihZeUyB78uOkU7O1vkpQWe6BnP7lCyWt
 Ru9BpknbzTSXM0v+wrD12gLwNx6PI0N7RiPG1j1ZYb90DpqYV7/QwZMr1S5bU2BpwYAsz+iU0Yj
 qRxoz3tLC4DeymyBpig==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b94170 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lOmVGwoZlIa5BXrI45gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: a27kK9zR7qASEPFS8sXUQUS23v-HxAiT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98156-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pradeep.pragallapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 291132A952F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 1:03 PM, Manivannan Sadhasivam wrote:
> On Tue, Mar 17, 2026 at 12:43:11PM +0530, Pradeep P V K wrote:
>> Enable UFS for purwa-iot-evk board.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> index fe539b1f4567..e9cf56a415ac 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> @@ -1497,6 +1497,24 @@ &uart21 {
>>   	status = "okay";
>>   };
>>   
>> +&ufs_mem_phy {
> 
> Nodes should be sorted alphabetically.

ok, i will reorder it in my next patchset.

> 
> - Mani
> 
>> +	vdda-phy-supply = <&vreg_l3i_0p8>;
>> +	vdda-pll-supply = <&vreg_l3e_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&ufs_mem_hc {
>> +	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
>> +
>> +	vcc-supply = <&vreg_l17b_2p5>;
>> +	vcc-max-microamp = <1300000>;
>> +	vccq-supply = <&vreg_l2i_1p2>;
>> +	vccq-max-microamp = <1200000>;
>> +
>> +	status = "okay";
>> +};
>> +
>>   &usb_1_ss0_dwc3_hs {
>>   	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>>   };
>> -- 
>> 2.34.1
>>
> 


