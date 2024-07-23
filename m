Return-Path: <linux-arm-msm+bounces-26900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB06793A036
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 623C21F22C9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FB8152189;
	Tue, 23 Jul 2024 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dd2rXOqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520D915217B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721735389; cv=none; b=H68PGFLgBs8mVF7TPSdEG1NkyDroPayJDWhPCJvx3qRY2sv86Pxq4XIa95Fi9fbwrh1xhoQGrc6jl+p5o4+qDiD4VG8qJJncz01nqEJV1JAccHkyxr4pJRj4AIR20y8hfuaSc4LqpGm6+px7cla+hEKv7Psd5a9L9hHQKrXic4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721735389; c=relaxed/simple;
	bh=hCpkp5ANZ8OkyRK1jIyFubJUFgQl0f1cvXrspwfYuRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLUoDLtmh0cyFee0OuCZ97Mf6hcL5BBJdh2VBBU2hvUw93jjapKwPgHR1EZWyla5Bz/a5gio/8DAWuKhW7mW9XRdkzNDTXVgMgs81G1DI3HK/bDZWwTlpvKyOsJNPe70WQwvNGT5KHuAvueprY7AXHB8mlN2whzxThf1XwMcYM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dd2rXOqN; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso4947537276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721735387; x=1722340187; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=llaCJsVSUmU+Pmrfx22YDYSfpr8wrINFhr1BhQOlVyc=;
        b=dd2rXOqNr3sLwF0+oZwHXvguuj3L6yvtCV7VmzYHmD4wXCawQBgU8IGkDtwls2oXjT
         myXzwIVvdNfxZY+mM2ud3pjdMK4IShzAdcT/21InXxosdmw6G0WdngbgFm8Jx4voYlwv
         flfZJl6kvvd7CKw8NptA943+G5tXwWEQP9UJ4rU1m8Q8WUN7ThKzkZel7phk3DoIyQAg
         L8Ue8iksb1lZ7e2IFrUg2VRB79+kA6xxub4aKZEdooE8oODzaX9y/z6lcYzcwrw7/t7U
         oKP2iQbaV7vQWC9XvsnhZKS01xCK8tJcEP9Enbzbe7jfkoUBoromzjnVctIGaTwP8Uxo
         3K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721735387; x=1722340187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llaCJsVSUmU+Pmrfx22YDYSfpr8wrINFhr1BhQOlVyc=;
        b=skmcMQwZitkaA4IVe1Ih1paJkuh8jT7bj7ljWRcSjEDTFmHNYc9JJAZSZx5pBqsl5/
         rKLc+FJGA+4mvNO0Y4g4iTac9ybmnljajA+udUY8/P1/fbERPZkqsRnPbIwbJi4Q5Zbh
         Mt1JcX8qLxPkzClu8SXNvx8uyByzCpp2Y+D/UpGJDOMcNmqcgEFzkCRme+pX9HYGc3Cy
         2lG5nX6ht8g2c8IPNysW/+Csp2L/+oIcFRuUIIMUJJ54LvQhKjeizgtUwRqwf9L/GfJ6
         CiUKRGm1H/eOLpnAc19Oj510kYfkPvpcrGWfn/Ov8ozYLJtjy+sdhOAEUQdSCbGNcu3Y
         USmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK0+QhaRK91gdpH+Xf9YiqGVY7cOis0XWxB0RNZSAg843pFnVc5h8hZIvnmrluVJfKpOcKAOInQ4Rfimvhfg3LYf8pMnWmHxTAzSjnJw==
X-Gm-Message-State: AOJu0YzF7oYrgz+LOQG9wLhBaSBqOJD5+wQI/it4LAuVk+XAF/97fJeO
	919IimixG8KRxvurnAPvt5Rr8HCdBEfkRCLEDpCbURhflp1ohu0iSFIE8/w4cBQ/JrRkNxI9h0p
	nQpqmLwyvb1gkJz2/Imu5yGzugiATJcA6bvsQkw==
X-Google-Smtp-Source: AGHT+IGuO4i1P5RHinuVPAWDIVC3NOtN+MxiPreBx2aMxJvTATo97Thp/RKQ+zI6rh4tuhZUg++9l/QZJxL5swB8y84=
X-Received: by 2002:a05:6902:1025:b0:e08:567c:c9c4 with SMTP id
 3f1490d57ef6-e086fe5459emr11815420276.6.1721735387259; Tue, 23 Jul 2024
 04:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
 <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com> <86068581-0ce7-47b5-b1c6-fda4f7d1037f@linaro.org>
 <02679111-1a35-b931-fecd-01c952553652@quicinc.com> <ce14800d-7411-47c5-ad46-6baa6fb678f4@linaro.org>
 <dd588276-8f1c-4389-7b3a-88f483b7072e@quicinc.com> <610efa39-e476-45ae-bd2b-3a0b8ea485dc@linaro.org>
 <6055cb14-de80-97bc-be23-7af8ffc89fcc@quicinc.com> <a0ac4c3b-3c46-4c89-9947-d91ba06309f4@linaro.org>
 <8dfc5456-861b-e01a-d2d2-1bb9adea1984@quicinc.com>
In-Reply-To: <8dfc5456-861b-e01a-d2d2-1bb9adea1984@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 14:49:36 +0300
Message-ID: <CAA8EJpqrxCyeJJGSORtfvi-bBdqPOjr6xO4gff2W+LBCEVoxJQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC hard-coding
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, stable@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2024 at 14:37, Satya Priya Kakitapalli (Temp)
<quic_skakitap@quicinc.com> wrote:
>
>
> On 7/23/2024 2:59 PM, Bryan O'Donoghue wrote:
> > On 22/07/2024 09:57, Satya Priya Kakitapalli (Temp) wrote:
> >>> I have no idea. Why does it matter ?
> >>>
> >>
> >> This clock expected to be kept always ON, as per design, or else the
> >> GDSC transition form ON to OFF (vice versa) wont work.
> >
> > Yes, parking to XO per this patch works for me. So I guess its already
> > on and is left in that state by the park.
> >
>
> Parking RCG to XO doesn't keep the branch clock always-on. It just keeps
> the parent RCG at 19.2MHz, branch can still be disabled by clearing
> bit(0). So during late init, the CCF will disable this clock(in
> clk_disable_unused API) if modelled. Hence this clock shouldn't be modelled.

But it is already modelled:

static struct clk_branch camcc_gdsc_clk = {
        .halt_reg = 0xc1e4,
        .halt_check = BRANCH_HALT,
....
};

>
>
> >> Want to know the clock status after bootup, to understand if the
> >> clock got turned off during the late init. May I know exactly what
> >> you have tested? Did you test the camera usecases as well?
> >
> > Of course.
> >
> > The camera works on x13s with this patch. That's what I mean by tested.
> >
> > ---
> > bod



-- 
With best wishes
Dmitry

