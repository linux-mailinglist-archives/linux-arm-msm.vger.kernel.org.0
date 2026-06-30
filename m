Return-Path: <linux-arm-msm+bounces-115403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OshsEoi0Q2oRfgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:20:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FEC6E41B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:20:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T6HuvqFG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fi7TBVSL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115403-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115403-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 325EC31056EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29BD40911C;
	Tue, 30 Jun 2026 12:05:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F013405C55
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:05:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821155; cv=none; b=aRXSUFbGgSgnVtVdRjbLbtXCn72D8qBJl4ufXKMKARg5w6BekvU8EC9M3H9n3+JoNIZbzs0Vt9UqEDDjv8tBD5JSWPQvddDs1rOKSBQCmyr/2X4az8FOW2XjpX5IA2jg6i9Qo7eEJV2h99L5Ub8gxqSHO9qo1Gl4Tg8seiplta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821155; c=relaxed/simple;
	bh=vpMAwpte2tX4ELtpDnI24a3ay+0Q7hZpikQJ+xcsdVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpWRk+e8+MBaRklx8d+Y0qMIdJ+4DuDt2pEtYEHWvRslaS4ZPZQG9UYnf5ngxdmGs2kRuQ1XNGQSdHGwaneWKO7lezla5jQjRDH1PBNt9GWo6KdxBMDXqRVkcWEQKF0LI0VGPY8ttbBuA7mWa9tRBxpuie/bvJ+dXz41ewTRZSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6HuvqFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fi7TBVSL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mwAf1605085
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FGdnLjb0PIWG4GlXZplmg3kw4pOv8RKY9RWmFItlcE=; b=T6HuvqFG7+NIeWJU
	bvXumMcF51S78RX9GymhgyjQryDYB5s4ygqTrIhjKghayfo68RoeR9QHZ+PzQJtm
	TQSK/wH0l1WFp+XHG49EbMmQDag03WpMClyHczWL/XoUMqG1rWMtgLdQsu2cLgbv
	Xq9GsOlIBl6QDXOIlKt1S1CRYE+gDMfdbuifCZVXX1vzKi2cfF7vT/x9xCSg9LIs
	ijcAVrRSV6OZ39H3KOu3YKj5plDRmL70De2OeoL+rLlqHzXcsAvZezGfE075fsor
	7JaWG5FIy6rIZtnWzprpAmHkB1SS8FPwPtkspwYvETuyhmmHTBYtv8zxVYB7V+LX
	U1GeAQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjj39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:05:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdcef50495so3052e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782821153; x=1783425953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FGdnLjb0PIWG4GlXZplmg3kw4pOv8RKY9RWmFItlcE=;
        b=Fi7TBVSLqRXiSBQR3PplMX05+i/MIxvRWkXMoi7yqzIKDpe0bfJcQMsS4jVSV7PwCT
         0Z2km6c/RQremYT/JjztcNpbPNotLcgj42kA0cyN/9BQVW/Kty6K6osg+Iv0IC+mNp58
         Ut6nNMBOhnj3RTnJtOSGeKtH1LLEVTTgKIcUe7S74QLT/dpzvakB9lXGZ+OpTKYkH4a8
         4ePNy6s1FWTBrxBbL3wQR9kPWeYHZuopLBNe3yT9rnp5TiVBP+XSEoTJue72zfjUoivg
         qdZeCF3jqRxGgu2SePTDYUO14ZvZWymbCYR9KQTpJNnZFsclAgl35cNt304vBT9pWGvZ
         HHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821153; x=1783425953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FGdnLjb0PIWG4GlXZplmg3kw4pOv8RKY9RWmFItlcE=;
        b=f5z+HAAgsx1YYJHhmQ+JZIvlaIOF5YsUWX0/WjyEkuP/Xq6fqecMrNf4M/ThfZVAlf
         kllwRzoSEEIQYZ3WwlLymN77MRDSQK8MBj6LJ//tWH9T805+9lSoawo30EQn3CBmphku
         QOSBo2pfXv4sfepxBEDbhNspEIxUxnoKkiVUhneyl8shdRNQjt4OeVgGEDzgNH+MTTbo
         4i9BjFhiFhqQ7Qu97+tQPKichG/58HwzdK0ceV6P6NcYsMJ3h/ghqEBHOuVQUdEJ6yyi
         BYWaVl+QyMhTjvd0dUOMzm4d76uNCTEANNdEAW0n6KZ0hZbk5CTqcYNy0oOgh4YAuRLk
         xiKA==
