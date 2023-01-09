Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6DC6621CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbjAIJkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:40:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236536AbjAIJjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:39:53 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EAA64C2
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 01:39:52 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bu8so12058074lfb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 01:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNTaDPZQqhVq4tCzrzCuljd/XD3ZPbp8/ypK1cVwGwY=;
        b=CPUR6B+jNtotVqY2UYOeu8rcJ2IpwscSOTa/JAs47etYOQYg+CCe6xB2qjOnPBMyYD
         1+KYXNrTeRcCt3awfE/yVcyO+zaUXaFk4XrheU8l5UytoH0jlAfXUWRibpI2iFAlcqOC
         1etvmoXcuK4+ePu7PUmpqeJHq29+3GCtRw/vsecL98qaOSFR1+o4PB9AgTL3fetDonEO
         hAn7gQ397i6kEHHKJ3wjZI6we3lA+1IWIbWRtZeMW+C+E6QTO/S6rtrvZHfN09ySdx2M
         YT8UU1WUb9TO+dRAruSHVePuK3bFRVtHq2VFtXk3a3vHyJ9nWT1cOAhJjZB5H+kubtfc
         kv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNTaDPZQqhVq4tCzrzCuljd/XD3ZPbp8/ypK1cVwGwY=;
        b=G+wucPO+m6LAKr45rqHR3bMJ1rBYfrq0w6etcicf2da86u1uRuSkb73DAS+bnBbtF0
         xDUbX8CpuDXYIFQdLhIMMKxv0GuDEJNe+3YKZVBQbxgasvOvghDpexMlqyNmkhKRpkfM
         kNztB3rkIkXesbr+UgefIPGUTTOOC0eQS1KjkdBnR3tE8NV2i4M2mM70PnTkbYmmErNn
         cQmuwi1GB4dazCNip7se1q/Tz72ZBPMs/Sm1COtIPSWnuaQmf++YwWTZxPUeHp2ii0/0
         c3tJvshN/s9vvZKbJMutkjRBKjjdniPE21K1I+ClH7W79+DPcqqyrXrLYflOXd5FV4vV
         PvCA==
X-Gm-Message-State: AFqh2koGhQZOksG+yjeTVNL2nlEwx/SOhBFlUANQo1jzLQfBGl6NP+jw
        xYc2kdRGZGXWcBNcOAvLgIVENzhwWWSiF7ni
X-Google-Smtp-Source: AMrXdXu/wrlCYPLir5cDEo8fvUFWfAWn8v2j8TSteO483W9sHij3qpDDMhUkB30pgA+iubC/4K1zpg==
X-Received: by 2002:a05:6512:3ba1:b0:4cb:f3d:c47f with SMTP id g33-20020a0565123ba100b004cb0f3dc47fmr15579492lfv.51.1673257190939;
        Mon, 09 Jan 2023 01:39:50 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id b8-20020a056512060800b004cb1de3f487sm1526257lfe.104.2023.01.09.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 01:39:50 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: reserved-memory: rmtfs: Make qcom,vmid an array
Date:   Mon,  9 Jan 2023 10:39:45 +0100
Message-Id: <20230109093947.83394-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Some SoCs mandate that the RMTFS is also assigned to the NAV VM, while
others really don't want that. Since it has to be conditional, turn
qcom,vmid into an u32 array so that we can handle the NAV case, as
well as other similar ones if they pop up in the future.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2 -> v3:
Rewrite to accomodate for changes, don't pick up tags

 .../devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
index 2998f1c8f0db..cfc2fda30eba 100644
--- a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
@@ -27,9 +27,9 @@ properties:
       identifier of the client to use this region for buffers
 
   qcom,vmid:
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     description: >
-      vmid of the remote processor, to set up memory protection
+      Array of vmids of the remote processors, to set up memory protection
 
 required:
   - qcom,client-id
-- 
2.39.0

