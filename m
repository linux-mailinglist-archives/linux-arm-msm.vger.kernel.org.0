Return-Path: <linux-arm-msm+bounces-46936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082AA2891C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 12:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82C08162A63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 11:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9091422A1C5;
	Wed,  5 Feb 2025 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dYyDhUKj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8C021B918
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754598; cv=none; b=h1NeEm7OZAP5qrhkDg7AbzDs/GMpPDqgHFxfrRTFoH6bQuWx2wUyUMb40h26A5ChZXtyGTuENlISSOcPcWvVI0Y939xGJc1wOTpz4jcmv7QZ9uKwuH57SwgnEW3hwr8LuDaq8dO0hVcjzZx9iuMsp8jelIL7RLY13Fm+ve32jYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754598; c=relaxed/simple;
	bh=AqZfcnSsRLIRU+F8qfTXzVLSe+zGLhUDza2QBN1I/Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIMVpNeXQ6YOAB3CAh2Ur0N6TXCQnMZtV94/5NWUOnMbDUQfT0pMlk+8qjS7XacZ34Bmg0vjsOFSqomEzY2Bb9/reje2MLRR0MnKHFdKeKMDpEKrXP/xzZ+jFT6G6mXmo9y33WVtQ7BEbgmotBdDauf0vMmzD0RRwfQRHY4ItNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dYyDhUKj; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f88509dad2so49586047b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 03:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738754595; x=1739359395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fa9aGxXl6mZVn+FME8FAQRbgYiaB3nWrpoQsGxnG/Q8=;
        b=dYyDhUKjdWuAJLGCFK5b8enLJj+t2ejSufYWeSCIUOmzhm+jCt6bG3eNgXOrTGs7f/
         F1VqjhIF5O4IWxEpN6UW2BtfzxtJzXAeYAHXtYDPyLrrrIjTk5FHxjy4t65gUBt+lsrB
         AYeC1BWgS5vT8Dt7UADtWvCWRC7fNfRktkrjx5KrAZkFoDd/ItXqoSC6p3ibXbgizxyU
         MrSmBY0MpVqWzyRIhNXtGpTGJ9ZYOm9Ud58NonNhQcLegImn3tspg3mYMH9wuvZ8/hnW
         fCsnMlrdqNoj2jjMxsOUu6yc5CSOfu//Zo6EBhGRaZ5TRaEjra+s9/BgCNKn/fMyqti7
         z01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738754595; x=1739359395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fa9aGxXl6mZVn+FME8FAQRbgYiaB3nWrpoQsGxnG/Q8=;
        b=s88tbUkXtsy7ved4Imjc8qYrpv2MgWQ8qrsEzCZ45yc1JzjUvfaZ8fNk8olpfGd40b
         C+54K56U/SCd6xDi7Vcah85RJvqQVg0tWcUe5f8KveCSXBrAxiO/BhT6OQ6rMqKcL4h1
         uYQ0SOXZWKe1/8EbhlaqKGvWVTc4/u8LVXc4Ae0UfzoIU7Rvix8R1+Efd7kGHmDWW8GA
         Ekdddz3XwoSULg3fJKR3sRr4A6gaZjalnEtHz96s+mJMe2eC4pn3RRx3JhOCNQN3cNA2
         jG2Mk+3ScmvCJYlza1sHcwMIOXvsQAingGS9NaHT7deqAovnAE4IX8hPaegiaxgk9cOs
         Iy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU011awHLC8QqU7c3vuUOfYRoA2mzwRGMe1sEzNTxEvRkBeBHOdVv3iKIzMPfJKyYrUJqQFpw+hONRbB+EU@vger.kernel.org
X-Gm-Message-State: AOJu0Yymd8h5QQAb4cHj0MYAzgeP0abcjWOWWYL34fw+auW9c6hJ8OGT
	9ZrZrn3EHFqKxjyqWMO2b0o69al9OLmv3BFzUScexS8FbhBNGkvBV7dn5QSyJLEcvwT2v7s9Snt
	L2uprF8KZxyQGfoDQCONjRFjLRA2KMRCETUfOeg==
X-Gm-Gg: ASbGncu0t3LXswMLwcVWBVZu653QrFG9C5RZyeuJsR9D0NQ2GjGiivpa/18ruApDet9
	SdoYHDmxdlbohI+zICrrnMfmuj/EJlFXPBgNWHgPNFUcLwRrRkKJpQcz31ZAkq4y6PiTFFDg=
X-Google-Smtp-Source: AGHT+IEW6RD+5VnO+7EsCnCeyhyA9cslgU2OmzAS1vQAeudwMDWyr87z1JVVpYOmr30QsWroSZRBnjtOK3EDe6HFwcw=
X-Received: by 2002:a05:690c:6a03:b0:6ee:6c7d:4888 with SMTP id
 00721157ae682-6f989ef890emr20596927b3.22.1738754595544; Wed, 05 Feb 2025
 03:23:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org> <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org> <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
 <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
