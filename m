Return-Path: <linux-arm-msm+bounces-34335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 264D399CB25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C54321F2104F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02DC1A4F20;
	Mon, 14 Oct 2024 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yZMqifFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E511A7AF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728911347; cv=none; b=kHPzPUlVEs9TcbQe5yezvykloKmh29NyQfSeOCHH+uAaA4i4eMgnsZt6m88SZcTS/y4GJ90tlJSe9KqNvprsyrKw5TWna6h2mIlxJoN82rSugYH+vXIfXbgiqamrV4mJ0FVPNc7O833BAZrBmWu/vdup0fgItEJuXGFeRgOuKXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728911347; c=relaxed/simple;
	bh=KrIsq2TplMAcC3vZ7KzTAGaB9LDDCrPy5Hjd3Pz11r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a50LaHLnURWJ/A5YDfgtvvyal3zRahG9MbFQHsuGoeK7ida+J+TqfeawjL5ij6keCoKEk1Jumy7xYXyr0MY/0gxyLWqhvr6CehfaNor0Ogv0g9l+hQtEJIxaKXLoFvS1vHp1zTbW2HF6uBAUQQ8NuIgW05g8rMdC+mS1eQ2hk08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yZMqifFi; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f72c913aso997232e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 06:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728911344; x=1729516144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5L05MlQtWawdX8p0wuqt/baMtRhM5OYK1N4bwWDl5s=;
        b=yZMqifFijxQFDP66rh2JbZMVTwlU2rCuEzvadonb1SCkohpIy69rQrv2wmnF/0C6SR
         MNSt4zmiwDIO2F0YGDgGS5srRZViobUVvxChkIvM7zWbW2L9iD9mtRdr4vBLlApU6vCA
         J866MzhByUToMSRs1eka1llwUFExZ1XBbLROQ5VcOoWEu3VubXpYNX3+vRXeOLrDqM4w
         I5FHCdkf1/UMny0Nv84+IOCMx2BaAz9YZn9pQ/xVRb1cO+tIm7/ZcliuDAo8gESrGBj/
         JbtCl01D2bkxvddX/HGqYtTxTkwbBpUZjccePTdY5uLlSCORL20ziM3hWX6N5ecL72iz
         WhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728911344; x=1729516144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5L05MlQtWawdX8p0wuqt/baMtRhM5OYK1N4bwWDl5s=;
        b=UmQSYxssGwvv2jeirkxmtm7GmFrmwiVoJqhGgu87x8jGiulvEbIfWXrtZiqfoNA3vU
         V8GvDX1HZ+HY4bBw41jRRwLaLoVXHLX+FpRbzB8ZkjJUtSq8VZf0lKzsS04BLxLdeJwe
         GNkEwmoK+nExBYUmdcKioWyeLLDnxF7OgUGuZVBjtpNbHFfeQOeO+NoLd2NLlxQHjqbO
         UYr5DgCnS/HXQ4hqLfkqpfZ6/sgjdUJQ9EecMxmOx2THphsQz0ohEeAX9131F870igTP
         q2Y4uZGpHt99DWbfZPxf5mNY33HOU0x2yPLHYXNKP+Bm7VlPxquUdGbkEUeYNOH7SI9b
         5m4g==
X-Forwarded-Encrypted: i=1; AJvYcCX22TM/IEkwPzWHB35RQsZ1OjUCEs/TkOIvD4aGiHc0YHraXNzGrqE9iFp1U5m7Vbi8oFZcBaRdi/Z6qVKU@vger.kernel.org
X-Gm-Message-State: AOJu0YzKCBUsNSsgnnPWXzuUzbWRcqpSdmdFD7vQZiL1JACl7wE1kIn8
	Q4atSP167IIFDgVb249nTDxgsSFkOjWl/qVxxrtaI/79+nT3LnQhzsulNmZnNNRT7UdAX0DPknn
	Jzgb5UrW/Kt1Y1jv6w6K+fw8PE3khXX9OjDeEIg==
X-Google-Smtp-Source: AGHT+IE01F/CRk63gLh6wyNUgkx2X9t+nVpaABxUkKcustXwQv1CEDsdg/mGhJHXQ/JNUYjs2Ro8jQ0+C6HhhsODR2s=
X-Received: by 2002:a05:6512:1114:b0:539:f7a2:65ac with SMTP id
 2adb3069b0e04-539f7a2661bmr1505166e87.35.1728911344139; Mon, 14 Oct 2024
 06:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com> <20241014111527.2272428-3-quic_kuldsing@quicinc.com>
In-Reply-To: <20241014111527.2272428-3-quic_kuldsing@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 15:08:53 +0200
Message-ID: <CAMRc=MfR8rK3EnZx3_9rxkwgv6f8jA4X0u0cGBkpJ89d5i1MKw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 1:19=E2=80=AFPM Kuldeep Singh <quic_kuldsing@quicin=
c.com> wrote:
>
> The qcom_tzmem driver currently has exposed APIs that lack validations
> on required input parameters. This oversight can lead to unexpected null
> pointer dereference crashes.
>

The commit message is not true. None of the things you changed below
can lead to a NULL-pointer dereference.

> To address this issue, add sanity for required input parameters.
>
> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/q=
com_tzmem.c
> index 92b365178235..977e48fec32f 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_conf=
ig *config)
>
>         might_sleep();
>
> +       if (!config->policy)
> +               return ERR_PTR(-EINVAL);

This is already handled by the default case of the switch.

> +
>         switch (config->policy) {
>         case QCOM_TZMEM_POLICY_STATIC:
>                 if (!config->initial_size)
> @@ -412,6 +415,9 @@ void qcom_tzmem_free(void *vaddr)
>  {
>         struct qcom_tzmem_chunk *chunk;
>
> +       if (!vaddr)
> +               return;
> +
>         scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock)
>                 chunk =3D radix_tree_delete_item(&qcom_tzmem_chunks,
>                                                (unsigned long)vaddr, NULL=
);

This would lead to a WARN() as the lookup would inevitably fail. We
can possibly keep this bit but please change the commit message.

Bart

> --
> 2.34.1
>
>

