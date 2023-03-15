Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD756BB8F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 17:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjCOQCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 12:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbjCOQCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 12:02:31 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2975C19F3D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:02:10 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id x37so6626022pga.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678896122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4L0/ohRAJ1raHuU4C5yE5OwktiAIDlaiHLj7apxZis=;
        b=iCIm+CLNElLowiPW8BSJAMT4GTixDbfkn6+Q26QjHY+PqA1JTIZcwxRu8jXplIuMh/
         wK61PzB7F9T1nfyBrkxz0LKohxPlsOuiieYEw4uIcMX+SxNyD4V1hxru4+GQFsFzCNKN
         BE11DaM7+MIkktCeZqUqKDncDkf4Sw+QsGq4foMEewiSF/AN60wRrfMODTtQSP0lr5Ae
         Ja7oPytu8ffwdlMRXc1r/mPHUj8J7V/Wr1c5T9iIXnjqV3cJTjmkDGt25SRDbgOSer1Y
         QNrTY1ALONOqebfq4YxAk5170hIdGqaZ0nLfROBJxNxTn7d6/8Evo023nQdl7R/2h0fD
         Zy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4L0/ohRAJ1raHuU4C5yE5OwktiAIDlaiHLj7apxZis=;
        b=syf6V/lM5EVgjjxNl4JAhmyrNk7IYa1LOQVGjvq7SQqJ7ikHQ5SNMpYSIvGEbomBzg
         t174N+si3CowE3nGuJz5sIrL4Xh0BSE7HlPdZ43jx5qoDnnKMFyYe/X7Je49NyM9uYus
         9x7GOTHRU+0J0GNU0Z1pUXe4UgHsAa8WMK3173X2nPUWtvZvqN92tXNQnsI+6XRYtQUU
         5uB1kaadWaSHf2qS/vHjK0nlkSxJFyiAbc76p1sf31hG1Fn4RQhEi+dBcoOch0T6XgYF
         +++zKOsZc5HnW4d18+8R8lRebf0iF2P61y/gkdNDPNa/m/GtIOn+pkkfmlOu3+M3hjma
         bqAg==
X-Gm-Message-State: AO0yUKVz6Go1tUo0kFwXTSBMOk243SMvt0DsqynmzONNLSZdfbm33W2M
        jyleVaj/2lzJKtfZ+DMaQbSKXrKwOcjGK+3B8wI=
X-Google-Smtp-Source: AK7set9gu0TYUW6m4kJv/UKCBbx75F5ypLi4TuKVs4G3o3XWAxkNUy3arvohuBmDBAXMFwAr5itBiw==
X-Received: by 2002:aa7:8bd5:0:b0:625:75dd:1140 with SMTP id s21-20020aa78bd5000000b0062575dd1140mr54075pfd.8.1678896121556;
        Wed, 15 Mar 2023 09:02:01 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:1acb:9af6:bd7f:78e7:7ae6])
        by smtp.gmail.com with ESMTPSA id o1-20020a655bc1000000b00502dc899394sm3457170pgr.66.2023.03.15.09.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:02:01 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH 0/2] QRB4210 socinfo
Date:   Wed, 15 Mar 2023 21:31:49 +0530
Message-Id: <20230315160151.2166861-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing IDs for QRB4210.

Bhupesh Sharma (2):
  dt-bindings: arm: qcom,ids: Add IDs for QRB4210
  soc: qcom: socinfo: Add IDs for QRB4210

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.38.1

