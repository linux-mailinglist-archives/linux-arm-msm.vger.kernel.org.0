Return-Path: <linux-arm-msm+bounces-78032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC4BF1FC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 17:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E4854620CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 15:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD43723817E;
	Mon, 20 Oct 2025 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCIyZ/am"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA078223DD0
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972669; cv=none; b=rk+wTAeFS569JBFGDW5osPajAQhFzCwxniAFFYoyfAxt67ozXkXUwelKH+S4j1dhanlrHG5uUb4sFvBKdbLV9dDxtNVEX4phk3qIeXTCgNz2BOdOdVACzRHXS/SAdh+iT54P6dlcQfYC3IwzR1R0Fi+lMJqO219rPV7RZYCDLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972669; c=relaxed/simple;
	bh=NQTt3yR3wb555kAg+WKMiqLQ3QOmGXvQw1+WcPNE6mk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=De1XZVU4wYvBfekl+Aa1bZBzOP2QENOOK530ATQTZLNFDgSvRlx9mqFVn++k/J/5N21AZyEYLMsVMFKykBSBm2wSPrRcw2v4aGKPaw+MWsG/+TAlmTGgxyH8839DV6FG+uMr++NdjIwAMcqCusvHEbG7+ve7OpJz3s5W5VxfnHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCIyZ/am; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46b303f7469so35204245e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760972666; x=1761577466; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7j5YzMBOCDrFLrL1gjEGQ9zi19aLgZpxoO0BZALkK7I=;
        b=UCIyZ/amgYCUKpmSi2zCw1JGpsCsGWkMe4lwWX6WkmtRk6juK6CIbkwBYZ57y8ZdmM
         jmqWvtxnzwfo4+Q8tHe4MdEBPRG/baug1JI5umGrC3+QKypZ2W1TmHWn15N965W/BkjY
         ZFIYYiX7Iz3gO534fWQ8k+/LzP9mR/Q1I5QmcDZEIPFp9nZ5cP/jdLxJtAdtggWFI4rk
         pLZMtSs0k2U9KEcu7ZGg/TJpvHn5K7aiULdMXqRu7HtUnt+K+WIFhFhcTLda75cPrPP+
         9OnOhxRkyCXkAyGo5R1comx9x1eNq0s7m7byvwMmjIayGMdOwpVtbGHVUsa0alq7MKAI
         nnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972666; x=1761577466;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7j5YzMBOCDrFLrL1gjEGQ9zi19aLgZpxoO0BZALkK7I=;
        b=l2bK9Dy93pMH8YOJGuUqPELNBKmTpZ9/T3Fc3KYalZ47vG8Vq8n2kjO0MnY7Th6FGs
         Bea5HfAUOLb4St2wp/zGGWkXlkboVy2kHf0Zim8uomSKYF/8+6zwbSRIZrdaj/nsMTOR
         CdkUQH+CGR2+UITQqt8FqSZlp49Crc8Am/ki45mNL39Fbn++5IZqme/UjjF7KpH6bGwu
         X2tSpV8NH7mnnyaWh6xAmUO6+V1c+5t6RAJxguM7WXPyvj0CQKVektEca97VVguZDFcr
         BemfmvCF5an6/zfXYKXWLD2STpY2i4QXr+e4jQLPZoSZFIih0MCeqSPKNaEyy3QKAs3e
         dhMw==
X-Forwarded-Encrypted: i=1; AJvYcCW83Wv+TO5OmE4f63hEosXmgG7zU5qhFDM6gzuFk+ogLHaQCShs7isU8Zkp70eKMsHCvE6QUwhrvhha1mn9@vger.kernel.org
X-Gm-Message-State: AOJu0YzYIGfx9yy6fFdtV+YGuBWYD1UxA6FmeFrAnnB1MsXiNHpqlJxG
	vvmaw/cpJ0icRTQvewsrDqfC8HdnjZMWrCA+1DbcvRduk43ZdDFG2vO6g9DB4pmOEpI=
X-Gm-Gg: ASbGncsg97KAiGY+krirC756+4Q2P79EJZ683rrqUuI/1XgsPHgdncpEgppBi8M1Akc
	o7Gvk+qvd42bHc3CReP/QIW+0ZomMvBKPPUua1DIbWpXGc9na4hFOercCjLzHM8PZQ0cdfcTwOw
	erA9LgrKdNr8E2YWVBT/G9lx2PudiSGVQwACg4YiOXnUs+CwDfrSzEJex+rcUiu5GjP8AnCEXX7
	6xBKITy/7dF5DE26OYF5ww00qW/bNpPoSMvnS8j+MspAEIvLkWoFD6mo4vJe8hxkSIKyO/6meT6
	AX94Ckuya284Jvs7bsFMpl9D1hHX2Cmh3Tj//tFYATrr2kDDopDshXKYZKISSNHP3S0foAkO6GX
	wftRWPov+65OCVJKzSxheTl0c/eDpaOP3nG9dGWYzB3qXkjChi3LUFR9D8t2u+0Civf6Uk6BfI9
	Yp6XOOcMam8z1HOw==
X-Google-Smtp-Source: AGHT+IH+kjVEaLAgrhbcv9wCPGNvII0B3F+6rlxLJXUsp++tlTBLtRr0Ji9BepfUMnPNIQ4qAWtnfA==
X-Received: by 2002:a05:600c:5299:b0:471:95a:60b1 with SMTP id 5b1f17b1804b1-471179192d4mr122728725e9.32.1760972666014;
        Mon, 20 Oct 2025 08:04:26 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:9f99:cf6:2e6a:c11f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9853sm15747079f8f.33.2025.10.20.08.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 08:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 16:04:24 +0100
Message-Id: <DDN8PM13DWWZ.BCXRTJIFB7PD@linaro.org>
Cc: <perex@perex.cz>, <tiwai@suse.com>, <srini@kernel.org>,
 <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 7/9] ASoC: qcom: q6asm: add q6asm_get_hw_pointer
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-8-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251015131740.340258-8-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
> Currently we are performing an extra layer of calculation on the hw_ptr,
> which is always prone to errors.
> Move this to common dsp layer for better accuracy.

The subject says that the change adds q6asm_get_hw_ptr but here it says
that calculation of hw_ptr is moved. Where is it moved out of or from?

Currently the commit message is confusing.

It seems to be potential confusing split with commit.
("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer") where calculation
of hw_ptr was implemented in q6asm-dai.c.

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6asm.c | 12 ++++++++++++
>  sound/soc/qcom/qdsp6/q6asm.h |  1 +
>  2 files changed, 13 insertions(+)
>
> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
> index 371389c8fa7a..643ca944b1b5 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.c
> +++ b/sound/soc/qcom/qdsp6/q6asm.c
> @@ -6,6 +6,7 @@
>  #include <linux/mutex.h>
>  #include <linux/wait.h>
>  #include <linux/module.h>
> +#include <linux/atomic.h>

Ideally this should be sorted but it seems it was not initially.

>  #include <linux/soc/qcom/apr.h>
>  #include <linux/device.h>
>  #include <linux/of_platform.h>
> @@ -248,6 +249,7 @@ struct audio_port_data {
>  	uint32_t num_periods;
>  	uint32_t dsp_buf;
>  	uint32_t mem_map_handle;
> +	atomic_t hw_ptr;
>  };

Thanks,
Alexey

