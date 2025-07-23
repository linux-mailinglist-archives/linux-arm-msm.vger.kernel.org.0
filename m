Return-Path: <linux-arm-msm+bounces-66294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C1B0F29D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29D6D188F826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFBD2E6D15;
	Wed, 23 Jul 2025 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5AOYPF99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C4A2E6D01
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275248; cv=none; b=r/wA4109/+ThFXu34JxU2pmWjsPDEOC2jyZU9OOjJhgZ8/OyCiAnfrINsiGlxzPMoeexPhIQmzKK1nH8nhC6GDUOA6H4Xloj3dbsNjjJf4++zHDtI+XAZ+VwprE5B54p0u9dUgA3U4oe6ra8UGLyrqEP7pmVNcuJ8QON1WTM8AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275248; c=relaxed/simple;
	bh=M9Tx5ZYOOQio+9rctVMSmieb2MGlJvg4v6PrbBzZjCw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=j7lkTvnRiL/+K3cPqUZpY/TxPa6dxtwzlotBIXIlRoscpqZr6VzZxz2xVy0y1mohp6nSibrdiu99PYstbmZU1kVafG9ihC3pOzLteNTJlwrhS0gHdvBI5Iyxp4ixZWDBaniBB4aeAX/q9kOpuIyHj0DERVKLdhwH8kpAIM1PNAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5AOYPF99; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so1071644266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 05:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753275245; x=1753880045; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5lpP9/8KkNOqIjJehurSf+iqWvP7v1rvCy4fSy8ktk=;
        b=5AOYPF99Cyjw4hgwH0Z6Yey0gpF3XIM0+A5Bq9IQZC5gosGSmjm1tDzKHV96/ya9DW
         8bkj4iPfe41zcxPpI2ewLV6I/gkElrNu7iAKKXiIx+ssqQWsr5uqLJJxpntW+9PWpWXo
         uTwtThnJiZkCZq8agybroXp7/zIS9LNMKjTji9Sgo/NKfm3X1bNEH+FgsdIWx3A/N/hP
         0XTIKQaCmbEHoEaG3x/axNh0yff1+TtQIAKOiqiATe2QSmo2ifrWQIxK+C8vJbFgU/as
         RfyvQnD25CevXkTWbLdWJO3jL/MFNCO7zL4lFaW8W+TQUWWalHY4z06ZwJ4Nko05Xqph
         ZHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753275245; x=1753880045;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E5lpP9/8KkNOqIjJehurSf+iqWvP7v1rvCy4fSy8ktk=;
        b=OD4phJ0uHEYCitUcTOntOeXh4t6F+eSEL/x0jn7UwJBp8tgerB/EtaG4QcE9rkROcY
         tIcv0wwZ0K3hHrE85acZJdhCRgmEFf5QxIM8iyZmjbm3NIgly/tON7meZpnx+3y02T8u
         xlVtgQJYILmbFNYvz7qpalLT7VU035pkkTnVv1OKEl6Thxaw761mcV4GlrSGSHjBlcpz
         HPEfgBZdOSkpyQCXybylxFAFzZTGMH07yePMVDJEnvADwB/FJ/uTVvjhb4aWhn8EB4Oy
         j4f9MPOB3jED6ocZH9+EJHAZY/ScEZUmVrwKwsximpXvu5oZbwiSWq5Kt8/QwgJU9Z/x
         65Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Fnh1ATzmCDHau+YWJtEMyxT3Y/DQ6D+Rm4Tqxq3cjczjLfkOogds2gp9IXxDE6T8zS5AW12Jff+3GSSe@vger.kernel.org
X-Gm-Message-State: AOJu0YxNACItXfaAaweysDunhxf2I/tEHYKVqBNsNekNISYzW48SrD+L
	wJIQBnd+Hfj9P0iob+IhlRZS0f0fWm/k7rnwDJnu/62TpJy6F6KHGwYRAwOmBK9ZwqY=
