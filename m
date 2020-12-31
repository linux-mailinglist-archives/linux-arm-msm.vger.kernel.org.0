Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FCB2E7FE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 13:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgLaMZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 07:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgLaMZP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 07:25:15 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38524C06179E
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:24:04 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id l11so43832994lfg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=50YWbAm2z8JFqRwTF3PvDhtM81i1dEM3p4jr1MtmPig=;
        b=PXVKzo0T7Mph11Zl83nrk6DA/kopMT898iZtYT9ONiZdgROQcq+HD3DjLiQyxaX0Ab
         z0Q6e2yUTUfEe0fIQlC2DSDaLXYrMoroHGEkyLfyjvDvfBDqQprBTQZ6SZT69DQkMUup
         f2pIpsxAfNfiGjaucfZfgHzVEs/DCSYY6ygivFMtaGBEp54gmcRTI1EsCHmy8auX2EjQ
         lFr0itxVAfJ61NvJlkJ4fR1svLtIZ6YTSvxr+IcV0n96eDtOzIPNxOrKzDee3OYa/KON
         omiN8DcH0Z5Wx5uIK7a+II4CU9qjvVB+0GMUyNCgX7tspMrvWTcIupV29XdHiSzzU31l
         5PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=50YWbAm2z8JFqRwTF3PvDhtM81i1dEM3p4jr1MtmPig=;
        b=A4JHwzjyAt8aqJwLuqc/FJrxNdhA0B7vmWTI1BFv0qOqGt56xw5sORkRUsfnGbhpKA
         3ly9rErpUEmtIKZgtHQ/104F63j4u2oT4BFwrQFL7CpgIl1xEIWXqo8UCdJ7BoictVMc
         DmlCrUR1t4+IwtyeEK7UIoFLPCPqrqmu3NQKjKA1Iz47eIkh8RpWhZ9QRQhdZOkvWulV
         b18qN1iL1O2frnUpj8TideKlQOXjsA4HwW8YCGLxsQigJ+6LQAscgUBqQL3jwjOyBfTF
         fxY5sFymPycqT5/afkOEQqtP5XRg00UXW10NDQiUzkMHyScvojWEMFkfBpcsJuXHzFKU
         IKJQ==
X-Gm-Message-State: AOAM532J1GvbPSarn5L3dtMX8iYdcvbSBnh7YUGt+I4VI1o0a5zf0ZEG
        0Perka/ytu8/VYjl8j1cjnlCgA==
X-Google-Smtp-Source: ABdhPJx+TfN1rUj02in1TY0rQeJUD3WgK3bc6epu5SG0UmQyibtkyH/S1P0de8c54obgdUylFsLJnw==
X-Received: by 2002:a19:797:: with SMTP id 145mr23778136lfh.651.1609417442743;
        Thu, 31 Dec 2020 04:24:02 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id n10sm428569lji.99.2020.12.31.04.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 04:24:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: regulator: qcom,rpmh-regulator: add pm8009 revision
Date:   Thu, 31 Dec 2020 15:23:45 +0300
Message-Id: <20201231122348.637917-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
References: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PMIC pm8009 has special revision (P=1) made for sm8250 platform. The
major difference is the S2 regulator which supplies 0.95 V instead of
2.848V. Add special compatibility string for this chip revision.
The datasheet calls the chip just pm8009-1, so use the same name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index b8f0b7809c02..7d462b899473 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -44,6 +44,7 @@ First Level Nodes - PMIC
 	Definition: Must be one of below:
 		    "qcom,pm8005-rpmh-regulators"
 		    "qcom,pm8009-rpmh-regulators"
+		    "qcom,pm8009-1-rpmh-regulators"
 		    "qcom,pm8150-rpmh-regulators"
 		    "qcom,pm8150l-rpmh-regulators"
 		    "qcom,pm8350-rpmh-regulators"
-- 
2.29.2

