Return-Path: <linux-arm-msm+bounces-114136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8O7lDQBUOmre6AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:38:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD58B6B5DBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:38:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PUKWMtJq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fneRlcVp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114136-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114136-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A12B5302EAAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E723C73C9;
	Tue, 23 Jun 2026 09:37:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88B35F5E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:37:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207474; cv=none; b=fMq67kNhljYlPl4Xdp6Lpw7qNTKjSScb7Ue9fEJEbsYmhAVw9iCOO4sWwMP8CrfFTpTOwt7QZThSJtOPugeP5ne/Je1F7yZf3Gg2D+j0/X45z/Tucla+usNn3zp/xYKoRRD58yZqnCxWJm0JJb3RSwcl7DAZs/Id55nnwDfCcuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207474; c=relaxed/simple;
	bh=2wVq63q5P0hf32yJ9O1fniufU7zytoJEohnw2ghclDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+S1RyJqtDVDd3eSzhQQmWS0s/c33ihBsi/c3BWWhoGWcrDLVgio78reNZws8iiqSTDy+xt1hUNcQN9rt9O9OPaSrLoMmMQuXFBX1lAaWbm2ngNUEb3EDzP0+8425l84iOUgWHLOjScVqejVLo7JmDRZ/SVa+hN4D/j+m+a1FDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUKWMtJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fneRlcVp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cd9a3338372
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwtP61IdAgBU22DmFB1IdTuyyl9/rAce+FGuyNSJ3Fk=; b=PUKWMtJqbTB13do1
	1kuM0dIsQrTO8MZuuAODDNZssgXsyorwE33rwgH8lX5G3WrlZFXlWtnP8Dmz2X5D
	TK7sGvUSHHj+710p11cYyCH200Ei+JTNQj2yzccO57X/9njZ9iqu0d22af+9zrCF
	OV7DGEXPnM5yR0RapB1jxozVWkDtVcwl2zt/6SxYccaBjcDeWIKqQbkXqNaVLB1i
	IlmDHbpIekraiDTXmBy08vugiaLVr0To/IJsZGzqLj/RpmYuN74js7if7fxGvy6x
	TI1TIcqc/PKZJHq3OcwpxgY8mCUpwAUdqepEezehIB+2DbuLJ3aEPbM2RlmtsoCc
	AnPTiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhm0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:37:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a15cef334so6082271cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207471; x=1782812271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bwtP61IdAgBU22DmFB1IdTuyyl9/rAce+FGuyNSJ3Fk=;
        b=fneRlcVpqrx5sykIJ6tIknatL6BvgzAtlQ9FaY6euEpULlmEx6jO6nJ2hjT6ZFEOu4
         aGmIQ7ynppR2wgGPq4Rglp1pYrBpfzarRz/6+orTl+EUZldgZ7NjtBqvDx43Witl472t
         1Ek5U4uDPOfu2fC0y8NMvk7ugV917Eet+H/Sm39+jKbYc7npc3pgnCo/vuEF2pO/V5z2
         jNgV2l1Eda4XHKAxxdP+wfXkE40kcV7kOExY47PqU+/F1tZgVbrLdgO6E2Wz7ObNg1kL
         AKfqTWGlkRU/Jr5czwrTbpTtsa94khWXbLyVxRhR3Ugmvj2zOn5D0JSsYH9oInoV3lH8
         wQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207471; x=1782812271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwtP61IdAgBU22DmFB1IdTuyyl9/rAce+FGuyNSJ3Fk=;
        b=jXsin4XXERrD562LSvquwJ9+CfAnsFefPNqWI2SodmvQl+3XXqmCP5UTdI9i/LqhG/
         RWenwrGPP+5c76ufFfPlBu/yo8aXKYS/j5dAIo4yEgX1467a9GQ6GypYyG2tZrKSSiuJ
         mRD2QBC7Q3+GKEKio6zWPRQaa2lfatgIdoXNRuEES7fCWMwG+dJdV7f7fg/CK1cgyLy/
         GOFSVovvPhL6nQGDDAkm1oUeMzsUiafKHyOPImv07MFiaXeyHzvGdLFB1efH4Px50wJh
         Yx4uuzmenBGJjtvBNmD9FQT8ni7PmSpYa3qI1bEk6hZiQHxRXjGyvlAMAfAPrLLtPYk/
         swyA==
X-Gm-Message-State: AOJu0YwibakdNDXcnxRoNmOLNqqkEzB/pXy12tC9xQTHnpHpCeBxahrT
	PFDnrkNNP2nzJhdhjGAwalqJ1HogbBzjmjFFtnT72g5RxpD4vzUYOCsK8KCXw2Q44s//wHABkah
	fTfGtHLdhmQRg+pe02Sv9zjFZ1/93Z/J4RZKopJa0sSdDojRovDG/FNwwTE5kW+gEltsM
