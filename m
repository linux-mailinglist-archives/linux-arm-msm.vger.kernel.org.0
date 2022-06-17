Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 355EB54F582
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 12:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380531AbiFQKgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 06:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbiFQKgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:21 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0E16AA6A
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:21 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c4so6264977lfj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BPM1lPElVRKHfSfZkivxc6Klx1L3jnABydrUVBQMP0U=;
        b=T3xd5AFu0aHBgrFvV/NHxWYh+71RiAe0Eb5xnkHI0menhC2kuEo3wShfU2B58UUOvG
         CmBDiAG7ci86yMRjHj8W1NDYKgv9K908P/mPrNJkRxgXcFzTTPnnOxtJ6UzQMTix2MxJ
         3UXIms+ZEue6hENMMfsLhxjUTlR1oE7pPk3paU4X8FPaBXcND8kG2m1B7XFzrySfbH78
         7QcBiVWV7PN3e1u/bEfLiiozdny8GMg0M9olf3tWIQ7G4cO4z/uV1vgYzHe4GYufp3BW
         6DiUZ/JKvVenxBKCRUOp8pTwHsmV3oVD7fsu8wt4UaBigHI6hyMadTnwsn2BuKwnUVFv
         BxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BPM1lPElVRKHfSfZkivxc6Klx1L3jnABydrUVBQMP0U=;
        b=dkJjLLekg1N++Ry7XArKxMOH5lfZ/oa2V3eTfDKYOGQ1TOSteg2b29fwBTYtHIb0tF
         SH5YGT+Pz/L19eEswM30xDr/YyFfFHUWldi1asikOllHcXA8eGorajpkuvBXxppLqS6N
         RhZzAkdbnai+S7LThhrDk6VsQf8D5FGrKKABulIfUWU1LaiKnljKQbX6iG9I1U7pe1Ci
         0voDtdzLFEb6w5y2TB4LkUftiGxrG/4MXqwSYmWlBtwpITxx4iHHHKfIJp/LY7K2q+Dm
         RSHHLhfZo3IYQS52FHu+a9rTyQPSjwyBqBFmUVy4N0Wl+oVZGB64KX1ifBtOzC3dCQ7a
         5i5w==
X-Gm-Message-State: AJIora9wNv3QKhAA/DbfI5+ojQptUnmPUU1aM/S/B9gIvwlKXfUDmI44
        p0FlM5gBBfkt55ll0JEvAC7OIg==
X-Google-Smtp-Source: AGRyM1vQFxmhM36CJpjLmGbKY/c+jI34RGfZYGRL2Wt7y8RQnl89EqIsPtHq0/HJz1sNjOM5CrFERw==
X-Received: by 2002:ac2:4e86:0:b0:479:242:61da with SMTP id o6-20020ac24e86000000b00479024261damr5242193lfr.40.1655462179436;
        Fri, 17 Jun 2022 03:36:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00478ff020832sm591803lfs.106.2022.06.17.03.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: qcom: msm8996: add #clock-cells to the HDMI PHY node
Date:   Fri, 17 Jun 2022 13:36:08 +0300
Message-Id: <20220617103608.605898-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add #clock-cells property to the HDMI PHY device node to let other nodes
resolve the hdmipll clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9932186f7ceb..f94f10947f26 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -964,6 +964,8 @@ hdmi_phy: hdmi-phy@9a0600 {
 				clock-names = "iface",
 					      "ref";
 
+				#clock-cells = <0>;
+
 				status = "disabled";
 			};
 		};
-- 
2.35.1

