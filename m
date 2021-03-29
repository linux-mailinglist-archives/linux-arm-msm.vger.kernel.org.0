Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D30A34D987
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 23:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhC2V11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 17:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhC2V07 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 17:26:59 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7DBC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 14:26:59 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id q3so13891111qkq.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 14:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eJqU0/cPS+mS77TP8GxPDtDH/VWNgX42EbTcAAsXICw=;
        b=qP8DOoq1GMeM8kgtESYUEd271+22IEX+ZlHTqMa6oP7VS3bEv9Hgq++3jKqmPPtQJ1
         Utbw+Q3sjxhjy0GgAsBbi95s92Uhva9Cce+6kB6HyCB8/nbNd2ATQPJZzoYHKHRrda2S
         ZUjgIh3de4CgHsJdBsnHBr65Fw0AejiCl5opfd9hCUv5oa8wmcJTxtyontq55FU8HA9o
         /IrgKMQHxwuKZrIMlvkKuTgff6FH2cHnLDbIMCKuhu7M3VKlorb/9VQPQFzM/aL46+nH
         JmO7YhaGOFWWbpQ6TieLkiG2YBYblRvNZZQ4BHpDLxzTbv9AQLMJlV1V0bX+bRD7Wqjb
         TC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eJqU0/cPS+mS77TP8GxPDtDH/VWNgX42EbTcAAsXICw=;
        b=fF5UXYTuGI3VVb/WObfpFW9hyaO/vHTW+xwy/zVx2OcgFabKJP3WkcdZ46Vwd4OBB2
         VyHOgGZwcQAynMrGZw0AXs+kLCK3otrQ9EgFL8/3+Zbr7mmibeLkKTSaV50KqZrSXAhi
         qB4peyqgtMN0spRfO+07XvHp4dD51jnuKpCnvq8ccN9uMnf/wGtD9kiOVcAjTdTL/Mp9
         4mjOXuu+ubBktyw7IExuR9349o/YjFc61CmdmaROLZqN7NTPJAlYvUGzb0bxlqboSj7E
         vg95gDaxfGALSu45AEUGWbxgoVE4kvb5eFhBo12dYarHH2IDssNt81KIzcO/EnymHy6D
         g2YQ==
X-Gm-Message-State: AOAM53223IAvHcIMj/LQuhPMJgUrfTc2MlAqKdT97v+pidFnMe7Z1M0B
        R4Fo9I9CHxWgspK4RRLPf4lhpzIfLYE0Pd2Wq/HI5Q==
X-Google-Smtp-Source: ABdhPJyL2OR1UUBRUKPHyqDAfcfiobuWTxHYR/Q9O4t9Wp0wgNlNAm89T8wP8qqNa1Qsbg7i6/me9yvGYh2BMm74BZI=
X-Received: by 2002:a05:620a:1326:: with SMTP id p6mr28094554qkj.217.1617053217507;
 Mon, 29 Mar 2021 14:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org> <161704879057.3012082.16461217665128806379@swboyd.mtv.corp.google.com>
In-Reply-To: <161704879057.3012082.16461217665128806379@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 30 Mar 2021 00:26:46 +0300
Message-ID: <CAA8EJppDP3utsi_cAMPUOZU_Ma4McDVHn6gJZraKzRMGcgcjsw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: q6afe-clocks: fix reprobing of the driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 29 Mar 2021 at 23:13, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-03-27 02:28:57)
> > Q6afe-clocks driver can get reprobed. For example if the APR services
> > are restarted after the firmware crash. However currently Q6afe-clocks
> > driver will oops because hw.init will get cleared during first _probe
> > call. Rewrite the driver to fill the clock data at runtime rather than
> > using big static array of clocks.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Any fixes tag?

Missed that.
Fixes: 520a1c396d19 ("ASoC: q6afe-clocks: add q6afe clock controller")


-- 
With best wishes
Dmitry
