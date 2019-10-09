Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B687CD1265
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 17:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731661AbfJIP0Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 11:26:16 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43391 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbfJIP0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 11:26:15 -0400
Received: by mail-lf1-f65.google.com with SMTP id u3so1978438lfl.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wOcaopzXOXD+usHp96MLejtldLwmcKRCmKe5gubp3hM=;
        b=iKWeJdmGRHccgf9FoMbmzUbBRxoUHujF6DrYvq+P3h8z3/GprEMW5NrvUjL0ldy49E
         5QO1X2+wfCkASte84vp+wlGB00QffleBOZHr5Vylz1e/euzezmmJhMQSGN2L25t50xla
         PkmWcucmGn2OMDcU9YwHCf4Q5ArXbKCXWL2Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wOcaopzXOXD+usHp96MLejtldLwmcKRCmKe5gubp3hM=;
        b=Mmjc3JHRRBydPR/WjQvCjMLPFKU8m0y4jXl6YXA63QvXbmu7Pse9mf5BNRUWbdyEGh
         K81y6U/AOWPEK5HdbPBC0xV4CQPgjbtPrXFLrOsl+M90y+nx+CfXQ1KTrqY2LyvIFZeg
         eqrgVbbe0sW+XEDSRhFmWYTXP4/34VBzAi03mNQtP7c9d1u+48z3zw0GEw61Mb/L1OuH
         mMVPz+pGbFTuuschrIlvMmu89G9YG7gI6O4W6jJUkCpXffgPXeJOejwF8y/5PO1Kmv5a
         7w6PQiwXeJi8MiW3PLKiVJwu7i8TgvjGyxhJhL3tE1rcupgy8Ff8AUaMhY/s8VhhmLQs
         jw4g==
X-Gm-Message-State: APjAAAX2aYssp6485WGkYZeu546WRWbl4lrXQjiW84sOlEbFoFiOafP2
        czv4lPnn7xd80wBJjJWaAvwnfkcomq0=
X-Google-Smtp-Source: APXvYqz/FpkLQyvWxfWFtl7rBa70IrKCV0itEFFDHMHamv6+fJSvQipef47tp6YTwLLcQiBvK0s+Ow==
X-Received: by 2002:ac2:5209:: with SMTP id a9mr2553567lfl.48.1570634772300;
        Wed, 09 Oct 2019 08:26:12 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id l3sm540307lfc.31.2019.10.09.08.26.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 08:26:11 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id y3so2928571ljj.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 08:26:11 -0700 (PDT)
X-Received: by 2002:a2e:9ec2:: with SMTP id h2mr2389130ljk.85.1570634770860;
 Wed, 09 Oct 2019 08:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191008234505.222991-1-swboyd@chromium.org> <20191008234505.222991-2-swboyd@chromium.org>
In-Reply-To: <20191008234505.222991-2-swboyd@chromium.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 9 Oct 2019 08:25:32 -0700
X-Gmail-Original-Message-ID: <CAE=gft76a_UFaSjca-1nR0Pf5TUU1FqWaEjzRyRhn_SkFmLsTA@mail.gmail.com>
Message-ID: <CAE=gft76a_UFaSjca-1nR0Pf5TUU1FqWaEjzRyRhn_SkFmLsTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: llcc: Name regmaps to avoid collisions
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 8, 2019 at 4:45 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We'll end up with debugfs collisions if we don't give names to the
> regmaps created by this driver. Change the name of the config before
> registering it so we don't collide in debugfs.
>
> Fixes: 7f9c136216c7 ("soc: qcom: Add broadcast base for Last Level Cache Controller (LLCC)")
> Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> Cc: Evan Green <evgreen@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
