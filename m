Return-Path: <linux-arm-msm+bounces-74523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31FCB95EB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 15:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 786F52E6FB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 13:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284E3323411;
	Tue, 23 Sep 2025 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tzLIuP0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6112D3720
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632425; cv=none; b=ESv4shxPPSywypdlnEQfKEt0tMhnpJctbcAii6XS85E3hWmMc+FOEbh1ogcbapycW/ioItDyUFJnObl9JZtsmbRltLwyqRQ9iq6zLGNgpBwG7EQftYyN9SIFhmO6FQvttGUvLYFSKTjN5ZxFClJb17uhwOhmgHyII7Es3H/Nr74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632425; c=relaxed/simple;
	bh=vy+E1zYorab2a2XzZaWSJSTfgNU9c2BkfDyhamaFdNs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=sDQnganZRYaSzUXPZiJ9/uU1Rxyym36U42oT2MVesedvxH+Xx6mMqoTMEBws2fEGS0bDxKOHwe2ZmhWb+KeyUeTZsIUdHNqO2VMrUOo4+f0uPv8YT8DYfPVprZ9zwckmoN/Ekd/mZZC0hq1i48aQJI9Jlq/I7i+FhoKoNpll+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tzLIuP0y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so9414406a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758632420; x=1759237220; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jQgMsYwYsxfq6lp2ULuttB6hJRdnd9uyWFcrhi5sA4=;
        b=tzLIuP0ytWEKt28m+XgNKc3A38n1kYglPDYpLPKQ9pf3nF2bth1ydLw7MKzk1XCPHP
         88V9fU2Aa/9Q8j4ya8cbO+uwwnT1qsToam7ZlXsPujzjSyGWj0Zp8hX9Vsf17dSs7i80
         v94pugzz43u4mdrhFVA65m0SpvgIVzU8gVTOT/1YyUOuyUQzrc1DI9g5w/c2OPb0Xjz+
         ewS8OYNry6V19co0fcnvGVh3Cg3Z/0yS3mnQRpmB+Slfr1QlD1WNOEl/6+bdxXHL6VZN
         QCHeNpiLfmYrDTYGJWiFNTBOm59xu8czIzBPkYEXW4UOBi+MdpRksHUkG8OZlxs98Kmy
         7Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758632420; x=1759237220;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2jQgMsYwYsxfq6lp2ULuttB6hJRdnd9uyWFcrhi5sA4=;
        b=Dn07veESIKHQmYR5tDxJ3Zt1M1aba68HhpPAdBID3bVqFbIBAAFV0ZwVyRjTsR3/iE
         9lJOc0BfYwWZRqKZe0xlBte+2/t/xST9JNfsNyHTE/56Q3Z7FIirt5QmWVc+OWK4deyu
         4XTuVUes7ibjHIaDDTfgBl2azB3N4l778MFjaiQdUYao/kJkViKFW0403b6mgfbJZrem
         0NuyTCHSvqzO+ZSzsnJufYoQVfyQhBtRHyKObpJsEJDyjN4pnQKkWERoQd6pu8pZYVMX
         msqN0Jd5+3kghGL2f8JWx9J6IpLhsm3sO0Q2cPZR6bLnch1RKJ3J/8yl+hkVfkMoXQnI
         Hp3w==
X-Gm-Message-State: AOJu0Yw+esNXh4JGkisy1FvlZuu7d0g7dbk1FKLQH+URZ9RZsyyQdc4A
	PcjOFB3o4u6KoATQp4noVJUMYsjfgEOt74g3OdzofPEp4impzFVR09HzHKjq4FKtQgM=
X-Gm-Gg: ASbGncsO8s/YKK6igu/goTMdoO/MFUUbNcODv/ahB21r2jvIAZ3ypZ50ZGC66D2miOZ
	Q0G62WhKW5jC/KoDKdq6R9xaU9hw/Pg4OVBeCAofY13ssN8nhedmOLvybMF2aDtl1irNIFSSc3+
	vrEXM/NHr0mcsklxz4Q/UuKgg3/IkYQ4J4zkI4AwzrBxuejTizC/D6bTKxkdVcSuoU/UqQpQ7Mt
	tcb9DQSgFU0uOTzaQQZ23ykLSCvm8M9I5bTF2PA7Oko7Ss3DFCHxYX51rOgtdGSxJblRYw2G4pU
	TU0C/WYbEHwcPkhx7od+1aKy4mHNBVmSdZuuMPAz6PtGLQnPH6L2UcPrL3AzyvEn+8K8VoQRvy7
	XDFDgBxoPul3rs8ReJaGMH29jKIxZAfvYD+Dr6t6LZIdp5+gkEzuC9ouGVIgwbzPlzs8m
