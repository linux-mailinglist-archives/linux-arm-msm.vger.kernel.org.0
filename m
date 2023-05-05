Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25666F7D15
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 08:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjEEGlD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 02:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbjEEGk7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 02:40:59 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C825A1609C
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 23:40:52 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-51f597c975fso1263703a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 23:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683268852; x=1685860852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fcm7rdxyr0xQGgW24k3dhsiALIquYRobfBwbbRtNKtU=;
        b=Q6yy787yvN0xQS4jJfeyx9C2FRtdQmyTxVJ8w7F4NVmq1evCftj87C9EkmVGTnPf8l
         A6qvGHwGmgAfiPENVMgd/ZcdntZIopxTdu5XhdtgvN62Eti98pUKbmkWr6FLnMHbGct4
         nLi38fMcJKxCPAE064e0H5pgW8KVO87k2jTYE3LDmdqWMbrBkiOQlB5SkCWCkd2621zc
         T3R4gvJtKzMEpDVja25xIv43yV9q+J69LiHjqEzokeMrljiYvEY08sBPobOkVifdUAxR
         /xuMi/zd/Y0arjAqhiCUaOBCllhlR6RU7WOyhe+/hIJtL+G4iUyuqiLzNwoBpSeU8OxT
         QmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683268852; x=1685860852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fcm7rdxyr0xQGgW24k3dhsiALIquYRobfBwbbRtNKtU=;
        b=GtV5327nsjmu5QbfloylRoAfYUJXAj3LAW0PQkbF31Va/fSWh15VG5Qv63ijaQvgcQ
         VwvpLhWFrGH1eNorTJtox38bt9vMHXJUZ9dXN4FQItoSYHW5VpUwph73zHAPHLQGfX4B
         zvl3Rz+2N7O568ldMfkrzfjHPX/6WDBZXKxK90tbAWNlm93h3d+kW0FXZuJMqvEmKjia
         9cQPGdF+Q959Vd9mAycBJrNigDuBBryR3K/lSQ6Q+sWHTfPCiNL6qKF1XRPSnYgCjds+
         YCOTw9kKCvWcwBm1Zav0UCc29Ymx/MGyq3D+Wxq3FLJkD9Knv/0Wq21qbEZYKkDDUOJ3
         XOLw==
X-Gm-Message-State: AC+VfDwNh8kGoxvEWt1QwBCAr75YOwOU8SMQ8vvKIfnW3Tdm8DGpCOxO
        PARXJlYnfhb7j1J4vkUfbV3D4gI5J6NSDd0AZF0=
X-Google-Smtp-Source: ACHHUZ6jemHRhjG0GcxYNktlk6dyt8FRpMgQ9x4jI0pFw6UN9dzfK/kCHY6vKO33CIBWlB8B2mLkmg==
X-Received: by 2002:a17:902:8691:b0:1a5:150f:8558 with SMTP id g17-20020a170902869100b001a5150f8558mr397342plo.17.1683268851927;
        Thu, 04 May 2023 23:40:51 -0700 (PDT)
Received: from localhost.localdomain ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902848400b001ab0b2dad2fsm816251plo.211.2023.05.04.23.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 23:40:51 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: [PATCH v4 1/5] usb: misc: eud: Fix eud sysfs path (use 'qcom_eud')
Date:   Fri,  5 May 2023 12:10:35 +0530
Message-Id: <20230505064039.1630025-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
References: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

