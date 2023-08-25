Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9543378916A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 00:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjHYWJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 18:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjHYWJC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 18:09:02 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A43F26AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:09:00 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bcda0aaf47so27987961fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 15:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693001338; x=1693606138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHrt6EyKwHhWexHAYiM7UY5P8HCNxqki1yO0ectc4Lc=;
        b=SlJel8eCuGtcrj7bgRwYZG2H9dFxspPI5JCdU+GYztVzVMt+o4YUCR9SozPl3duey5
         yKqAvmPWhGokOe7VA/Fx5H3BWqHs4icCyJvYFudR+X2RjzlqHhReV1c/KPHenV6muMY3
         0hHTtjqdCMn+Afz1PUM1PEp02snImwxnjlF7/Gjb9ECx8qP2+MZ5BO5HqEuv+TqxA2HW
         j4ElX0OCJl6GpJtk+TE49u2aU77k0z5uhxVK9D5rOhR61AnEeSI/fM8qqv2DKRbt6Xel
         3xwEztQpMsN4P/5oXCGRH+pKLNNUBWUuHCjpr9wL6UOsauavGSC95rJwHe8UgXskwXem
         FTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693001338; x=1693606138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHrt6EyKwHhWexHAYiM7UY5P8HCNxqki1yO0ectc4Lc=;
        b=Vv0lRquzWaI6vXejLI+wRZRAqOkL5H1J9P47FA9Jr2gSZFoKpSkoJJp3xukbBeUhZn
         /Pc1R5EBCOAsIVRBDTiu/cnXIFBDvAjvvl3dgsRKzSIUqRNAw6XBEC61JcAVHdEHeUQ0
         ORKosy0WV1xEWQQ3mW7JrVqZ5HBZh/EnINQzs/mlEfFShjcJBE4frhzxVrEK/Sjp+gvn
         QMdHwNYnjnTw5Za0uMrj2z0icGzQi26lbBytyy3f7d676P81O0oGsmDP5N7yUOW1sgVD
         VdnUXGRL9D067qFGNSX5fgNjreQFhh+LBVfJQTa8cd+Iazsx8OM9YEwBjCS56KY/WPLW
         RLVw==
X-Gm-Message-State: AOJu0YzIH1CL6GAtCPPhuhLg12oDxD8iYlzcQobu/wiUTKngYwhRlqm3
        UUh5wUcoimdx59QIms6kf8UyLQ==
X-Google-Smtp-Source: AGHT+IEPheZn/X4jScpF8eIiY/uiL2vkMyUkKghkIB/PCl8WvjbVfHap2L91CzSurrL4LxkqVLi9Wg==
X-Received: by 2002:a2e:9c83:0:b0:2bc:db47:9ae7 with SMTP id x3-20020a2e9c83000000b002bcdb479ae7mr3312893lji.20.1693001338501;
        Fri, 25 Aug 2023 15:08:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u16-20020a2e8550000000b002b9af8422a8sm494951ljj.130.2023.08.25.15.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:08:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: qcom: sdm845-mtp: enable Vol-/reset button
Date:   Sat, 26 Aug 2023 01:08:53 +0300
Message-Id: <20230825220854.1655162-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825220854.1655162-1-dmitry.baryshkov@linaro.org>
References: <20230825220854.1655162-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Wire up the Vol- / reset button on Qualcomm SDM845 MTP board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 7579ba66c6d8..aec3f358d426 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -609,6 +609,11 @@ quiet-thermistor@4 {
 	};
 };
 
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.39.2

