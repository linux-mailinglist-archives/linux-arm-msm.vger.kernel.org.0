Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA39C2FD5BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 17:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729298AbhATQb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 11:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391183AbhATQ04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 11:26:56 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A4FC0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 08:26:10 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id k47so8049493uad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 08:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VA3sevNOG9LLzIdGtexh/+cDQStXz1NVLJUbTaa/OpI=;
        b=XqHtcC1Cu+MW2ZiMfGVlGOQfR0LPyWWzi5zKLqS01utd6G69mhKg9C0CV4ZI0McEbv
         CSg7aZXht+OcOyeAmNPQMaBsN2VzhaPNVYuP5qT4pckI9GKBN60qMdtolLmElgTe5Xol
         633w5+Z4SJCMYCOPmES8Zy3+SQdgwmdr/qrXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VA3sevNOG9LLzIdGtexh/+cDQStXz1NVLJUbTaa/OpI=;
        b=C2dM72bqcVQioSjbsOhoH71P7Wqthy01Xp7R3WSDxGtfoXOcRXJDQl7LjBrmfcD6iv
         wtWkQcBOubip1Fupfr9LhdXOb6EmjFliujhcGCVLGEmM+DI7VkEjT+M6/m6egJKrv+s2
         cZChMpKS/H00hmXmAqH5I5hGWZchAdnEWaQGvZCb2enYTKLmu4pqp78tuTnkk1zZhz0H
         nGsOrSRhnhmwGqOkyZksXX1u5BeSlqLpIdjgx3wCeZ+2Ip1RxQzO6kZX2/hfNhHVYkai
         o9Ey7TC8JiTsAZoPJCLj7Ys3sUtn9Aj7rjiLoGvuoheAB/yb6icwHsjP8pe0tzA3bbnp
         hdEQ==
X-Gm-Message-State: AOAM532LaSoHkrWjbHZzdraUdZFN2pon8umqdk/JgWv4BcAjxZHlmijB
        GylDIayjhadrc9rS9bUr2vz8saf4BIDKNQ==
X-Google-Smtp-Source: ABdhPJxe++p/D9AK6fhhr06aXOpmJ11QpUrDMiLff3KsaEHU40W3YomYdec1PxwacSO84o/Eoy3+Ww==
X-Received: by 2002:ab0:6dc7:: with SMTP id r7mr3417775uaf.115.1611159968992;
        Wed, 20 Jan 2021 08:26:08 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id q197sm347698vkq.53.2021.01.20.08.26.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 08:26:08 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id k47so8049457uad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 08:26:07 -0800 (PST)
X-Received: by 2002:ab0:6454:: with SMTP id j20mr6909033uap.0.1611159967277;
 Wed, 20 Jan 2021 08:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20210118113651.71955-1-colin.king@canonical.com> <YAf+o85Z9lgkq3Nw@mwanda>
In-Reply-To: <YAf+o85Z9lgkq3Nw@mwanda>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 20 Jan 2021 08:25:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XMxHCs5bvjPGjENL2Sty=AD6CS3jYnESDG+qKJdiMU+Q@mail.gmail.com>
Message-ID: <CAD=FV=XMxHCs5bvjPGjENL2Sty=AD6CS3jYnESDG+qKJdiMU+Q@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Fix an off by one in qcom_show_pmic_model()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jan 20, 2021 at 1:58 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These need to be < ARRAY_SIZE() instead of <= ARRAY_SIZE() to prevent
> accessing one element beyond the end of the array.
>
> Fixes: e9247e2ce577 ("soc: qcom: socinfo: fix printing of pmic_model")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/qcom/socinfo.c | 2 +-
>  1 file changed, 1 insertions(+), 1 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
