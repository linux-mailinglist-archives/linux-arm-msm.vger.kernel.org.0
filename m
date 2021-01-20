Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1821F2FD796
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 18:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbhATR4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 12:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390729AbhATR4b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 12:56:31 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BD2C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 09:55:50 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id d15so11452158qtw.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 09:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H362xI0GtWa0hOIoSQ+pekpVy6ezMEffCM7UWNAOymc=;
        b=veCH8tNEKxgqYEzpRP8IcBFLfAMCml/hf44I9sYxqhnjOr10ZOvNISY7A4IJZsawvV
         HCiGOVH7W4/slNrK9mSPMBLcbjWs0yms/XICtsTlYdco9/qMS/xjAeTirOzLycM98iI9
         TBFSqPw2DOSeal6gVNnc01qD1b3MsVPVPrt8NwsU6qV3qr0NT2QQMFTsnO9aeU61kfhn
         Bb77vE/Z9/wQcZzI6/eMit/LVrAx72FIydTRTqcUfkM7Fz+2TAhm2sB/MqsY7OKvVKjp
         WcLwj2cRGgh7/bWbDH6P/Sa7qeY1EOordXmuJcxCTbR09DQKgFG47JO7JyMerl8Hj24v
         Ksxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H362xI0GtWa0hOIoSQ+pekpVy6ezMEffCM7UWNAOymc=;
        b=di8rl/iK+5dY06R5mk/CPb5Jtv/i3zSN7Mth0BIY0/ImP+tsRqxJIcIGJlzABb8K5R
         JYZDGQD+LTD8/Z1SwC4Qspg3iYL0rsTK0HHqfQ+oRjdEpmuvhAIDNLZFFZLdMfly23zS
         vyUUkcJD4+b1EYq01f5qMCFRB4SUozpG6YwmydXNfrioD5uhDrOrcR0n54/bv7ndDXnt
         tbD93D04cX1E3TNwUR7ZC9++FmKENYrRafqTw0u0TE6AWNB/AFIpYhjgvRiUcqOruWGA
         4uo0zC7I8tGO6GEPzG5YuF9uuyNdzhIc50LKygMKNxn8yyVIXWyNYR3tuS0K3BYDKJJ/
         TPjQ==
X-Gm-Message-State: AOAM532udOP/KaoF/SUZZEtxboJfFy3G/shlt3ihka3URlaNpO9bHdnb
        Yy5rFinKDj1o3QzzUtO5J8Uy6v0eQ7gGc1oJU3cfzg==
X-Google-Smtp-Source: ABdhPJyom6O/x/vLdy+hF+kS63EhbC6UqvXwgbwn32Nmb+M6GlijwFxjc32b1qOPGGxqZxd8k9NXhzZfiTIKcBYsx5A=
X-Received: by 2002:a05:622a:14e:: with SMTP id v14mr10088141qtw.298.1611165349302;
 Wed, 20 Jan 2021 09:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20210118113651.71955-1-colin.king@canonical.com> <YAf+o85Z9lgkq3Nw@mwanda>
In-Reply-To: <YAf+o85Z9lgkq3Nw@mwanda>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 20 Jan 2021 20:55:38 +0300
Message-ID: <CAA8EJprP4xm=15Ss540uf0VW1-oXA0Sjr6pmTv_deXvjOqL4tg@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 Jan 2021 at 12:58, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These need to be < ARRAY_SIZE() instead of <= ARRAY_SIZE() to prevent
> accessing one element beyond the end of the array.
>
> Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
