Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601BF2C8133
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgK3JkW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbgK3JkW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:40:22 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6A5C0613D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:42 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id iq13so987542pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kInwNk/ThkAgXZIESon1lxicNanN9RlxTXl9tfSYT+I=;
        b=TbxvAnphZq3cYNCJUbUtFa1AyiklRgh9V3eytXtB2+MA+N59i82/8p/I+nBhqtti1T
         RNU2DO1mimbxTOlaQzim0eVj7BADi81YK2EL6wstOmrGAsJo4dk3Bvzmq99H7Zwd8TLj
         VSs0xeFw+HctZm4ULD2HsYrN0v/69y3RciFhmGKmVPrBqdfPn0R0751GPAd+9q+xJ8s+
         ZBARmJf2tWBGzTSiEfy78rEiwREiUctT8BeaANW+pBQlMUTOlrUklql/6jyzUHefPZUS
         Fhy97hRnXxVmJZVzp4SWjnaIQ8Z+7AdO8HdN14QWx3L2szycP5/Be7DijwSmXKLrQp/g
         EDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kInwNk/ThkAgXZIESon1lxicNanN9RlxTXl9tfSYT+I=;
        b=lKcyPsgHfFVKHE56UIohTNZrE0H0P1hOSmSnpsAg7Z4WhLePQiqlekamI1c7Nu4kvu
         poDlZKpO2CPK3TdiGHZ0vih04UeIZ1E8LWTxU/AnVFiwYVGtg7O27cc59baNoTU5uanf
         dRvl54gmbZdXDW/daOY43EsYcuSx2v1SODoE/JyNXAf3GA3FfypFWGh2YnSSPwJuVrQ9
         9sEwAFoXCcZADodglcVYrzcxAXxeorMgMlBh2XuTfZT2x9JSI3YEH7Fe0QSySuv9RYhm
         sXvZrsXUJ8n22Fbp0z+sTuGSUEUHhZP3RXFiM8UCSh95bCHGbPT0TKPrDs/uXvh5qkpg
         l6PQ==
X-Gm-Message-State: AOAM532eMT/fh0y41cfOTSg4Xo96rN8fO4hdA5kSZkMqdx5Jakoo5Sop
        bD8/TqxwFWF3VchrJInTpP6U
X-Google-Smtp-Source: ABdhPJxtOi+SxptVYdB7IQ8Knkxu5SaOB+1NQsbA74i63is0pUSwmrRl0T5YNBgY9sHeErbFzHihzA==
X-Received: by 2002:a17:902:a9c7:b029:d6:da66:253c with SMTP id b7-20020a170902a9c7b02900d6da66253cmr18124185plr.19.1606729181717;
        Mon, 30 Nov 2020 01:39:41 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6c0d:98b:4016:605b:102d:cbb8])
        by smtp.gmail.com with ESMTPSA id u14sm16348429pfc.87.2020.11.30.01.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:39:41 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, saiprakash.ranjan@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: msm: Add LLCC for SM8250
Date:   Mon, 30 Nov 2020 15:09:21 +0530
Message-Id: <20201130093924.45057-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
References: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add LLCC compatible for SM8250 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index 0a9889debc7c..c299dc907f6c 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,sc7180-llcc
       - qcom,sdm845-llcc
       - qcom,sm8150-llcc
+      - qcom,sm8250-llcc
 
   reg:
     items:
-- 
2.25.1

