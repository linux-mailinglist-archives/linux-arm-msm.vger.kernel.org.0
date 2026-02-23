Return-Path: <linux-arm-msm+bounces-93574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFOZCHPTm2ma7wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 05:11:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF99171BE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 05:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62D0F301ABBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 04:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AD4279329;
	Mon, 23 Feb 2026 04:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpvXHvmh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XByqp1vE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2B1459FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771819873; cv=none; b=n11merG15P0l/J0ZPUp41swlDqFXrvp+Axfg4KmUoNciAZfYFjCxPyXmd+qgEvJFvxFL+25h5Ynr6ngE0/ZAP5oZcMIggCGModITB9sk+8mTZGHk70wnlKkpwiCOyHIM+THJxk2XlT2IkMubBb+HfWw9ROms1U+kgdBVJIeNaJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771819873; c=relaxed/simple;
	bh=pK2mrrtPuRNmvsqeRdkmGxg4hvXswhtTttTGwKwnYvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJEoVMjJsuwpnBxMPARC4yjyCqavobtchEiYtZ4IDsT98isZKAdfkSkjPFP6etZraEUHcnfA9dbXtE6Aph7/ObDGHHFuwrTzXOQXXBTAUuRI164SMGikAe/C0UGHDirku9xo+O37RX5oeYBJELauda1egZwCwMDZgAnMMPaqNA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpvXHvmh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XByqp1vE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJvrmi1930507
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvxeIuAz4elwHbRZzch3j8yGiACxyiE0IXv3v/wGlrc=; b=HpvXHvmhN8XLm6Jn
	lTasXuj+d7GTZi49/6A+kqdbNUWT2oHVeyYq5Ni15FgwzyyiqRxOxzrby6JNUgVQ
	b009kuKQFBuNIQefGdkVPV4V2Lpgnd1OQdhvZXnBaIMX0nYzrN+zn8LiKwdY99ej
	hfpL+Xb60TXBhlek1091w1eELHh0MMvHCtroXo/GGN148DOks1/uhOkS7tdoOaIC
	sEeRLrMBPKCu173Eevqpe0wpN3ikwJu2XnEMkU+7CWwyMp6Uh6V2capuAS9nuosc
	vtRzufIxmgXIpUHYuK/jEutRFxXiHXExVf31bn/gnX/dOmna9WnsCUWo1RihVDrj
	3w4QjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3u9w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 04:11:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso2700243a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 20:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771819869; x=1772424669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvxeIuAz4elwHbRZzch3j8yGiACxyiE0IXv3v/wGlrc=;
        b=XByqp1vEaMRxeYdAIiVo7f897lQV8SuYoZm3FsbEbVm3E1MKyRDsjW682ZiJ3pFcM4
         smeibEFhn8enGNVBkYVVur583B5heOGnSGyCqIe+v5DMsZf/7HzD2/gn3oqOT65XknWs
         tOHRjF4M9q4799v9Hbmsw3vOisSs4WECDu5FnI23DquuNf+/APdyalFjfK+nfqQSJO10
         Ff3f3kP6/Masi9qzCw3xHtMCFHZOQdkDzS8FhSlFhfA+5HBHja1piRrKizMocX6p2GBQ
         zcM32W3CDxLEgd8K4zsJvCXs9uK7ER8VwMDOaIk0s/gEo40JddudjdValP37FUGdKScE
         zAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771819869; x=1772424669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvxeIuAz4elwHbRZzch3j8yGiACxyiE0IXv3v/wGlrc=;
        b=V3NISvJ9gNJ2maOkDuz8y4+8Y0y4qRMSOebIWk7yvkn7xv065SDtwei7jny/oo7hR9
         2G6ee8o8ypWoveleDHi/qWcF1m4GiAwTowBgEqfUVgnkBL5lO/WHHqsuk3TwBkNZiNut
         tdi8JuU/zN08XA3nL3vRd5QYEyeuXtfpQXFzVbi733KSoFawglpmfR5oWuDCF3B4MUNk
         NI4EKouSK+5UP0UykeQCHyQEUti4ik9ZxE4d9CiQC25vJuiCnlNXw2oTGibwEU3Q08Zx
         /DMr64LYI0Emmm1ETZ1Yrr3yCn4zZ40Aa0fG4l+9RQ4Z4BZkTG7JPc2xoJZRyCBMiik1
         7ErQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaW8VZsdZsgeQJxHZFLh9s2dKmjl0F7PuprszpSWz9e9NNEwhtTlDR9IJAnXvqdyFJI7zXrOPuQl6D6LAD@vger.kernel.org
X-Gm-Message-State: AOJu0YyOcEx0fgdG7vVSw+rXSnZvmTFnQ4hKyaehilvhaCW1yFVzGAyo
	XsrRaLQETWvJGLObWFDcdP7nP5epfH2k+pNeoO6NsJ50x8ilspI297kmY2sygahd61IjYXODyeV
	FJPYMRqalVLCO0lYfm1MMObyOo47fcBcuE6N7n5DZVEBEnDSjiv2TLzcOggTTp28Aetjf
