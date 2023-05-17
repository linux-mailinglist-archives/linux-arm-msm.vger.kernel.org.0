Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9C8A7073EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 23:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjEQVTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 17:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjEQVTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 17:19:05 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEBE9023
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 14:18:40 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64388cf3263so928328b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 14:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358293; x=1686950293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/foJvy2H11hs5U0azHSnrQ7t4rS3XX0dM/KWP8Ep2ME=;
        b=Th60rWvh2iNisgtghM6ZzEq9K0EkgEr4VXi3UlJyUyiP+460PFZ5JqtkZK3BGSvoTH
         K/WWkEN4lkHF1N1DhYEIZuvJyKLDgPYVP4gGU4guA0fqzj3dC5GbZfK549hMUtWRXalT
         fT9Ou4y9cO1PL7TG6RA7IDohMOS3DsLW2tCg4llfTOZ4xBBkB6vUN/p4Vbg4teMs7KSu
         3ilkh4td/bBuHntwo6d/JCNgsAj7NuI72hbuNPpal8JPyLDpTOxyNoesFNcctHJp6qUk
         ysLmYetj/28I4Q3c/9uQNjVULqMSqq0xrjSM9E3bgpM2iIquXeZ8CXltJFavolf/eAFF
         ckqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358293; x=1686950293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/foJvy2H11hs5U0azHSnrQ7t4rS3XX0dM/KWP8Ep2ME=;
        b=Zj+gEr0xbY4yOcxxnvTQcLgBUgLe2E6dhouECCl9QflhQlB4stBUSbDmWxBTmsbRiC
         s7T8P9unRPWWEWcFI6t+t4G/PNeWC873R5nqPspk+ZKxf3enwRfQjIjrqcRT66ZPdxtm
         vx7ELS9q+Sesb8MIiGMc6Nay3RMa8gdO95XbWWJpLQCfu2J4I+CC8G1egOV15WJqGYD7
         eOXATCWfK3/3Oq1+UZXRQrWdbkfbNTidXGpRpVJmfNhRLVQafFo2ERm7doCS4PU1kuBW
         QeQ/cb+SLW8LMEYSoPVKuQidQtfyZjf7lhseL85cQjM0GIlGG+XlXixnr/UBTTJI206F
         DMHg==
X-Gm-Message-State: AC+VfDzTTn+XuKV8W+IBjAXv0yi/RzjTk6OGttOukPdNXvYA0qM9qTy7
        cJvkGlAQOOkjVNxT/jTxxBAeiaWjrNd7IjWDmoc=
X-Google-Smtp-Source: ACHHUZ6yw7WIHip5dqJcUZxgerTW+/OJRBY0G1K6ZjqYzK9H3Gmq6HfpJEcdVnlBedsu0lLoLPtqvQ==
X-Received: by 2002:a05:6a00:1908:b0:646:59e4:9514 with SMTP id y8-20020a056a00190800b0064659e49514mr1434833pfi.7.1684358293326;
        Wed, 17 May 2023 14:18:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:7a51:340a:a439:1b87])
        by smtp.gmail.com with ESMTPSA id n18-20020aa79052000000b0064cb6206463sm4359210pfo.85.2023.05.17.14.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:18:13 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 1/6] usb: misc: eud: Fix eud sysfs path (use 'qcom_eud')
Date:   Thu, 18 May 2023 02:47:51 +0530
Message-Id: <20230517211756.2483552-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230517211756.2483552-1-bhupesh.sharma@linaro.org>
References: <20230517211756.2483552-1-bhupesh.sharma@linaro.org>
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

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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

