Return-Path: <linux-arm-msm+bounces-92025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPRkJFjMhWlWGgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 12:11:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4683FD0C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 12:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C3A9300917C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 11:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279D939524D;
	Fri,  6 Feb 2026 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cutHuSQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpnY8Jza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93FA376488
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376066; cv=none; b=PNKbiroDQkI7toQA8Y2uFmZ3tFVvdigAQ9QnlHsfcHChTqWVxrmx5DUnwvmM57cApDQK1uaZrn2rwfRH+eLd53GAGzk8ScefPAULPJk7NVT6g9ORUfmukwWinZ7hStYofyG7vx88Czu91VKEPRUzcNAOAhK9HzIc4Ggm3UsXF34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376066; c=relaxed/simple;
	bh=+yFKYS9dJmSB/fowYx6rpZMMnRfBFuyq/cdEtCn80i8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+RVkbGvgKWp4BNXhYJrYs4B9Sh/rpvEzTk1JmOdEDwIULaLSDS73pwztHNYKw33aK2MlTDqF+U/6nntGZlzzJwg2t7LRCW1cXU3o6RPM9r0gf4I78NhYh/0J8/lOHofjjS6KjD/1wZZx1EXOsKqcLy5D/uqogBzFBkGvMtudYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cutHuSQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpnY8Jza; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616B2mtH2938808
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 11:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmnJDbMdmYg9mmGsQVZ9ALxcPAyJadi+kElzUo3o+r0=; b=cutHuSQWHqdV6v6A
	DH1bP4hE26qWnovw9Zpn6r2liw7zO3HCXJ2V2Odm2GlNbrPiB+eN+SCBiWCF+42a
	ia+Po0dB01RXf72k/KLx/hs7quV3vWCr9VjpouYZ/frIMQO7gFjpZz0I1ISOAmug
	1K7N89ZNUajVkHJg9u2lUpVbKx4tudGTZxZEtNfUOVvw03MWYLMeamLob2rZq0xZ
	8zmfdahtG04rowGAn3w1XLa94LIRf1QVLLad2K7cs795rGTWNkdvYsG68KRRi/2l
	HozOzB1Kbj7jXuCRatfWpNbCep+r5NFWZ5JIYkh+pF8eAArjeSZV9GzRJygtaVUB
	uBVpnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5f35r0e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 11:07:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so68031385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 03:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770376064; x=1770980864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmnJDbMdmYg9mmGsQVZ9ALxcPAyJadi+kElzUo3o+r0=;
        b=FpnY8Jza4zQaGefHdYPmtD9ShcqP89njqlG904ZdNugGFqwWw3UQ3mT/1eMqNFJr3d
         UHkQfHixelc7b5IYTT8gSCvyD5M+aibrIe0AM3QgsTjWBouqAkiG4cvLfgbwYjnVesYQ
         8eQLy1qLRGUSGw8ZTzwG5vOP6uDvGIZ/SN6IanXkBl5TkjUIEaTx5Lyr0/3ACWq0pdBd
         1ekk1nJNGKE9OxXkdJGDO/2RPbi4Bwl2RoSlWBRfzXUty0E3FHBsn+SP+MA+C3Bbr50o
         ZaS4M8tZkxu/gXmRMq0Eo50ttXBvJl6DEgRIP/fhlkgxiftDGjU86C3yO4wsUDQXEDFy
         Qz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376064; x=1770980864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmnJDbMdmYg9mmGsQVZ9ALxcPAyJadi+kElzUo3o+r0=;
        b=QClK/oB1tZqRzNKwcWpz7lzCGUVJhXOWN7HvPtyygo9y6iJ7bnCr7TCS95/Utyofje
         JsmvNvrXxnirvboC6Jyp/iujvsY7zg8y1/SY4J5AG1+X5rc1vkMsa7pZNgexSiuhOjqu
         HBAF9z2ZGRpP6xx/fWW8Rx3O0SZ8y5RQOem+lvRLsuzWnGoXL4FFYo/pO9up0OwlDUz3
         kOIiirZ/0aCkQnWm6HxGtAV687V01r5WqCdg73UssYbpviX8Cf5eMWWEM6WeskbrFIT0
         MFDOlfIz7wTImdtZgvHWfO/ov+JSeFpQWX7K20jUpaLdRUU7z8EoX9AtC4mUfQoAgHeR
         tdFg==
