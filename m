Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163DA396463
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 17:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbhEaP5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 11:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234569AbhEaPzU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 11:55:20 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF7EC0494C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 07:36:09 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id h16so2917911pjv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TvjojEYkUcciFGjoK9PExTv10PVSKxQplxp1sRiaIpI=;
        b=GDoDjavg9WSUFrStI/x6zQaKFfLe1Uvdwa5cASUXP4s7OJeyQZr2HQ6GFpvCGHSoFm
         2sy14JP+rK8li50dKlW78CtrFVFRhsKjOJjbkP/kfSFnFe0P+Kjukg1PyFriTmiECNaw
         90wQ6HotjoUquPiLEr5bHy+mJQx0juqP0kbD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TvjojEYkUcciFGjoK9PExTv10PVSKxQplxp1sRiaIpI=;
        b=XpuDTjSYnEEDoxVcU8tMIOrbi/ZfUm0Rq/AkWhLtHsGDVHYagQtIR6Bq0tUMxxQdQe
         AzhJf//ZnyTytLIOZyLiQxzQDOmKQOKaZzSl08rx/Mrp4QtS0VUIZxTiGRk0bu3MhUHB
         t8sFSs9qryN9QdgYie5sfkkIRN4IdnSVlyVYwd8QrT9fZ6GRjw8u3NV1+IvwmopXRycS
         Kw5R1sI2sKA2dlEYhFOQB5Tuwt/9ALSxNt4A+20Ej/ZFKO2J49/7Oy35IPJ1UFa3GcT0
         Kh++HS2ocEUaLl/tBWQB0O3Ed2hLP3irtKPxe3a6c6B80FithF9GHtgo9sUYmXFgmLMq
         lwkg==
X-Gm-Message-State: AOAM533jGNuVDKLkYaysCO6Nu4ykhLW5kT16/4HtD/KgVcjKb4TGYApg
        apu40sgxz1PgExBKELuL6kChQw==
X-Google-Smtp-Source: ABdhPJynM/jfg1vpJVL0xht4RCkyvJQ0dUIDAdwAvZEuU2SZChGp5iLKAsrha1qhoK4RQMdFt2WprA==
X-Received: by 2002:a17:90a:8e82:: with SMTP id f2mr20123792pjo.157.1622471768974;
        Mon, 31 May 2021 07:36:08 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:10:ee09:a901:df78:da19])
        by smtp.gmail.com with ESMTPSA id w123sm11072498pfb.109.2021.05.31.07.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 07:36:08 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     broonie@kernel.org
Cc:     Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: add lable for secondary mi2s
Date:   Mon, 31 May 2021 22:35:57 +0800
Message-Id: <20210531143557.3975917-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds lable for secondary mi2s to allow overriding.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..2027914a0bed 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -772,7 +772,7 @@ mi2s@0 {
 		qcom,capture-sd-lines = <0>;
 	};
 
-	mi2s@1 {
+	secondary_mi2s: mi2s@1 {
 		reg = <MI2S_SECONDARY>;
 		qcom,playback-sd-lines = <0>;
 	};
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

