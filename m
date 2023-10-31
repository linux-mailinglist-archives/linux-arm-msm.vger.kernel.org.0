Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6FBE7DCDD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Oct 2023 14:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344537AbjJaN2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Oct 2023 09:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344492AbjJaN2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Oct 2023 09:28:36 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E570EDE
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Oct 2023 06:28:33 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so5106988276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Oct 2023 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698758913; x=1699363713; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vkk8ZCgsYoi/AnkxKAKmjXFYbNerVSNaR8gjvx3gGLI=;
        b=mfmxvAkaWTHVReVhcai2HV2+N0NXUBbWKEkOdfemm2zd9OzoCjI4SWdtyJMwU/2uHj
         Muaq+krn3KIqakqLwbn063r01//nX0amTdx5EIgstFQC/U78PWVl58hr+f8ESbKu1TVN
         jtZBKLKB0Z5lATDdyzi0WY3/rncI2fsvuPZIXdxNed5T1Qf6wglOkYPUk+gvH09VM8Ic
         fbiO+an1IYy4DSrTL6GH1AeieZi4y2uamtGd344N1B53K3Am2LzV9NgIT0QJOMvLIWhR
         nl9ZOMEIuDD2gj06dYiZ4MesNhb5BRalouqFP2p6TnPHfDzs2zwA8c0Wo5l/p8TbElau
         xthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698758913; x=1699363713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vkk8ZCgsYoi/AnkxKAKmjXFYbNerVSNaR8gjvx3gGLI=;
        b=hj3FnChyVaZZcvRjK/wdM8L1FH+WIh1RDSzafCgcmNtCXTeWmUIMlzDPrtsj63Gus3
         cE9Jwr4O3bRIpZEgHBVoZyl4lsAiCsBXcps5E5FqAzpst/WwI/CRPFKIJ4bMY81MCHyB
         YkJzxFwQOP6uaChJWB13Qez7QJqxg9fklEE0BUfFVe4ZaFmiWKnZ3timwJUEFhzAjYex
         1FfuD+Cj5yk+mRYNtsSvk7fwywO0SsIxBAU/rFnu+x8osheFc9ptOllzPiGH6OJA+XaJ
         3b+obIR267WSg8bSfvCiGYKjZONFt4EfbhXyKCECcrcff5KZZqfwcTbJAzKood9lGuRM
         p/DA==
X-Gm-Message-State: AOJu0YxIBKF7+5mb6yEqZ50kO+50s3zqEkgp+4eXsqcgXqFKHLez8kXs
        TWcXxV7V9h6UvgdVKwFpXJlUCJLZ10ITlKKwg9Jeaw==
X-Google-Smtp-Source: AGHT+IFxGRQfCveVDXVJVYYAtbgwY6/eAygWWpBIQ5S0HJJ6v7iBgo2Jge7ptyq+gUT1DXQGHLc/CMOxuUr+u443Pmg=
X-Received: by 2002:a25:c541:0:b0:d9a:5ff4:cfde with SMTP id
 v62-20020a25c541000000b00d9a5ff4cfdemr11842307ybe.13.1698758913054; Tue, 31
 Oct 2023 06:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-8-dmitry.baryshkov@linaro.org> <ca3a0d84-befc-4426-8cdb-ea9d55e7fac9@linaro.org>
In-Reply-To: <ca3a0d84-befc-4426-8cdb-ea9d55e7fac9@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 31 Oct 2023 15:28:21 +0200
Message-ID: <CAA8EJpqbMT3+53NndkjvJ67KvURYsbwD6yfT4v6KowsiYdOR8g@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] phy: qualcomm: add MSM8x60 HDMI PHY support
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 31 Oct 2023 at 13:17, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 28.09.2023 13:16, Dmitry Baryshkov wrote:
> > Add support for HDMI PHY on Qualcomm MSM8x60 / APQ8060 platforms.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Do you have the PLL working locally? Would it make sense to ship them both?

I do not have APQ8060 / MSM8x60 platforms, so I can either c&p the
existing code or I can drop it completely.

If anybody is willing to donate and/or lend APQ8060 or
MSM8260/MSM8660, we can probably fix that.
Requirements:
 - HDMI output
 - UART available
 - fastboot or network support in the bootloader

-- 
With best wishes
Dmitry
