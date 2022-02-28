Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED304C6C90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236450AbiB1Mbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236493AbiB1Mbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:31:33 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9023674DC9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:30:50 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id g21so4692619pfj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bdFGPaHLF7q33XjdHVVzEQl+cyICplAt+e9SLu2DgQs=;
        b=gUhPwRnq9XhVBQx3qfYtwLHnwuC1oGeZOyn1dJzPmvpgvDSoAU0UOOH9HRRf5UYaZl
         GGc1+3ndA+22UVupxmLiU4RcERkwzikYpcUvlTB+PE9juyCIVf9FbaxHFdl3Cig3dhwR
         8QjLr0XpRYthcfjgDH7TposIL/q6LJGvSlvYqLo8KvmZf+ZNjXc9Bly1xBSv9qd31wMW
         Ial6oxWTd8tvNChIYtc67Ou855rKIqqMyqIteumY5PM/8hA+ELlAY5QH7kTsci06tXLy
         r8GaFA/UpH+b8XBQuob07RtiWzti5FybcmlnNHyrArEJe3tg3TkDGdUh6kiir91IT8EF
         t/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bdFGPaHLF7q33XjdHVVzEQl+cyICplAt+e9SLu2DgQs=;
        b=XQgPHCgkCtmdSbxJiYV+ciHeWEElHEnAwnJTD+bTlQcbD1PN+8XDvwN7cUgFfwWkOH
         TvkuMbw+NALoeFVMWYRDPa0lJFVLy6h2r2mAyJoamce7SC6PSWhjUuCPWPK+CjGiZQfb
         RcNsxu3gEtxqghYz2MvYfOFknvn7cgNlPQ803EdaTAdKuBuxuHc9nLyVcnwMeIMtSLfk
         REiT9EaL7FgB9g0gJKfIiV8RKBsb9Q4s2eymIu1zDHpEoO8JUG89jNxg9zfhunSzWiuW
         TTM1KuCi0RXk40l/W4HNJDYovdIyJv1IVgz2DFD4uz7d+KaqFSivzZd33rSc74vcnaPg
         6M+Q==
X-Gm-Message-State: AOAM530gVpOEMef5sWHFgkbX93OFLIYVi1kI8hPGSsqR+Q5qOgSVPULR
        FI6jj7JHHcgjMERmPRlSvTW/dhjOXfE9Vw==
X-Google-Smtp-Source: ABdhPJyVtSk4jTW5oYYXrdUlcKwpX55KSnC6bOeagoJLOg6Nd4/T2dIu/uH6Umd/slf4L2TkDJ8cyg==
X-Received: by 2002:a05:6a00:1152:b0:4be:ab79:fcfa with SMTP id b18-20020a056a00115200b004beab79fcfamr21150362pfm.3.1646051449819;
        Mon, 28 Feb 2022 04:30:49 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id f7-20020a056a0022c700b004f0e9d686dcsm13790001pfj.137.2022.02.28.04.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:30:49 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 4/8] arm64: dts: qcom: sc7280: Fix qmp phy node (use phy@ instead of lanes@)
Date:   Mon, 28 Feb 2022 18:00:15 +0530
Message-Id: <20220228123019.382037-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
References: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the 'make dtbs_check' warning:

arch/arm64/boot/dts/qcom/sc7280-idp.dt.yaml: phy@1c0e000:
  'lanes@1c0e200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 937c2e0e93eb..575f1f00f602 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1669,7 +1669,7 @@ pcie1_phy: phy@1c0e000 {
 
 			status = "disabled";
 
-			pcie1_lane: lanes@1c0e200 {
+			pcie1_lane: phy@1c0e200 {
 				reg = <0 0x01c0e200 0 0x170>,
 				      <0 0x01c0e400 0 0x200>,
 				      <0 0x01c0ea00 0 0x1f0>,
-- 
2.35.1

