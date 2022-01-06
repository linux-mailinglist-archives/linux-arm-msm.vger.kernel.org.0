Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0E7486885
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 18:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241843AbiAFRbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 12:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241866AbiAFRbo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 12:31:44 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B51C034000
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 09:31:43 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id a1so2956431qtx.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 09:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GgGIgMajEhcXcb+pSiiU8hULLmnW3Ix8+OrCDOiX3Lw=;
        b=Jo6aOpRcqwgI1DHuAffeVnOLWMf0maPodl1wC1IQJq7vARxmfu+Ue9aSJc4yugEI4p
         g/2Bq7w0n9AuMlWZlOOslHlaI8qBSCc0vtrE+g05Dkk7NZnFchZR3i7B6hJoegjpSE18
         wfKSaXEugDx9AQIqP32HpdpeMj8P2f6r0queG+dCI2fjF7K5daJkAZI12QzVKyBE5gFt
         aMr0w98EAqRDp+2CBvDXAUK4CXzdJmkpfve6qvuhPXOV64Vjq27yLAXibZ/3QQQEbQAs
         iVhuJr3wFhiQzI0rpwndBz8ZESpWrmR3Xnmhx6ELhkbgeRY7c1PQ9KsfWeIGGq6suDHO
         XrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GgGIgMajEhcXcb+pSiiU8hULLmnW3Ix8+OrCDOiX3Lw=;
        b=7aMWuHvd+njf2QjXA7zth2yBqjVkaY8YUawx1CLp8BtXULZC2bimhgT9xrJui2/D+x
         +87Rm8w5d4EdznJNGoCV+mrijo5iJkU9RChOo6mjbRcTSLLK6eX68Eox3LCSPiqJJFKC
         Kwlw0GSWGr8EwgrBU9fKjgd26A3lXHF/RcgYAZtD5BQeOS2uEtDqhL/50k4aR43/4Wap
         rKSp2RHxIh3CbPnhRQ7tH8upoAuXkEhAV8bBIolnCf1p8b5VOl9d9gESmOG/1PLuurry
         tmkJutwleBamRfPW+Yvw/4ExcjM0OKnrUNzf48SQ04/GNd41nJUcwL54woZkdkKTczGZ
         WubA==
X-Gm-Message-State: AOAM5314kq0U419tvlyhQfV6u+pteViqfij1WLzf0nVjDuFDNQXDhSkf
        zxLBkPSU3d+qIGiUsukD+raGTw==
X-Google-Smtp-Source: ABdhPJxV1YhSckhNaETNVUzcFICOYgIeIzL0P7GqkFpNo8sOKp0GrBfISIqDVzY7He5aFMmfCGamtg==
X-Received: by 2002:a05:622a:28b:: with SMTP id z11mr53231851qtw.242.1641490302620;
        Thu, 06 Jan 2022 09:31:42 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id i21sm2126536qti.31.2022.01.06.09.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 09:31:42 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Patch v3 3/3] dt-bindings: thermal: Add sm8150 compatible string for LMh
Date:   Thu,  6 Jan 2022 12:31:38 -0500
Message-Id: <20220106173138.411097-4-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106173138.411097-1-thara.gopinath@linaro.org>
References: <20220106173138.411097-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Extend the LMh dt binding document to include compatible string
supporting sm8150 SoC.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index 289e9a845600..a9b7388ca9ac 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - qcom,sdm845-lmh
+      - qcom,sm8150-lmh
 
   reg:
     items:
-- 
2.25.1