X-Google-Smtp-Source: AGHT+IGD3NrE0KKZ/8qWAbi1hdO1vb3x/gJtMsj6xAGGJGo8t9h8hbseK2tTsAYUn9WPQe0nC385bA==
X-Received: by 2002:a17:906:6a1e:b0:b2b:f498:e2f7 with SMTP id a640c23a62f3a-b302b80a6f0mr239870866b.47.1758632420275;
        Tue, 23 Sep 2025 06:00:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b264fc79404sm978329866b.10.2025.09.23.06.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 06:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 15:00:19 +0200
Message-Id: <DD075WC7A6KR.NJJA1Q4WAJUZ@fairphone.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: rename dtsi files for sm6150,
 x1e80100 and qcs8300
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
In-Reply-To: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>

On Tue Sep 23, 2025 at 1:01 PM CEST, Dmitry Baryshkov wrote:
> Bjorn said to me that he disliked the conseqeuences of renaming
> qcs615.dtsi to sm6150.dtsi. Let's increase entropy even more and rename
> even more base DTSI files.
>
> Leaving jokes aside. It's not uncommon to see different names for the
> same SoC (or almost same SoC, with no visible differences from the Linux
> side). The platform now known as 'lemans' is a good example, because it
> had been using SA8775P, QCS9100 and QCS9075 in different contexts for
> slightly different modifications. QCS8300 / QCS8275 is another example.
> All such names cause a lot of confusion when somebody tries to follow
> the actual SoC used by the platform.
>
> For 'lemans' after a lot of trial, error, Naks and reviews we've settled
> upon having 'lemans.dtsi', the core DT file for the platform and then
> naming individual DT files following the marketing name for the platform
> or for the SoC.
>
> Apply the same approach to several other platforms, renaming the base
> DTSI and keeping the DT names as is.

If we're doing this already, sc7280 -> kodiak? That also covers sc7280,
qc{m,s}6490 & 5430 and sm7325.

Also, does this mean that milos-based Fairphone 6 the dtsi should be
milos.dtsi while dts should be sm7635-fairphone-fp6? The latest patch
series uses milos-fairphone-fp6.dts.

Regards
Luca

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (3):
>       arm64: dts: qcom: rename qcs8300 to monaco
>       arm64: dts: qcom: rename x1e80100 to hamoa
>       arm64: dts: qcom: rename sm6150 to talos
>
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi                        | 4 +=
+--
>  arch/arm64/boot/dts/qcom/{x1e80100-pmics.dtsi =3D> hamoa-pmics.dtsi} | 0
>  arch/arm64/boot/dts/qcom/{x1e80100.dtsi =3D> hamoa.dtsi}             | 0
>  arch/arm64/boot/dts/qcom/monaco-evk.dts                            | 4 +=
+--
>  arch/arm64/boot/dts/qcom/{qcs8300-pmics.dtsi =3D> monaco-pmics.dtsi} | 0
>  arch/arm64/boot/dts/qcom/{qcs8300.dtsi =3D> monaco.dtsi}             | 0
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts                           | 2 +=
-
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts                          | 4 +=
+--
>  arch/arm64/boot/dts/qcom/{sm6150.dtsi =3D> talos.dtsi}               | 0
>  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi                  | 2 +=
-
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi                               | 2 +=
-
>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                        | 2 +=
-
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                       | 4 +=
+--
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi        | 4 +=
+--
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts            | 4 +=
+--
>  arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts             | 2 +=
-
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts                          | 2 +=
-
>  arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts   | 2 +=
-
>  arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts           | 2 +=
-
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts              | 4 +=
+--
>  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts              | 4 +=
+--
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts           | 4 +=
+--
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi           | 4 +=
+--
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                          | 4 +=
+--
>  arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts              | 2 +=
-
>  arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts          | 2 +=
-
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi                             | 4 +=
+--
>  27 files changed, 34 insertions(+), 34 deletions(-)
> ---
> base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
> change-id: 20250923-rename-dts-5d74d6132f40
>
> Best regards,