X-Gm-Gg: ATEYQzw5fy2Ib6msg5q2oT66J1FA65mpx2IpnKuPmt3LyYaJDi6392fSiipoJEZSAWA
	ujw/kpVY9jqwLaEQMKApzGpIZumF/5BE9mZrLepH99RkjPdlGu20tSW7WTik6+5MyNAaO3mMUCO
	eOb6wjZz0LaejKXRxAVQeIfm1Rsr5t8gUiV5W3NgcJCO5qvBd3+Sqj6uE1rWSTnJ+OG5prvFCG/
	+XOHcrDSCGSwRzVZdES9voo89w6pT0nDbA5JWdzirRPWkHg6OlKMeUtwkYGhNzbw0Zg8bXM7Feq
	6Sv2cWybNuguhYe2Ft+Eg6JXcVSvKKIQHjdbnp1k+z/w9uFeaQzXFX8D782zSJ77A8JbSVYuVPj
	pUHlJ9zvN9T/4G+RlH/rYC/30zgFWcv4EYPUeNJNe5OIeYJC1CB4=
X-Received: by 2002:a17:90b:5687:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-358ae8f6728mr4987384a91.34.1771819869258;
        Sun, 22 Feb 2026 20:11:09 -0800 (PST)
X-Received: by 2002:a17:90b:5687:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-358ae8f6728mr4987376a91.34.1771819868763;
        Sun, 22 Feb 2026 20:11:08 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358af93b2bdsm5386376a91.16.2026.02.22.20.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 20:11:08 -0800 (PST)
Message-ID: <9defac59-ae8a-4658-ab38-dcb0559d9708@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:41:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa/x1: Fix TODO in system power
 domain node
To: Daniel J Blueman <daniel@quora.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
References: <20260221105245.19328-1-daniel@quora.org>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260221105245.19328-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699bd35e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=t9ty7G3lAAAA:8 a=Z6mox6vU0p-v88y-cpwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: VvRLSrLpBZtatzWg9DpmBMmAg1aDERPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAzMyBTYWx0ZWRfXythlFLFuOP0O
 wOFEOQia60737tMsoQ2zT3VnJZFjSJy3aFmrnSXYlOSEErWuC5fFQ0/FH421FwtPDR9ZrEesRMG
 3imDx/0pu+u2KcbgTtpOTVVlYLLkpvai8zpv2ItGadT6zIDjAyvAzVAZ/p9Z+OUW9+BwG6VePwD
 hiaL6jrw/GUpLLGp9LZpalp1vkZfJ9nU5YBXyBXqQcVpI8FahC4cgLjLX4kSjduI0fYmf6XDRxm
 //E258dVejjDud+Wqy5Fi6Zo4YrjmVdpsTpyOYWM7sNBJH5cXMun6cmkUEZskBymedsNxtenbHq
 qrEgYf5bf1sS5XVEY4dUwms8wMYpBtxmIA7Aee6YFFQ/K5MAmH0bCVx3Vdbn+x13Woix0LaBOSM
 A4MR6MledxgMRgDHcCKCkGzoPJLbv8v74W/ZCp36Qtk3pLA9boK+pTl+PnnhuKKuoj+MQhg68hQ
 T4gIW7jpDEZ47i3+R0Q==
X-Proofpoint-GUID: VvRLSrLpBZtatzWg9DpmBMmAg1aDERPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230033
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93574-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFF99171BE4
X-Rspamd-Action: no action


On 2/21/2026 4:21 PM, Daniel J Blueman wrote:
> At present, designs based on the Qualcomm X1 Hamoa reference platform have an always-on system power domain since the OF node values aren't implement.

Implemented.

> 
> Fix this by using the CPU C4, cluster CL5 and system DRIPS parameters from the ACPI DSDT Windows uses, together with the Low Power Idle _LPI minimum residency of 9000us and wake latency of 5000us as exit latency. Finally, assume the entry latency is the difference of these two values.

ACPI used 5000usec as total exit latency, with this change total exit latency will be 9000usec (sum of entry + exit).

> 
> Tested on a Lenovo Yoga Slim 7x with Qualcomm X1E-80-100.
> 
> Fixes: f33767e3cfa5 ("arm64: dts: qcom: x1e80100: Add missing system-wide PSCI power domain")

Using this fixes tag, can make the change back ported to stable kernels without dependencies and may break the GPIO IRQs.

Background:

PDC monitors the wakeup capable IRQs during system wide low power state, hitting the system low power mode can break to wake via GPIO IRQs. 
The system-wide idle state was not added since the wakeup capable GPIO IRQs were not configured at PDC with 602cb14e310a
("pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now").

So IMO this fixes tag should be used instead of above with the changes to configure PDC to monitor GPIO wake ups.
I have these changes to configure GPIO IRQs at PDC and enable back domain_ss3 idle state in my local tree, which i plan to
post this week or next.

Thanks,
Maulik

> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eacb20..64338769bc85 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -290,6 +290,14 @@ cluster_cl5: cluster-sleep-1 {
>  				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
> +
> +			domain_ss3: domain-sleep-0 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x0200c354>;
> +				entry-latency-us = <4000>;
> +				exit-latency-us = <5000>;
> +				min-residency-us = <9000>;
> +			};
>  		};
>  	};
>  
> @@ -448,7 +456,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
>  
>  		system_pd: power-domain-system {
>  			#power-domain-cells = <0>;
> -			/* TODO: system-wide idle states */
> +			domain-idle-states = <&domain_ss3>;
>  		};
>  	};
>  


