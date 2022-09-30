Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECEAD5F0EC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 17:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbiI3P1C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 11:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbiI3P0j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 11:26:39 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371E817CCDE
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:26:37 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id f23so4267218plr.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZxqNeg9qYIg+s4/UlajiiC5HVdIkGrA2Kg81oKMQ+/o=;
        b=lixgqKiaVh8FgIvf+wBRcxXTpxgOT34Fs//W1EgmcnS07zDGAOwB7oU6gpSpABj1nr
         ktxYNGLj8xK9TlF/S6G0q1RiU0Xk3d7tVUNs+9HDcOcl+LXE0P9aHlQTXyJengHl5coj
         umBNRt1+k6zU481Spm5y3Sd28+hHPFtWzg1GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZxqNeg9qYIg+s4/UlajiiC5HVdIkGrA2Kg81oKMQ+/o=;
        b=MoAyWeChRJ/23y6OruZ/dmj+DYJZ4RfpJZJ+01cuHdC5lNXBIWEFk3tY03g9vWwfWZ
         ZKZM/sbXOdHgIW6b+Wg+12qNTXwH2vXsHmWJQanjLxtySBHttks+qtOHTWKgEz+atSJL
         Bblzv8r3VQfqbJcfeozrYpJmiZbgaKI7I+E4sNqaIs7h3EbmS9pNC7FKrWBM8W1ww1Qm
         K4emfTDlWj4C+jJC9VMHxV1QPd8b/EnUqlp3l3kX2Vwhi60FGjr5SATJF+jfpoB0pCVs
         /iR5dEgOhsuPbIoc9jcUa9TDJoXSMHZVdp1VaVs3+AHJ/n2Cf2p42QCQuFKzcmm9RRRk
         MDww==
X-Gm-Message-State: ACrzQf0aQU3jWjSfSR8s6KfRKoU/jRjCN26rY9LA19+nISJYe+bny8fZ
        Qmcq+L6ksvzzZVFD7kgYdgfyKg==
X-Google-Smtp-Source: AMsMyM6cqtLD4mHnlGb/6labWolHwlzyKQJy45yY1kVU2WbrVm26A92l3jcoySwYvWCxxvbH0zIRiA==
X-Received: by 2002:a17:90b:4acf:b0:202:65e3:da5a with SMTP id mh15-20020a17090b4acf00b0020265e3da5amr22515279pjb.174.1664551596651;
        Fri, 30 Sep 2022 08:26:36 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id o9-20020a170902d4c900b0016dbdf7b97bsm2006133plg.266.2022.09.30.08.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 08:26:36 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     bjorn.andersson@linaro.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v5 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
Date:   Fri, 30 Sep 2022 15:26:11 +0000
Message-Id: <20220930152613.2018360-2-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20220930152613.2018360-1-judyhsiao@chromium.org>
References: <20220930152613.2018360-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1. Add drive strength property for mi2s1 on sc7280 based platforms.
2. Disable the pull-up for mi2s1 lines.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index c11e37160f34..83a42a77121c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -639,6 +639,36 @@ &dp_hot_plug_det {
 	bias-disable;
 };
 
+&mi2s1_data0 {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_sclk {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_ws {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_data0 {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_sclk {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_ws {
+	drive-strength = <6>;
+	bias-disable;
+};
+
 &pcie1_clkreq_n {
 	bias-pull-up;
 	drive-strength = <2>;
-- 
2.37.3.998.g577e59143f-goog

