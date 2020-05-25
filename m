Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F60F1E0988
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 11:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389080AbgEYJC1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 05:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388680AbgEYJC0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 05:02:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A89CC05BD43
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 02:02:26 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w10so19982762ljo.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2hg/OH74DORU9tQYyoK6Bqm4fFp4PsuIpQ1XLjl+5O0=;
        b=nJgmdmXKEcK518FOp+NQL3H6U+rX+6T2vs7v/hbMr9J7mT+2oqY5KESoJrLLAjOUG9
         uZQP1RTQZ59BZRCli+A8sOYo+oCK7EjHGwWIJD7hMZeI49fs0lVC7oMvLSsrEaCdeYd7
         D9ftD2zAvSNkl8FFKRMqVMuY2uWNqV+eUM+Ubhy8lyZ4Oan76ifF3HzMV80DsH0eWWwe
         z/RYZU/PENhp4FyyFK+yA0dUh5joa/UuWAWxgcBchUTn1H5kvYWb/pD1B55BLWpj9Rb9
         Q12oVhjQlXXxI49ZU5keD+FfG/wX4BZr6dj+DxxLXS2e8op5jpfTGZw4yAuPM+OtzzYX
         mPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2hg/OH74DORU9tQYyoK6Bqm4fFp4PsuIpQ1XLjl+5O0=;
        b=V2tAg86uvOqCjlNEN2UFKhtPaOZQMUbz75QaZN/UKM2NMGJ9Nw/Uh2JhLzSMhBzSEN
         ggdd3y9kkdTBMbNo+s3q7HC4AqcP1p/k3yH74yjB2eJ2eiQUPwTruOBouaB7H5BbjO3a
         z789PYyqsYR3GAYgsY1qmnmOvNRFaUCJTIHMpv8WDWzi8iqA3nTQ3j58KWNPsMHV/5d3
         1sChJRt/JaSyOOMSFdoFwOOi7n2oSRMIS8U1UBbaasnNTGqdJ/7Ts0e3EkCeum6oV447
         aS2f8VqIZ22K69dQEOZUhTFz3yaIB2mnxHVEtiQzYX0EaoIQG6Lx4rwZj/ExG+flSuzv
         f+EA==
X-Gm-Message-State: AOAM5337CicNIzTjyVzEHNdfJ0opWoOLzeRbZ0hH27qc4aMRRR21lKxS
        1nsyCRHqf91QogEbdZzzHRA2Op8PxeJnIGex763D8A==
X-Google-Smtp-Source: ABdhPJwWFwfymHIMrEwH+BYN7cjY1SJ5pJ5xBRDS9aLWhYF4MaLelR7tHM5Ct+bMfDm+2aOeyWd13ahqyngusi6HRaY=
X-Received: by 2002:a2e:9716:: with SMTP id r22mr13965648lji.293.1590397344884;
 Mon, 25 May 2020 02:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <1589817025-21886-1-git-send-email-groverm@codeaurora.org> <20200519013813.GU2165@builder.lan>
In-Reply-To: <20200519013813.GU2165@builder.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:02:14 +0200
Message-ID: <CACRpkdbSsVcy=6Bo42SnPqgKoa+jNanmBEXix_yv6aNK8VcreQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: msm: Add check for pinctrl group is valid
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mayank Grover <groverm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 3:39 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> @Linus, we started off with something similar for GPIOs and ended up
> with the logic in the core code. Should we somehow try to do the same
> for pinctrl?

msm_pingroup_is_valid() looks very reusable but I'm afraid I do not
understand the implicit assumptions around it, but I guess yes,
if it can be properly documented etc.

Yours,
Linus Walleij
