Return-Path: <linux-arm-msm+bounces-89813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMtLDVRtcGkVXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:08:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24E51E17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 18CBF56A920
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8783ACEEC;
	Tue, 20 Jan 2026 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6vLZdgF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KV1ZJTh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A552F3EDADB
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907211; cv=none; b=PsYQVVZCcH95u93DmK8M6CTh+o4dztw//DuooLgy11KCU9DXDtHSfPFxKddx0s4JBk4EX6/fXHJ0aiNrlHndHPzwyBfNh1ExlYl13Q53vCgSFmCn3dIkQxTKxH1clC1E0PTaXeyeDLV54lOSEdSbDgsUQ/yFEBTEZWHhAXKdKFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907211; c=relaxed/simple;
	bh=qd4+Th94V2aKdqVjG6D5LnNUS6XetozG8x9QcYx7qOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wq5LL2XzxG5FyNuCuBKFOskfjGuZmGdH1lecKSGO0xnl1BGrPYgtYuPTjputIc5lpZBcYhPweQKCrIdk6aD3tV9Ls/vsDcbGTc8EeG753WBvvdQav8yk/qtdjViHDHJabNM6q8iS5YrA/fAFtwxNDUem3gWpva6nwehB7lJZMmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6vLZdgF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KV1ZJTh7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KAATfu3808948
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4NSu8zTti4kQhYydByRV1dDUaviriPhETn1j+QujkUA=; b=M6vLZdgFwAqcFoBD
	hlcaT4gy7N8WBMC7wQxJUr95n6MqcjQCuPqZ89Vi9SzOpKxg1J+N6ti3WqW/ndXo
	KoUHjztUOzLH7LNxuNTsCgAs0JjBqtuuaHSZVOOmDn9NHXiDx76RfabXaQYMWH/J
	vbejeRw0pSf4hOWZdXiSrK0T54uatpLoJkJ3krK3bRUD7kGRZTp1IpsTiIVWJ1oF
	ljlYqoVfipBhwdeaGh30PIlVfpe2fn97xEHRuXDw1Mvha4sfEeXpxKWacbHa382f
	FxdZj7pLwMae/mofy1r2AfswstNeDOHYFe8uLxf1G6sjw8a49/6JgM5wgME0T2C6
	5IVrCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt1f89bck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:06:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c536c9d2f7so195149385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 03:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768907208; x=1769512008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NSu8zTti4kQhYydByRV1dDUaviriPhETn1j+QujkUA=;
        b=KV1ZJTh78EuHoWG4X+V6iyvX69DvUh5deHBmNXiC9+f7K3G+Khb3Zer40bPp/2zV1X
         RPu4X09tcxJTsNW6wMZUz287B6UDbxDkffkkBTsX+J8LGXaj344dRgzrvjtK3kq3NHvm
         uod84wge5DJqRbuVlfjeHDr3OgXlmNJ/GgZLFLoUL8Y4TGPzJ3ECo71BkLj3Z7UYpNHE
         aRvqeAmMRiogANjgaf7x9F69DQYADfAzq+gekNz7Kn+wfxFT4a9ekZbDIZ3KQoi36Xks
         zgOKSoThpq4AktJ5fTuwUclZKEWTlnnwRJEDG0v4IUCw3I7SXyMYX0Z8l63JjyxphtYn
         O66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907208; x=1769512008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NSu8zTti4kQhYydByRV1dDUaviriPhETn1j+QujkUA=;
        b=mhmT/TYl7BoDpxcJG3pOXyc5L2mCG2fgTpzcEmah/GLGkERzYQVeCr9d3o4P/EigVF
         A9qeWMuho7SgGob6WMaRjnbneIDAwGlr++7ajfu+fqVt90oNh70RSK/eBszBTrMJtVv9
         a2YIXdzYakBZ0qsraab6TPm/Z7rs5ERcA4S+TTbhmnATB12zrSKWGceXMZ6PI0+ib5GE
         vQspWJ3H9/veH9GuK4aXbu01zNtbEC2/6KUHcytjh1TMipJ1pLDtCuGuvybZllAu0M9+
         VSxO527QBD6ssmtonzHbln8Il4tO+W8cyBfQmALvKCYNEaQvormji5iwINYK4/jRFQd9
         YZ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVyfeI6FAi9ofdivjywyH1WHep4+9lgcxEtcsgn7Y6jk3tstXh20ppl7F7sBpNZ7/sRdLPh/Gw085y1PmR3@vger.kernel.org
X-Gm-Message-State: AOJu0YzGgyn6L3lf7gz7q6MQwF7lGJ9bhxo4/GYfvjIWnmtufsKzUdaQ
	1mrjVWSYykYXXLMJ+ZbuHJ/YcUJyrperDC3qNrV4q2vT/g04+V5F63Wg10I9BkdUsZXe67wZVan
	pbWuZZcZKkiCKFokzfo8ZdBkpo5h6yNI5aIN/72LuzDlRURg1GZxo6zYz+UUykESQPgBj
