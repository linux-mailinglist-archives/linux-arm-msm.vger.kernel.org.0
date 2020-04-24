Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420961B7AA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 17:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgDXPvv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 11:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbgDXPvu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 11:51:50 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C54EC09B048
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 08:51:50 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 145so4961379pfw.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5PlYrTAxuP4jdGGCfhHHIkEJ7U7EkPwrECQq1/CaMg=;
        b=EaiRysTHCtPodQ5fxFggQe3OinZ9fgf3lzjpO+Ink3q+dKHjSSGbaKMXLVP65Y7nyq
         TaxOzbgnqWXRtkAaFjxJD3pHXfoxRhIcx6M97qzDbeTTiJjX7kFSf5g0kH5SlZzTIhQU
         hY2fZ5eO5EVxTyLMtxw7Iq6vMaPZav1IOXT4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G5PlYrTAxuP4jdGGCfhHHIkEJ7U7EkPwrECQq1/CaMg=;
        b=VZpaOy2LNxRKHJVxCu3xRg6p+aDevNwLsx2CeRl1NPULEj/zHlLqbltAzjVLMfbW+5
         3LTw6gjETlcVsGxyx2iIQ7e1jVkIOV+ptR1Ri5Pr55OO/K9kr/GLfsIO7VqDyH3MjBuh
         /9tSpYrhRVCP6whHPRQcODsQ5nGQkDtqHswX1BM+IAsGawM3fh2yzDY+ywvNMfw131EK
         11G56qMFn4o30EhrkIxJDjTqrtxXtEoo8/mPxkEdHQdWHVHotn20fbJ7Hc959Fv89pZZ
         Rw+4cxaatKDLpNFW2i2j15lxCIfpzNVrDzWv8z3TX7sREttj/rgzsRBVBRD2yIBwnSCj
         JlDQ==
X-Gm-Message-State: AGi0PuauR97z3YQnRRSlUXglv3JnvAiTBBeWBepXnlRVCq0MuiGiuCdu
        B28mWHGfzSZFl+1dfoQXJvlQAA==
X-Google-Smtp-Source: APiQypK5wO/pT3SH10jr2z9q6Ql2ONlPngJbVETLFqKnjrW9asaC9My0tclDZaDOgw6H69igIIl2Zg==
X-Received: by 2002:a63:5663:: with SMTP id g35mr7350444pgm.356.1587743509867;
        Fri, 24 Apr 2020 08:51:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 185sm6546149pfv.9.2020.04.24.08.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 08:51:49 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>, mka@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: Add "no-map" to cmd_db reserved area
Date:   Fri, 24 Apr 2020 08:51:29 -0700
Message-Id: <20200424085121.1.I9d1e84d30f488cdb5a957f582abaecd2c0b24d70@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The example in the bindings and all the current users (except sc7180)
have "no-map".  I'm pretty sure we need it on sc7180 too.  Add it.

Fixes: e0abc5eb526e ("arm64: dts: qcom: sc7180: Add cmd_db reserved area")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 4216b574c080..94d2ee126d25 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -73,6 +73,7 @@ reserved_memory: reserved-memory {
 		aop_cmd_db_mem: memory@80820000 {
 			reg = <0x0 0x80820000 0x0 0x20000>;
 			compatible = "qcom,cmd-db";
+			no-map;
 		};
 
 		smem_mem: memory@80900000 {
-- 
2.26.2.303.gf8c07b1a785-goog

