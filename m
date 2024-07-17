Return-Path: <linux-arm-msm+bounces-26425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88802933A44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9A4F1C21232
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 09:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3610E17E8EE;
	Wed, 17 Jul 2024 09:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSPdeGXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFADC17DA39
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209755; cv=none; b=ILwQO2PKmYKAQHIIr9A2zYaMT39yQcx4tv4I3RP6DcFwl8JBl0n0XNK5KO/LitrWkdaUehPXaO9w+XcKIgEFkJijAgFDNsZZqVSak5R4jJVkDSJaRMXz1L7iw/whBstR82112F0Zes7iIcu9ql+y1J9FJwUe2gm5pmpxMyNOMp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209755; c=relaxed/simple;
	bh=drdFYOrEjEZZrQPn6blYFIY9QhufSQCcwyTzafmSIHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyz4xNPLiR2MGvsFr6JzaaBh0/lGoz7kNZG3CVnN7fFwX7GfX/sfkAdDRnS0NUozZ5hXM79+tlicAb+YTZszJAdUSHY1uYc4NzKb+WGuZqitfuCWrdOXW3V4VDezI5rZhxmEP5qAzcr73dKVIMktkraIC46Y78jSCbFrnZ7ncMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSPdeGXt; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-65fc94099a6so38858377b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721209752; x=1721814552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LL2uY9ouT8695FraeZM3uIpWSuZKwhAInrpmi+yLgbM=;
        b=VSPdeGXtUq3LDXlfUm7MAyQINhPS8/mPB4tkgq9Sv4NRPo6Q1p/K5Q4+KrkMMvlHgL
         B9+JKZtAphoCYnkYbn4WC+46OOJG8Ud15V42lf5/XIoGPgcrV8tVICgKjp2V9nvgRLQK
         uB2xVYELCSqie4GgOKH9h+GlTkRsvhvNjv+TPmskCIcu2x4GzGzQ6PZMqWGVBxtYYW7E
         vt6zD9Rn9S8rubzWVxKLE4rEMCL1f1zL2hiTXDadGrpyAanpb/oxtVahwLcxruVEN9/s
         hlqNs0RUro5gYOO0u7m1NiXDuAeOJihYT4C/xUQPNMZxWdRrwtTDGZZ2h8PoPClSarzq
         7udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721209752; x=1721814552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL2uY9ouT8695FraeZM3uIpWSuZKwhAInrpmi+yLgbM=;
        b=sM+gT/smT/BFU5QSOjH4K+ZO7Nwk6m8n0cqVbLPr2CAqzdFrxXJtREB04do4Fk+RG1
         FIdn+M3/oLH0xBJ0cfeQyvDfTs5knDORhaOsddr4WDl0DeUKp+8iobJlodSDw7w3NVfx
         UF1R9PNlnHROm4nf+LE/qbi8hgeGdGq51WUez8zBbe3KV52ZerQ9zSiiWvgzd/kUJaJl
         Ff3dV6o3ppXOyeiHZIZuX5CJJOJWsOie+v+3Ydp8wQ62HLTUfT/CTGrES3ev2qOOD4Ra
         K+bewVlf6X/uZn6CUnOMnOxdUMtlY9LPbi7POLBqxxQ+zxq9TTtlIvpZn8woYTCpnJiD
         /WLA==
X-Forwarded-Encrypted: i=1; AJvYcCUhlLRHbIuB5bjaNqs8Winq0izy0M+7C4+3sqH3HYr2KdAX+s+99iNUoGUrBZ2eJ9/H5FwgyrxN3TDh/shIqJ6f54TQMnuhLQ3VFYU0Kg==
X-Gm-Message-State: AOJu0Yz9sAamwv7U6iSFjrGfMkVHqnIqRqfMUYN0jDf7Vk2Cgu4fQdMX
	hPTR1AjQ6oKNReq/J0f5XS4Umy5gnYpOudwDmqE7VEAJrdsHXfUCd13N+inZ20/CZqx7z+lIK6o
	kMeujwlrU7gngRmrOklnHrzhcXgiypF2vsAeczw==
X-Google-Smtp-Source: AGHT+IHjmMFD6c3evR25tinvxOr2rkpD+ML4O2P6BsHhDsyGohpJopMXy1cyYtbnmZhlLNx7godvFt8mE4znoTGHtng=
X-Received: by 2002:a81:77d5:0:b0:664:4b9c:3ec with SMTP id
 00721157ae682-664fd78f3bamr16513537b3.10.1721209751656; Wed, 17 Jul 2024
 02:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
 <20240717-dispcc-sm8550-fixes-v1-1-efb4d927dc9a@linaro.org> <d60cd97b-a1da-4dbd-910d-92cd62762afd@linaro.org>
In-Reply-To: <d60cd97b-a1da-4dbd-910d-92cd62762afd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 12:49:00 +0300
Message-ID: <CAA8EJprvS-bM47BTmgtA=9NunW1Lpy-9dLdYmSy9RuL6JyQENw@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: qcom: dispcc-sm8550: fix several supposed typos
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 11:08, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 16/07/2024 23:13, Dmitry Baryshkov wrote:
> > Fix seveal odd-looking places in SM8550's dispcc driver:
> >
> > - duplicate entries in disp_cc_parent_map_4 and disp_cc_parent_map_5
> > - using &disp_cc_mdss_dptx0_link_div_clk_src as a source for
> >    disp_cc_mdss_dptx1_usb_router_link_intf_clk
> >
> > The SM8650 driver has been used as a reference.
> >
> > Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/dispcc-sm8550.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >


> > @@ -1146,7 +1146,7 @@ static struct clk_branch disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
> >               .hw.init = &(struct clk_init_data) {
> >                       .name = "disp_cc_mdss_dptx1_usb_router_link_intf_clk",
> >                       .parent_hws = (const struct clk_hw*[]) {
> > -                             &disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
> > +                             &disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
> >                       },
> >                       .num_parents = 1,
> >                       .flags = CLK_SET_RATE_PARENT,
> >
>
> This one is NAK, I checked and on SM8550 the parent of disp_cc_mdss_dptx1_usb_router_link_intf_clk is really disp_cc_mdss_dptx0_link_div_clk_src
>
> I checked on the SM8650 side, and disp_cc_mdss_dptx1_link_div_clk_src is the parent of disp_cc_mdss_dptx1_usb_router_link_intf_clk,
> so it's different on both platforms.

Interesting. On sm8450 disp_cc_mdss_dptx1_usb_router_link_intf_clk is
also sourced from disp_cc_mdss_dptx0_link_div_clk_src (at least
judging from the driver file). I'll drop this chunk and update the
clock from the sm8650 branch.

-- 
With best wishes
Dmitry

