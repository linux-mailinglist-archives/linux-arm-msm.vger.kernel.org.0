Return-Path: <linux-arm-msm+bounces-99880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDuhAqTTw2lLuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:23:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A239324CBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D88763015B70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27833BD649;
	Wed, 25 Mar 2026 12:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7GGU5ZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYnlja05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB0F33A6E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441264; cv=none; b=OqyHb3gF1UPyNwO5DiRGJKsaV5gkUOKGkgdqch1wq3q4FUSUhWo6z6kGtwAeRbmmee3FqyS512pOlLzNXQIBqD+DZuyB28JS3EtfeQVUbKWAWwilJL0cxG1Qvy0Y2zY6Ma0zRx2x+/WyGYl2mA1zUfi+zcWT8bu1KqSCPbkOU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441264; c=relaxed/simple;
	bh=CASlOad9Jz3rR8JWN7C8Lo7+MS2Ekj1KXi5ZFFnLDNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOVdP7HE+hfF3QbIaGxnPBGf05QR5VVDGRzxgJ09B6SZXRhoU38oHgH2XsQqkIKJ70PyGFp0NdtnG8ztqGNNEqsvXtzHFY2Ynz5tGFGhBsJb3kJFnLy9Tcirw8f1HIlb5Hbeyt73/5uQawMZo0cXyWOkik4MOob5i1LRo00ory0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7GGU5ZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYnlja05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG7NG2993701
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ij4ktEkghVXMujOAQpvP2x/I1y36LCkTpjVnnIT2MWs=; b=V7GGU5ZRS3OyYkDd
	Wy1M3r6SIDNq1O4jYrFdCwfNdDQCG+n0/6DEkZ/FjGIGKeRVZziiZn64/z9F8zAP
	WBC2RiIuPTICWoVbKk7ewZBbu4+TmAI61tiQeWxb7y4KThD4a1/SeOFskXJpZwlt
	TXIfSlI4Qf1hFM2mIGNM37umA/BhdZxjEug8rrYl/G2omLbbaMPlIhr1GKS715fC
	2rKCztLmYLZtMuBG8XAwkwp7B28iZXppapNjOd3YMS9r1oiodphIBo+6S7O7dZEF
	00r+2CbNk3YKxK+1Rx4RNQa9QSus4P0bk7uxfsivZDcPsxeeRv1P2DkrXG5heD7G
	8WlA4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4gcfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:21:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b06b68783dso41445395ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441261; x=1775046061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ij4ktEkghVXMujOAQpvP2x/I1y36LCkTpjVnnIT2MWs=;
        b=YYnlja05E8CBpz2FHKlkczuyjHgA/kynlgYlGQO2z1HdKSnzL3fHdHGYWHljzfdklU
         o+l2niRH/GI05YX5AMu68Y5dfnWIGdQIfGVWstTWsBjzxdedCI0i1brp4onFQQgEeSER
         gg2vqDeZblJVNHlszz0kIXFJ4vHUB+vkF/wBHN2yQKUgppnXWNLRHRIVcfz+b2+uDrPo
         ZzuNTfaB1AuoZj6Y6h4Abp+MoEe6co3D4PpFmCuLQP5fBDH63XKkV5cwh6V1H9X1KayP
         7znAFqnTq5Qruv7htN5T1hysR24MqpNPgloFhWTtLBqVHXmBo0dpKVPF/hMud1R/xtuL
         el3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441261; x=1775046061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ij4ktEkghVXMujOAQpvP2x/I1y36LCkTpjVnnIT2MWs=;
        b=Ai14djiNM/ociC24q3GVAliVw7O7DH4QjyEUynalWiuTAr2EmgqQm6VQPK25MC9GxY
         oQpI2C6PXr1ysQ8MhFERBbBbGh1sxiLpd/MgWqaCeFx+AXU+DJ/GvlNK1Zyg5dGgv6wp
         KemdHkC6Mhrxq7wHe1u5xhuWgbZbWdCR6uX33iGk5P8auTrycwsPJJdGRDZhKXZ/lyvN
         ZkWuozpxdjS3bXktZdQqx7VUPnnsv6756812dg7a82KcKbSeWAGswWOurcTu1OreX63S
         0j5I4/C4X56p2MUUxhoUjY1iLyDz+/wm2VA/IEEohaWy6s7u+aghect9eT7SjzNBtLH5
         CBqQ==
