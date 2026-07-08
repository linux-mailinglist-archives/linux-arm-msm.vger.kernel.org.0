Return-Path: <linux-arm-msm+bounces-117751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qzumF7duTmp+MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:37:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A62027281D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:37:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zz0An9vk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZCkdRjvV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117751-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117751-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 164E33201556
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38303AC0F4;
	Wed,  8 Jul 2026 15:15:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7D349CFC
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:15:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523715; cv=none; b=uKEeUC5LaByzfV+0+KSrjctLoogaK38mTRJq31vjjHUw95AOaD1KCdE3Q2WT71FOh1ba4EufmZYinviioV4ikFtjYJFVR1Og+KtoO77pDRmNCPaomeAHz5h8GFC2QHmZWZ2snVvhV+utRr9pBEw4oaw8p0cTdSCwENhF6SlVM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523715; c=relaxed/simple;
	bh=06pp6G3KkhWYzK+vY3emAkxSkwfpFDDYROrrg072vf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S22FOxr8Mn4pPd9WIaQI8ohbmpHrPTc50DX/EMMrEZcZ8u5AvwwwGRdJuMiFta2Ft5fWt6nomKwjzGm9ge5pwkvto3D7ewELeKYE3Jw6CCTpTck29QU6L/shdSKr7/K2myM+OSarwIFS2tW+kVtr6lFzSZBt34A03PJmgSCj61Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zz0An9vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCkdRjvV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3PoQ2667189
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Q8l08ZeJoDDd2lDvSh+I61vIGH6bhJAPIGzGpxtJ2w=; b=Zz0An9vktjmHRSAP
	uF4EvjhIlutU+oeYel5T+WPvSLW6oiNoLue5fvZGdKVpDX2gVHdVNNqW+EmmdFQB
	EVSbIOzksBZy8d9/U6FOG0ZUNNXkwj0EJKC+WM+pIhbzYNAkVxAwKnE7V0oHTQfO
	XLNnPvx6NRIKyOrvkdq186PP+YTR4qG7ZRQit5SAkPIxXKPZ+C5rn1ibLipZNZuX
	MGPIOXonHaf6nYTH+w/bZiY5uShfOJ7GNZjOZQ5/1MrAXzvC0gzKuzkVElRKrMic
	L1Fe35NGlXVzOr3Zh+HSlY5b4xxqP0lLS5SHZ/eOxtTq0jdu9FiVT8TKo25kEusJ
	d1Zr5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hguu9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:15:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3810960140eso1567374a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523712; x=1784128512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Q8l08ZeJoDDd2lDvSh+I61vIGH6bhJAPIGzGpxtJ2w=;
        b=ZCkdRjvV5geRgzTM/NGAA7pIGzckr2khB0Mf2AqqAyh1rjMFN+G7/R2015dNM5+oeQ
         XwldmZVX84OPD8SRCisFLWvSaYH1CcT+FPci59SWBbwZZCQV03Hc8osEFcdfzSnvMuYY
         6pPZMTNbLO2c+3fiJUbjH+BrH5wrYvK4vFqYhHg2AmNNZ4YTTbN913lWdByeaai1CWne
         3leYpu0004Y2ssSwMKix7dCMlac3YbUoYqMsmDW0Us1q3wGSen9xhyXxr8GNSVRcCZCO
         fxlbk5Frb9X/0O5f+XN9qI6jacm7n1BiNpcifecn/NKOZvsUdqXK06OB0prYhpOdIyM6
         L4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523712; x=1784128512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Q8l08ZeJoDDd2lDvSh+I61vIGH6bhJAPIGzGpxtJ2w=;
        b=ZMbC5cBiwdn2yEyPRZ4HnXQanPEGWslNYNlwly/cy/NyTiFpDCKH9oP1D4psYpsIoG
         57N0ljax3fKK+pCn7HK57qit8mNeCV36HKaqXEeYrQHZJqQ9428wlXkLdSGjEC7dFNG7
         KoWZkjquL9s66ZpKfLW/zonv+YdNMR/TrKphNQgQH95gD9GbUeDs8L3QXFsFvhrswene
         Q2xHLpUaVAZpiU9irQpldk/IpE8s6mIxIl+aDjHzel9jlEn89zkVvR/gJvqRXw8WHDsm
         ZJ6UzNlOI/GxrQaxJ5X/8OrkHBcVng+aq8b3nbSTY3Jr/gY3Y4eN16BfewRxwV2hYedk
         pl4A==
X-Gm-Message-State: AOJu0Yy3GnYi5vrbPtxaLkFqNEtm6cdpTthjk5UZIP6Ow/Cprn2EtSWs
	GOCuHu51tmefufLm3VAYKq3Fc6t25w8EXHGAzLUvAbxXqg7t1ek+bIROcgRvO5hMAXzLiCm74PH
	tMbcz08MgJstLbuZdN3knRGovBQgA0Y3eiIbvuelTXbw/2RAwCnrMonsZR/kdU0dlqQUR
