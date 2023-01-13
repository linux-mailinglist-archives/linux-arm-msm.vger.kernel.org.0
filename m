Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5B5668A0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 04:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjAMDZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 22:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbjAMDZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 22:25:40 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9091580A
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 19:25:38 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id v23so17263413plo.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 19:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yWM9xiWj0MDQWf+13yvBO0xsCa3YE6cBbf88bv0xKGo=;
        b=mmBXkG/LSqvEPp/oud0jjzcfAcQK9A1EVzIN+KuMHROkzbXneuRSvT4e+2RNZB5fmA
         pQhGOD9FhjoVtQzP3KGi206ANhdJB/HTBUWZouaXaHqpzgBR0WnZAE7sAL97U5/guxa3
         GWuEGpXdjVdbIsUK4QMH+d/oGpil7EfgQ97v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWM9xiWj0MDQWf+13yvBO0xsCa3YE6cBbf88bv0xKGo=;
        b=wq/y4xwJwXY6ruKb2FyG1ZbmvfrDiZhhsQJWyLWJCZ5pBVFC7f0tnj4VQ7y1nIv09F
         XxZZ/Tz1h9fs36NPheu2ohzwVDGIMXgUguUlpd3sulTug5aewV8fFrw1Ygl01DkEDKu+
         e9ddZBmGJjYGcJB+Rdne9GmZyXh5DJPPvTRTnvng3LtO0WprvAry6KXEGail5ONk1tc4
         ygOnLF+gzUUM6lc3zZR9ro9arY0YsVcNwHqF+uKa7HVokOAjPKfSI7rZwiDtE+vcow+K
         6a0d0D0hRArh1g/q5odB8tBGragvoYM/GPXBtj6TMyfgQcFjz+uDcv7WOLPcLuT52y+k
         kqEQ==
X-Gm-Message-State: AFqh2kq1LA5z+O/H12Zns7bDay2ZbJ2gvHp6s8iPDVuFOKuz89NsEdzb
        0MXis1PbobDLpt1A7Ztf+/o1w+mbdEUJz5du
X-Google-Smtp-Source: AMrXdXteN4EQNWVjUzcqIIa8750bkO0vLIuJOV4mCsxDWyWFHhvIj+daEShB5XYfiDU/YgV0SUnvSQ==
X-Received: by 2002:a17:90a:5903:b0:229:11ab:4ea8 with SMTP id k3-20020a17090a590300b0022911ab4ea8mr3097656pji.36.1673580337564;
        Thu, 12 Jan 2023 19:25:37 -0800 (PST)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id e7-20020a17090a684700b002260c751b00sm1870588pjm.23.2023.01.12.19.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 19:25:36 -0800 (PST)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1] arm64: dts: qcom: sc7280: add display port audio
Date:   Fri, 13 Jan 2023 03:25:10 +0000
Message-Id: <20230113032510.749804-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DisplayPort sound node and lpass_cpu node
in sc7280-herobrine-audio-rt5682.dtsi.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

---
Changes Since v1:
    -- Fix the commit message.


 .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
index af685bc35e10..69e7aa7b2f6c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
@@ -33,9 +33,22 @@ codec {
 		};
 
 		dai-link@1 {
-			link-name = "ALC5682";
+			link-name = "DisplayPort";
 			reg = <1>;
 
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_DP_RX>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp>;
+			};
+		};
+
+		dai-link@2 {
+			link-name = "ALC5682";
+			reg = <2>;
+
 			cpu {
 				sound-dai = <&lpass_cpu MI2S_PRIMARY>;
 			};
@@ -92,6 +105,10 @@ dai-link@1 {
 		reg = <MI2S_SECONDARY>;
 		qcom,playback-sd-lines = <0>;
 	};
+
+	dai-link@5 {
+		reg = <LPASS_DP_RX>;
+	};
 };
 
 /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
-- 
2.39.0.314.g84b9a713c41-goog

