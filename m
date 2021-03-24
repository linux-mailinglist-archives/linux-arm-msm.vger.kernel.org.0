Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0C4346FBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 03:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbhCXC4N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 22:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhCXCzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 22:55:36 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EEDC061765
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 19:55:36 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so408664pjg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 19:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VxX3jCU9gxpYCK5wxlC07dKnMnHlhcGJNIa5hTcYbHE=;
        b=f40wFQdeT6npH+pw+HAc7cVoVM24lGjxsjvh9ss0IAFkeMdNXo3UsL/t0j43d2olss
         FfsR86iQ9J9/5W27eztxDunvESkS1E7olyR/007Sm4fP6xQmoAc/IH2jSDK8VRvTZM/a
         UGupzhmMml/m4ViNMWC1wJMjsbFj9Rq8avW+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VxX3jCU9gxpYCK5wxlC07dKnMnHlhcGJNIa5hTcYbHE=;
        b=qyZgeThtYDHT+P5CyBDP8zGQCnzOfzv7W1mDdQsRN+RG9y0RVPS1TatYMfXdwMmCz3
         UDH2N4QnfFL2vHru/6JKfViF/ODRpn2I8LzgvmynPyELV1xQdTuzrJmXnYf84ZpQviOX
         +5dnh0uAKyvrci24XrwSEMVOi5NgBsNxOWlYTw+klEKTfo96dneGsuT7OexWvVzFYRE4
         FRlbzdl/8ktszbi3An+ZCQ+22eyPnWBA+/0nBVdcoEBSBgKHkP8FQVZZauw+SspETSc2
         3RsDsDuR4m/DCwUOKLBeVkeXq7/+a2UbDGqrSU3e9xifJgEdd8Tp55fpLTMPknyKdJYk
         1t7A==
X-Gm-Message-State: AOAM530j4/70ePEDMp3BahxIEMa/ikSSVGgAa4/lzPMQz7jcJdsStaeV
        KQ4vefpz6ofmtlUFsZeF02899FaEsyGJGw==
X-Google-Smtp-Source: ABdhPJynwED2kc7VSNElAA7bTKcRRHocGbOuLARI0DW++dV5v5I4giF/PTHaV0dDpzmJNobxrQDgyA==
X-Received: by 2002:a17:902:f547:b029:e4:6dbc:6593 with SMTP id h7-20020a170902f547b02900e46dbc6593mr1474686plf.4.1616554535976;
        Tue, 23 Mar 2021 19:55:35 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id t12sm468146pfe.203.2021.03.23.19.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 19:55:35 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: trogdor: Add no-hpd to DSI bridge node
Date:   Tue, 23 Mar 2021 19:55:34 -0700
Message-Id: <20210324025534.1837405-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We should indicate that we're not using the HPD pin on this device, per
the binding document. Otherwise if code in the future wants to enable
HPD in the bridge when this property is absent we'll be wasting power
powering hpd when we don't use it on trogdor boards. We didn't notice
this before because the kernel driver blindly disables hpd, but that
won't be true for much longer.

Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Douglas Anderson <dianders@chromium.org>
Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 07c8b2c926c0..298af6d7fb4a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -595,6 +595,8 @@ sn65dsi86_bridge: bridge@2d {
 		clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
 		clock-names = "refclk";
 
+		no-hpd;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
https://chromeos.dev

