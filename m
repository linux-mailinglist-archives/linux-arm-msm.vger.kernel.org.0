Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C537769EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 22:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbjHIUYN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 16:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbjHIUYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 16:24:01 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D547B2113
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 13:24:00 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe2ba3e260so1336505e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 13:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691612639; x=1692217439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdqJgWZNg40t68LcXb+7Hqc71sK1xzdweXSJa68+4X8=;
        b=qlimNmWOiJYaLq+nu1wUcOggc63JmCYXBWV1mCJOkLYtE/6+BOxu/5xilLIyr9VkiI
         5Vl4We9kecevx0e1xufKEWnkczBfzggPBIxWOmfUXkq9K05G4F8+xboS2eDOmnpurSRs
         UeTT3XqKzxQRZSlt1sNoo/mQYWq5tD5dTgolqTwX3ur7VdX10eNRmRmaRyo0kRx53O0e
         kBOARTbxBV6XE0PuR4D5C8EOg3GNwSFIBmZCpLel7RuP4Pzh+0HtT59Mpvu3I+lPlWl0
         LCenSf4g+xsb66dLlS6rXnpN+UlRza/ImTTJFxs9CayUY6cQiPN+jfSsYYVFhKETiMWO
         gpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691612639; x=1692217439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdqJgWZNg40t68LcXb+7Hqc71sK1xzdweXSJa68+4X8=;
        b=hwF1tKMLyYmojREZ+5sC9uTNMytNzQK5Qqlkwebxjo2buYVJCbVaXWWgsXGPQ02fBq
         jefiyzxlCWmbytuLaBrOyl9I5BoPEpExiJ6IaVEXiAVl6MhlSJE36AWRbptLl0g8yNeM
         7pd7NVV0vCccH4LQqk57s7wQyqydDfvwhTAVwgV9aopvXIlxgdir9sSJux6QjamcwgaA
         g7m6+uBa8E1gGffOxrXNc8vKtsaj9r+Clfhxsw0O4MAQODEDCGTmkJ3a+zfOzghkj7Os
         FtANxWVVheHeWdbjVmQ10Ed3nrgPgXZIy4QA6um8qOClzHkNZ4EJ7c5xb9yJASWtxLC/
         m5kw==
X-Gm-Message-State: AOJu0YxdRFrKnJ8+MxtVKa55BYm1sJKUEBukiLtVVxDVbjCjAvU7Kh7p
        JdXnoDZ02Sh1dNfQQ/XfvPfs2g==
X-Google-Smtp-Source: AGHT+IH/DspjALB8JxIEu+WVcA+QQjvgRfHMCJcRp84Gqn/f2HjGSn9hB8znDGCMX700goXzIpl5sQ==
X-Received: by 2002:a7b:c3d6:0:b0:3fe:5501:d284 with SMTP id t22-20020a7bc3d6000000b003fe5501d284mr187431wmj.11.1691612639322;
        Wed, 09 Aug 2023 13:23:59 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c22ce00b003fba2734f1esm2927509wmg.1.2023.08.09.13.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 13:23:58 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 6/6] arm64: dts: qcom: apq8016-sbc: Enable camss for non-mezzanine cases
Date:   Wed,  9 Aug 2023 21:23:43 +0100
Message-Id: <20230809202343.1098425-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
References: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When we have no camera mezzanine attached it is still possible to run the
test-pattern generator of the CSID block.

As an example:

media-ctl --reset

yavta --no-query -w '0x009f0903 1' /dev/v4l-subdev2
yavta --list /dev/v4l-subdev2

media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:UYVY8_1X16/1920x1080 field:none]'
media-ctl -l '"msm_csid0":1->"msm_ispif0":0[1]'
media-ctl -d /dev/media0 -V '"msm_ispif0":0[fmt:UYVY8_1X16/1920x1080 field:none]'
media-ctl -l '"msm_ispif0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:UYVY8_1X16/1920x1080]'
media-ctl -d /dev/media0 -p

yavta -B capture-mplane --capture=5 -n 5 -I -f UYVY -s 1920x1080 --file=TPG-UYVU-1920x1080-000-#.bin /dev/video0

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 84641925f3329..4f9d6f6ec1157 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -250,6 +250,16 @@ &blsp_uart2 {
 	label = "LS-UART1";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+		};
+	};
+};
+
 &lpass {
 	status = "okay";
 };
-- 
2.39.2