X-Gm-Gg: AfdE7ckn8nKtIvgUm71Zw33hstH2D8ex9VEqjrH7/8gBjDPQcZb6yDBxGXYsz1bdyVO
	+6BoHuJvjFpYkzSS95NMnFv2lwRqBIqjXM8aB7DdrpFoHKE34WwJdjWe/kyUtAHiWGDnXXfsoYD
	0o5Xw9CZ82PwktGdR9VrMHejhBXyjU0+dCCjeCcwxcIgRDYpjzlvvIsKrJQ99fLQVDiD0p0ycw1
	DXqsqMdHpuPOLOVVnniPXoGittDNBD9oOn0ZImBh2uPSYyyxrqRyYvdBTLKzGppfObXeQQu3tG5
	bDkXWO7/dsLBRiXQtcxT5wAZPKcWV8otPO0i6X04dPlnBzp+rVEFd1DrN33Pwvy+lLhvuPLyKBU
	RAcBgOfce81GQszYP/MX+HFVY2uL12dMhqmU=
X-Received: by 2002:ac8:5d56:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-51a4f4c3867mr43266641cf.5.1782207470974;
        Tue, 23 Jun 2026 02:37:50 -0700 (PDT)
X-Received: by 2002:ac8:5d56:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-51a4f4c3867mr43266391cf.5.1782207470362;
        Tue, 23 Jun 2026 02:37:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be31c73sm4549155a12.17.2026.06.23.02.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:37:49 -0700 (PDT)
Message-ID: <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:37:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
 <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3NyBTYWx0ZWRfX0oRg+kKziNRU
 H2nyxdWG2uGoc04Z/EQSuCHGG0fFdI7JSDiv+FYDCkOrmqhGvdZBoOKtvhrVOXt03c06vh4iaHz
 a1nPrfkGEiZnzmBj9tC+Uu01YE1Zuno=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3NyBTYWx0ZWRfX++1oLDX+dfgC
 vePmgaY55bMI6k/AYGikNHyvStrDxVV2tGDvjC0oLnbbYczr2xuXzbxPx8D1Hv/9Wsr7BBKHKGC
 myzcn57Vwq5U26GKieScawWTZup2P7gEL9D0SFDy+xP7RRM29OfhwXCzsPFR9RHjK227czjNU4Q
 V6pOtu3+XNYL22M9lbi42SnFVoKBcasGllBYGDKoQC8QziQNdoAj4Gm6WqVpzRaGsEHjZnT88hy
 urLWxdfucV9UrQz2FXRtQMUJWffEaBNXB0IdEA2uJRp5SuFBtZWHPO+a/tS3T54OaMM5BxgXiTc
 9McGAa7tcNqBWzkRIOdHE3vaKuTEuAxGcNOUSXFgmSfTnZ57QsAkZl05ZvpJYFOXOYB1TBgMIGu
 UTFijYj46hqRVgfOzzif8RGEkBDNRg==
X-Proofpoint-GUID: iOs7kpuWbooo8rGcfan4cZd99vS8Jlvy
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a53ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=brZ7cBQDmfkCTKpPTsIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: iOs7kpuWbooo8rGcfan4cZd99vS8Jlvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114136-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,proton.me:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD58B6B5DBD

On 6/23/26 3:44 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Add support for IPA in DT while expanding the IMEM region just enough to
> accommodate the modem tables used by IPA.
> As reference, SM8450 uses IPA v5.1.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

[...]

>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 55 ++++++++++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 56cb6e959e4e..c904720008fa 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2639,6 +2639,47 @@ adreno_smmu: iommu@3da0000 {
>  			dma-coherent;
>  		};
>  
> +		ipa: ipa@3f40000 {
> +			compatible = "qcom,sm8450-ipa";
> +
> +			iommus = <&apps_smmu 0x5c0 0x0>,
> +				 <&apps_smmu 0x5c2 0x0>;
> +			reg = <0 0x3f40000 0 0x10000>,
> +			      <0 0x3f50000 0 0x5000>,

size = 0xb0000 for the RAM and uC regions that the driver seems
to poke at (at a glance anyway..)

[...]

>  		usb_1_hsphy: phy@88e3000 {
>  			compatible = "qcom,sm8450-usb-hs-phy",
>  				     "qcom,usb-snps-hs-7nm-phy";
> @@ -4970,17 +5011,21 @@ cti@13900000 {
>  			clock-names = "apb_pclk";
>  		};
>  
> -		sram@146aa000 {
> +		sram@146a8000 {
>  			compatible = "qcom,sm8450-imem", "syscon", "simple-mfd";
> -			reg = <0 0x146aa000 0 0x1000>;
> -			ranges = <0 0 0x146aa000 0x1000>;
> +			reg = <0 0x146a8000 0 0x3000>;

base=0x1468_0000
size=0x40_000

Konrad

