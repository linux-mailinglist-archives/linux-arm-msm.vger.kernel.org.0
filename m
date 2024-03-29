Return-Path: <linux-arm-msm+bounces-15743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA0892374
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 19:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 599D028681E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 18:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B991638DD3;
	Fri, 29 Mar 2024 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKZOYBAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EC639FEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711737561; cv=none; b=gYduuA48XGjY5La+PWxl3XdvomLoyWQzkh4+Araq3+96PTczEXv/7/17ws6mhjDt3OU0B+CZPfATBwlCd+GkzEyYiSCKNpHTExgwS/HXBsJxuzK4dLyLRAUSvtZVp4+JqwC9b7HPZLydvOyu6/rTjOr+vqVfeA46OgqG76Q+xgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711737561; c=relaxed/simple;
	bh=qw+LyXS4Jxo0zDRbwxDiYKHnX2Jw5hLsTZxGE8VC8ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQCWHJwRkDG0nMryrJguu1U4Hd4r405b8tf4wDFD57bRAywnj87OfT8Acy4F7CfWWZtN130NvYSQhyu8NXOlriJ1REoWFSrgQWkPIawn6d03zKhXnE2pmVJlU/i7nrZp08Q1sJg9wG+Il9FFKTki0BSwR0XSzwhxnibVW2AwGaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKZOYBAW; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60a104601dcso23189477b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 11:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711737559; x=1712342359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lLr/63FZWa2U7lSsfTE/HR44aBZA5xAziz+mA0POm4=;
        b=VKZOYBAWIFzcgAl+/tnYagcx8bjcRV0nljVD0rIR7EV/k2KcqNWxuur0Bdy1NN0Agu
         a0tLFRvQsZxz9AGE5LwZl5rxPCIbyN8NQe1VeuzY49LOzfbuVLxLu/+xv2wiurPqhvmn
         AJdu24FYZUHT061l9qKyiwyPdt3QVpQCyut72E41oYChQT2wrfaf6P629rSscBBXtalT
         5O/QaBwA9uzmazKMStkXoxbozwmfwav2ADcNCSJtaZVZwMiC9uDUDnQ1+AceYL8BSy73
         yo2KLvs3coj/r0+eC313LBG2X7Ny3S2o9rImIMoLLii2eMd80bZF+UT4PPwaLAk/nrkk
         eKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711737559; x=1712342359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lLr/63FZWa2U7lSsfTE/HR44aBZA5xAziz+mA0POm4=;
        b=ntgKMYKZps857ZXWX73LAG443K8Cinue+6YRbSH3M5aCDC8fI+qWUDr+TxEs8J1eI0
         EHi9UdvhOS+yHEER9XjrKgvrsG2HCj1T5AldJil+23BYVE8B8Rs6zqoDrtEpj32CI1Pf
         Ow9xE0Xwue/xK/1Envua6fjyAABMQi3qSsT5TXOyHOkPI9fh1NcqWDdGYbGnF8wnjZkU
         BJTv2AH0qj5B7OUC0iURwFUz+krGP0Foa9/eKMsusPa6pSIydnUmYvfstB3K2C1EkPJM
         ZRSBZWdRCGuuW41MpKQ5kZj2NAf1p/TCF+jOURNPj/iQtYe9K3fMQL0qGclApUJybEfP
         yHnA==
X-Forwarded-Encrypted: i=1; AJvYcCUrkRzBAsmyVwM840Whah7k7QaPlJM6K7rdXCMOAdv5aakv4xjEo15h7Q/nbc/3kcTRpxq5ITAbobaobV514bt+iyJRsFwTsYSPzsAjSQ==
X-Gm-Message-State: AOJu0YyHQIG5rC3wfJPEA71HX8CBwmYwx8dIDZCJkCsoSeYf7luWpv5P
	nTis+alguBXes9iyOMCY5O2bzPtQpEtROwkW+7PS1x5+d1KGxtYNRyOEN/JfKbjBLa/ybvUPxrj
	/Z1+gBa1M07iK5fnD+kEUk3gv3bap+7BrXG5ORg==
X-Google-Smtp-Source: AGHT+IG6LHCIDykcmLA6i5jn5Wvc80VbM5tLJ6fDDXX2T5HcQwx31rikXyypNkMk6YErFbMKbGLu3vNXn1mOcGtZ810=
X-Received: by 2002:a25:f622:0:b0:dd0:972b:d218 with SMTP id
 t34-20020a25f622000000b00dd0972bd218mr3373650ybd.41.1711737559195; Fri, 29
 Mar 2024 11:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327113228.1706975-1-quic_mohs@quicinc.com>
 <20240327113228.1706975-3-quic_mohs@quicinc.com> <CAA8EJpqh0emOFUPSj8rPaKr2hZRWwOh9NNTco8fyJCtwXe9sSA@mail.gmail.com>
 <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
In-Reply-To: <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 20:39:08 +0200
Message-ID: <CAA8EJprLB6+i4H5tK9LbJYOEH8v9QF78u-+HMmqPqfpvz5J8zw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for qcm6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, broonie@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, lgirdwood@gmail.com, tiwai@suse.com, 
	quic_rohkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 29 Mar 2024 at 17:20, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
>
> On 3/27/2024 6:39 PM, Dmitry Baryshkov wrote:
>
> On Wed, 27 Mar 2024 at 13:34, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:

Please turn off HTML mail composition and never ever send HTML email
to OSS mailing lists.
Now quotation levels are broken...

>
> Add machine driver for qcm6490 SoC.
>
> This initial supports which includes WSA883x Speakers with onboard DMIC
> connected to internal LPASS codec via VA macros respectively and also
> WCD937x based headset.
>
> Add compatible for sound card on Qualcomm qcs6490 boards.
>
> Granted that qcm6490 is similar to sc7280, is there any reason why you
> can not use one of the existing sound card drivers? Like sc7280.c or
> sc8280xp.c?
>
> The qcs6490/qcm6490 has additional interfaces like MI2S, which requires additional machine driver modification.
>
> Example : Required new DAPM widget change in machine driver for MI2S interface which is specific to qcs6490/qcm6490.
>
> So, using new qcm6490 machine driver.
>
> Will try to use existing sc8280xp.c machine driver.

What about sc7280? In the end, qcm6490 is sc7280 with different firmware / spin.


-- 
With best wishes
Dmitry

