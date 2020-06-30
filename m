Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41DD4210080
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 01:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgF3XhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 19:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgF3XhN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 19:37:13 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FF5C03E979
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 16:37:12 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bj10so3906099plb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jwnTIUpl4Z9SyL/We0nzSfYkibBG9NQmHMNaAhO+Afk=;
        b=cqBxdZVU6FSIAzp/DtiImlkxrgSyPy1w3FKIfnkd/s5I9dFztiqgFCZ8tAsy5+/dpO
         uDHgeBQcraEKej9lo4pTg+TTInU4U/YW3E0lgnbyGpngZL3ppIkBOriyDzZCuFme0aAU
         SeO13MGZ5hZHyWRlKPOyeVO6FQgLKaWdIDpos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jwnTIUpl4Z9SyL/We0nzSfYkibBG9NQmHMNaAhO+Afk=;
        b=pJV4d0fO9TR+1mHVAFdSf8sKoajadK5FjFAd34azklDI81HU3uYZbIubVC8rA3SSmt
         U4pgLeRWpeorlhmv0tMkOONjJ/+AscQ6Zcq+7gU+jbL3ktHHMtoRyXxH15mJf58CeCzd
         xfnD1xJo87UMF9xMDqYhd9UORiElEulN7oaXB08/3Hg+3rxDzTaCIUJnf3I6IIOvh0Wa
         LOy7EldV2tn6G7fnkcMe/zJIZR8XtUH/oiZ5PDsheo+kQTjOHzDmyMVDkQyZar9P91rx
         RB4cWiyaINVVoxc/XRhgRRF0FH33yLf/cZd2gmp0zq8L3PYZhG8WIvGvzo7beIt1ox9C
         kVQw==
X-Gm-Message-State: AOAM532tEvSBZy6RzV/ERXsPbNgZE69kVTz9isj/bEkb0+6m7pIEKW06
        M59Y1VtqKT7WBT71wZbcRExoPg==
X-Google-Smtp-Source: ABdhPJzp8Ls73HghT2zU/dMp64VGxtzKH5Ohxr00uTutcC+tOxtk7rWO8haK1rt8tZpH++luCxrTxw==
X-Received: by 2002:a17:902:7241:: with SMTP id c1mr12128164pll.79.1593560232556;
        Tue, 30 Jun 2020 16:37:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id 144sm3738122pfb.31.2020.06.30.16.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 16:37:11 -0700 (PDT)
Date:   Tue, 30 Jun 2020 16:37:10 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: sc7180: Add OPP table for all qup devices
Message-ID: <20200630233710.GJ39073@google.com>
References: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
 <1593506712-24557-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593506712-24557-3-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 30, 2020 at 02:15:10PM +0530, Rajendra Nayak wrote:
> qup has a requirement to vote on the performance state of the CX domain
> in sc7180 devices. Add OPP tables for these and also add power-domains
> property for all qup instances for uart and spi.
> i2c does not support scaling and uses a fixed clock.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