X-Gm-Gg: ASbGncutZz0H9oHoJ6spPFy4QcgraCI0LLLPBQeWQ+z2ViYrDeJHFBtx04GGXxOngm8
	jTGxc6+Ti8fW3aUOBDnr/RnKrQmbrVAmC9SKp8VN/gy4DA5+xmvfHS9aEmCxYblP6tkvaVwDjk1
	WPX0FVBEp0iG/6HpEco6f5uSESLx30OXkqMKn42il7CilrEdHoYnzSP2FmhuYYGx02YCvngEzbD
	2sfbXBsi2ZLiy5tP4vrIV06L21McDr1QGh/eT7x9xM0ThPKwJj/jpYfqM8Lx2ghfcqAovKQ30F9
	ikkDBfhaR7CqDqYHIm+FasdZfbjQJSYzAbJsEgH2uH0FhantifYur6mc0WpdFJXprZtIEFZZPJP
	5mDv0ahsD8Xt4GxjVtk6YB1es4pq8hCT+FltzadriqR5/AB7johSF6lOTTKrnmNSM/cY=
X-Google-Smtp-Source: AGHT+IGI0FRIBcn7+ewvVoVXQiIxd4aqI3a5daINMP5NPbGCg/btrnW7FF6uC84mAKOivQzb6X0JuQ==
X-Received: by 2002:a17:907:2d0e:b0:af2:aa60:90c with SMTP id a640c23a62f3a-af2f917a878mr268806566b.53.1753275245117;
        Wed, 23 Jul 2025 05:54:05 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6caf9ad7sm1043339866b.164.2025.07.23.05.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 05:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 14:54:04 +0200
Message-Id: <DBJG7C0L3EFP.BOWGHS7WB4RM@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Clark" <robin.clark@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>

On Sun Jul 6, 2025 at 1:01 PM CEST, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
>
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: the driver is a part of drivers/soc, but as it got merged through
> drm/msm tree, this fix should also go through the drm/msm tree.
> ---
>  drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_confi=
g.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca09=
4903bb1e7389066 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -12,6 +12,10 @@
> =20
>  #include <linux/soc/qcom/ubwc.h>
> =20
> +static const struct qcom_ubwc_cfg_data no_ubwc_data =3D {
> +	/* no UBWC, no HBB */
> +};
> +
>  static const struct qcom_ubwc_cfg_data msm8937_data =3D {
>  	.ubwc_enc_version =3D UBWC_1_0,
>  	.ubwc_dec_version =3D UBWC_1_0,
> @@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_dat=
a =3D {
>  };
> =20
>  static const struct of_device_id qcom_ubwc_configs[] __maybe_unused =3D =
{
> +	{ .compatible =3D "qcom,apq8016", .data =3D &no_ubwc_data },

Isn't also qcom,apq8026 missing here? Not sure there's any more
missing...

Regards
Luca

> +	{ .compatible =3D "qcom,apq8074", .data =3D &no_ubwc_data },
>  	{ .compatible =3D "qcom,apq8096", .data =3D &msm8998_data },
> +	{ .compatible =3D "qcom,msm8226", .data =3D &no_ubwc_data },
> +	{ .compatible =3D "qcom,msm8916", .data =3D &no_ubwc_data },
>  	{ .compatible =3D "qcom,msm8917", .data =3D &msm8937_data },
>  	{ .compatible =3D "qcom,msm8937", .data =3D &msm8937_data },
> +	{ .compatible =3D "qcom,msm8939", .data =3D &no_ubwc_data },
>  	{ .compatible =3D "qcom,msm8953", .data =3D &msm8937_data },
>  	{ .compatible =3D "qcom,msm8956", .data =3D &msm8937_data },
> +	{ .compatible =3D "qcom,msm8974", .data =3D &no_ubwc_data },
>  	{ .compatible =3D "qcom,msm8976", .data =3D &msm8937_data },
>  	{ .compatible =3D "qcom,msm8996", .data =3D &msm8998_data },
>  	{ .compatible =3D "qcom,msm8998", .data =3D &msm8998_data },
>
> ---
> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> change-id: 20250706-ubwc-no-ubwc-3c5919273e03
>
> Best regards,


