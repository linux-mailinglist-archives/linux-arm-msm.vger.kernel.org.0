Return-Path: <linux-arm-msm+bounces-79263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A6CC16430
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AA963BE5C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E416234B198;
	Tue, 28 Oct 2025 17:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Jb7YK/tX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404D634AB1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673223; cv=none; b=q0CzWIX3slmRMbB7LtJ5+o+NWaJ/Z34hbl+PeIksolwcSv5hBmvx41w/DcXXoBRWFQk5f3fT40NjQsKtw7WYAAkDoJoEUAx0Hc9SUMVlI4t0Q42u6flYeZ+oIhzp5zNjzCDEcm/2Z7H8ux79KUBQrFWLTr71UoS0pkdZ1c8Z++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673223; c=relaxed/simple;
	bh=aXUMeXzMr7+pu8Yf59D4UfcQD82Ccm+D67e+43HI4bE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxo0ICrkdWvSLHTLwxJiW2Ek+wVvqvrC8+2DWoq46vBVlcO/i2uFqb4IhcpSA8EleNC/B9nfse8Enl+TDHMsVSr119JxAfN/BcqqHWQqdZ+sjrD9FXsxHMm5BJ2lXW9ykldMs3bFHRUoTpmVcXylmWCQclJkcF4gSkGV8S2kM68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Jb7YK/tX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-378d50e1c77so57188511fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761673218; x=1762278018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1dDT+Kuo18gW/vAs5pcbkOprB45nObDwGH/xrxPOiA=;
        b=Jb7YK/tX/NExrWrnnfEsvBKPDaXpc/KVGXJh1wkHCo4Zfs/c/o0rSwNvp11ctUHn0m
         Y2c/NFQCsQQpy7HyA24SMs5VAkyjRHaVj6cx52it3B5UwRa5FwpvqMmGjS+BCtlukMfG
         Um6dQl8jszRUVksnp6ZuaksjsS0ApRauEtN2aUIeeXDFbsCz16g/8ARsSTZyfFQvQm0k
         rkNZxp7xYTscP6u9+d9+7qs1ITpxYc1tf60x/tHJHk6omM8I9vkni4qVhyOx/zWpj4cR
         w7GLMo1m8WVXIC720BeQ9aH/dSvIrJ7qvIjqHLbQPOL4qD4/C65l5N1hFAF8ScwUn8O2
         ApfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761673218; x=1762278018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1dDT+Kuo18gW/vAs5pcbkOprB45nObDwGH/xrxPOiA=;
        b=nvGrKECL9TgGDX3h/+0PdmX9F6xuerKXyq2Uf8o5MAJmzXgtbh/dn3643RguTL6wlb
         cD2u/+KzCY3Y1KKhyluzD8+WHdyPOH9eWZbI6npi25StNinoIqszQ0LEVSrKVvf9lDHy
         0Jo3WA6QD7kVYm7TfOjjaqpxralim7KjrBY6x6kQesKnsnJ8NKeXqzM4UCxHNJLXCity
         laAMD9Fn5PyHMdJ5DbF5dmN/LTohAXYh20lKsixrOOFIqu2+HxHL0bTO3tpGYxRNrBMv
         +IITkr7erNbbnCcnWl7gAhLdSaHSGm+3579yPCKwV3wmVH6SESKcNAI9GTNWLZMxGC7P
         9pag==
X-Forwarded-Encrypted: i=1; AJvYcCUEjkAxC2P6zn2WojACyUWPWG11S8hnHPXEKXRbIpI5TGR3zhgLCVNww2i7GZnJML8yX3AwfyRSZG+MtDS3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8HqVvCCgtDCnaob7mI96T535sLRs3GqcNuXpkroE3+uuTLNn8
	QnbBV5lA0Nh8MkMdfIeoi28nRpigChl5NTvRdW5l3AJ25GjKsMRHy2XWvtbUr89Pj3Tihp+klwA
	Sgwx2Vn1mF6j9/tse0gNZhno/MayDwQJoF84wIZeERw==
X-Gm-Gg: ASbGncv7evDKpYYTyjXBfcCFrRXxySOZ1x/oDJgCQq+8YKQ5N5yYgjk6FAlzNO0l6db
	HvvZV0Bq+SBk/D5aRLT4usG43BqRP45agqxgRk+FkeCPoPK5G5vVxQ2yIFuIXJVniq7UGXWh9ce
	Xd3WlIpiryPlS16HR3NRz9uedA5kSWH+C1+IpXTRG+lqwFvaXk8KsdvQ4B/ypZoUmfX+KHV4jfF
	OVgyPfeqN5hmnOnlR9hIpCZ54zbimjf7KHMnc3PzaLERww6T8j7FaQmrOA75XryNSrznkwv4P55
	h/poUV6yYHHoH9gEObe3qgdz51o=
X-Google-Smtp-Source: AGHT+IFNOY7fS5NXoOFhyNJtmea1wSytgnH4oBkJVvZ9r27nhCdq6OSaGfOh73lSEWuOWGB7Asbt73QW9CvKZgTz/nE=
X-Received: by 2002:a05:651c:4347:10b0:338:10c9:5871 with SMTP id
 38308e7fff4ca-37a052c83admr689201fa.34.1761673218316; Tue, 28 Oct 2025
 10:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028155320.135347-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251028155320.135347-3-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 Oct 2025 18:40:06 +0100
X-Gm-Features: AWmQ_bkhwYP_3u9-JoVziAs2Bk2afMmvyoh0mwlsnq_68htCAVlTBlNvVkP6s1g
Message-ID: <CAMRc=MewE_wRrKsbo94GuwrO2D=1L==3ceJBKXQXvLgiqhd7Dw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: MAINTAINERS: Add Bartosz Golaszewski as
 Qualcomm hci_qca maintainer
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 4:53=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> There are no dedicated maintainers of Qualcomm hci_qca Bluetooth
> drivers, but there should be, because these are actively used on many
> old and new platforms.  Bartosz Golaszewski agreed to take care of this
> code.
>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Marcel Holtmann <marcel@holtmann.org>
> Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> Link: https://lore.kernel.org/r/CAMRc=3DMdqAATOcDPhd=3Du0vOb8nLxSRd7N8rLG=
LO8F5Ywq3+=3DJCw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Changes in v2:
> Don't orphan, add Bartosz.
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8abdc0e50699..8a2c5fb0ba55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21145,6 +21145,7 @@ F:      Documentation/devicetree/bindings/net/qco=
m,bam-dmux.yaml
>  F:     drivers/net/wwan/qcom_bam_dmux.c
>
>  QUALCOMM BLUETOOTH DRIVER
> +M:     Bartosz Golaszewski <brgl@bgdev.pl>
>  L:     linux-arm-msm@vger.kernel.org
>  S:     Maintained
>  F:     drivers/bluetooth/btqca.[ch]
> --
> 2.48.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

