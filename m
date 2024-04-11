Return-Path: <linux-arm-msm+bounces-17297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787F18A2111
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 23:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05AD91F23252
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 21:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F3C2DF84;
	Thu, 11 Apr 2024 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZakNMt88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF14336B08
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712872008; cv=none; b=NoA2JOdKrvmivg1r4gJGg21vWSCAPkY5gPghC8iL8FCuG5PWAgCp61DceoG/d8l7GbeGiltOwnCEr7PY09pdSiYlJ3Ml0VtvI2E87n/roJCTHB53WwUivAmGz/uktWl8E1qtXMVy7yhADuwGrePczCTgidAGNtjBNjRdqHtounY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712872008; c=relaxed/simple;
	bh=uNSs5vtcekAeYi40GD/+uwWvEM1ihdSyNIerkATTiZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J81c8kPljJZfnEG0iDYAxLl5ksflwy8EbtBoxsu+MDqoBptbyr3fFz+2NXWMs/RVU4ZVVs9WQP7avjZyyIDq8rs2TRJnfqbzX4jwBwBfX2kovZMRM5r8F5ETlxe+rcgSP8X4Rnn6NQju6IpxJry8RAT89AF+q5ilL3heluw6E/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZakNMt88; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6153d85053aso2205527b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712872005; x=1713476805; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Bv9F7Hojq/Cfu3ER7cqazK0eiROWzKe2VDuRs1xH1A=;
        b=ZakNMt88rvPT1gXETHuE1PCpmjHeA/xQxgvMLZX2om2yoILTHuqY7/zcPNkBjznrMX
         fDl2EU1OBtK6WKmfo0dwXK2wc06MffhIUss0aYKbLzerQgOLgGo3mkObia3+zLZZUpNA
         M4QhjlbZY0zWESx75tVqboJBxLF521poX6wYoSTQxFNGq68Ws/VcUMlAlvHiw6igPHON
         2RjnPNoW3Q6gPnrsNSM5ijZASPcSXvwtPvbjY3QMqVs/ELYJqyD0Ue6l4Y9pSbR1Argo
         QrEdcNmDn20X9GUbwss3irx4voZMS+OI5119IfVW+ww4L6FtFroq4EZYmjnV7+3UxTic
         nhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712872005; x=1713476805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Bv9F7Hojq/Cfu3ER7cqazK0eiROWzKe2VDuRs1xH1A=;
        b=BMZ+iYy9vvXItuk8FXUfHBQXBv7C3xFeX67Vir5KExR2cXQmXeHPrPC/tTlxS3mfd9
         sQLujATpo1/1omsB39BW8zdZzBfCDGhStwSHScJZEtrJqmO7tWI5QXUA8h9yMrDRZU54
         roT90pm+CbkqRYNCgSIJcnQdtDip69M99Y63uKySNkuzfwGfHFwGPiX26e60nuWAaLNk
         7whmqNhsoaSLAdnOAawmERuw/VfEv5+1mShTPg6+15Lqa9WXtNRGR80PUNLudSlCo+Ut
         J6wzKEc3hBhUz5l+T9DBKGlzeNF8B+fq4v/VDmkfNgnfiifGk3tiNFHGKd/NilEpXGBZ
         z5fw==
X-Forwarded-Encrypted: i=1; AJvYcCVdJTn2OYkN6TXv+U37ahw3wGBWEJbyVVxdMlpUlAKItTaIHZvT6BkMwf9l+ZYXemNFNYHvl1YAUwfLmHc7GzosyaknETkUn28vRvQmQQ==
X-Gm-Message-State: AOJu0YxuhdkNStromSZ29wyRmhOmwP3UcypZr5WjYkVcIfR1U36nEw2R
	7iNoPy4K/lkifrFkKVLB5/TYg5yLp82NKYqyMCORbNKcJs7oxFocX3mbxx23JS6n0Dz6yHnTt77
	yRySWIC8+KoT0zIMnpmA5g66+WC0n+dyTRiD7KQ==
