Return-Path: <linux-arm-msm+bounces-108737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOjkFD6pDWox1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:29:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A45AC58DAB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E71033059319
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94163D6688;
	Wed, 20 May 2026 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2c8DS+6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379C53D811E
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279300; cv=none; b=AvyIsPxdqUaeyUE/rmOAI8J0FNdhp0ebJ+Qio/kyKHsnMqlgzt0Mk9zb1sKMR1wUqwSqFcgwpbYczcKw7w2zlD7Wch2PWMtA0R37EUgwlqyugr3qWrDSicqkN33ynDdGeKPygD6+SkBK+I1bSjjvL0+hqW/LHfKz3qFId6cycfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279300; c=relaxed/simple;
	bh=c20waQ3ciaPhuvDx9sD7rBsAnnmu0YP6ZK66HfND+vk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=VTUS5Jy9Th9dxNLcgabj5OoC/AF3I4xBR3jIN3JsHUSucsmn15jq9hlE896bkK7u61+0pJ9yAY4qePzUaY+hPbTXCLvfonpTtgX2THQV1IqyO2Q9mEqAJQYBEFsXE4QvXT3gxyARewpYi8bZM/stUk3S99nDfxnqH35XGf1SECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2c8DS+6e; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd8d0e4e341so590356066b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779279297; x=1779884097; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XpYHzlqjA32IUkHlT71NisujrYawqJ/BOyAN5JmGyM=;
        b=2c8DS+6e6Uj7GZlhNIJ66CaRAg3WVVmSv6Dbmyi9IklK3iZexA++PhMKUkRkSxceXW
         LVpBAu7D8hCNhrW9jd749Hym4Yal58iX0Svea3miw9AZC3XYnJS83XjTdbLGebU8gz2J
         C8ZuiK7pX9a6iMp95Ue849K6Ejq0lpA50cupQIsshZ5KOKmR7i7NnGK+Nz1wRl5IZ/tB
         qei7gQiJjpMzKjrleGNopbm9v/Sy2WUiwBXDOjzHAwmpv+uEqax0/vb1/E5rQ7Xl4nV7
         UtKc4TD+U2HhoqpTDgkQZFS7TQ2eqCY7BYJgTwgY0ttA1wMuORtmzndVQQumGIozE/OU
         +qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779279297; x=1779884097;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XpYHzlqjA32IUkHlT71NisujrYawqJ/BOyAN5JmGyM=;
        b=H+7tlsSvTUATg3Y+tM11Q5iCVQPFm33hi+IJqnm1J4qLOkyB5Uf3kf15uMLzY+0vmP
         dBDbMSr861S5lbC/q6dD31bbx4OzvrA2ackqgNCWkHDAawVV58XzvlJENmfcLjjJxzS/
         /UHRlS00RXpt6K5vZAKvkVFM8e4o/kkHBp4BlXfaNIC0Q5fPtTIjokB2DWq1GdQn7J2Y
         6PNkQnuJ0m6dEDsszBfX8PgA9gzP7A93heUvtCE+scP4DSimTp5oOq77gAbB7p1m9plR
         M0YS88Rt+UvhokOBfDFlmEMUYF5L5bvq4gICbrvPoIDjvU3PtWx35MzV7EVv4LtlZTxy
         zvAw==
X-Forwarded-Encrypted: i=1; AFNElJ+KuNtoa0D/mtl51jHHDSHXYdY2QV5TmqrvU1IGD01rdAMWeCErLty2brq1QZRP60owhwyMrFIMZRtpKGxZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhQivlMCrNk1VWeGM7BHvmxZKjkF+Jetm/q5TiOSEJKbavX931
	ag2JUUveSToYH47p9c5PVbvl35NYAsCY1LvediSarDZ+BG8pqzy9rN6xFykKxX3YTJQ=
X-Gm-Gg: Acq92OGiuWG5nelGHr0LR+82Kb4SWOkqw0FzXZ5bppjDRW5d/mquWtec8kYCNgZE72f
	J+2paGt0LgpfOF8aigBDO6RPH6Sm1RL+cMc2feYjEFmQQUUxYhNOoNzSQi4ahc9z9ErKyNZGusR
	5x95YjNLKcLpc8SZgQtc+uVskkyJtuN4QHs+APq7vSAsEixnEqDjitNJOtyKH2CX0efkGkHBbOI
	Sfucy6DHbGtVIsh3wZaYz/fBN+hei7G7ilc6uKrLgBPv47Smmb+Nrw+sTll2DjkSgK0QIedT5qG
	NIctF3XTBrE4isrfgUpqdSWxQ57ym4HeWhg3uM2wlCmSYC9m67QvjvD0zCKr3H+C/IydV1Qlh2d
	95M9pwuk5p/O/37y4wdkr5KSnYzoshaeeb1brHnO5kQfXyqZRa/HssamBYjmu/rCUIwS7styhzY
	I9qNyrNFppuAWK7YG1l0+w4wNjJXaMEIIPG9ksLCq5BK9LoKQW5dIeJRui9VQcK//z7JlP
