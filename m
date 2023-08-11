Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9BAD779B94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 01:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237351AbjHKXsC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 19:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237309AbjHKXry (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 19:47:54 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB368270F
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:47:50 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so22035165e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691797669; x=1692402469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOzVs2HtrX5IhBLihgAUak82ejGShDB5s4kZ2H5Eq+o=;
        b=nt8B5jnm6QQZDVNhKcItbainDmpNnuo9IrE8q/LzXVU9XaBt74T+MzJENnxfoQTlq7
         mvof2jARSJqqDFGWqj3zbNF/E0C8ykZqY5YBzFk5EzBV/GNC4+UyF2/k8onu7ujfER8F
         vdIuNJOVzBtlauaaPT2D5NodR68Gm8p1dRxUZ8+TzcQBlQibslK6ENijGWGp/4LH4yoc
         AH9YiTf6D3j5faBiG7wBah0b5cD7GV7cI9bmow8QJnOLZAdn8fDku7wIErnAKMAJXWkN
         4Fl19+d4MLE9GDBK1krOyiZQ8d72k3ggoxDgol5hE7tOZczdc8qefJrVJoCLlyVhj9Ld
         AMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691797669; x=1692402469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOzVs2HtrX5IhBLihgAUak82ejGShDB5s4kZ2H5Eq+o=;
        b=SDOIHXsfFIzuiwzoNTa9gso8J3YFLGC4IgJsCH81tJmriJMcFzsvLIRHXCmu6ZX2Ul
         pBAAblI7iGWdiOLVzfV+9PDxaFCHXUmSDwAljIIqDEUOcPENVi08SRqJebKJ0pJPVZaC
         fPu7GHGpKUZSDvAbPHoFmW/kwKldIYR+wLzqGwrfE3RsabCAZ4JzrB//Sf6GcfFLQFET
         kudoV+rpCTYCXup8ST7hH+HaBXk0qNDfE/2y2DYepxkrRlcFNVJpS7FQeoRq3hsP3wYk
         E6AvFkgXBkMHtnORbRkoEttEAufuFVDypNL/n92uVV/epWTaiNJ+E3R4MNSntT3rzqBc
         zvsQ==
X-Gm-Message-State: AOJu0YxpV0UY4pk4Pr5AWxyLqPBN9JpzQJzrr1ZcBfEzDiWzal6mHJ4s
        XQdxg/2CBj8pQs4SqfkDzUrCag==
X-Google-Smtp-Source: AGHT+IESavfmHbl40jNIKHZE6htBviSm78onBhJm1EjOeUKsUyE+sMVPcFn6hh2mq6Gak9i+1Vim9A==
X-Received: by 2002:a7b:c045:0:b0:3fc:27:7e46 with SMTP id u5-20020a7bc045000000b003fc00277e46mr2611933wmc.3.1691797669404;
        Fri, 11 Aug 2023 16:47:49 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c025400b003fa98908014sm9599051wmj.8.2023.08.11.16.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:47:48 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 7/7] arm64: dts: qcom: apq8016-sbc: Enable camss for non-mezzanine cases
Date:   Sat, 12 Aug 2023 00:47:38 +0100
Message-ID: <20230811234738.2859417-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230811234738.2859417-1-bryan.odonoghue@linaro.org>
References: <20230811234738.2859417-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
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
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index c3cd08aa5c85b..4f5541e9be0e9 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -226,6 +226,10 @@ &blsp_uart2 {
 	label = "LS-UART1";
 };
 
+&camss {
+	status = "okay";
+};
+
 &lpass {
 	status = "okay";
 };
-- 
2.41.0