X-Google-Smtp-Source: AGHT+IH3nG+5ooddR3TkR9saDOqZj8XET0NZKBgRR8e9Tshi5Wd/hYdbU8WpoZKw3lbPWRjF2Tg1FDbxOHJcQIzTzvU=
X-Received: by 2002:a25:b55:0:b0:dd1:7a16:7b4 with SMTP id 82-20020a250b55000000b00dd17a1607b4mr793294ybl.31.1712872004952;
 Thu, 11 Apr 2024 14:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
 <scvwfj44z3wpp7phvesfwjuv5awtlkwby2vvrpaq4i5fircrt3@i3ebya4iymf3>
 <730d6b9e-d6b4-41fd-bef3-b1fa6e914a35@linaro.org> <33qyr6cfruczllvavvwtbkyuqxmtao4bya4j32zhjx6ni27c6d@rxjehsw54l32>
 <321aa524-ab64-458a-b4c0-70294cc5467d@linaro.org>
In-Reply-To: <321aa524-ab64-458a-b4c0-70294cc5467d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 00:46:34 +0300
Message-ID: <CAA8EJprvss4RTXQWMQpcE6afpc0Q22zzeGxJBxh4s04E=8rGBA@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Apr 2024 at 00:35, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4/10/24 21:26, Dmitry Baryshkov wrote:
> > On Wed, Apr 10, 2024 at 01:42:33PM +0200, Konrad Dybcio wrote:
> >>
> >>
> >> On 4/6/24 05:23, Dmitry Baryshkov wrote:
> >>> On Fri, Apr 05, 2024 at 10:41:32AM +0200, Konrad Dybcio wrote:
> >>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> >>>> abstracted through SMEM, instead of being directly available in a fuse.
> >>>>
> >>>> Add support for SMEM-based speed binning, which includes getting
> >>>> "feature code" and "product code" from said source and parsing them
> >>>> to form something that lets us match OPPs against.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >>
> >> [...]
> >>
> >>>
> >>>> +  }
> >>>> +
> >>>> +  ret = qcom_smem_get_product_code(&pcode);
> >>>> +  if (ret) {
> >>>> +          dev_err(dev, "Couldn't get product code from SMEM!\n");
> >>>> +          return ret;
> >>>> +  }
> >>>> +
> >>>> +  /* Don't consider fcode for external feature codes */
> >>>> +  if (fcode <= SOCINFO_FC_EXT_RESERVE)
> >>>> +          fcode = SOCINFO_FC_UNKNOWN;
> >>>> +
> >>>> +  *speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
> >>>> +              FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
> >>>
> >>> What about just asking the qcom_smem for the 'gpu_bin' and hiding gory
> >>> details there? It almost feels that handling raw PCODE / FCODE here is
> >>> too low-level and a subject to change depending on the socinfo format.
> >>
> >> No, the FCODE & PCODE can be interpreted differently across consumers.
> >
> > That's why I wrote about asking for 'gpu_bin'.
>
> I'd rather keep the magic GPU LUTs inside the adreno driver, especially
> since not all Snapdragons feature Adreno, but all Adrenos are on
> Snapdragons (modulo a2xx but I refuse to make design decisions treating
> these equally to e.g. a6xx)

LUTs - yes. I wanted to push (FC << a) | (PC << b) and all the RESERVE
/ UNKNOWN magic there.

>
> >
> >>
> >>>
> >>>> +
> >>>> +  return ret;
> >>>>    }
> >>>>    int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>>> @@ -1098,9 +1129,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>>>                            devm_pm_opp_set_clkname(dev, "core");
> >>>>            }
> >>>> -  if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> >>>> +  if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
> >>>>                    speedbin = 0xffff;
> >>>> -  adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> >>>
> >>> the &= 0xffff should probably go to the adreno_read_speedbin / nvmem
> >>> case. WDYT?
> >>
> >> Ok, I can keep it, though realistically if this ever does anything
> >> useful, it likely means the dt is wrong
> >
> > Yes, but if DT is wrong, we should probably fail in a sensible way. I
> > just wanted to point out that previously we had this &0xffff, while your
> > patch silently removes it.
>
> Right, but I don't believe it actually matters.. If that AND ever did
> anything, this was a silent failure with garbage data passed in anyway.
>
> If you really insist, I can remove it separately.

I'd say, up to Rob or up to your consideration.


-- 
With best wishes
Dmitry

