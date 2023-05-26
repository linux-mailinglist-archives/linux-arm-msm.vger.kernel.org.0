Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE745712F29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 23:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbjEZVu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 17:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237412AbjEZVu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 17:50:26 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB8FF3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:50:25 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-307d58b3efbso794711f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685137823; x=1687729823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSmVapjGY4609B8VseiXBSPMlIsV3BDKD/4/5pbhv2g=;
        b=fODsJkj+Hro2Wfc0z3784TStz/6r2gHhSteMjBS+uU04NTFJl+XFPzyXCHjT9VIupM
         kHeB7IxUibhFug8qiXTAi1s0FdqHGMHNsmXDdnpJrPKjdfaDbRgcrr+NE85n3EwFX2I7
         SdavXuAzQPFfyjrKUSTUFq5z8hFJzvcibR2kJqqIn+BoPs438FzWNZ2Qyhr0e/49en8c
         cMA8q46y80kxVALSdzp/5GeRxiEZ7PjpuZUcWr01RXP/A7TpyLlF9koNtMKQJxkgQdjd
         OicouiWz8PvMXr9vGKuc4pzCfUsEW4E53mKY0XOQtbinEaQiGwBL22n4tafapXIFh62B
         Fqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685137823; x=1687729823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSmVapjGY4609B8VseiXBSPMlIsV3BDKD/4/5pbhv2g=;
        b=D0wVQ5RQTscZKaK9uX0ep0/k1/02aIxK3tRcmQgxC2vl2hkdTAzszhj+OAJTrYpUA0
         n96IQ4U2AaFhter/M60XabTV1k3naULNGOyZg/oBfuitiwKYWP7gjg/OAWHP0nYMBlv8
         uiV7I5QFnt8VitG3yOwvsggzTP65fHlVYBN0EFOTPHXi5SMVa6JXZ7a0jUU6zzZgHWXp
         IDyAtPFJ3oenanyrNx7t8nxWQ0MZPoDoLhUChFvW81nkkS8PQbskfO3EmqZLC1MQl2uQ
         vNx3WkszfowsJLaCiCBjP8CjRwqRPe4p0+yaCX/IgNh9Ui+0pgUNMCkSEkZ4vE8AXV2P
         XJEA==
X-Gm-Message-State: AC+VfDw0TIUNI45LUxA1GzM1QDHpSJCp4OiOH0ISwcRVr3fpdpwSPq9T
        l2V0u8TZd4Hsbo1sxq+NG5v7xQ==
X-Google-Smtp-Source: ACHHUZ4597CKiEnG6ZGKVxpPpAmPNqvo/bpBooYfiEBcPxzY91RQ4xC2VRpDx+7NIGZBAi6EVYYLuA==
X-Received: by 2002:adf:f10e:0:b0:307:8e50:34c6 with SMTP id r14-20020adff10e000000b003078e5034c6mr2449447wro.52.1685137823708;
        Fri, 26 May 2023 14:50:23 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id u4-20020adfdd44000000b003063176ef09sm6294314wrm.6.2023.05.26.14.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 14:50:23 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Fri, 26 May 2023 22:50:22 +0100
Subject: [PATCH v2 3/5] arm64: dts: qcom: sdm845-oneplus: enable pmi8998
 charger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-pmi8998-charger-dts-v2-3-2a5c77d2ff0c@linaro.org>
References: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=AyeJbiuz3WEehh/6aaynrQbFEhw+gvf37a7oFpCMTYc=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkcSmcdbbCgMaVjoB9CCMMj8UI/65+76bJZR78Y
 mkXRF2VpaiJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZHEpnAAKCRAFgzErGV9k
 tt/MD/9KZTeRvBj45NLbqEiXjoqFtf4TxoWSQTNt+lKxkk27noMwUHXCQgRMzDQUVoWIUznWeXy
 TnSVBgJrOcJq31wbvTXZJqkg2+J87gF4ojIFVK+SvvUZQA/HlCNR41oRYc9cyI48QrESH6h4BC0
 aUIADvWREkC5Uuprwy/WQ9q94cGvzT91rmFFIscj/HdNvWafUYVbO0PHW2TMt9EGBQUC646u3PN
 2hCXikvreP2XDIi9p9r72tyz91limeZXoXvuS0B3MlRWIOAy57Gch0oNvHmwXogwc9hcUOOh91a
 ljIC3XgpG2xLttGS7L26JQKW2Dkj/hfkP0IZ1Z/lEMef+e1QqbgNA/WsX9KAXHypBC6gb5nusyk
 JTmwV23J93dFDyZKc7ZZJazdKn50p0KiYOqbp5Ng/JR2mARONBvoElBWbpTkE2oP7cn6pe7jtAV
 b+oZdYykhcUjVquFxEJZq1zc4HoytdNJ6/tlysYw3SAohFel0DRVKcKpUZ2SqhRbMdGz6H5KmGe
 otc7hbfIZ8uWOU1+ZpqWa+iOp5P7AISTv7X2pTmrVplnF8bXKEWt/B1fhfT7OWXBEcgxgDSbbpc
 W+/DW8zPUzx7cqWqndf8/5VqRauh2ABjfIWiRsJfm4EtubXpUq2G0+MY5YqCejCMB49bdIoEmH5
 j5eUMhnuosI3cOQ==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the pmi8998 charger on both devices, enabling charging speeds
above the default 500mA limit the bootloader sets.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 55ee8dcf27c3..364adf416c4f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -480,6 +480,10 @@ pinconf {
 	};
 };
 
+&pmi8998_charger {
+	status = "okay";
+};
+
 &q6afedai {
 	qi2s@22 {
 		reg = <22>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 6cdda971bb4b..623a826b18a3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -51,6 +51,10 @@ max98927_codec: max98927@3a {
 	};
 };
 
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+};
+
 &sound {
 	model = "OnePlus 6";
 	audio-routing =	"RX_BIAS", "MCLK",
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index d82c0d4407f0..9471ada0d6ad 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -47,6 +47,10 @@ &sound {
 			"AMIC5", "MIC BIAS3";
 };
 
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+};
+
 /*
  * The TFA9894 codec is currently unsupported.
  * We need to delete the node to allow the soundcard

-- 
2.40.1

