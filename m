Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225196BB8F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 17:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbjCOQCt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 12:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232922AbjCOQCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 12:02:32 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D527FD47
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:02:11 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id b20so12013053pfo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678896125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/Lsu5smiLBa9MSeSGWc1WGcnC/b/RQv3FtSyR7SFF4=;
        b=FgJU1ov+oT6SE1jCig02atP/jcu4Ky1MMsOM1FlYtRFqjFVv1R2X91E1B44pRjXW72
         XhwL0NdpyrC/pI+RXSlf95HXcW8FZRLXMJvbW095TirxYMv9dn82SCbbwVxemSNiD/UJ
         wEUkY7Es/JycBM9us9jPaOGcr5gxd/LjDtcHOJoWcaYOrtbtZ8yGFv4wVNovau9zv+lL
         aig8HVp6iirjZRsa68QqeoY5AlsnNaTFt4V/SUJGYxBSBqdC2y0gERpwZbTs3cf6xrB+
         33qpxOA2kyoPaGaXl9pYnlk4SNmgJSZgRvFMuemLaa2Jj+8+UeSprGD6JFiAbjqwXAmj
         PSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/Lsu5smiLBa9MSeSGWc1WGcnC/b/RQv3FtSyR7SFF4=;
        b=QXeHsy8/gcDR7eor2iN3Xww6ydU9DcOzRxyc+iI73NJ2R4FK6DEVMERgb1kYnbWH40
         FuqGF9ADsH6IwBa1fpZx94vwroxFc+puzHTD0vQo2w/TAVG0jQIIkaiqqoAe1cFHF2Ot
         06HdMczBnRGdYkhxBMSGYEFGntTdcU2QcqlhYn9NgYptTq34wnfag4fjNpodhqliOX/7
         21qbtDbvbq5rjlVcc5YtDVy6dvfN+4weNInjKrNupsiup8sqDfVjtDHYY3SN0j1PWY07
         3gc51/h1xO7aMw6/AEd+yQOUJ32ryJNl+Rj5hN9lCtPZNDVqSdKwvKug8Q3LDNXGsgdL
         9cCA==
X-Gm-Message-State: AO0yUKUnjxMJ+E+YmkM36oPHoPxNr1ecQ5Z1icqDvn9GFjUXrquOdoMo
        Svpz9ODajJP+BpFDD79FBo2oPzMCa5kq5mCSesg=
X-Google-Smtp-Source: AK7set8Z4HGNMWRt5GVuA9st6blRtNG8gAmAR6OHCAZyk1xzCzctYdB2+DaMPJ97/T59reoxXbfTbg==
X-Received: by 2002:a62:64c9:0:b0:5aa:4db8:9ab1 with SMTP id y192-20020a6264c9000000b005aa4db89ab1mr4981pfb.23.1678896125274;
        Wed, 15 Mar 2023 09:02:05 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:1acb:9af6:bd7f:78e7:7ae6])
        by smtp.gmail.com with ESMTPSA id o1-20020a655bc1000000b00502dc899394sm3457170pgr.66.2023.03.15.09.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:02:04 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add IDs for QRB4210
Date:   Wed, 15 Mar 2023 21:31:50 +0530
Message-Id: <20230315160151.2166861-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315160151.2166861-1-bhupesh.sharma@linaro.org>
References: <20230315160151.2166861-1-bhupesh.sharma@linaro.org>
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

Add the ID for QRB4210 variant.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index c3c078a8c0dab..6bfd35e00c5fa 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -229,6 +229,7 @@
 #define QCOM_ID_SC7180P			495
 #define QCOM_ID_SM6375			507
 #define QCOM_ID_SM8550			519
+#define QCOM_ID_QRB4210			523
 #define QCOM_ID_SA8775P			534
 #define QCOM_ID_QRU1000			539
 #define QCOM_ID_QDU1000			545
-- 
2.38.1

