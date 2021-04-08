Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F3F358AC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbhDHRFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbhDHRFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:05:36 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B590FC061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:05:24 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id d5-20020a17090a2a45b029014d934553c4so2585444pjg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KN4LU6k0DDNtB1tTf++h2CYThhSstL5XVO+zCntug+s=;
        b=s8bMWKPRweagGjIdIt4CPbxE7dEHVwxb2IkFrTXDK1uw/gKkyB3t2grQ8rpauRBNVY
         rQ7Y3FFr7HZ52e/lVDfzfMzP5zBmu+BVsG/+D1MpwfthofMYo88twkfK7J3xxs4UcZ3B
         4Vj6H7ujzrN/J6qRPdyuG0SbBxnO+GJMyRB8KuWPp9I5mShfI7AxVRRpdot1KOVC8O91
         KSHw7Wo+tZbmoR63/kvYba13T2XyHyritv48oKa3S0sr6zFUyOnpPGxEfyBIsOi9HRsu
         frEzU9GYTjmz1pjf1NX2zxWGxTFTOewj052IcE9TUhxXfPWUHa1/uFYbndbR1XAWILVa
         MLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KN4LU6k0DDNtB1tTf++h2CYThhSstL5XVO+zCntug+s=;
        b=fAVVBNGciAY30Jd9vz2uVpxMSIczstnv3jR3VhQDQ0DQ8UtjPaLVSM9wPdkNfPiq/6
         m95kavvjdH1+SoBRvKiSvPVRXLZFjGGX9+Gm3pUDijtYyU2jEEp+esyhVtHe4ry0qys7
         TvseKkB50V0B3LS2PoznSJEHye7ff3D8RbG8wDAsWcfNh0vrPAVvNre1+PhplYQ4eS2G
         vvGVnAcBW2Mn73nPMd/12hRZLajKkcQjG9fCfsuwcdyBrURiQyqn4Ltlaq388RxTdPon
         wDDoD/QlQDc6lbyaAU0dQQGI7dsP+CL3Vkt9JIs9dMsRC2LVlqVo7FwB7okV/Cfl8tpc
         7/zg==
X-Gm-Message-State: AOAM531IYL5yrO7XkfYdOSBn48TuMIIqmZy7MpSiBtD8uV/YqJThNmqH
        PmTVJKDACio1aKl0+XoKe2B7
X-Google-Smtp-Source: ABdhPJxrgISlc62IX4IrrCXEuOeSApRtkwb7Vy+9D9YjAnW51sMkUa217juGyd07cataj8BahgKN2A==
X-Received: by 2002:a17:902:9a98:b029:e6:faf5:8196 with SMTP id w24-20020a1709029a98b02900e6faf58196mr8612088plp.23.1617901524203;
        Thu, 08 Apr 2021 10:05:24 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id y194sm65183pfb.21.2021.04.08.10.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:05:23 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 06/15] dt-bindings: firmware: scm: Add compatible for SDX55
Date:   Thu,  8 Apr 2021 22:34:48 +0530
Message-Id: <20210408170457.91409-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree compatible for SCM present in SDX55 platform.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index a884955f861e..10281ae6e1b6 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -21,6 +21,7 @@ Required properties:
  * "qcom,scm-msm8998"
  * "qcom,scm-sc7180"
  * "qcom,scm-sdm845"
+ * "qcom,scm-sdx55"
  * "qcom,scm-sm8150"
  * "qcom,scm-sm8250"
  * "qcom,scm-sm8350"
-- 
2.25.1