X-Gm-Gg: AfdE7cnceEJCOtIB0y4refpwE6a06fZVDj8ugeHkN8MWv+mlFJRGnbaLD9hupgucgJt
	UzjZnlKmveHdOrr+vYye0pv/fW+JuVOljOCQEbidMN8bKp2ivd1lsh+wjJpn7g/AZ1CqVJYNl/U
	MuI2kfz5WY/zu8fWLUA4AzG9AOMrRkKqrOcH69Ms2gdqrygoDbsoulqgsmN0zrqM2UPufyzl31J
	tSQNHJmAdpSBInG6beBiM5nrFxy3kz/lV9Adr134kNCdp593iOlnjNvKk1zRqHLdRqnnNHkDkm+
	/zcmhZc15saEeBBIZPWNTTxJDrwot2hNBouynqxjXFRrQJzJ8c+jekb7bkQtVCeRDKS1xMGEQ0j
	/+7r2U3jPajC9IRq4rHtjydr0tkfN5NNBg2dYtSNejw1F/mED9SI6qxaTYkTgO1S7qan8NyIKQb
	eA/w==
X-Received: by 2002:a17:90b:3fcb:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-38941cc76camr3267646a91.26.1783523712148;
        Wed, 08 Jul 2026 08:15:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-38941cc76camr3267592a91.26.1783523711707;
        Wed, 08 Jul 2026 08:15:11 -0700 (PDT)
Received: from ?IPV6:2409:4091:c00d:4a15:d9c4:b604:397e:f06e? ([2409:4091:c00d:4a15:d9c4:b604:397e:f06e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm22558561eec.27.2026.07.08.08.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:15:11 -0700 (PDT)
Message-ID: <f95666d3-3349-4598-84fa-bbe1c868ed69@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:45:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
 <93513477-d606-4881-b5f2-0e04e3a4146d@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <93513477-d606-4881-b5f2-0e04e3a4146d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tArLiSboeF24lZRfPk9PNta81zcO-Umf
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e6981 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4vn8qff8xjHfPtou0l8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: tArLiSboeF24lZRfPk9PNta81zcO-Umf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX5s7BgaIa/YYb
 ZyB3hzczV873xjUlJtG97WSMB+NjEpeB/aQEVgh1G4/xU/WOqpu+ilc7dPO84XRLQbXLHSqsEYN
 enh3gQSbn3DVxPRaK73LpBdlr5dL7l4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX1m273ctIiZQB
 mtKm0j9b3n+OVag3um4D4SFWaxU1N2AW3MXSkowtdeOGQA7odV9QExVR4M8lHN3qEankiX8omXC
 X16NrRzCUUjkupmS3pYNfEjmqfn3dKRVVcNOwuJD7vjsPKSEr12hho/w5+wYY6QPA1KbsRuATWS
 mZJaR6IxaWzQD2cTF6ypPVVLpv+3k5oKE+3F5B9BMVR0cBYoRU/rT1qa553jDytIVqD3avBYobQ
 BTftqt5aEAyoTQw08Yy/PaW8o6WkzHiVK5jlGpOtqIH1XRlN8BAZr8tkduCLFH1h6WT0SaqbDtI
 inz/aKB9SH9tmDvwxOyIELImV2/q41cPgpnLPdYrCoqfaf+FqDt5CgR8ISYcQSExDHumomBwYmt
 vPqJXBsSUpaAzGDphrk+NU7hoKy2c7nmOtSCKvn1GSLLB/ATztcq/dx9viwvSFwKrY/V1KUbnLs
 u37NHvJfhWUme9nb8+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-117751-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A62027281D0



On 06-Jul-26 2:53 PM, Maulik Shah (mkshah) wrote:
> 
> 
> On 7/3/2026 4:43 PM, Sneh Mankad wrote:
>> Add support to display subsystem level LPM stats for shikra.
> 
> Instead of,
> arm64: dts: qcom: shikra: Add LPM stats support for subsystems
> 
> Below better explains,
> 
> arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific
> 
> Generic qcom,rpm-stats only reads SoC level low power modes like vmin and vlow.
> 
> Shikra SoC specific compatible allows reading individual subsystem level low power mode stats
> along with SoC level low power modes. Change it.

Yes that makes sense, will update the explanation.

Thanks,
Sneh
> 
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
>>  		};
>>  
>>  		sram@4690000 {
>> -			compatible = "qcom,rpm-stats";
>> +			compatible = "qcom,shikra-rpm-stats";
>>  			reg = <0x0 0x04690000 0x0 0x14000>;
>>  		};
>>  
>>
> 


