Return-Path: <linux-arm-msm+bounces-59577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD89AC5563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7AA1BA604F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698F686347;
	Tue, 27 May 2025 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JtBBTR5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDC9139579
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365854; cv=none; b=nlRki1GbZ97OXvBlKY7NYKLn91Smia/woIuLxBYDn49qZ8itmSHg9C90q0Vv2ffjNb5n/H1pCOBFcEPpK1nwEX8G13dIU4xiVFeyw8sYFJ36sdm0Us/AS9Fg11yvGPYRVozc4C7hoz0HAntyQ/8PEXR7oAub/gSlkZuXB4Rph00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365854; c=relaxed/simple;
	bh=aVeuz6U3ZP8Pi2cSgrUYzQBvgbejSBQthrlVk69LKvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJNe2IGGfYRLrvTDgfIEfuukoEyI1QyrKb4QiMHA3TkE8vG2YoifR/MtP5bd80RrMO1kxljSyQXhCueGVhSngUdIC3tmguAd6SQdO3jX/Qkpwgix9O9dBIWjxUK93bQoOtqZZ/tHuuGe2yClpx/3NyQB/ExqWsgTOp8iGgWGB9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JtBBTR5H; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47698757053so40767051cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748365850; x=1748970650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1cD0wSUoGRAfow7hZRrSlocwlqH/rpj2EVVATTYGe4=;
        b=JtBBTR5HAOdDtYrRwv1dja4pBPVUVBAkgPlIb0HbJteTwV9psUc2mckYzGDQLAohtf
         1JeBv8q8y1uGP+BtG4/p8tbseNL7/WFLxUGl75aSl+DoUXkzJOYQAu2GJpMroR39aIud
         wTiQ9MOOtY07AHKZW3mVBKK1NydELbqD5pKuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365850; x=1748970650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1cD0wSUoGRAfow7hZRrSlocwlqH/rpj2EVVATTYGe4=;
        b=U+4uuk45RcoZulUZ5u3cjbq6S/bV59+nAKP+TW59lgMMISrVa/jKW/qZ7s7P/1PE2Q
         Atv3kGIRpKEpVrRh0dflfUVZfPIKKYrrdiQoorMUC3EJ0spVb8UdwLs1Yk926Vn9RHGv
         5c4QIS4OgJU19qXa/Gx5Rw+yWlGcbt6v/TWCm7NL5j7ngFuWUoUPPrIs61PXvG3opV0o
         RnN4uk0HXsSVIBmBw/X19bWVa21HlwyHtirrJyHL+Qyk4EOXd3GXNuoHhaxLY2SuC3ua
         xY70j6auzMTgr+fxyZFcYogpoohDA3fPaoW0K3WhfPtKh2a6EFHB1UWeuCeJXdThe1B6
         h28w==
X-Forwarded-Encrypted: i=1; AJvYcCUIxtT8NDFHe+Ke7RqyBoEgaGn5PWBTXXSKz9uc07Kcpac4tU82a284PgJwNbeCzjrnm79eVh5+RkTzGRGz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo9bYYx/gcU4pL4pOYLSGMg0bljJrLzardfC+rCySfys+MnG0n
	gee9WDK7we/n5Uuzt2tski/fNTM5hVG6oW0Jbzxj6lw4muoLd8xBn3l50h24nCQ8WJ8JpKpziIf
	Skzw=
X-Gm-Gg: ASbGncth8QZ+LkAD53qHuY/522wJ2uuFaW5Yf+HvzVDkjI5u6z+VNZmro56IdEXMZbg
	3sYGq1CV8zVGZwvNExmh8f+0rl5M0zxXD8p0rcLt4QPPbmrgysopRh0VPntravxMt3TtzBxbGki
	NtAuupy6qu+NDzi5lX68gY5HCC20pmCgj23M13LtdYEbEzqE3j9sJIHGFxNXe0/u9nbOLYvUGwh
	1YH5OHtm0rmeup5g36+HZlwsoSArYdRX6XIpzL8Ajic4xMnEoURnd/ZuwvsNpnUV/a8C7RyLw+n
	/OW7aTfe3f2/3bSuVD7NqKaGn3Z1DchcpUnmCABhokbZQJS7BEl9JvtPLBD6dozVLsk51/vbgt2
	HA98ksfyYJwSRct+Ovq6ina8Qj7KPDQ==
X-Google-Smtp-Source: AGHT+IGSzHvM9NSQGQp9cy2brP4ikJrMcc95GVkxKoiIzEHu8IF0Bz6UvJxvkAR4II/m9NdFL5Ls/w==
X-Received: by 2002:a05:622a:578f:b0:494:7e51:acce with SMTP id d75a77b69052e-49f4781b069mr238173361cf.39.1748365850438;
        Tue, 27 May 2025 10:10:50 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6faa4818527sm42754146d6.20.2025.05.27.10.10.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:10:49 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c54a9d3fcaso318069085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 10:10:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxjDjsgGRKxl1gQUembqL26HPE3dyovDcNqqGsP/mE02x1S078MfDHY1F6WGY+RDI3ISpQMbHCdOcplvFp@vger.kernel.org
X-Received: by 2002:a17:90a:d60e:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-3110f0f9b4cmr23039125a91.10.1748365371916; Tue, 27 May 2025
 10:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz> <20250524-tb16-dt-v4-2-2c1e6018d3f0@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v4-2-2c1e6018d3f0@oldschoolsolutions.biz>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 May 2025 10:02:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1-xhzWjftAkSiwTR5AE=2nGxFSaiv18_KXFJkKL1USQ@mail.gmail.com>
X-Gm-Features: AX0GCFuyCqgo7k3OkEiBoeoIIm92d204Z5xqTgDrr1m_iEfNQkkSSlBFML6TL54
Message-ID: <CAD=FV=V1-xhzWjftAkSiwTR5AE=2nGxFSaiv18_KXFJkKL1USQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/panel-edp: add N160JCE-ELL CMN panel for
 Lenovo Thinkbook 16
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, May 24, 2025 at 4:48=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Panel is widely used in 16" laptops, and also in my Thinkbook 16 G7 QOY.
>
> CMN N160JCE-ELL EDID
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0d ae 2b 16 00 00 00 00
> 20 20 01 04 a5 22 16 78 03 28 65 97 59 54 8e 27
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
> a6 00 58 d7 10 00 00 18 35 30 80 a0 70 b0 24 40
> 30 20 a6 00 58 d7 10 00 00 18 00 00 00 fd 00 28
> 3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 36 30 4a 43 45 2d 45 4c 4c 0a 20 00 95
>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[2/5] drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo Thinkbook 16
      commit: 126bf397bf58485cdd631824190cdcfeb86f5d9b

