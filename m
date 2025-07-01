Return-Path: <linux-arm-msm+bounces-63256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B15AEFFA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D58BA3B405B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AA1279355;
	Tue,  1 Jul 2025 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFMHXUn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329F527B50F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387033; cv=none; b=fvBPUbpbyt+jfRmhvFBSePynjAjJwnSY72I4o3lnW43pgEGW33w5vlVhB30XZGNHicBlHqMx8jTOl6om1+78iXomP9oKokekEK2bd8wgjUTGwrHs+KQLxl9W3T2myfGcx5i6z0Kh8v3l3kzsQ9kgsHToGeXxX7F3sGG3QUqNm5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387033; c=relaxed/simple;
	bh=TRyKPGlzqNiaAIc+Td0ze+LpUFf6sYZ4Ct+UtsDxJJ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mOn97bmKSroY5Qam9DLIH6h919CYJ5W3qNSUG2opJ1NXM3lphEFWicJHnh0nnKa0PkaJJNlSJFarxp0djaYictppjJU43gwCobU2PxlAU2/hsZ4srmrvAkpE6BbsmZzyZrywm9RLITcocBSiemQQnA6JkCwUfUd2xYNi9gV3sqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFMHXUn2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso29463745e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751387029; x=1751991829; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N84p1IfPOnU2LRyJ4jJI6ylTwqJRzAAmh1pUeFRFmtE=;
        b=IFMHXUn26XoQxgu1PEOhUk+1DwDCC0gLL1fvGvxN6KXwHj83WYK7MaMemjuyu6Bj6C
         s6kIMqsWWEeY8yBZuvpFt8JZmMrPDXLzxWb21dw+utltdf4Q9XhLNMkuhPzP6MKkXyvU
         dBcze56B2AcofUbbLP3R0xmh/GJEWkmBoR6NoOIu4g7IW8Gr7tZgju0zBQiknwyUR2IK
         ue+Vqe7Lp/z/zGd6Q9EBY7megXj46NTu3uPFLZZc78ubpCu7fSmApHW2EONsaOeOAMeK
         x8JfK+lv1V7mTm2i5A0ZoE7eOfbWSgacnkUcWgy4hR21+6XBUe+RNurXqFZY993daOIe
         AyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387029; x=1751991829;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N84p1IfPOnU2LRyJ4jJI6ylTwqJRzAAmh1pUeFRFmtE=;
        b=A1yO0uqTCfpQO2F1eSLTaqGFLoh1ryzKpglaE4w1iRBHffVHY78eP9F19GzVY+9ov8
         IG+LFTKGOGQvVR4pRm/EnurM27psUL4Tqxdxx/SPSqkmf5HJ5vjy36eFZBRiTyALmVRs
         HvT6h3Zur8/uZ+I/oqFR6x2fbPXeY/3/IzcWEZx27BRI34HNfNfpWdBhKpvdRCN2BVNt
         6foqzVrOFiFmUMS2g/LZGFNgin/ixTD1iCoyyp8MPo4UFzpm+OvLJX21Ya18dnm84mk3
         piddyK0bsgWFmhSDtPfp0upnmOJjTul0KfoutfjnhmLZWBuGFW7AV2TyYtNiewI8iP9r
         7GoA==
X-Gm-Message-State: AOJu0YzowXDvmXiWfAIzNICatPZ4srbw3wDOTTA3pajYXdgR8xSDu/ls
	s8CMoFwpidhdznRxxjabiw8T4sqBfmNy7h39NYvqgOrxVntzdJCkyWI5cQsPQenOMXM=
X-Gm-Gg: ASbGncunxcFWhhnIwiTTIHMAZZDAlb7hYItvdXPLaIxZDtplHOeDiDI/U3rNEKYPcgl
	4KxTVDJ/mokmGbHbjdS49PJDF51IYci+rhApy1/R+33Ubcmjrg2R/S+UbDNPNpn1ih3uLJfU3+s
	vP4D1RfzmxEM4C8kj0HClLGeys9OEM6MuZImGmNRwRiBcK+h/YWEQyqUByOOzWX9Oh9D2pGjpmA
	OFQ9OIh3eYZKYZbz8ipZ7pLJz3AkLSlzOlMLRpuHtoiHZeZTUdKTURk0+fYhuI94fl62FsWjMOk
	OfGV1o0PztJHKNtcwjWZB+G9qBCWpp1FLHA7FbYKvCpMnt5OW7F9oY9i+LY9ijzsc3DL61dkouK
	1Lzg=
X-Google-Smtp-Source: AGHT+IF76AvC+yZFLcI56pCMDzSJYwqFxY/61zrbScuKifRBlFHkGuW5GbezYGfN5iWuHq0HbK4jxA==
X-Received: by 2002:a05:600d:7:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-4538eedf21cmr160209575e9.2.1751387029430;
        Tue, 01 Jul 2025 09:23:49 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:4dad:b69a:9c81:2e57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e528a9sm13932521f8f.60.2025.07.01.09.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 17:23:48 +0100
Message-Id: <DB0UVXK5ATOQ.3JOWJ0A1JNIAF@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qrb4210-rb2: fix GPIO lookup
 flags for i2c SDA and SCL
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org> <20250701-qcom-gpio-lookup-open-drain-v1-2-9678c4352f11@linaro.org>
In-Reply-To: <20250701-qcom-gpio-lookup-open-drain-v1-2-9678c4352f11@linaro.org>

On Tue Jul 1, 2025 at 10:01 AM BST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The I2C GPIO bus driver enforces the SDA and SCL pins as open-drain
> outputs but the lookup flags in the DTS don't reflect that triggering
> warnings from GPIO core. Add the appropriate flags.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reported-by: Alexey Klimov <alexey.klimov@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/d=
ts/qcom/qrb4210-rb2.dts
> index a37860175d2733214f1b257e84d5cb4821033242..bdf2d66e40c62596b8b024de8=
33835a0750df35d 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -5,6 +5,7 @@
> =20
>  /dts-v1/;
> =20
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -65,8 +66,8 @@ hdmi_con: endpoint {
>  	i2c2_gpio: i2c {
>  		compatible =3D "i2c-gpio";
> =20
> -		sda-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
> -		scl-gpios =3D <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +		sda-gpios =3D <&tlmm 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios =3D <&tlmm 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20


