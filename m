Return-Path: <linux-arm-msm+bounces-49530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F4A46203
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6445C1893C56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC89221728;
	Wed, 26 Feb 2025 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oeQkAmaw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139D221726
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579218; cv=none; b=e7VM8qhHng6UykhaMs08dAWoN6LyODC84PzXNHPDYyAL1RVyK1Aav1u6tU41sBTWwEuCalH1yhqtyv/OC0YDrhyDN9KgxBaEtnwbMNG/j8BJlMNePGIl36LZ6/V2Ks50XesCqXwONkPA8GU/7SBZ3Y7tooD7KCDpRrHxE0xFVd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579218; c=relaxed/simple;
	bh=NakPrcYHABUnkE9/40aDSNT5XIpd9QvW3ezgcg7EAk8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ccNul1FUYmvrRu6bPiOF4FxqmCML+MlJq6eUdWIZfb1+9bDnZFlIXamirkU9OgtVMa/dBwxgmfNIDaOXbsme44CxIDLZDV25o0f32DW1NJoWKJ4YwWzWsNChJWRV2xzSSGCQpc9m76j2lTUGoZRaL01whMv8jxmvJyOBi1kePfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oeQkAmaw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43998deed24so65597905e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 06:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740579214; x=1741184014; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgbpb+wQs1fiWsUu+quFf7N3iJTinXogOjcbntSJGqg=;
        b=oeQkAmawKdFkOYIh1KZFQXcbri2BxNd4USu1sfqxG1oG4BhpFo600nhh6wWLLDlXTB
         OsPrUz8eNDTFeQBsPtAtxKDMv6m4fPhcI9ityR7RSBOOwzURU+LdzDsNuSkEDx0supIs
         NhVQlvcEABsAw6jwUGO8u03wAnafGXqMHwNP4JvciSUkJkAYDKjjIDeLJeH3Bg/qTPZu
         PnxTxFwG6HYXTKpjxWr3tzWt07PPUn8ZjvsYjKi2zvOFf2Z0EX5iOLztv3ae8RHq3x+7
         f3KB0hRtFHCYXs6QkVNrebs7WOrVhkh7DYxGDGx3iyRgrnnAalh/D8Q7XUNyQn9QSNLq
         QhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579214; x=1741184014;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgbpb+wQs1fiWsUu+quFf7N3iJTinXogOjcbntSJGqg=;
        b=ih4jR7zkwvAapyn89+I7ceyzBprVV48KWyUel11FVG5D22UqVKxGaRH3VMLsNg9Sjq
         1NZFXHn9ipSRp6FBHUB2u9hVEf18dBqSIAS2CCibVzCzq/Cp+0HQe+ELkErjphz1+6TL
         3ijqp1vsfuX69PNICugJOvZfx8W5mkKtvVtMnWg+A+RhcPjzQ08T/vVMzHwOcAu7AZzC
         ZoFq31ERk46cIUIx9FXVWD+J6kljAtAmD+Sb4QzxHFlzXJ9aL29rAPmO50FHy9QNBf6d
         fJywCFfmmZ9xJqBzSffw94dShkwgEdZIhpAMjQWyVOcp6xbFMGWp2uPb7x4yfdwr3Xbk
         fQmw==
X-Forwarded-Encrypted: i=1; AJvYcCWsk0UeQgxrWQRgOjsU1YIbBq41rI3TEICOnPkulMLsbhDHYFkkQyCkXGQWKGaE+6wOZRMGX3NBRN9VF3Fj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo3WaWj0bc+dN+/Se4UKzMXrjn3j8pLBmuj9eDNkyoix5sd+FN
	UmSeqEhjX7lQQ3QGiC/0RxpmfDQupNGagXULn6nU/E9rb40Cnb4m6z01gegPqOc=
X-Gm-Gg: ASbGnctcSeI/g4wKldoe8WgOHQIKSTNR2WxaRo1elyxeO581GkLQ483LggP/i7ajTiN
	d7rRb5O16IR6ujJOjG5SEuE1/YVm8LKn5Z2m93eP5+29rD+Xb71WhSah0O9IfbYVCrk+oS+9bPL
	g+kqw6dLrAMOKr+ZMZyH0tZF6YhNxHaPHWZ5chOlBP8Cu1ga/0OSYRCYraSOIFIOC7VUILlhE2i
	exfSvCbhV6Z1iNd6IbqGtfqOe/mVHZzGnNvzTbemvF6/gHXGjc4wjtpCRKDpHk6YHb3AHGHf5Ic
	x3PyyuSSTdGjOs9bU4YwxOgiSc4t9/2b6cbSCchF1qMo9CO47UrYwbHCfi3BLh4HnktURMs=
X-Google-Smtp-Source: AGHT+IGjMBREYHM3Ps9vQIMuqM9jKVtM80DfGnNOYnRFojf/OC403IkVNKEcMty4GV6fP9tsA8PHBQ==
X-Received: by 2002:a05:600c:19ce:b0:439:92ca:f01b with SMTP id 5b1f17b1804b1-439aeb34975mr170790095e9.13.1740579213904;
        Wed, 26 Feb 2025 06:13:33 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7121sm5791619f8f.61.2025.02.26.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 06:13:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 15:13:33 +0100
Message-Id: <D82FU3SIX5RZ.1Y525GJO0UOAA@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Robert Foss"
 <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Barnabas
 Czeman" <barnabas.czeman@mainlining.org>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@somainline.org>, "Caleb Connolly"
 <caleb.connolly@linaro.org>, "David Heidelberg" <david@ixit.cz>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Some small preparations around CAMSS D-PHY / C-PHY
 support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
In-Reply-To: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>

Hi all,

On Mon Dec 9, 2024 at 1:01 PM CET, Luca Weiss wrote:
> Since the hardware blocks on the SoCs generally support both D-PHY and
> C-PHY standards for camera, but the camss driver currently is only
> supporting D-PHY, do some preparations in order to add C-PHY support at
> some point.
>
> Make the dt bindings explicit that the hardware supports both (except
> for MSM8916) but also add a check to the driver that errors out in case
> a dt tries to use C-PHY since that's not supported yet.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (2):
>       media: dt-bindings: media: camss: Restrict bus-type property
>       media: qcom: camss: Restrict endpoint bus-type to D-PHY

This series is still pending, both patches got reviews and no pending
comments from what I can see.

Would be nice to get it in for 6.15.

Regards
Luca

>
>  .../bindings/media/qcom,msm8916-camss.yaml         |  8 ++++++
>  .../bindings/media/qcom,msm8953-camss.yaml         | 15 +++++++++++
>  .../bindings/media/qcom,msm8996-camss.yaml         | 20 +++++++++++++++
>  .../bindings/media/qcom,sc8280xp-camss.yaml        | 20 +++++++++++++++
>  .../bindings/media/qcom,sdm660-camss.yaml          | 20 +++++++++++++++
>  .../bindings/media/qcom,sdm845-camss.yaml          | 20 +++++++++++++++
>  .../bindings/media/qcom,sm8250-camss.yaml          | 30 ++++++++++++++++=
++++++
>  drivers/media/platform/qcom/camss/camss.c          |  9 +++++++
>  8 files changed, 142 insertions(+)
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20241209-camss-dphy-8bf46e251291
>
> Best regards,


