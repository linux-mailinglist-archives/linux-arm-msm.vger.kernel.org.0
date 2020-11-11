Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8512AF4F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 16:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbgKKPhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 10:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727483AbgKKPhS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 10:37:18 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5AEC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 07:37:18 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id h4so929712pjk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dAPmV9edE4/crH+mmhu7/1610fImDAiNEzW6DR8R1SM=;
        b=lFzNV2BkovmVncb3mvVZHFlLQmmFJaozQ6V9PbjhDzHzu75wP6AxV1jKRNXaH20uNA
         I+QRLibZQXgbSwcayS6tjc5ScPIc/cKc+2fw5MjwzjveXoxnzBBjwysz4gxw7EIygDiu
         X4KsBl61UZVZnbmgDGDUwGZRXCdR7rEBW9Hvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dAPmV9edE4/crH+mmhu7/1610fImDAiNEzW6DR8R1SM=;
        b=Gp+Dst7KfApCrKhhaBqCo6OaSat1iyklbNpuzCiYGPOMc5I/L1AD/lDG1cElr5J9SZ
         n1ebM24X8lZjhsCKnP104X/VLLKuDDVkz37D5liSTP2Mjua8UcIfLmv4wNDMdD4fYBCN
         a4A4IRuCvlP8/VBzentJz12JlHy7X02gZ3iGC0XuSgVi4tICxDCm/V9X3C8H6SKpqtS2
         KSKuY2HCJ/uob9oAUTyS4vtLcZFx9EhZ/+HD78xybAYxbyHqqUQ4VX5AD19wZb4fqNje
         Q71JXb7QUi/84oT4Z51PsmQ0sthYVb4Dnp+JoM9iSMtW6YX/ICgbF2Bo1OvqJRirE53l
         Kiug==
X-Gm-Message-State: AOAM531g3bDjEMUZ7TsrJ5c6bfMbaLF21mSsLQL5k5i+EopMCf8fF9En
        RVhZcz/FPcfkmR7ttlHDjQSOFg==
X-Google-Smtp-Source: ABdhPJy8mgsDncieuqZo/EMZLxuVK3XT0SQT2xkfSjn2mJVzlim+pZwZKAD0SXWDCH1v2Ri1jTSKbQ==
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr4677388pjb.172.1605109038207;
        Wed, 11 Nov 2020 07:37:18 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id c19sm3005904pfp.1.2020.11.11.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 07:37:17 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: Assign numbers to eMMC and SD
Date:   Wed, 11 Nov 2020 07:37:01 -0800
Message-Id: <20201111073652.1.Ia5bccd9eab7d74ea1ea9a7780e3cdbf662f5a464@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After many years of struggle, commit fa2d0aa96941 ("mmc: core: Allow
setting slot index via device tree alias") finally allows the use of
aliases to number SD/MMC slots.  Let's do that for sc7180 SoCs so that
if eMMC and SD are both used they have consistent numbers across boots
and kernel changes.

Picking numbers can be tricky.  Do we call these "1" and "2" to match
the name in documentation or "0" and "1" with the assertion that we
should always start at 0 and count up?

While the "start counting at 0" makes sense if there are not already
well-defined numbers for all sd/mmc controllers, in the case of sc7180
there _are_ well defined numbers.  IMO it is less confusing to use
those and match the docs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 4e7e58c63285..625e922c273d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -31,6 +31,8 @@ / {
 	chosen { };
 
 	aliases {
+		mmc1 = &sdhc_1;
+		mmc2 = &sdhc_2;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
-- 
2.29.2.222.g5d2a92d10f8-goog