In-Reply-To: <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Feb 2025 13:23:06 +0200
X-Gm-Features: AWEUYZlJPJ9hwhYV7xEOL3gLUNVn5kAppOzW5Vg3bQGz2sNQ7dCZrFHi0WhZq70
Message-ID: <CAA8EJppUkLYfHUcNcJA5or4ZVJsbTe74a6GGV1CR6zqCWmVjRA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 5 Feb 2025 at 11:34, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/02/2025 03:51, Dmitry Baryshkov wrote:
> > On Tue, Feb 04, 2025 at 04:46:04PM +0100, Krzysztof Kozlowski wrote:
> >> On 04/02/2025 15:26, Dmitry Baryshkov wrote:
> >>> On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
> >>>>> On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> >>>>>> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> >>>>>> clock from Common Clock Framework:
> >>>>>> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> >>>>>> concurrent and conflicting updates between PHY driver and clock
> >>>>>> framework, e.g. changing the mux and enabling PLL clocks.
> >>>>>>
> >>>>>> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> >>>>>> synchronized.
> >>>>>>
> >>>>>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>>>
> >>>>>> ---
> >>>>>>
> >>>>>> Changes in v2:
> >>>>>> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
> >>>>>>  1 file changed, 22 insertions(+), 13 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>>>> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> >>>>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>>>> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
> >>>>>>          /* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
> >>>>>>          spinlock_t postdiv_lock;
> >>>>>>
> >>>>>> +        /* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> >>>>>> +        spinlock_t pclk_mux_lock;
> >>>>>> +
> >>>>>>          struct pll_7nm_cached_state cached_state;
> >>>>>>
> >>>>>>          struct dsi_pll_7nm *slave;
> >>>>>> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >>>>>>          spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >>>>>>  }
> >>>>>>
> >>>>>> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >>>>>> +                                        u32 val)
> >>>>>>  {
> >>>>>> +        unsigned long flags;
> >>>>>>          u32 data;
> >>>>>>
> >>>>>> +        spin_lock_irqsave(&pll->pclk_mux_lock, flags);
> >>>>>>          data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>>>> -        writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>>>> +        data &= ~mask;
> >>>>>> +        data |= val & mask;
> >>>>>> +
> >>>>>> +        writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>>>> +        spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>> +{
> >>>>>> +        dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>>>>>  }
> >>>>>>
> >>>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>>  {
> >>>>>> -        u32 data;
> >>>>>> +        u32 cfg_1 = BIT(5) | BIT(4);
> >>>>>
> >>>>> Please define these two bits too.
> >>>>
> >>>> Why? They were not defined before. This only moving existing code.
> >>>
> >>> Previously it was just a bit magic. Currently you are adding them as
> >>
> >> No, previous code:
> >>
> >> writel(data | BIT(5) | BIT(4), pll->phy->base +
> >> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>
> >> This is a mask and update in the same time, because:
> >>      (data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
> >> is just redudant.
> >>
> >> I did not do any logical change, I did not add any mask or field.
> >> Everything was already there.
> >
> > Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now
>
> You did not address my comment. Previous code was:
>
> (foo & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
>
> Just for shorter syntax it was written different way:
>
> foo | BIT(5) | BIT(4)

Previously it was a simple writel() with some bit magic. Now you call
dsi_pll_cmn_clk_cfg1_update() passing the register bit field through
the 'mask' argument. I'm asking to get those masks defined. Is it
possible?

Yes, the code is equivalent and results in the same values being
written to the same registers.
At the same time you have added a logical entity, a masked write. I
want to be able to understand if bits 4 and 5 are a part of the same
register field or they belong to two different fields and can be
written separately. I really don't understand why are we spending so
much time arguing about a simple #define. Okay, in case of drm/msm it
is not a #define, it is <reg><bitfield/></reg>. The net result is the
same.

>
> > your code adds BIT(5) as a 'mask' parameter. Is it a correct mask for
>
> No, my code does not add it. It was already there, look:
>
> foo | BIT(5) | BIT(4)
>       ^^^^^^^ here
>
>
> > that field? That's why I'm asking you to define those - you have changed
>
> No, I did not change bitwrites. The code is 100% equivalent, both
> logically and assembly.
>
> You mistake maybe with some other part doing "writel(data & ~BIT(5)" in
> dsi_pll_disable_global_clk() but that's just poor diff.
>
> > bitwrites to the masked bit writes. Masks should be defined.
> >
> >>
> >>
> >>> masks. I want to know if BIT(4) and BIT(5) are parts of the same
> >>> bitfield (2 bits wide) or if they define two different bits.
> >>
> >> While in general you are right, it does not matter for this fix. If this
> >> are separate bitfields - fix is correct. If this is one bitfield - fix
> >> is still correct. You could claim that if this was one bitfield, using
> >> 2xBIT() is not logical, but this was there already, so again my fix is
> >> only fixing and keeping entire logic or inconsistencies intact.
> >
>
>
> Best regards,
> Krzysztof



-- 
With best wishes
Dmitry

