Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F253432CE93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 09:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235002AbhCDIfl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 03:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235975AbhCDIfV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 03:35:21 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26089C061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 00:34:41 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id g4so18474265pgj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 00:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cXzOr5VqG+rnasBiUZd59HK+G0nM0Guy74H/GlHyP1g=;
        b=sFgke0U0UHnUmiR8mylnIke8SooEK7XC5l3kBLbvfDHsCun8G5vVrhkxB8UuQL0wHy
         TLqdBl2Ex9u2Y3VZE571S8xEfxMLKGiIUrxlZ2QYlGHF6RKyTJfp1wJGKjYy+qjHQ3CS
         93cltc+ajJq2U9D/RKrWWfOtGIst+r2Yqrt9s+4j5dl7jI2l1L8bwZ10o8OzTjxcY9LD
         pCT5RmSAyGUCEk65tSDO9mfge3iMNIROkiKblmEQAttz9UI2APP+FHTRXUJAZkkORcMq
         z9q580VuSHokVWmFXxub1kX3DSMOfy89ZXiMx0DqP4oFHZSEszAUXqaiioCh7O7Swnmk
         g7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cXzOr5VqG+rnasBiUZd59HK+G0nM0Guy74H/GlHyP1g=;
        b=breFwXxR7fEA/Yt+Gbjeuf/UoiR3xwInaDTGw9U/1Xftr/ealEGdSK6lp0oTfcy5Tl
         EH9zExkZNq/PZWsN0c+QYcjLJh1McXq9Im8vQ9lRm2FcZDCbRXGJoacKrhWPr+DwZUuu
         neA8PVhf6IEVK745tn3HguuHaL2Xx8+Pkqr3nqIlK+Oa9Q/reHsEe+CnTI1gxUjW1PIK
         /OvWfa+n0bMz66G5WGgaGowNm3egoTwEFGwH23uug6C3tmxytAKlZb2xrNlD7X2Rf85H
         4g+FC7IXiqj5SmP7KUOd2LvLHcC3wiEjIo893TjfSoHSXyCsD4yQJyj3p4Gp6P8Me86c
         90ZA==
X-Gm-Message-State: AOAM531/LdoFG986aMpHxduamiA3Rj1+L1KqPDFiChrMjWHnUpi+qVao
        rhesLWYSOHxsng9/KSNMbS620Dj7UG/6J2jHV7Em8qLCRSgqbURZ
X-Google-Smtp-Source: ABdhPJwhvmrlKD8pgVXzFBFTr0MP9OaV3vaG4euZYV71BujM21czOEnZcoRceNXWTDDxUHc89tA4kYaYVGTyM82PijI=
X-Received: by 2002:a63:511:: with SMTP id 17mr2712356pgf.173.1614846880646;
 Thu, 04 Mar 2021 00:34:40 -0800 (PST)
MIME-Version: 1.0
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org> <1614208985-20851-3-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1614208985-20851-3-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 4 Mar 2021 09:42:19 +0100
Message-ID: <CAMZdPi_8sxhzNs0SVf7ap-nmufmB5UuPrtYWcP4PK6wmj0FgJA@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] bus: mhi: core: Download AMSS image from
 appropriate function
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Feb 2021 at 00:23, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> During full boot chain firmware download, the PM state worker
> downloads the AMSS image after a blocking wait for the SBL
> execution environment change when running in PBL transition
> itself. Improve this design by having the host download the AMSS
> image from the SBL transition of PM state worker thread when a
> DEV_ST_TRANSITION_SBL is queued instead of the blocking wait.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
