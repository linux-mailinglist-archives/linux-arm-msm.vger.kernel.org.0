Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB80792B09
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbjIEQqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235728AbjIEQfV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 12:35:21 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5AF1FC8
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 09:33:23 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso26889865e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693931506; x=1694536306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1I6IwceD9yMG95Xy3C5UFcBdFWUjpLzegH+tNAfDOaI=;
        b=Pfv+aWD/C7L4PJlcj5Wk02+dkvLKhNS0VvzlHBTMcZe1XDY9vhLjfLhnO+M0tbukCx
         j/AfG63CcuM46U8GEfuh0/ZnvUCyc3P4vZaooS4GxH39VJoBlkm3zm6NxM4Aa5xo8H6u
         D2YTqyYobT2A4TAsEHORcmgPfAebLoPqOWMRdYCM//JjjE/79mD8YCDWrpugwhFJ1q3W
         tIKe9TUTasEqvu8gdXIWlPkmzkdOmbCh4PRuoq7lS2i4rWdW6PRE12pLkskFSWgfUD72
         qMmoq0c96l7pci4qPw0NYstoGI9wDzWnfMCC/XKmtAIXqVWdkCm5OBaK7i62YOuoDtx7
         k42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693931506; x=1694536306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1I6IwceD9yMG95Xy3C5UFcBdFWUjpLzegH+tNAfDOaI=;
        b=fmsMqqTVDyjb9vTBH0oELnLa6zIIMbv1rZvyTSjKzJpGYnVTHATpOsWqQWdhGrgfc2
         UfXa1H57kKk7z3VDXhkTyH5fmBZv6oZsynplyNcDWOFANgXvaOL7jJUOBAnUkDpX39jT
         NoA/BAX0VDrYInpdi8h4/jmlNbYL7dqmNhIp/U1e5rME4NMPHykJZmqpcf0WWxSDdWN/
         giYIH2EskoKcNpp1dGDPsedngI7Njmzf7xBGr+vSQWRMOW05o3M7z23x08MS585o+MtA
         9kx+3UmxffMFCSTaPglEusD9oHPpvCuuBM3S+OrjlKSRKxRCjx5LD4A8WVXlC1E0SMAO
         5I5g==
X-Gm-Message-State: AOJu0Yw6gFrzObh5nHBoVdS3rB33bjqcL3ANbBVXY7UhmzieVkMLfsvE
        uaQaE8npjd72SHZ1t9rvysgLrrx7+Rt1JKXrkxQ=
X-Google-Smtp-Source: AGHT+IE652HnpOuqvnVBGDDLrT5wGDbZm60/a3Eibz5HpmZ0r1doLgr270vkCnEhcqO3UeDgCRLTVw==
X-Received: by 2002:a17:906:1db2:b0:9a6:4fe0:4552 with SMTP id u18-20020a1709061db200b009a64fe04552mr203290ejh.46.1693930770138;
        Tue, 05 Sep 2023 09:19:30 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id v26-20020a170906489a00b0099cc36c4681sm7743165ejq.157.2023.09.05.09.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:19:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/12] arm64: dts: qcom: sm6125-sprout: correct UFS pad supply
Date:   Tue,  5 Sep 2023 18:19:10 +0200
Message-Id: <20230905161920.252013-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm UFS phy switched from dedicated driver to QMP phy driver.
Eventually the old driver was removed in commit 02dca8c981b5 ("phy:
qcom: remove ufs qmp phy driver").  The original driver and its binding
used vddp-ref-clk regulator supply, but the new one did not and left the
supply unused.

The Qualcomm UFS phy bindings were also migrated to newer ones and
dropped support for vddp-ref-clk regulator in commit dc5cb63592bd
("dt-bindings: phy: migrate QMP UFS PHY bindings to
qcom,sc8280xp-qmp-ufs-phy.yaml").

It turns out that this regulator, although with inaccurate name
vddp-ref-clk, is actually needed to provide supply for VDD_PX10 (or
similar, depending on the SoC) used by UFS controller.

Bring back handling of this supply by using more appropriate regulator -
UFS controller host supply.  This also fixes dtbs_check warning:

  sm6125-xiaomi-laurel-sprout.dtb: phy@4807000: 'vddp-ref-clk-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 90b5f22ea9dc..a49d3ebb1931 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -400,13 +400,13 @@ &ufs_mem_hc {
 	vccq2-supply = <&vreg_l11a>;
 	vcc-max-microamp = <600000>;
 	vccq2-max-microamp = <600000>;
+	vdd-hba-supply = <&vreg_l18a>;
 	status = "okay";
 };
 
 &ufs_mem_phy {
 	vdda-phy-supply = <&vreg_l4a>;
 	vdda-pll-supply = <&vreg_l10a>;
-	vddp-ref-clk-supply = <&vreg_l18a>;
 	status = "okay";
 };
 
-- 
2.34.1

