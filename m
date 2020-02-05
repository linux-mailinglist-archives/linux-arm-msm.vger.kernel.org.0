Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF1091539AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 21:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgBEUlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 15:41:44 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38110 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbgBEUlo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 15:41:44 -0500
Received: by mail-ot1-f65.google.com with SMTP id z9so3309227oth.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 12:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C80FvtF14u18Q5GuI4vN3cPxQNFCTPS0fGip7F+rzSA=;
        b=tUzYU7xPl+51dvzEMgLEd/cCMubfaL8ywjSse0rY7RFkACLPYA4FOyxZvncSztxGfm
         jFsPLMfKId7jpqzuZVxT2EFmuMLwh+x8Uzd2b6p6oOpYZTrPVrxfRUoUs9SiWeil9MEl
         yg3G0cSD2guGQ453ii26L+O3hPobLCKda6c5k48Srl5Yl0CLV7URwPTuaaKYCo+W82Uw
         zYcfpRpIMGhr7SSz87faIU23uuVkeMhwdM06oNRgj2Hb9/VE/+uxfuAdOGmHUe/euw8X
         cH3J+NDend/xp57RcU74XjqeczV2W7ypldS6fRitxcboaDc5T8+C/X2ZQRo1+uH4ScSX
         IPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C80FvtF14u18Q5GuI4vN3cPxQNFCTPS0fGip7F+rzSA=;
        b=qrl0ptvAWTNr98lLeEr2vEkDL9AQlYWPoSsKO4jlVDX/i7fsLnl74BP6fDGazgCRUj
         E/fGX2xssNmXyCRbnirpK0AxXfp76n5NvX44c2AUkz6tZxgeFRcrKiZBnSd7OoQtRaIt
         I004CuLtL+tiFJqFruID++n4S5U7Dc08FKQkdtxC2Ua4EqWP7XSl2Eh3FlNCo5R+VhBw
         4U+BgSuKfbZfqY93hC1z/K4v4rQit7x2iATJWbUhIY6mXQqf1Y25Ett5l8ag2pLdPXMX
         8LkmZ8Ij7ggQT/MdfwMejnpVIUCE219kou/dBwSW5L2TouvwRXPX5eGTV1wB5QT7z/rZ
         NyQQ==
X-Gm-Message-State: APjAAAV0R26GzItUR0HMmNFfmw+B+iXkGjN9l5zKNv8tiCCvt+O4Bqff
        BgDg1DhRNNqPBZzMvCo+5UzOmtcESwpETp4U0XW1XA==
X-Google-Smtp-Source: APXvYqy9KjEBmSX5NkhLfBxg20I2V+XHYQ3xYGJSq4SDwQ1CyKJCQ+J9WrP3E0MhyV/DgPruw7w2Y2qCsPlY5jZD2/4=
X-Received: by 2002:a9d:7493:: with SMTP id t19mr14867146otk.332.1580935303244;
 Wed, 05 Feb 2020 12:41:43 -0800 (PST)
MIME-Version: 1.0
References: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 5 Feb 2020 12:41:32 -0800
Message-ID: <CALAqxLX73PWJUFB1g2_nkdanGvCXJJDznwMUwjN2x5AiAJ=Ppg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Remove unneeded GBIF unhalt
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 4, 2020 at 9:42 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") added a
> universal GBIF un-halt into a6xx_start(). This can cause problems for
> a630 targets which do not use GBIF and might have access protection
> enabled on the region now occupied by the GBIF registers.
>
> But it turns out that we didn't need to unhalt the GBIF in this path
> since the stop function already takes care of that after executing a flush
> but before turning off the headswitch. We should be confident that the
> GBIF is open for business when we restart the hardware.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Sorry, yesterday got busy with other things and I didn't get around to
testing your patch, but I have tested earlier with my own patch which
is identical:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/db845c-mainline-WIP&id=4e6a2e84dd77fe74faa1a6b797eb0ee7bf11ffd7

So, I think I can safely add:
Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much for the quick turnaround on this!
-john