X-Received: by 2002:a17:907:9607:b0:bda:17d0:cf02 with SMTP id a640c23a62f3a-bda17d0cf22mr285739166b.19.1779279297448;
        Wed, 20 May 2026 05:14:57 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e604e6sm840883366b.52.2026.05.20.05.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 14:14:56 +0200
Message-Id: <DINHVCP2GI7N.2AJJFB3CM2DHN@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>,
 <sakari.ailus@linux.intel.com>
Cc: "Hardevsinh Palaniya" <hardevsinh.palaniya@siliconsignals.io>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Elgin Perumbilly"
 <elgin.perumbilly@siliconsignals.io>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Walter Werner Schneider"
 <contact@schnwalter.eu>, "Kate Hsuan" <hpa@redhat.com>, "Svyatoslav Ryhel"
 <clamor95@gmail.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-4-himanshu.bhavani@siliconsignals.io>
In-Reply-To: <20260520115641.11729-4-himanshu.bhavani@siliconsignals.io>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108737-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.3:email,0.0.0.50:email,0.0.0.10:email,fairphone.com:mid,fairphone.com:dkim]
X-Rspamd-Queue-Id: A45AC58DAB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Himanshu,

On Wed May 20, 2026 at 1:56 PM CEST, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
>
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.
>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>

Your Signed-off-by is missing here as well

> ---
>  .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 3964aae47fd4..5fb0f3eddf66 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -17,6 +17,7 @@
>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -547,6 +548,24 @@ vreg_bob: bob {
>  	};
>  };
>
> +&camss {
> +

random extra newline

> +	vdd-csiphy3-0p9-supply =3D <&vreg_l18a>;
> +	vdd-csiphy3-1p25-supply =3D <&vreg_l22a>;

If you're already enabling that, please also add the supplies for the
other CSIPHYs (0-3).

But also, since camss for sm6350 hasn't been merged upstream yet, this
patchset depends on
https://lore.kernel.org/linux-arm-msm/20260216-sm6350-camss-v4-0-b9df35f87e=
db@fairphone.com/
You need to declare that in the cover letter!

> +
> +	status =3D "okay";
> +
> +	ports {
> +		port@3 {
> +			csiphy3_ep: endpoint {
> +				data-lanes =3D <0 1 2 3>;
> +				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				remote-endpoint =3D <&camera_imx576_ep>;
> +			};
> +		};
> +	};
> +};
> +
>  &cci0 {
>  	status =3D "okay";
>  };
> @@ -582,6 +601,34 @@ &cci1 {
>
>  &cci1_i2c0 {
>  	/* Front cam (Sony IMX576) @ 0x10 */

Remove the comment now since you're adding the node.

> +	camera@10 {
> +		compatible =3D "sony,imx576";
> +		reg =3D <0x10>;
> +
> +		avdd-supply =3D <&vreg_l3p>;
> +		dovdd-supply =3D <&vreg_32m_cam_dvdd_1p05>;
> +		dvdd-supply =3D <&vreg_l6p>;
> +
> +		clocks =3D <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clocks =3D <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clock-rates =3D <24000000>;
> +
> +		reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 =3D <&cam_mclk1_default>;
> +		pinctrl-names =3D "default";
> +
> +		orientation =3D <0>;

I personally like adding a comment to make clear what '0' is:

		orientation =3D <0>; /* Front facing */

> +		rotation =3D <90>;
> +
> +		port {
> +			camera_imx576_ep: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				link-frequencies =3D /bits/ 64 <600000000>;
> +				remote-endpoint =3D <&csiphy3_ep>;
> +			};
> +		};
> +	};
>
>  	eeprom@50 {
>  		compatible =3D "giantec,gt24p64a", "atmel,24c64";
> @@ -1115,6 +1162,13 @@ platform {
>  &tlmm {
>  	gpio-reserved-ranges =3D <13 4>, <56 2>;
>
> +	cam_mclk1_default: cam-mclk1-default-state {
> +		pins =3D "gpio30";
> +		function =3D "cam_mclk1";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};

I think I was told before that this can go into the SoC .dtsi

Regards
Luca

> +
>  	qup_uart1_sleep_cts: qup-uart1-sleep-cts-state {
>  		pins =3D "gpio61";
>  		function =3D "gpio";
> --
> 2.34.1


