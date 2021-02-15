Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E5E31B58A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 08:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhBOHOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 02:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhBOHOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 02:14:50 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E314AC061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Feb 2021 23:14:09 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id g3so4344561edb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Feb 2021 23:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CefDFEkybrGN+T0rEOjeJyX9h7vbSSt5IaSGMgW0+xo=;
        b=f5Wwm1hWE+mDtDxQ+nbbthGdlpMHLlmM1euLBrGWWdIrnY6G74c9RYVywxJr2uc7L9
         2OcvsjJTFjiaCavupGY0u7Xxth2iCWqM8wwcL5ZBwJqs13YTrvI838RuLaSQwJx835j6
         5rw3a6zi7+iwTD9ecpN3ybmaOPveo/rT47OvcdZLP1Olj5rWl86MJXi4EUGaMzcJ4z+f
         IAjRnpM6iJ7zPcgvyJTE1Qo59aFfH+5HL5mermNRKytDCa1dKLSn+tUMLlpNSMlq2SP4
         aU361Tbfw+Edd26882xCMXCBrwZim/ij6wlRgaxdDc+aR+KjmeDBi3J+wztm3KHt+zNN
         F/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CefDFEkybrGN+T0rEOjeJyX9h7vbSSt5IaSGMgW0+xo=;
        b=FUAE6XZVoagY1aSxKYmlTjio4TuBh1AIQBX3J1ZhF8uWvLQBM+o1Y8Y+8DIwOYn3Ua
         Y8cWTwuxQCZyeuZlQKzQIZu3fZNlgECYaA6MqF4A/h2QsbLck/fotPY7CKp3UiI3DRuh
         DisbrhdP1l6O055KqQ+9LU7XE+EnFTY4aFHoVcsW/eAeiL+zeRrsNDcj2ZwimW854GKN
         ebXnoBcg2m+L9IgF+QdYQ/XOm7zRAgUaJ8+nvcORboqvfUoAvRM4/Szj4tiPvNA1wfup
         W4NK+hXFzTrzAdr8OfE+FBKql/gXP5ci05dbZdrfCr7NuCwQ/4862LmvPxNY/4OT0xoQ
         O2cA==
X-Gm-Message-State: AOAM5319WL9HBvixkOJ/GjBd8ODBqw7Z997K6WbQ/cYsn6qmLnIc43rm
        V/XjpNFCqejnL5+JRdiL0I+DW8d8sDYC4Wg7ABb4YAffnz7XZPQZ
X-Google-Smtp-Source: ABdhPJzIsth1gsdugeCLLoJgTgiNWZTF2WcqLI2r3yh5TzjlOIcaBmKjSd9FcsEPjXKzYZuBgByPYVCc06Fc+mIiXtI=
X-Received: by 2002:aa7:c308:: with SMTP id l8mr6661209edq.366.1613373248473;
 Sun, 14 Feb 2021 23:14:08 -0800 (PST)
MIME-Version: 1.0
References: <1613176814-29171-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1613176814-29171-1-git-send-email-jhugo@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 15 Feb 2021 08:21:46 +0100
Message-ID: <CAMZdPi_xpDmGRWP7TObR-Sj45pAiUK9YXoSXQgEnfoL6YQy4Fw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: core: Use current ee in intvec handler for syserr
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 13 Feb 2021 at 01:41, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> The intvec handler stores the caches ee in a local variable for use in
> processing the intvec.  When determining if a syserr is a fatal error or
> not, the intvec handler is using the cached version, when it should be
> using the current ee read from the device.  Currently, the device could
> be in the PBL ee as the result of a fatal error, but the cached ee might
> be AMSS, which would cause the intvec handler to incorrectly signal a
> non-fatal syserr.
>
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

So in that function, 'ee' should be 'previous_ee', right?

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
