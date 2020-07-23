Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5338122A3E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 02:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733270AbgGWAu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 20:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729401AbgGWAu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 20:50:26 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9888BC0619E1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 17:50:26 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a23so2131050pfk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 17:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=79nT7TCbavlKTvAjlFmsWU03rk/qHwKF6zh8YUZSTdQ=;
        b=YGcbcvjoJjGEJsEwK341b8LPPW7cY21tCnUUKGLZdYMzOpv1ClesbiLphb7xZEIZS6
         vw5zovR/9Q/GbHbAg8bdOPaF+YsjC4p4UCxlugGH/DR6WIBtE9r5Ek9ZuqnL5pMkhuyC
         OGvlX+dW1ci8SrYuWRKyzsfVBEwt7BMr/51Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=79nT7TCbavlKTvAjlFmsWU03rk/qHwKF6zh8YUZSTdQ=;
        b=fExl02C0TWkbyC5HNSJZOX9CCHbsCA8NBrb9Vw7AR4d78C6qWByExkoCbBFDpTOhEk
         g+bXG1/F6beL/hjS/8gVoYo6X3cLgQ9/N1vlHxf3vMYMNQxu4tt+r/qKSrN9rTTstPNP
         vNssVJyw22rlSOKGLaoh+Fc7lBVP2stxMYmr0XjBJpJ6XK36u3Eph0nAjm990MYWQiM+
         mMKNnBXCeBqj0iMb7JJfYHJL19aVZwS3E4JXwi2GuRgtji/gQuAMekD6NvBXM/vToQn9
         jISX7I8tRYYZgUlB6/jWKpQrbe1Hh24DN1m62kWykDl9b+MzEcDQ+IAoflaqRB1p3R/M
         591g==
X-Gm-Message-State: AOAM531x2QobThsaju0B4orSZ7vCGC3J3kSgE0POoDCW0phgh2N/pEa7
        HoiJUbQ3uXat5Znwlq0O3WjIHXcful4=
X-Google-Smtp-Source: ABdhPJxw9gftHTfZNdHBmj/aQ6rhgFvRetcUhJQU0A9vN+tOj4m1E+bJ8Ea3rQPb2K6hftFAYQmGLg==
X-Received: by 2002:a65:448c:: with SMTP id l12mr2045251pgq.234.1595465426001;
        Wed, 22 Jul 2020 17:50:26 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id m9sm815681pjs.18.2020.07.22.17.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 17:50:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200722150113.1.Ia50ab5cb8a6d3a73d302e6bdc25542d48ffd27f4@changeid>
References: <20200722150113.1.Ia50ab5cb8a6d3a73d302e6bdc25542d48ffd27f4@changeid>
Subject: Re: [PATCH] soc: qcom-geni-se: Don't use relaxed writes when writing commands
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Wolfram Sang <wsa@the-dreams.de>, msavaliy@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Wed, 22 Jul 2020 17:50:24 -0700
Message-ID: <159546542444.3847286.3076597427214316886@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-07-22 15:01:20)
> Writing the command is the final step in kicking off a transfer.
> Let's use writel() to ensure that any other memory accesses are done
> before the command kicks off.  It's expected that this is mostly
> relevant if we're in DMA mode but since it doesn't appear to regress
> performance in a measurable way [1] even in PIO mode and it's easier
> to reason about then let's just always use it.
>=20
> NOTE: this patch came about due to code inspection.  No actual
> problems were observed that this patch fixes.
>=20
> [1] Tested by timing "flashrom -p ec" on a Chromebook which stresses
> GENI SPI a lot.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
