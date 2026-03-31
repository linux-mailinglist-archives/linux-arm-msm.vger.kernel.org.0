Return-Path: <linux-arm-msm+bounces-101118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CGaJHERzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:24:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3340B36FEC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D8E03020A5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287F337BE98;
	Tue, 31 Mar 2026 18:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TY1Ui2sa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YX0UiVTx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C265E37AA76
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981485; cv=none; b=QpdKm/mhnaj7Tagn5Oa03JDdMkMJD54e1Tdz8LJD5stJpcDpDmX+im43AKMIKFEdEqxmLj42H6gKjwkr0gjDnqEZmQV3igBsf61bMMlXgJT/p1lV5EkAAw2b142BOjQFGtjR+EynalvcFfc4E3L46pa6TvJS7EbZLifhKjAlWyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981485; c=relaxed/simple;
	bh=4Y0QZZf7hx7OxnfngFgck/ptzeCaLWIRizIPuutL2gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRuQ6tZTcDkVT+KjZii3me5wU7KvzG091qGJCWdVYxy6DjbfkuTgacfey+8rrOi4eW5Fgupd7kTZk1CMBzsWNEqVhzXV6TFZSD0xysF/KMCxj30mL0xRLBVUlc3gwSrSZqr7EJoQlymFiJN0LeGyYY+EiV/6pDlm6gB3MqphxQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TY1Ui2sa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YX0UiVTx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VIGojj3081339
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/CWZbyw95JjqJqWLA6GpFRlU
	U3PYOcL3cCFiiHuW7b4=; b=TY1Ui2salHX+314tX7JZYQH1a9tRAIaDQf0Uedvf
	ccm4DkCqI4CCZyydNqbnVYJKkcc/N93VbofDKGbi5wOH980qSQfV9pgjjMZWplo6
	/lZH0iVFL3Ovw2dOaj/DjwJhD7OZL5MP3wLcXyANt+e/oMba15jtHYAq+PEz+OdP
	DkVtL2RvnNayfv7ewPBpZ/NhkmEX0v42ZjCHx73yMQeNRZvQwSbzhDHeTOir1kxS
	9iDqgoCdZyvFTudQbLUYDL4rxjzxrCiW0uG6/auzveiBqmEmTdS0YRNCRfRd2KEP
	OPUnbgJtcMq/2NCew1NPV9ijncUsNwCXQ1u0UhG04M4JEA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkr0xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:24:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso200102321cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774981482; x=1775586282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CWZbyw95JjqJqWLA6GpFRlUU3PYOcL3cCFiiHuW7b4=;
        b=YX0UiVTx2cNxZqn1tCLjO3f2XATgCH7GDfzTJsXl/WzBREcFkiOXoyKK1BVwBSK1vi
         cjkYXFXOOd1C1fzeYHGk8oeJ7Zqj7DM2ri7wJnbglCGn/7cNi2aqdQa0RWIYM3gBwH8l
         JDnPxmwennkt6Wg0TIJEcOWEke6iK++ZA5+iteAopd7Oq+aiDJf9uzgMTGFts8qN/OZY
         NNERUsSfwxbVizDJb/7wB5KXLx2u7IR621TqPCHPKrO49J0pTXE4pb3epsHkwYkNQshR
         lnNPmyYmw9oV8zQqblGFT0NKca9Jy2qW9pbKANgiqB4ymg/HXdlBeiMYDIs2NJKayxMA
         dGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774981482; x=1775586282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CWZbyw95JjqJqWLA6GpFRlUU3PYOcL3cCFiiHuW7b4=;
        b=WI7IYjSMbjZr5tDZOkiPVFnDAniSgp+ha1P2ASAd+8pEMRnfIuqtqhTYqK7cb/VehP
         Q0ZGrJtAgJ7gHjyLtoNCdcn7Hr7ytOGsmDiPs9jC6DyDqHX3Vq9ks2yNFGQQEb6U+Pck
         EMNdWcPkJVqmLS5e1qKvB7ygtf9SMX/qDy35qtx5x1kzdCI+U2gRe8XJFOL0U8E+O+pe
         j/vFk8TRx2YeBmBrA4VqNqXqCzjWtqrVoLZco5Vz5pQlehAythedKCNf1+8YUBW60biX
         KWJHO60OA7hbll4WBcYmk6oYOnmJHAvdTUeBs1Npla0NDNYByNGTOc2MM/3XOnb3zuGT
         u3fg==
X-Forwarded-Encrypted: i=1; AJvYcCW0YPmfjxpk5pEwP6OF88RGQpypJgFQfKwpFfWOXT1xLK5cgjaLwB5iCwoRBFeQ9SbA6+NeCp0KfMOecOgM@vger.kernel.org
X-Gm-Message-State: AOJu0YyDRSLplK14u73pt6b5TTzYTsuYl1nSAGcspSMsCFITkQa8LMzw
	qhdS9V8vW2vlPGcIs31CWOlbPmN4NbvFnL2J+TaD+7ZhQ1xCL9DSMBtHy/HxVI0iTTZxtnQIeFo
	eFOjAEVA5Ru/rm2IIffbOzfNtz6HS0Y04KQTcaI2i1Jz+pMeQOyoULLQuioyj3PCutrNu
