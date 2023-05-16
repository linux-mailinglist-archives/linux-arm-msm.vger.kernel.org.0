Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFC9C70598B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 23:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbjEPVde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 17:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjEPVdc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 17:33:32 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB3B7A92
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:23 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ab01bf474aso1215805ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684272802; x=1686864802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fcm7rdxyr0xQGgW24k3dhsiALIquYRobfBwbbRtNKtU=;
        b=m3gRccPpzdD1H9i2KDuHDv8HqzdRasCUi6O3ztffhNI30urEr4XcoVyZhRJGDq1ljW
         ARzXVfRYvvbGBKgQlD3ZQfybIChLBbsLVfrOYjaFH83gfRDXbJOa6+hAKBEmIAlj/GMX
         IrXkQ1Povc0GNP9oJ9dS3m19xqak2dv/AyxqBkD1qcgke1ye0b8A0J3YecKjSFcMUGQn
         yhZh57JWMMOs68RZF5t5AvXabd0/YfELc9gMmFPUtd86Rpn6LNKAeA+1Ad2AzIge2GPZ
         SHZTaeA5wTBVGk05XG5spWhgk5MQBc8hh445ezBEhqBsxxhPGGJGlMn9SkhRjgnwd5UL
         fQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684272802; x=1686864802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fcm7rdxyr0xQGgW24k3dhsiALIquYRobfBwbbRtNKtU=;
        b=bSUleLgg8aXXzyY+MOnbrwLJ593an6/Ap+2vpQaQb2oPUoBEke3OW4TN1CmrIV9bC9
         i3Uhmrdzz3rabobxJu46ZydA3hgDnwwcc58Sez8vhQtPi44AfirPFIiD/CJupJamHAr9
         mdNkhesZjPS0VVyfkItZ7DxpogR3+G8LtwvKixp75A4T3SRd52vvl6lRJtEOxxhNKx0y
         cVJz3Vkmqb8WUDMxF10+BJhxxp7r+UDnC4hMavoY4iGTTONC+MO8X8nvHhsmhcuivCbk
         qf0O7goCAlvhWmB6sKLmhWfd9uOla4BrYujWW6HS0pcuLYn6WHfw+I2DLJ7zSuBXOvqa
         iF9Q==
X-Gm-Message-State: AC+VfDw+1tjrrHnYZMeM6u0H1r5zKTj/vZyWMOtc2w8jtikT+ERJr9kF
        xjf9lgdIn6LBGFnXNys96IUaT9d+BPVrKFTfvC0=
X-Google-Smtp-Source: ACHHUZ6Tfq02iqowHYvw8wmwSAkE0dw4yL2jaThXrzO3sdK8Mx7Qmp8sW9eKaYI9qUeaq8RSGbFwgg==
X-Received: by 2002:a17:902:b197:b0:1aa:f446:d518 with SMTP id s23-20020a170902b19700b001aaf446d518mr36579051plr.16.1684272802399;
        Tue, 16 May 2023 14:33:22 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:7a51:340a:a439:1b87])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001ac7af57fd4sm16027676plb.86.2023.05.16.14.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 14:33:22 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: [PATCH v5 1/5] usb: misc: eud: Fix eud sysfs path (use 'qcom_eud')
Date:   Wed, 17 May 2023 03:03:04 +0530
Message-Id: <20230516213308.2432018-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
References: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The eud sysfs enablement path is currently mentioned in the
Documentation as:
  /sys/bus/platform/drivers/eud/.../enable

Instead it should be:
  /sys/bus/platform/drivers/qcom_eud/.../enable

Fix the same.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/ABI/testing/sysfs-driver-eud | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 83f3872182a4..2bab0db2d2f0 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -1,4 +1,4 @@
-What:		/sys/bus/platform/drivers/eud/.../enable
+What:		/sys/bus/platform/drivers/qcom_eud/.../enable
 Date:           February 2022
 Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 Description:
-- 
2.38.1

