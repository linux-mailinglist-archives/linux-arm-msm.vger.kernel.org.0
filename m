Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4214563F278
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 15:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbiLAOQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 09:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiLAOQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 09:16:36 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FEECA16C
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 06:16:29 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so2216111pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 06:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8JTeHACPwdFVMcbaC6yQ3WteUvkFssvw4+UCeCx36I=;
        b=ch0xUG9YOubXjD0wvTuXNd+CTBjc5WKR4mSRv+MGMOWfTkeRhQAVmw7STqtcL7EMY8
         dyOlsSVwqpzW5EcEciBskC4L7QLQOSxxFoBUwGHZPlJRDmB/i4aF3E1LiUvc5rDVhY7d
         v5L+ClmbUrifTxk6iYfUhqRvngpao5LH+QhBMiVwDMjaKTk9Dao/4xkChijMWCEbWjFz
         /AFiYMmibkb4OtjcX8Ch8ggyCNJn3tvzemoUCqnJ0+aoqItp9FSDXT4sY6regtdUte2p
         LLibUXQVBMQuv9+1vCXVYsAQzecaXO+5yj7gj9Oxm/0f0jrfqXlEj+L0WKWNTlmMzgT6
         Q4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8JTeHACPwdFVMcbaC6yQ3WteUvkFssvw4+UCeCx36I=;
        b=s0eChQFlutx+lIGKWQvXaCp4Kbroq4JF70i4ZC5FBftsNC5NcuD+1KI5xO1XHeKLSf
         SZkWIh4THAU1xRa9plddDueYDQuZ0t3WXF5pI2K0QLs/zL65WNhsqbavI7+Cb8zACnH0
         M3+0yKQHVBVuzJS/cYvrxxkFukFlLMF2HUM7OYsNB/6s6FaxBbRCHtWeAvi/qIB89JO1
         sNWmI67Uu2dAYspf8BkJKMBclJ5bGktPZ02aqrBPde+ipvD2ipSozAGWXDIS5ZXxRpoS
         iXNSL6i72vjQcWayGb91xH0ysROsKbfiVDJwITdFZvfLQ4jRzZKN1hsHaAOpu/aq6ELp
         UWZw==
X-Gm-Message-State: ANoB5pk3gicNo3JlIeIXjbGAmRsVW4cnz9e2ZbaNz6zuAy7vPqsMPKmo
        ZL4ZShg3MPiP4CmaGpZpBcesirvx9Fk5hQ==
X-Google-Smtp-Source: AA0mqf7Kqf2NvXbWUbYDgBGqPALaEBBCxfn18BJA3lPSL8XaZKmexl9qRIE5fYgfO2A/p9iIG7SbBQ==
X-Received: by 2002:a17:903:1246:b0:189:63f2:d584 with SMTP id u6-20020a170903124600b0018963f2d584mr33499319plh.156.1669904188728;
        Thu, 01 Dec 2022 06:16:28 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c61:2814:c945:522d:e948:beb1])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ff0200b0018975488514sm3663041plj.126.2022.12.01.06.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:16:28 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        a39.skl@gmail.com
Subject: [PATCH 0/4] Add SoC ID support for a few more Qualcomm SoCs
Date:   Thu,  1 Dec 2022 19:46:15 +0530
Message-Id: <20221201141619.2462705-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds SoC IDs for Qualcomm SM8150, SA8155,
SM6115 / SM4250 (and variants) SoCs to the socinfo driver and dt-bindings.

Bhupesh Sharma (4):
  dt-bindings: arm: qcom,ids: Add SoC IDs for SM8150 and SA8155
  soc: qcom: socinfo: Add SM8150 and SA8155 SoC IDs to the soc_id table
  dt-bindings: arm: qcom,ids: Add SoC IDs for SM6115 / SM4250 and
    variants
  soc: qcom: socinfo: Add SM6115 / SM4250 SoC IDs to the soc_id table

 drivers/soc/qcom/socinfo.c         | 6 ++++++
 include/dt-bindings/arm/qcom,ids.h | 6 ++++++
 2 files changed, 12 insertions(+)

-- 
2.38.1

