Return-Path: <linux-arm-msm+bounces-55928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D0A9F4B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 17:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24237188F550
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 15:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1299525D54B;
	Mon, 28 Apr 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ir3GTvIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298D2561AF;
	Mon, 28 Apr 2025 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745854868; cv=none; b=ALBOCAhXXJOYzrnSZ+vif/E1Z2V8kKqOEQxRIfPnurqe5NWOa8mj3+aKuIZs3TGBQ1dbNJxs4duLBD+mYHWwrActOpb+oxtafm9STZBBAnEwuV5Lnho5FzRPE+hBIrCXUlUmDAxTd699CQ4X8n+i0lxclvVX9nc5+qrBVkTAXEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745854868; c=relaxed/simple;
	bh=K6/TSIu0i4G62nwC3J/EYkcZS/BBLoIYHCR/dA0hZXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNiod+DCOozNACHqODDxX8w/c39R5eEdqHNaArrLiVvDXj3sMydwfYVdAUG4eZnUnfY2hSABgFLKzlaMiVNzGEJ5oIcPIjdAipj5aXrqYeHyIIt7F9LgO82adDPORfBlu/M/+ckOo/z88BwwLiApYyYAtx9BmlKaBZasJRi6sGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ir3GTvIY; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso9471683a12.0;
        Mon, 28 Apr 2025 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745854864; x=1746459664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvufXHGh12wQHgjzBmUfISsVxoz5jVjmGbgcqId9HAk=;
        b=Ir3GTvIY4u3qeOOtpYdbxyXrNjo/HEfYIVPp8UBqlJ7KkBlVLm/noH0Se1Y7HbDfZH
         TjfZdpIEYbRYjbIKUKf2rmi96hTYpi8rIxs9xEAMToJJUpSn51FhAAyoKzma0en7jjEB
         PAbZeQwYFomqWr/wfcBzfIaTypJ6ubeX0gKai6ffJwGbK1DhA+SSuev3+SbrCob0iDNB
         TGucjYmidBUAf/IoyqRAg6Pzu6j35Ye/nX3qjSl89dAY90Yw8k8sqMjcUd5MbB6+k2H0
         3i1EyjypbYTjeIDeg1L71JIt+W0Hg897dzDP7dSBkLRLOm13/DqVp46EfIsZoy7lR5SW
         pStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745854864; x=1746459664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvufXHGh12wQHgjzBmUfISsVxoz5jVjmGbgcqId9HAk=;
        b=NLAhHOVtUV6LC3Y3cg9OWhFVFWFtoDYyrMV4Dc2t+7RY7YiLCVkiCiEN3Vq6XRVY3O
         jMOvCEEwTjwbdh3ngFyffZrmMk+Q1s4go2JcSwOTrXRYfyHKEb9fKc33tXHUaBQLMrnT
         wr1SE/abpfpDFBOBbg0ZuyxuSxmyYxN8Ua4O8/Xp9BjtBRRfD3GuG40mwBAGCjR98sn2
         2XwSh5bKFg3zKdqaRoEUYEuszLAQxFgigirlzQRppa9nhYJrkWEqBBZRXofWvE0WThDm
         ZxKdvlRxG2M6rj9R3Ak5j5N5ZYu81JnMtLMD7LhJveOkho6bkvg9TD6w8tGLh6slBy2o
         FV7w==
X-Forwarded-Encrypted: i=1; AJvYcCUBejnQEI2HQfHwMzrXo63o8mceyBPhK3SBWIVAWJdDFTxsP3DM2sdJfpy+GXoY8U7HXNOG8ZmVWsJa55OX5g==@vger.kernel.org, AJvYcCXldH4osycc2fII/zsuNV0LnT2ZZgcJGuND8lmmPwQ4R5UMOog76HnGabaINAKadEAsQRR2vcYClb6yiKar@vger.kernel.org, AJvYcCXowsuRf2yJiEaK4uiF/e38BZnmz0TWyRUlY+NkNYcexE/fflc8lMINPVzmhY8WHAz7fep9iPMSoIna@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4j79M4XVJd1omx9aAEPGY+HVOkaSry0klDkNGmYj+/k5TM8+S
	zwRab8YAWS7TwLyMc8GYRgkZFGkmwQoUd+LZvbHvudxG00PFLSLLloF//0g8fVNKdqusP46golf
	OvojQOSWreQ2AHPOWeVkWWCAYMrI=
X-Gm-Gg: ASbGncsI8bzThT/ABo/JaEmeOG8EgJnRS6SCfVGep7T73RtBajrbnynZynwGLECbTdg
	LydYSwSzeP7ZeFYYwYwRoqwI/97j9mlVAkgZ5VnlOg1gLhl3b4vyGMQuw22Z8OuYDrVunNWPLNF
	0nK3rGLYMTrvcWI8C8eSX19xF1
X-Google-Smtp-Source: AGHT+IFhLzE27vgSK4ERJvEKbxq2DCn8cB2x4uLyWSEziEtTs8e8qlO5UNLI7zouE014oKd82Co4iaD88PMd4xBtcTU=
X-Received: by 2002:a05:6402:2155:b0:5f8:36b2:dc07 with SMTP id
 4fb4d7f45d1cf-5f836b2dc52mr589411a12.16.1745854864251; Mon, 28 Apr 2025
 08:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
In-Reply-To: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 28 Apr 2025 09:40:52 -0600
X-Gm-Features: ATxdqUEL74T1cOG8x0vvh7KTkwIQBy8-5lGlhbpHJlzgMv0_fInhzrhYRfPduoU
Message-ID: <CAOCk7NrcpwAnUKcVsc5D03Aazt=qWLZB034xa2FH2PF9LuL6ZA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 12:28=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Enable Venus on Lenovo Miix 630 and specify corresponding firmware file.

I'm curious, how did this get validated?  I didn't think there was
enough infrastructure enabled on this platform to check that the
lights were even on on in Venus.

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebasde on top of linux-next
> - Link to v1: https://lore.kernel.org/r/20250408-miix-630-venus-v1-1-771c=
330ee279@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/=
arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> index f160ba562b0af505bdc1357731f75a394b5eeeeb..c11b972771c3881a57ba5a4df=
bdcea487da7c6f1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> @@ -100,6 +100,12 @@ i2c5_hid_active: i2c5-hid-active-state {
>         };
>  };
>
> +&venus {
> +       firmware-name =3D "qcom/msm8998/LENOVO/81F1/qcvss8998.mbn";
> +
> +       status =3D "okay";
> +};
> +
>  &wifi {
>         qcom,calibration-variant =3D "Lenovo_Miix630";
>  };
>
> ---
> base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
> change-id: 20250408-miix-630-venus-7a0b4f1f3788
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>

