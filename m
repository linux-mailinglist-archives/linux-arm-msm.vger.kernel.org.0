Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE30A781E20
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbjHTOZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjHTOZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:20 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FC02D5D
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:42 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bba74ddf1bso37139011fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541240; x=1693146040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUMR3LqJcxqZxpTo1E2SP3COlMrchmG5hYlUxy2vLhI=;
        b=qnumYkRMy5qjqNn91jKN25UnEPXHQG3fjXMmnvRFnsHQL1bGXU6j0EK7O5R3lhiRxs
         +TrrnufeDtMXTb4guljQcN7TwJ9iTTn+MccPtvrKDvrbq7hoOpo9tCLiRb5IlBV8bTIw
         eYWLqrBmqH+NXhipTNcpTc/QVy490kl7BPrLHm/fXzYNCCHNr1rYfero1f+PF76Bnz/x
         UkSVUp5KrChTwAH1vVtUQB6fq2M8DIbZbDmaDo3iVZadmU5JE2eHAzQpqYX/zxoiDeOE
         tRVCSWX0QUv/FauB9T4l21HhHrH4z2+D7xHdIK8lM+E11CD1XJuBk34eef99ZIikquRh
         23Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541240; x=1693146040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUMR3LqJcxqZxpTo1E2SP3COlMrchmG5hYlUxy2vLhI=;
        b=CCYz2yNxzEXte/zByOSS2V1MMwE7TJQDwSadkEUZFPHa0XaLfwtQM/C+BnG29AOev/
         G63dVDbWlR9zrhu+AoUZsmHgoD7PQJtI1A99T9J1FpwDyHPr1GEJ8+cE5agzk3ivoREr
         HypLKcb7XCX9U8O0bb9YhOnUR6NgMX9YMVFK94EW0ttoAEzu4X3QkzNiMRZcp4mifJBN
         zabwfWt2S54jQhj7AvyN+P4EONUyBXsyTq+VhEZ3qbUp67JzswTo3zPugc10Xllpx1sw
         nvXLBIzT0T3IpJA1sskial2vKFRSVUTc5waPo3NOV0rScRPbdm2EG5HHJ/L7GCA05RqB
         tfaQ==
X-Gm-Message-State: AOJu0Yy+tmMrXRJ9YP1OJLqwHkZOPckAGuVwVQuFTC3k+mugCdqX9kuD
        qHGZB5JiIqz8CsNnp1RwaSga5A==
X-Google-Smtp-Source: AGHT+IH9SBm8UHcwiZJ6hZkUq5f62BcCkWHDyWeTvgtXUbCl1CrVzCB/6GmGPVuFaN4xnmAlUYFBAw==
X-Received: by 2002:a2e:7019:0:b0:2b9:acad:b4b8 with SMTP id l25-20020a2e7019000000b002b9acadb4b8mr2948261ljc.52.1692541240124;
        Sun, 20 Aug 2023 07:20:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: [PATCH v3 03/18] phy: qcom-qmp-pcie: drop ln_shrd from v5_20 config
Date:   Sun, 20 Aug 2023 17:20:20 +0300
Message-Id: <20230820142035.89903-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no shared lane config for v5.20 PHYs, it is only present on
SM8550 gen4x2.

Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
Cc: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index e15ea113b2db..373f959e439d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2342,7 +2342,6 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
 	.rx		= 0x0200,
 	.tx2		= 0x0800,
 	.rx2		= 0x0a00,
-	.ln_shrd	= 0x0e00,
 };
 
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_30 = {
-- 
2.39.2

