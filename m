Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78FFC672323
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjARQ1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjARQ1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:27:21 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167115896A
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 08:25:17 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j17so6577699wms.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5Exmqod7rYxyDVLS9FkOBJX2qhHGgIWItdN+1JD6iM=;
        b=Kp8CojqRPzwg0gnuCcldt7j8PZf5BgsV6fhJwA0cZqV8qIH2kb/BwSJENcOce8fjuX
         Ov7cQPWFmZSkezEWMQksWgVVrGWG2RpOpqOPrlXuRT69savpHxiyQoN3rZmxYe95x7v/
         yBM8SVkjtZ2aE3jN4SjuIJt5s4wp7c47PdJf63tlYWlabGfWIOQmzDWBo9OXBjcDbaEO
         v9+NBIHoyDR/wyIZlv2jz4Df2zCMkJ1tQK/l2fWXtTdnBZ/O6EbAMfZ7y1pa4zB7P89e
         enRHzWA1PPEnjKHJiBBHhlEkFU+F1QoMYxjPsHZjU4fa95xaOeHbpwtrZb5+UVmRCpb1
         L5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5Exmqod7rYxyDVLS9FkOBJX2qhHGgIWItdN+1JD6iM=;
        b=uiSF4e/6kLXd6fWeCh4G0CgZqDA/iVMOb5WEYdalFuBKV5EEcC34uBjqZQi0W7sCdn
         S6gZSCswvD0eK3v0r/se7+/qi+JYT9WCCVZ0IrVU8x6FWZh/ZSbrwQWa9AM2+Xf4HyfR
         9JQXhz7jM/qCT40S1UpgmU7JhiByF536RcG2Kev5DosZHXmho5cuQqRuXboKLy+sTLun
         GfRsIvD2nU97U6mzKuoWkaxCtw86h+pfAx56hytnQ4ldbEu1XuMby4FDxwqQ1UbE+6Fo
         3Z3jTMjO58h2CKHQfhCiTRpEs6M7qYsWf2PQAfcZiUM09Ws3KcJ8p8MknF8bvfCbVamv
         x0Pg==
X-Gm-Message-State: AFqh2ko8TywRVzO8cOb2Bx/kz9w2LVT7WaLG8LN/91cNtBOraqivJH50
        VSL2sRgwfXxO77HMquYrTbJMMYtFflwGMf8KqOg=
X-Google-Smtp-Source: AMrXdXvHWkM36NiunCT6BBtkq9CAC8LU8Z2tJV77q2X+zY1W79XPygYWyTlJlqifEepodX8f5NwvhQ==
X-Received: by 2002:a05:600c:1ca4:b0:3da:f5b5:1401 with SMTP id k36-20020a05600c1ca400b003daf5b51401mr7529549wms.31.1674059115623;
        Wed, 18 Jan 2023 08:25:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b003db012d49b7sm3670695wms.2.2023.01.18.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:25:15 -0800 (PST)
From:   neil.armstrong@linaro.org
Date:   Wed, 18 Jan 2023 17:25:11 +0100
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8550: Add interconnect path to SCM node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221115-topic-sm8550-upstream-dts-remoteproc-v3-1-815a1753de34@linaro.org>
References: <20221115-topic-sm8550-upstream-dts-remoteproc-v3-0-815a1753de34@linaro.org>
In-Reply-To: <20221115-topic-sm8550-upstream-dts-remoteproc-v3-0-815a1753de34@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abel Vesa <abel.vesa@linaro.org>

Add the interconnect path to SCM dts node.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 3d47281a276b..ee3e5150a976 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -298,6 +298,7 @@ CLUSTER_SLEEP_1: cluster-sleep-1 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8550", "qcom,scm";
+			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
 		};
 	};
 

-- 
2.34.1
