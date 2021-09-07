Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8307E402DEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 19:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344755AbhIGRtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 13:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345186AbhIGRtV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 13:49:21 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD57C061575
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 10:48:14 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id j16so8763288pfc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 10:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tlcos91zBbCY3ADL8GJyLeddK+6RZ2RnTWrnb/tvp3Y=;
        b=MmrTm2r+15KdX0nopH9HOAGBe57S4oTePNBCsfNwe0sDF/H/enavdbJxJVU2K+sHcS
         PRrQNI+nm1agMwzuX7G1gZ3EXvaHxWYtFR57/FJCfOvdzWgxdK3Iq3mQtjVhQvWeyRwS
         AwtpZPDHBVuRX7Z9aMkbFNkmYR0Xh86eitxeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tlcos91zBbCY3ADL8GJyLeddK+6RZ2RnTWrnb/tvp3Y=;
        b=FarZEl656BU2RTY7hpnSxFsjthwsMpDsq6bupApeg6t5cRbO49VAuYtkQLj9sSJrXC
         64o5TFII0dGnmNXpJ9VFqGZaOzscR2cXM/DYIq9PP5Ii0MePc40s8YpACcHGNHtPAara
         9W9yAi33KGrF4ts3W7OBTqEuDJRquRbqXTSSylx9CEzeuYF79zCnDLLTcjJcWjOUGKuC
         w8UGc0J8trYRYjq8kkFHBbbHjtA+NjA1Bg0Dyctb6AG0v9+291ItsMXz+wEJaojOXrge
         MryVhJHDg+GYo7r+4wTVEtethrpWSMfdTvreo4yYYubZhg9+NdlNIs/rEnt/MP2C4rLz
         Aa/Q==
X-Gm-Message-State: AOAM531YAUof9qRCwAWB7JBHQhpBDY1OEM2stw5v4V6lhvkg0Nx6/9bI
        WC9KQKDtfI0og1DKaKNaXxUH0Q==
X-Google-Smtp-Source: ABdhPJzGkWqHMr6e4hfqWzVna21dN/+KfF8K4n8syUGpq8dAo62kw4og++aEOJetEgk8zhAc4ijo3Q==
X-Received: by 2002:aa7:984b:0:b0:404:fd28:1aca with SMTP id n11-20020aa7984b000000b00404fd281acamr17509107pfq.34.1631036894326;
        Tue, 07 Sep 2021 10:48:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c6b2:7ae:474d:36f6])
        by smtp.gmail.com with UTF8SMTPSA id r15sm11812922pfh.45.2021.09.07.10.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 10:48:13 -0700 (PDT)
Date:   Tue, 7 Sep 2021 10:48:11 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        swboyd@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add pm8350c pmic support
Message-ID: <YTel2zNSxDbERwH6@google.com>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1630924867-4663-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 06, 2021 at 04:11:05PM +0530, satya priya wrote:
> Add pm8350c pmic pwm support.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
