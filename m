Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD56521C06C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgGJXDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbgGJXCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:02:55 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258C0C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:55 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id o22so3233612pjw.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/bGZQukgdvxpeO9P4CSAAgyZ7LH76RJIkGY9IX/WOgs=;
        b=BcS8K872KzDafnCAvS8hTMh2QRHiwdT9K3jScaFOUPgJFjZ13VQBHt7Y2Uk6bycC3s
         gFubY3kH6dpBie7TZ00tvqwBf2YvJK8IXh9opftUX+2Lcxu5HoLJMLtS5LHH1U4GHzV8
         WUOgdIZLvuu9ghtGat46xqbYhTXSeOVqFMp/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/bGZQukgdvxpeO9P4CSAAgyZ7LH76RJIkGY9IX/WOgs=;
        b=j0F37Sk1HVksWDIMpaQBwH0K+PB0l8RttxrcqDqranQq/xwPiVCHhs9xnBG2Y4j9ZF
         qFtbRpC0STc1c4B/DCy6AjWRkfwPpwL6u91nVdFpENPZOfaZSId1GPW5C6yrxZDygNyb
         5vTmMLb4YC6uS1Yhd81Ly2/wnD7vG5B9p/1QI561ingbED2UeY/gxjLCySQX5T30HzZz
         A+iEaDYiRWk/pnmVWrMLtaF8jZcp20d2kDTB6J+WHdx/j6lrxTkdo/IIfhdc6cX5Cdfh
         mFPzf0KLluwcUFKBnFbWkzLGD7m1JbTyWMiyajb7xNJTGiorHW6d/2urA7tZ6ueS6SP1
         wXFw==
X-Gm-Message-State: AOAM532IxlpVBfCla5FbjDdYFjN24H6lTpY5ehr9HnO5mlwzyMi5aJbY
        kShHxzL79zY+ude8kolc5AwoIw==
X-Google-Smtp-Source: ABdhPJzVWK4kKHNQXZpw08rHhXfVuWKYJIflqz8a/l8lIEhQwXnMNLvfwBAieMzQP16Ze01ezXBUxQ==
X-Received: by 2002:a17:90a:2681:: with SMTP id m1mr7431338pje.204.1594422174680;
        Fri, 10 Jul 2020 16:02:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:02:54 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: qcom: msm8996: Add "simple-bus" to our mdss node
Date:   Fri, 10 Jul 2020 16:02:23 -0700
Message-Id: <20200710160131.8.I7a02e4b37149190227bc03fd1027c8241d8d4f4a@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710230224.2265647-1-dianders@chromium.org>
References: <20200710230224.2265647-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As described in the bindings patch, this means that our child nodes
are devices in their own right.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
If this patch lands before the patch ("drm/msm: Avoid manually
populating our children if "simple-bus" is there") it doesn't seem to
be the end of the world.  The first time through
add_display_components() it'll notice that the children are already
populated and it will be a no-op.  When it gets a defer it will then
depouplate them (even though it didn't populate them) and future calls
will just populate them again.

NOTE: I have no way to test this patch, but I'm assuming it works OK?

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9951286db775..e303b0e644ac 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -499,7 +499,7 @@ mmcc: clock-controller@8c0000 {
 		};
 
 		mdss: mdss@900000 {
-			compatible = "qcom,mdss";
+			compatible = "qcom,mdss", "simple-bus";
 
 			reg = <0x00900000 0x1000>,
 			      <0x009b0000 0x1040>,
-- 
2.27.0.383.g050319c2ae-goog

