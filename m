Return-Path: <linux-arm-msm+bounces-60310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E459ACEFAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 14:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 269CB189766B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 12:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A565B224240;
	Thu,  5 Jun 2025 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBum1WoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C935202F83
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128130; cv=none; b=SGP5TfCWc6+zOzVUuBKnk0YqJ2o3JW84Ea7kGBgnkD+TGo2MDzNkNx8UD3LL6JLHWsYcWYp6Rm7T49+zrlw+ow4KcTBf/w0/nIWPtK1QNxjR3D1HoD1fmrLwQOSX8phZJ27Y9IhTNLYGYy48lW4kAue8A1gMjTB2VEZsfWqRXsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128130; c=relaxed/simple;
	bh=eIIQM7TR+T1o+dHAZkYojtv7Dh1o+Bo1e/gCVkYcYrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLZgmQdS7rlkNZB2FwuykrKG1RerxwNpSl7Y6KOEseMb0ScYybNwH5Rrn/xuUKMivyPdSGz7tHFzmUvIDb0Zz/lQHpwjm0TpVklIRHgXua8wBD3HF9tOmp0HGEiwGC7AxrWoTdjxHJF2dgD3TIkaGbD3QESg2FCS6Vo81+eBiFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBum1WoZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55351af2fc6so1226217e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128126; x=1749732926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIIQM7TR+T1o+dHAZkYojtv7Dh1o+Bo1e/gCVkYcYrE=;
        b=sBum1WoZ3z0r4BE7gVJLZuzsycj7D4rrWlW19JJUORC6Z1/IjLlfeSq7JJI8sOqQyF
         A4fFs4gzFDZLFyalN08Vuhyo1Ay4xZah86ix1vMIwVdh3NkNaps3SuGU8EzaNWHoCzVR
         bHnXI+WMgeVx/fE2bX3qJt3uObzlq5iF7gLAoHpQ8kzUvDv+XiwKhiO/mfXtCEiPDEK+
         0srdlSqNT1oJzPywA7DcHBYTci/BpINtClXPO8cFDV2Jng956vIRUUGUrITGgzbYwuat
         Hl6mq/6i3rGDJYDd703evepjZjTtcRw9A1plNX6wIQhDjcPOgJtbbylWO1vC+QH6yixP
         H1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128126; x=1749732926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIIQM7TR+T1o+dHAZkYojtv7Dh1o+Bo1e/gCVkYcYrE=;
        b=rqwu9CDxocHT1BRki7EReFGjdJ7tt+gEDKKpT4Y5s4uhtKPm23sDjj3v+T17TPralG
         LcMFWZb7u4CY+uCPZMWQM9aD1wc8Zwk2cPXCxvIPO2+EvITetpFqlkydjRB1/gJ9ZM2D
         2f366ZWGQsRF/H3TuFJQRH2flQiBCHTDtUEgKb2O96tcTh7zBRD5PsR/HgQn3sfQf5nn
         nPoUvJUGCbpAwmj5M38zAUcw6r3MgNVRtN6zLT/A7359CLV3Uespw+idTFR0wDc1yLev
         OzfAeZEszHmXpTplFs+TOtCliEjWW9kF5zk0NQ2f2R/ktdRxVzsj/a7yOzWjbuYCsnv1
         UaDg==
X-Forwarded-Encrypted: i=1; AJvYcCX/PbATu+SIlaS2If4HVzGyNfpx+mM+Er1l20FwMjfJWnIU/ZgZc7PA6LEEIH1UsA4NMETXuK0ualWHR+W/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/wALqlq5UUbSIHUCrOQpmVFxySlu8rPA7aj1rMDEtZvGPkWpZ
	womwb3yV+TSyyjc5TptHKu+AfXd1RfVe69fLW8Lbdxew3LI81IFY+PtUOyyN/QC2rHBukTaq/3q
	3h5UntAMc4AmstazNENxE+LL7k195Tb70E7QCwSaFBAqXmZQ5kp0n
X-Gm-Gg: ASbGncvmom4YhQJQJJCh9WMeOVKzIzZZkq0Ex+PHGnbUsUztp+wwAL+LfrOPjPorDFc
	gFizP3XcRtTssCmlOCAfSazh/wTlMPD58iaR7lXkG9b9tfgghfkzCXGRPp1SlUCRXdWhOqhb/UI
	XQUiHGntDWQs7fp2+ruoIKBrSrJEwJkGVc
X-Google-Smtp-Source: AGHT+IFktJaRVQL3O0Bp6utEO8UMc0VZicEcSyobSFeL3Ri7u0e4wIa7Sl6wlc7e4nLZc48ufle+q9gKEzK7mexYjhQ=
X-Received: by 2002:a05:6512:ba3:b0:553:2868:6355 with SMTP id
 2adb3069b0e04-55356bf1294mr2148839e87.18.1749128126139; Thu, 05 Jun 2025
 05:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523101437.59092-1-wojciech.slenska@gmail.com>
In-Reply-To: <20250523101437.59092-1-wojciech.slenska@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:55:14 +0200
X-Gm-Features: AX0GCFvnKpjs7qcRC4zueo0StcdisXIytgLKoGyc_FirjmAk_wruvxxdurKXjDY
Message-ID: <CACRpkdZ7CEJJkc96Z=nu+Ax8jUJSK_YcMntzEBmoXK1g9d7uYw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add missing pins
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 12:15=E2=80=AFPM Wojciech Slenska
<wojciech.slenska@gmail.com> wrote:

> Added the missing pins to the qcm2290_pins table.
>
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>

Patch applied for fixes!

Yours,
Linus Walleij

