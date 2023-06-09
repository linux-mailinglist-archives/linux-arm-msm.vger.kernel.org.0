Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD5F172A467
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 22:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbjFIUUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 16:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbjFIUTr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 16:19:47 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FD33AB7
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 13:19:28 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f640e48bc3so2741058e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 13:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686341966; x=1688933966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snY4D3sGE1e7ie+yqodjXNQjLORoB4Le2XvDi4Nyvxs=;
        b=J/RvT53uKn81vykyxRc/xqktVn+5kbRkxfAwPc3YFPQllMKtM8FwnD9rhWA+pKWMLc
         K6vNow2B1biKhSir8swIoykglJ/4/pRA1vuxpLIQpJXpCESq8MVIc8q9QM7AYit+k1Gl
         IM4sm9QPRSlqYKpeLTvJJH2jkdUnjTIzmPiLU0OcoPTmEYbRFBUwkT2zZvZ6GlBiJ5fP
         UuckAZoBRTsulr/bGdr9jRvBlkv1XVWmTZRVeDGKelUEyrRu9FUosiwxYx61706J3u5F
         cgIqBVdfMBvFmTUhZ0gIhVtTSRJ1vndn7uLUputE+KlwGFXwbgullw9VOOIRb6xhbgA+
         ecGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686341966; x=1688933966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snY4D3sGE1e7ie+yqodjXNQjLORoB4Le2XvDi4Nyvxs=;
        b=giEfmeP6qwoI6uYoV8tZrVurTkJpuz1zAJ/mRgASJR2dr6ip0r9gLFL4NHVQRCq5sE
         9ERBIGlCTcbIEmCGamtaZvDh7JPTdViRvChLY1TUWOxsIkgrLmRVx8wy9a3sM3Q+D8Eq
         vmCO6GJ0q1iR4MbswV2EQhH4opZhHjPf64KETo5pcDxN5w5REGmsCK9SFD6eB1ua2DXY
         rIrQLSAAyH6Y8uGMFtqaYtkp2cXiTRCNlN35/Hso0W8o6UoQtR38pp+fYmnTU7kz8aU0
         qX1eaU7po17jovCNohxBq7Qq+dZoic+IQX6wwZIpXQsGTnU9u+vp9jaftRjZ2tkps9w/
         vblA==
X-Gm-Message-State: AC+VfDxJuxW3yvJLvVeXNh1WkFo++ZpWyfrdbE5qttLWsniZixljhNJm
        Tp6w0kC3L3B448jpqX6xZQOAcA==
X-Google-Smtp-Source: ACHHUZ4YG2m0AHWBroKJD4DK0DBjSY287zay8B88MMNwM9MQKxSfGkbCLkA2SNWs7kqpkmSPaOdZKQ==
X-Received: by 2002:ac2:5b11:0:b0:4f1:dcd2:ab6d with SMTP id v17-20020ac25b11000000b004f1dcd2ab6dmr1817826lfn.28.1686341966681;
        Fri, 09 Jun 2023 13:19:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id b18-20020ac25632000000b004f628eb7884sm641349lff.232.2023.06.09.13.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:19:26 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 09 Jun 2023 22:19:14 +0200
Subject: [PATCH v2 09/22] interconnect: qcom: Add missing headers in
 icc-rpm.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v2-9-e5934b07d813@linaro.org>
References: <20230526-topic-smd_icc-v2-0-e5934b07d813@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v2-0-e5934b07d813@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686341953; l=801;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FNDzStoIOSOrT5/ip8w/4v5ja9884ytJ2coU8jem68w=;
 b=hBGidsDhfmmwmmVYnFNuJvcKCzPCRU3vIZ+rg2ySGtT8vqPooBiRp4rXSKIDR5MsBlDFKRoOT
 3W0QtIiT5uqCzs5cZoVFyYyO3g8IGtbS0lToJRRsP+3vr9CHHAWfed3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the header does not provide all the required dependencies.
Fix it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index aec192321411..057a1a8b3cb9 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -6,6 +6,8 @@
 #ifndef __DRIVERS_INTERCONNECT_QCOM_ICC_RPM_H
 #define __DRIVERS_INTERCONNECT_QCOM_ICC_RPM_H
 
+#include <linux/interconnect-provider.h>
+#include <linux/platform_device.h>
 #include <linux/soc/qcom/smd-rpm.h>
 
 #include <dt-bindings/interconnect/qcom,icc.h>

-- 
2.41.0

