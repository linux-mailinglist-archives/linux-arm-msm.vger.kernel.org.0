Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99B4241EFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 19:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgHKRNA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 13:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbgHKRMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 13:12:53 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6F3C061788
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 10:12:53 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d188so7970030pfd.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 10:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EsxvtyjzAtXg5sUDRqzZVjThz8mBMWSIwRhZo+xufo4=;
        b=Qiivl9DPtHJleh/lzS440/NKVhFXk3Yy1tWl92a2XnuJBOWGpKkpkGQl+QJmRmUPp0
         sDzsmRLVz2R37jURWM0y4P3pazpzreDvZkb2OLaFUJlIpyR1cLyi7GqnTtnXBM0bio0o
         bcboHwDwhb+GNzKUDQCnK2Y9fT3vbSkutIvV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EsxvtyjzAtXg5sUDRqzZVjThz8mBMWSIwRhZo+xufo4=;
        b=FcAe1h6IuPihFjtkQBVKCp/IUprxF4voKfk/kGudOK5+wt+H3jlfhmUlYTqGAplqXw
         CKAEP2tK7qnVBkLMhLlJTQgZ9nQECkYZgAoCV6wvVAOpeLHsS2ClXTP6OehlmX0osTZ1
         qE+6x5xgXqBvn7fR+c2dLv5sNr+3V+q37bt91T3autcwTaar/tLc+FFhjD5IgPg3HwHH
         yVBb3Gui20X8wyWaSdtxe4baZCPejm92xsoZ9GDFJ5lpWqBIGzBmIjJkyEkrpDrSQ26B
         KEmNkKt3DKlry/0GUkIRahlBlgEwKhWF+NboM8dtT87APIjhL7m12wVQx357Up4Y4clk
         +wJA==
X-Gm-Message-State: AOAM531WavBxXwZM19WVJ5+eaLYxSpWi6Qr9bq1YeC8ElFi7bNh0OhQd
        ouahjvAyV3TVPxIna3NPQzok9A==
X-Google-Smtp-Source: ABdhPJwCvHLKBQO7DAmqBUXQnYRCHWLQK/g0UXohIgdSsjGgJ0tacFUZGTDws11zC3WzqMh1Mwhn1Q==
X-Received: by 2002:a63:ea41:: with SMTP id l1mr1644202pgk.419.1597165970845;
        Tue, 11 Aug 2020 10:12:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id mp1sm3589375pjb.27.2020.08.11.10.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 10:12:50 -0700 (PDT)
Date:   Tue, 11 Aug 2020 10:12:49 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        viresh.kumar@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] opp: Fix dev_pm_opp_set_rate() to not return early
Message-ID: <20200811171249.GL3191083@google.com>
References: <1597043179-17903-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1597043179-17903-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 10, 2020 at 12:36:19PM +0530, Rajendra Nayak wrote:
> dev_pm_opp_set_rate() can now be called with freq = 0 inorder
> to either drop performance or bandwidth votes or to disable
> regulators on platforms which support them.
> In such cases, a subsequent call to dev_pm_opp_set_rate() with
> the same frequency ends up returning early because 'old_freq == freq'
> Instead make it fall through and put back the dropped performance
> and bandwidth votes and/or enable back the regulators.
> 
> Fixes: cd7ea582 ("opp: Make dev_pm_opp_set_rate() handle freq = 0 to drop performance votes")
> Reported-by: Sajida Bhanu <sbhanu@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Tested-by: Matthias Kaehlcke <mka@chromium.org>

Originally-reported-by: Matthias Kaehlcke <mka@chromium.org>
  https://patchwork.kernel.org/patch/11675369/#23514895 :P
