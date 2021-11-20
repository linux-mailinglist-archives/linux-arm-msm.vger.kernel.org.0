Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9B8458113
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237660AbhKTX7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:59:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237701AbhKTX6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:58:53 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9C9C06173E
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:49 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso22795273otj.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=quWsWsCmfs9I828zomcAShzBMs2fGVBbOu9rTewbWcc=;
        b=x6AAB5P7hfsn2DZr/LsR/YbEfAsLj/Yq4XOc9cTijrFVNsgqmTKHIyFRFsW6Dl7SQd
         LEfC6yvD5uyFriFoysIE9zGHyV7Kk/AdZzOLdWGAiX9LT44c+rzjtuOELgjS0UziEhsc
         Fl11Z0NWESI4nuF4K2cePhig2v8R0JEhWmg1aqLUNFafev2lc7WxjNQhm6T8Bmn4Cid8
         dNIvksBqGT3G8lZD48gXmOzVW1tqmoDybyeb79qnan3oMiv6V3p9o0wVYODL7xOhUxJA
         GBkec7Kr4sbM4tKlD03ZkrvDrxEMZtB5W9af60veAzNmSsKVc2ZCTnOoBPiZhdGWipAN
         kB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=quWsWsCmfs9I828zomcAShzBMs2fGVBbOu9rTewbWcc=;
        b=udxOJZw8qQQpTivWLDi5Xub0ZvrMS5yC2dNsEvB0oEa6X7DV5wqD/xYpz91M6Akpbd
         xMO6lZrav+y9ifnk//Kw/VIxZUvfnlXXQUZ6asfvTU/NBuEvxiAvGxlV4y3FtuzYRmW0
         Jtw9Q3jd2nGYupTcQmqtVJd7ifYh9iW4E4/dsHdZBHE4bAjedPfxRnLYyYUq7T0QFwGn
         k/lWLlXVVqTqocbpRbZfVjzGhYNA6GAdHjurIbO4y5YuzczGUGKqP/0tjKbXWRKLRTGE
         +ZQ47bNg+OfY2LKctzG6dzU7CVVBAAHidAnb8jjtqdo27YAsLOm6SYz4oIyIQfOUVD6w
         UTVQ==
X-Gm-Message-State: AOAM533CF2U4DrhEaOuYnIy1SnOKGeytIvt3ZxwzSnMiPAZYViwLHAz4
        eZR72IqN7hViwaoCotIsYc4/hQ==
X-Google-Smtp-Source: ABdhPJwMoR41Jm/OVNuKr0os1YIx37w1/prSSbyV68vzGzDedWG3tddlRlicuQgOJFI+roKwoqkfBw==
X-Received: by 2002:a05:6830:104f:: with SMTP id b15mr14729809otp.215.1637452548901;
        Sat, 20 Nov 2021 15:55:48 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:48 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, dianders@chromium.org,
        Andy Gross <agross@kernel.org>, swboyd@chromium.org
Subject: Re: [PATCH v3 1/4] arm64: dts: sc7180: Include gpio.h in edp bridge dts
Date:   Sat, 20 Nov 2021 17:55:25 -0600
Message-Id: <163745250541.1078332.16492229519220111625.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211029152647.v3.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
References: <20211029152647.v3.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Oct 2021 15:27:40 -0700, Philip Chen wrote:
> The edp bridge dts fragment files use the macros defined in
> 'dt-bindings/gpio/gpio.h'.
> 
> To help us more flexibly order the #include lines of dts files in a
> board-revision-specific dts file, let's include the gpio header in the
> bridge dts fragment files themselves.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: sc7180: Include gpio.h in edp bridge dts
      commit: 963070f762137cff817d33c102309ab0a345eb32
[2/4] arm64: dts: sc7180: Specify "data-lanes" for DSI host output
      commit: 0417a86b200b4da1dff73e9f4bd7743346e5565b
[3/4] arm64: dts: sc7180: Support Lazor/Limozeen rev9
      commit: 7624b41b3379e664f074137001fc2e44bc1f5eaf
[4/4] arm64: dts: sc7180: Support Homestar rev4
      commit: 3922ccaed4ac9dab5087fc5f20d319cc55765afa

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