X-Gm-Message-State: AOJu0Yy70RIL0dHND4sUtudNdfGpR+uyid5f5XR1kpN8ViLjlvFXSlyC
	69Rkgqht1tPtShUOxIrJXnhAEAW/gcHwYJTfOK47iNLLWzXBJTBaP8p/aPbilskXwKFZzuDx1lO
	t5LP6yavntWihdOdg04aizyM7Kt/nw83KVIefmJ1y6b91jTt4CygM8kIdczxFpjASPJ3k
X-Gm-Gg: AZuq6aLXg0wVCeXJJib0BPF4+bDOdLVVUJCHXQT9/jDBxjjjKKp2da1KiKZmJrdtNwF
	vUq6XSjdp3NkzigoGuUbVBQT5iF5iB1xyuNVlPFA+1wV5i6oo0HGCyh/Uk5gNUAhr1YPFyREnuy
	7O3DKaXjUpGPJtwHgafQqUtdbhdv1zcXGPcDTr76cnnAFv5zpcZ0XBIm2p3X8bGj6GjQCRmi93W
	rF5x+rGIpLSZ9UqPsoNRfsmWSQnhCrrCB+afjppP9QDLCmUJVqQU3+h2nPNqdByWjeVXAeCnld+
	23ooDbgDKvK/ARu82q35iMatE7vPaXDisw1BW87mmX36SqctdO1wIudEnHHq3V71ghPKe6BGQpT
	hCJO10lpOLgh/j3od83dftzERGEweOGuzsUFEHwwaBAuYLdw8YiYr7gC+5LjKWU8iURw=
X-Received: by 2002:a05:620a:2a07:b0:8c6:f997:d6d1 with SMTP id af79cd13be357-8caf13ffa16mr206281385a.8.1770376064212;
        Fri, 06 Feb 2026 03:07:44 -0800 (PST)
X-Received: by 2002:a05:620a:2a07:b0:8c6:f997:d6d1 with SMTP id af79cd13be357-8caf13ffa16mr206279785a.8.1770376063787;
        Fri, 06 Feb 2026 03:07:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a2ff9sm73213866b.19.2026.02.06.03.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 03:07:43 -0800 (PST)
Message-ID: <678e0de7-7f72-4bd0-9538-ef1feef15a56@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 12:07:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary USB
 controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
 <20260206104642.1038381-3-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206104642.1038381-3-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IklY6efbaRP8wKvbLer8DmCRx6Twt0NM
X-Proofpoint-ORIG-GUID: IklY6efbaRP8wKvbLer8DmCRx6Twt0NM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA3NiBTYWx0ZWRfX616vs4pbaqEc
 bPzx0bXDix28L/aMmmTpo7ZdDb76fumDW2DtS6OI1F5Tk4xtdKbrQyzzi9+CWA8eniE6/+nICb1
 ZdGrnjuS8/vf5ZEPbCkkGmL/ZgggchV35LY7wGAJVHqpQfkuRADv8yFlrkFKpslX9uO5BveRiV1
 +0CwnPNKBJOHWP4ZbnjV5ODO3ZS12sCgBOafyD5qkbd3XijU0lCwNo8hFO16XdDl++XpL0ky7Bd
 9VHr/Al3c1vbIsv5TVeDaKIIaMbehlUG7LFanU40ZlTzKLp8bqynbbl+5Kt4amuPd/prLP3otIi
 HYSI4lQH1npZ/oPmEUlneHZ1KT/YyKNOSAX3e/LC65xk18NmeMGALbuOvqd7Hri/MlrjctSd7S2
 NrnrwaATtVkjv1fgUdKOMBPastpm3TgTT7IdTYxnLhtJlnRHUx7PoHJq7OOqcZzmtCMOMCSbcXH
 4Jha4n/8c1kK4ylswPA==
X-Authority-Analysis: v=2.4 cv=ApnjHe9P c=1 sm=1 tr=0 ts=6985cb81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=JTK9GTTYModBYemmL5AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,a400000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92025-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4683FD0C7
X-Rspamd-Action: no action

On 2/6/26 11:46 AM, Swati Agarwal wrote:
> Enable the tertiary usb controller connected to micro usb port in OTG mode
> on Lemans EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

[...]

> +	vbus_supply_regulator_2: vbus-supply-regulator_2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vbus_supply_2";
> +		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;

Are you sure it's boot-on? vbus_supply_regulator_0 isn't marked as such,
or maybe is that one wrong?


[...]

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 808827b83553..2710927c9172 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
>  			snps,dis-u1-entry-quirk;
>  			snps,dis-u2-entry-quirk;
>  
> +			usb-role-switch;
>  			status = "disabled";

Please leave a \n above 'status'

Konrad