X-Gm-Message-State: AOJu0YyMrnCPXBH7caklt26Oy+lNVitMqkzxqMP1tvqs+eKw7zm5SFzW
	qBiWWeewU6Y2CpPIkxtqrKOaaHONPGHFnnrId78ctEY4lK3oe8OvMLIGKjpaEEfayDPvcK1RbSX
	TyCTaOOLH8BwT9aQPzscqoAVUczNm/msMwNapfg7hu8XNdigxsNnDOhgd+dMKRrYcr+2e
X-Gm-Gg: AfdE7cnig8buY6Mxt2XSmdg8YOITwMsU5CBRiD+zyj2X/IMe8RoDqfxef/tCCCI2fDg
	U8nwFA9LKchTU3a3UD65BTcpVchqQo3LnVmjoMSRWGv9Cej6IN4OTMvrOtUOEvhrs6R9K5w3qm1
	umuNBF2HCEXbBo+gLOnyMCLuFBVUAUp+NObjQ+qcOdRJcrPtD/ErmqK+qXqNIHsqbtZvREyk+CW
	s10/E+9OVjr2JhTjdUxXeuz2eLXH7rc1XPjSuiHWQk8SnVQRL+M6Jl+qZKY3lEsCyTZQthqrT0x
	Mq9OqkP490+PeZ1PLcZZ4Q6O14nYZbclnyKEvHNUNJr02VQFYLbJQMtrtIEMyK7cgZq6svwjkgp
	SsE30uYvwfOyhQc9z3MPTweNibQ33LBml1x0=
X-Received: by 2002:a05:6102:370d:b0:738:4343:fba9 with SMTP id ada2fe7eead31-73a38a42b52mr469676137.6.1782821152922;
        Tue, 30 Jun 2026 05:05:52 -0700 (PDT)
X-Received: by 2002:a05:6102:370d:b0:738:4343:fba9 with SMTP id ada2fe7eead31-73a38a42b52mr469667137.6.1782821152447;
        Tue, 30 Jun 2026 05:05:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12891785f2sm113720066b.61.2026.06.30.05.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:05:51 -0700 (PDT)
Message-ID: <df2baf3d-2959-43f3-b6d7-9ba60d6a3cf9@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:05:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] arm64: dts: qcom: pmk8550: add VADC node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
 <20260617-topic-sm8x50-adc5-gen3-v4-1-4af9251731f1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-1-4af9251731f1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Uj5cy369CyMSFGG5gTqvtXJSezBFwuE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfX+/X3/Qt6ladb
 48NFxl646XOa+OevXoVduesNhmGuPkBlHr261mG379th1DjdiASAJtHFhCcI6nWt+iDoONCb4xw
 FhzzZH9m9uSS8z3a5uF6L2vk40C8OKLQgRELo1vh6oBSdKDKnll5a4Q1B1jZuWvh9t53I3hjafH
 SsoWqPo/tyis5+9vn+inxMtUY04f1o90+S+QlXmh557udpfi44Ac5lI8tfhgutzt+Xwk2vDm+be
 9CWq6M1grYRDOOWnnA2qkZTx4RIc3n0MgdvWGijM+elWBgufU5f/0P3OwhIlCSgxmriU/PL/r8C
 SLsA6v3kKU1/a8yDdVnSBye2TgKvGKa2jL6mTS8sjVIji6YGwJeyaWJuyGI/LkvQtjv/M4kKjxk
 kA6R3FA46qc9yx/XAhl1T0HwZwhWespLIwjO0spTAtXAR9q+/nh0nxKb7RmUM/HbYa4nrMXaHRN
 JHspLkx4oEqZuXIknrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfX2ybBiYG/ymgd
 Vk6rBBtIfCB6M/f4UHRRFCyNueKd1qqdCR9xH3s5tJz4scNCZ09O17DYKWVypHXCk/Ir74CPHL3
 Lyp4z+MjcehkRWXUmkDoceY7rA04ti8=
X-Proofpoint-GUID: Uj5cy369CyMSFGG5gTqvtXJSezBFwuE_
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43b121 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ifCK-ypfc7Y0ayOvxkEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300110
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
	TAGGED_FROM(0.00)[bounces-115403-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2FEC6E41B0

On 6/17/26 2:53 PM, Neil Armstrong wrote:
> Add the VADC node and the initial pmk8550 adc channels.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index 3049eb6b46d7..639c0b1e0c33 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"
>  
>  / {
>  	reboot-mode {
> @@ -44,6 +45,35 @@ pon_resin: resin {
>  			};
>  		};
>  
> +		pmk8550_vadc: adc@9000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x9000>, <0x9100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;

same comments as I gave to Jishnu on the other series:

nit: interrupts before cells

and use interrupts-extended to avoid the issue described in

2d5cab9232ba ("arm64: dts: qcom: sc8280xp-pmics: Specify interrupt parent explicitly")

and please sort the node appropriately - with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