X-Gm-Gg: AY/fxX7rBjL2oQiGkQX28kTPkxhElPtwGXfO/eH/AUpN+hG8V6zR2DN821L+efDcMfc
	mUQ0PYhd7/3faSWD5zZZfBH8dHLXzj9Gtoskq1zQcmdJk/FKlpLSYCSyE3jLau53+TA+W08jEmZ
	hM4D3WOuhzZP92ZbboEXBSNH00YiGPYpZEi+v5k7qOoVz2YyDP56s6+9OiFwOO8UysJsn/i8w9F
	Z0p7ikhTT8g0UkLG4Qry4TAO97GqK3QXS1szGEcSMFARUIH7z6OqMTPbqCjJX0EFqHwIi+HAjLS
	Kumrkyj/LvhHNTOC715G7Yj82ALT8ScePoNzxrW3cQa/PP2uiXM210KTLlBJ88jk7/m/M5aAQQh
	ELUq/PJb/3hp8gf7nrbh3FHDviZLI5NbhmeOaHObbRNHm09COSnwu2XLR/wLCGhEdv4Y=
X-Received: by 2002:a05:620a:1a1e:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c6a67d8224mr1384274885a.11.1768907207755;
        Tue, 20 Jan 2026 03:06:47 -0800 (PST)
X-Received: by 2002:a05:620a:1a1e:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c6a67d8224mr1384272185a.11.1768907207296;
        Tue, 20 Jan 2026 03:06:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca4d6sm1355982066b.39.2026.01.20.03.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:06:46 -0800 (PST)
Message-ID: <3c4b38a2-d526-4ac8-95ac-f4cc828d823d@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 12:06:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] sdm845: tama: Add AMS TCS3400 ambient light sensor
To: petr.hodina@protonmail.com, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260119-tsc3400-v1-0-82a65c5417aa@protonmail.com>
 <20260119-tsc3400-v1-3-82a65c5417aa@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-tsc3400-v1-3-82a65c5417aa@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA5MiBTYWx0ZWRfXz5rDa1Fn6hGD
 WB/0v6gnePLempipNFH2060ylDrhGkck8J5xteIALhvemW3UTEOXDy3GLrgOlvj+s79fGHxsuHG
 zayH86VyZflQLQwcl5CeIBkPTA4jgDI23Bi+vbwEdCDwhg1dVLvsjNXSf9wkJ6dd39Z0/968Z8w
 4Zs7kD9lwVN0/3qSCBTP/jZVsTNgrGK10dXj9Pq2U0R0/zrtiOFCZ8IVQ2JyaRy+nnFLEw9WKtx
 0eBl9+8a27gU9vFQz7xq3k97GeZ8CHWnP+VCLVK5+FSXZwA+7zsgoJv1yR+qipgrutCVx4Qa5x8
 RH2VYNu3P6kh/FjTBgbQ46fLqAoF1aHqW3zKe7E20vVM+1wgIODA4JNQmn5+tmKqyGkvMnn1sfR
 c2O3T3gphQ1a6YSNr6jTZ+XbEYQhK5cIXSePvAxdaqWV8l7SClNWuNDGLtkXYoZEpkSxwlNPCRB
 8p4aTcX4qIjiO6LJfRA==
X-Proofpoint-GUID: BQCDc8iTydd15GlRPLVYJf9uTy027e9L
X-Proofpoint-ORIG-GUID: BQCDc8iTydd15GlRPLVYJf9uTy027e9L
X-Authority-Analysis: v=2.4 cv=LdQxKzfi c=1 sm=1 tr=0 ts=696f61c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=oY6S75yeMliEVWA0OjEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200092
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-89813-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org,baylibre.com,analog.com,ixit.cz];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.39:email,protonmail.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF24E51E17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/19/26 6:19 PM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add device tree node for TCS3400 ambient light sensor with
> power supplies, interrupt on GPIO11, and pinctrl states.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
>  .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     | 36 +++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index 7dc9349eedfd..15d56d6831c5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -485,7 +485,23 @@ &i2c14 {
>  	clock-frequency = <400000>;
>  
>  	/* SONY ToF sensor @ 52 */
> -	/* AMS TCS3490 RGB+IR color sensor @ 72 */
> +
> +	tcs3400_sensor: tcs3400_sensor@39 {

node names (between ':' and '@') must not contain underscores,
and should be generic where possible, let's call it sensor@,
rgb-ir@ or perhaps colorimeter@ (Krzysztof, opinions?)

> +		compatible = "ams,tcs3400";
> +		reg = <0x39>;

I can't find supporting evidence for this reg change

> +
> +		interrupts-extended = <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
> +
> +		vdd-supply = <&vreg_l22a_2p8>;
> +		vio-supply = <&cam_vio_vreg>;
> +
> +		pinctrl-0 = <&ams_sensor_default>;
> +		pinctrl-1 = <&ams_sensor_sleep>;
> +
> +		ams,rgbcir-vdd-supply = <1>;
> +		ams,rgbcir-gpio-vdd = <0>;
> +		ams,rgbcir-vio-supply = <1>;
> +	};
>  };
>  
>  &ibb {
> @@ -751,6 +767,24 @@ int-pins {
>  			bias-pull-down;
>  		};
>  	};
> +
> +	ams_sensor_default: ams-sensor-default-state {
> +		int-pins {

Drop this inner level, define the properties directly under the
-state node, both cases

Konrad