X-Gm-Gg: ATEYQzwVk976pYEercbrik3Rio4pWLeDEo3Ya50wgu6pAL9ODKzIuOwqFMKoY7Mx46s
	p71ZY2ldy6gwCSHmW9BZ+h34zemGlocduxadWnD6TNzVi8FOVDHEbqehPZqCbBLmbEUVSjXEv+W
	qwYRpVlIA+oiNQidPnZYwI31Gh0EgvbhBYNg0MfFURzzJsmmGnVfgMNcmRDuj/yRSNzpqpBwvKm
	4vt7oP1ASaVZx0LUHfuJMSHC0nlnAlLhSNRytUVn0qcGScvesmD7e4dJSCMupcuwyZMOWjf29RU
	H91/jwnU8OUsdyHEucVXkyJ2LSNIX7eUrVKzUBKrEcjcO7FqIwGCJNUFqWGABQ330FGGxyeAigj
	gYuWXBduJScirxrIqgZE+Bz43OF3nQ7E0K0sWDqcQqfHHqu382Hj7MofLH4o3dw3IaOpolj/Pl/
	aI3RuCK5Vwpk0K/l2rlL3ateSR/lNdVrhsFI4=
X-Received: by 2002:a05:622a:1f99:b0:50b:43b8:d5a5 with SMTP id d75a77b69052e-50d3bca3f3dmr8612991cf.39.1774981482027;
        Tue, 31 Mar 2026 11:24:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1f99:b0:50b:43b8:d5a5 with SMTP id d75a77b69052e-50d3bca3f3dmr8612431cf.39.1774981481522;
        Tue, 31 Mar 2026 11:24:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838daa4bsm25924981fa.32.2026.03.31.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:24:40 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:24:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
Message-ID: <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
 <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3NSBTYWx0ZWRfX/U6VoeWrec1x
 8ggCHsofxk8TGVwlu0HtfVgTVpa3I/DmRskacirJHqI0b4G+J02Agv7Y4nRZODotucqBXKixIEJ
 bhtpXIN72mwKqp6Kx6UwzajnQ4h9KQVTCnIRBitIzf0GjdhrC7xTGyLz6+8cIk9O0JcsNl6erFg
 uSJJrRqMLtcf9DEqg7Gfbwpo63aZS/hif0rjKEfwxVll9AVFFuyimPnzOYP6IQoUe4GH2zO69fa
 E2Rm2oyve7EykgyMeP29uRkjEQgAQjNhhGoG7LhE/Uq1BWGcJPIXz0hCmYMnmEEGsOFjVUWrhkl
 E454nEDoMnuACtBO17MEqvhooK3MTq8V0vpCrFaT1ALAqdXufvKGRnMN68DugTgLYpVF5JeUvK0
 Kv6PVMgZnM0xvHugo5ZpsJwP1gGxFquwSGdw99+AMIEZXBKmFt+tFWyQ+jhptIDtAktV+tiVeX4
 7s6JrNg2PGD1zH1ICZw==
X-Proofpoint-GUID: f1q34yLQ-PiURgPXgjZQH7n93nkA1cVE
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cc116b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=OQN141zOAAAA:20
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=34O5YtzfCyVlAbwKECEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: f1q34yLQ-PiURgPXgjZQH7n93nkA1cVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310175
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101118-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,ixit.cz,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,4a:email,ixit.cz:email,2e:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3340B36FEC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 10:08:09AM -0700, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add camera flash support for the Samsung Galaxy Express (expressatt).
> 
> The flash IC uses a one-wire pulse-count protocol on GPIO 3, powered
> by a GPIO-controlled fixed regulator on PMIC MPP 4. The regulator is
> modeled as a regulator-fixed node and supplied to the flash IC via
> vin-supply.
> 
> Downstream references:
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
> 
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> index c4b98af6955d..35514fd53e3d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  
>  #include "qcom-msm8960.dtsi"
> @@ -61,6 +62,32 @@ touchkey_enable: touchkey-enable {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_flash: regulator-flash {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_FLASH_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&flash_led_unlock>;
> +		pinctrl-names = "default";
> +	};
> +
> +	led-controller {

It looks like the nodes are not sorted. Could you please make sure that
they are sorted alphanumerically (if there is no node address)?

> +		compatible = "richtek,rt8515";
> +		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vreg_flash>;
> +		richtek,rfs-ohms = <16000>;
> +		pinctrl-0 = <&cam_flash_en>;
> +		pinctrl-names = "default";
> +
> +		led {
> +			function = LED_FUNCTION_FLASH;
> +			color = <LED_COLOR_ID_WHITE>;
> +			flash-max-timeout-us = <250000>;
> +		};
> +	};
> +
>  	i2c-gpio-touchkey {
>  		compatible = "i2c-gpio";
>  		#address-cells = <1>;
> @@ -172,6 +199,13 @@ touchscreen@4a {
>  };
>  
>  &tlmm {
> +	cam_flash_en: cam-flash-en-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-pull-down;
> +	};
> +
>  	spi1_default: spi1-default-state {
>  		mosi-pins {
>  			pins = "gpio6";
> @@ -572,3 +606,12 @@ magnetometer@2e {
>  		/* TODO: Figure out Mount Matrix */
>  	};
>  };
> +
> +&pm8921_mpps {
> +	flash_led_unlock: flash-led-unlock-state {
> +		pins = "mpp4";
> +		function = "digital";
> +		output-low;
> +		power-source = <PM8921_GPIO_S4>;
> +	};
> +};
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