X-Gm-Message-State: AOJu0Yxm2BVjO+SKW4nAjixQERlC9KOprUgJmAMtDnGixac9mPj5Ns1W
	ZjmDQJpqS43t+xYeNSilQU7il95rj0gl/elM0F0DGgSi0LYLWhUwE4/ODagfbV6BUofM2g/jVPO
	5gSM2Qb6CNO8RVtM3c2h5CFLR2EK7VBp1hwRgwVctn2YEbD5eiRI0zTx7NuZ507i62Dqq
X-Gm-Gg: ATEYQzz+g6aKwuPvZlQ4K0rRPoUlVGljAV7FQD1IHXa77LWDhzejmTfvmrfS1Z+S5s4
	RYIAKEDwFopOo15RiDFJTkcaV7Ol7DXxH5Xw61OMYPIBg9YBL/G/L6y+pDih18MbC6t0OLHmU9g
	GF4LBL/Jedo5RZ68GeGegOldldex8efFWqzubnj62PdrxGwDiKEBIqsVuw3y6mUKDKN2HF2/pyl
	xEMG+smJst5eLOpKcUYRFfxN7ecmjn6jRQzi/aI8XzQvzdB+oymL5V7fW0Lfa13fA+PbmIH0XPw
	nzebw0HUiBjy8bRLiY2GvMJ+Ym6JE6wmp94JlTs46/xrKeCyx1pUvcs2hGSuOHyc8CuxpRcxXv+
	uotAURBCvWTIShjYPUgrsFvJDfTD8bT3+9QYKFCMqqsi7OaGmRwrb
X-Received: by 2002:a17:902:da91:b0:2b0:6e4a:1c1c with SMTP id d9443c01a7336-2b0b0a1554dmr38685905ad.19.1774441261491;
        Wed, 25 Mar 2026 05:21:01 -0700 (PDT)
X-Received: by 2002:a17:902:da91:b0:2b0:6e4a:1c1c with SMTP id d9443c01a7336-2b0b0a1554dmr38685575ad.19.1774441260987;
        Wed, 25 Mar 2026 05:21:00 -0700 (PDT)
Received: from [192.168.1.19] ([106.222.229.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835161a0sm221170325ad.10.2026.03.25.05.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:21:00 -0700 (PDT)
Message-ID: <95d9636a-63cd-4691-8d72-c1bb59c605f6@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:50:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
 <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4OCBTYWx0ZWRfX3Y/IUmoCeSRW
 0esHWrOTM7zkVStKHDRgPYfJeypW06/xa8YCaBTQ7M7jaXGbrNBW40sjMRhIY901FbXKUuX7NeT
 yG9xR8h1AnKGXsptqd6bkqLM0jzRJ5s1DXz6uDoANmSc99B3cCJJC3GmJuVtb4mhNREUFmL8p+B
 toQlQuKyeF6fIomzSoEcO6y7NBLIrxqD7gNyH1n+oBTOB8M6Pmqm/acpqykI2Rv4m0aOcrAPYsb
 mXXl80KGtw2ahXzoPscZaXzJdilYua67LBjDUE62B3+XNtkvJ6IbBNwcHD3MiHOj0ZAW9AoBGdn
 ThMVbgTwUMLKhW3M+7KUJIW/ncr3Y6P6pQAKlM/qrua5dZ0x9JPZCNnXn8YAn1op4wlyihV0CWE
 xZIRMjCRh+MXSAT/EiWayt0HoIuYGwbK0lDGX9/JVevD/3DwHwIyfLw8ETIi12irhWeTwARikle
 4Mx4nYsW1+H3SO8yxJg==
X-Proofpoint-ORIG-GUID: 4RnjIZzBVJ6f5VCGMUTeuM7mRXHgd8gF
X-Proofpoint-GUID: 4RnjIZzBVJ6f5VCGMUTeuM7mRXHgd8gF
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3d32e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=EBd7WcfsMYPMwvoCMWz0vA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=v9AdQsT0JroIR-EB4BMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99880-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.76:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A239324CBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 5:09 PM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 460f27dcd6f6..a0d2ccf931ec 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
>   		pinctrl-0 = <&eusb6_reset_n>;
>   		pinctrl-names = "default";
>   	};
> +
> +	embedded-controller@76 {
> +		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
>   };
>   
For Hamoa iot evk board, i have also tried and cooling nodes are 
reflecting fine.
Please feel free to add:
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


