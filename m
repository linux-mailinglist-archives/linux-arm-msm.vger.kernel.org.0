Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453BD577D12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 10:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbiGRIDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 04:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbiGRIDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 04:03:21 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F65018B07
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 01:03:18 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id k19so8331262pll.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 01:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8eXnG3wY3Xs6Rd1HwmYWWE1kb1ckVUQe9YNUa6RvcG0=;
        b=lkfuPqMUlgWCuV21AdYUfHwdaPI93j0efeL3XGhWlTWBMhNt83C2lfiECgcfmU6t3p
         5x3MpB0F74UzVQ6KuPeUu18jVnF6vi86qtKTUby2NXsSe0yZSVqFLhHdacNIPLeNOmDD
         QXgqatH1F9nqFbyi8xPdWNZsbomFdVWo2ofyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8eXnG3wY3Xs6Rd1HwmYWWE1kb1ckVUQe9YNUa6RvcG0=;
        b=BiymBnOuIvExCKwQPMQQpJc+28NFSvOLIGP5m8ubGbvD+kNBh0eWoyVQy83hF//mF/
         ZNl3vmNML5LlgTt9kMVYFDeTPLJU6RvNladK7IwyqZxgH1Spzl1FUS3Phs11CtZtipDL
         zJR3yCAKXY/BnzMvfByXb4JJHQehQdyWOBCCEPLCxPX5Uuj2Thu8GFEjnJICsNcnQFYY
         WeVPbC3/FAP1eHAG+gwoieN9LrKoHLgJAXeP0CN0Fve1K7DzoDsiZXUrNV091o3TOG11
         HETHpR8rOn88gimfeojLs3bB6WtAnsIRuk6SlKubXf3NC78QJE/2VU7AtoFZUpRDgs3n
         4ixw==
X-Gm-Message-State: AJIora/uEP4baITVA2s32AvfyAaH/X4DNG2MHqJDGiSPjLG92f2GXdF+
        8jt0jFB/gxESybS4LL988AjK5w==
X-Google-Smtp-Source: AGRyM1ui64BOJbooTruIT0aUeyw1XRI8hfYfWDsDWHLVYVPgsfYSyY90TNOlve/6KKtftXbK9TJSKg==
X-Received: by 2002:a17:90b:3793:b0:1ef:905b:7464 with SMTP id mz19-20020a17090b379300b001ef905b7464mr31856186pjb.46.1658131397816;
        Mon, 18 Jul 2022 01:03:17 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id 1-20020a170902c10100b0015e8d4eb2cdsm8672616pli.279.2022.07.18.01.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:03:17 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi in herobrine-r1
Date:   Mon, 18 Jul 2022 08:02:52 +0000
Message-Id: <20220718080252.789585-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220718080252.789585-1-judyhsiao@chromium.org>
References: <20220718080252.789585-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include sc7280-herobrine-audio-rt5682.dtsi in herobrine-r1 as
it uses rt5682 codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index c1647a85a371..98280436813d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-herobrine.dtsi"
+#include "sc7280-herobrine-audio-rt5682.dtsi"
 
 / {
 	model = "Google Herobrine (rev1+)";
-- 
2.37.0.170.g444d1eabd0-goog

