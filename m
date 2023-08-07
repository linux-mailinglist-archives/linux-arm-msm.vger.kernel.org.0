Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE6C772EC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 21:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbjHGTf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 15:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjHGTfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 15:35:24 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC92171A
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 12:35:23 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-307d58b3efbso3771169f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 12:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691436922; x=1692041722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPPAITnbHpLfLDmJySJco6dXqEzZhAIXMSVGP9xkG5c=;
        b=LZUM+utIDiGPi1xiYzGnVUrRE3JD6gHk+30APuYmhtNMPSSmObsmOtbItrpQNOUN4t
         zPNRHnd/puwUeyY8unq1z7weAe9GtY/5yrcmoPS+hB8xwUb1JmqYBGOzMk2hykf43FV/
         JhknVj5AStv2OENppgyTANVXuWUsC2bvnRFSG1x6OgEG1ByNZBS+kCGEMETLhsbomQZM
         UISYg4NWmRR6dc3GjwO15BzSebHDnO1UkuYxttotBSkOksk5um5Xi9vpIcI+OVDAYNQs
         e2aFmuv1l+CEl8miLYyIDslzQJZnpgFqV4zJsfbH2s+E/LJGrmR9lPrvVbAO7TmwxSQY
         pGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691436922; x=1692041722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPPAITnbHpLfLDmJySJco6dXqEzZhAIXMSVGP9xkG5c=;
        b=B0hIbHvbZa2DnZ0pTnkmp/eUsAIDA36OGqH/G+Ig1qhkNPdyF5mW6aKhi4eld/H3L0
         ylQzpFesFJOFTqqm7bsN7y0JKqtRMH0f1MkMPo27vvQ2T6eSUmFZK9Q4im32WjrPL4oH
         bEv3vvgRNZlf7ptKW94Tp/gx7lK1KBU5pFSCoaPwsgHls9x5LTTaNrAlv3i03lpiA77w
         FGMo9jiOXTIkGBit5X8Mhtpayp8slqnvkzM3oHN6IuN4Kkk/gIBZ5TeIDimoAi89ToKP
         iUA9jKIE+aVToeH02kLqI9WRVmCnPKvQMm/3yBpCQtpMMgwrAjV1O//PBRyE0l0EFcWD
         /5Qg==
X-Gm-Message-State: AOJu0YyDSNrYEsUoNhU3h5tlTZ/tQ+f39a+JsmbVxOyhwammcnOfbFQN
        A54GGAJw4530EGBBPIYNkalaKw==
X-Google-Smtp-Source: AGHT+IFZBRammuhICZdtkXlyPRUK42qVBcukcnqsd5LnVIL+qxwyxBJJMFPvA2T0zkK5l6u8AsitCg==
X-Received: by 2002:adf:cc8f:0:b0:314:1f1e:3a85 with SMTP id p15-20020adfcc8f000000b003141f1e3a85mr5993739wrj.61.1691436921811;
        Mon, 07 Aug 2023 12:35:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b3d6:9e6:79d9:37cd])
        by smtp.gmail.com with ESMTPSA id q9-20020a1ce909000000b003fc04d13242sm16061488wmc.0.2023.08.07.12.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 12:35:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/9] arm64: dts: qcom: sa8775p-ride: enable the second SerDes PHY
Date:   Mon,  7 Aug 2023 21:35:01 +0200
Message-Id: <20230807193507.6488-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807193507.6488-1-brgl@bgdev.pl>
References: <20230807193507.6488-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the second SerDes PHY on sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index ed76680410b4..09ae6e153282 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -448,6 +448,11 @@ &serdes0 {
 	status = "okay";
 };
 
+&serdes1 {
+	phy-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };
-- 
2.39.2

