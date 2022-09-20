Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96415BDA0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 04:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiITCTu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 22:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiITCTt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 22:19:49 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231ED6543;
        Mon, 19 Sep 2022 19:19:48 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id b23so1158304iof.2;
        Mon, 19 Sep 2022 19:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LwDIv/YhxguILfEJll0VukHNzzLchDu03ycarI8+xGc=;
        b=CKwOvXNb/tqfeds0+whEO9hyhhN7IA4No+r6GlE4Rd1gmUmRtjo2AjifRWN7MqC+fS
         uth3p/gV0XNSs+/CmrDQWWJeliHCT5rJLZK6NXJDAL8o1nWeVKNQ2ZAsZ2ISdtNx6mf0
         MH5Te+al26KOSK+jKpvD0ZNIq93r/wNFhsqNDprlAItFPv1ibCUQNoXNcEXuT7I1rYKa
         vzmsNyqUy4Mu5iiw05eqp3par4USeBVFJChOFMVjqfMXtnA6Al6NiOon3pXQdBd1vWt8
         XCvc/scnzKYIl/Tiod4EuqORIOt+OdH4el9Nytle/N82Jlcr8f02L9gCEU5+sbaGhfKN
         XecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LwDIv/YhxguILfEJll0VukHNzzLchDu03ycarI8+xGc=;
        b=mbu9ls90l68D6SW9QxrrCJ2n0xlXbAIC9UXiwDF2p2IXD93KnGV+mP/9zsilT3epeH
         wvK6OU8ECt+ScaajQGBZ11NEYbkufj5jDgUrslg7V+5VOAej3nKB+ZG9Mb+APC0RY6FH
         1tYvQmCSYv2AGdZbDfoEkTmApoi/YO5AXcR/MilnYc88AdriwtMEhQPSMUYeUdPfprJy
         Y5F/hlecWA9KV3hJLDKPEJ2GUv9K8KBupxzH7AZ055EkgS+PsZHIfCEF9V0jXUwzySSG
         Jt2avDFV4p+OMonOfs+GxuGN8I5O9R7caZX0owvLpaY0M3v9a1NLadW1ajHpCWZpR9Xi
         nLyQ==
X-Gm-Message-State: ACrzQf2Cbc/2ptPLbl/lIIglIxgmI+Iyte+l/XtVBX8hTyViQRY6DtvJ
        K36DV03xoMRnr6F2Hy2EdzNq96pPZPM=
X-Google-Smtp-Source: AMsMyM6pjQ1HbP5xUjobzX2jtpgRu+SsdbF8liyz2s6n+Mz+n1N87Eh5+xpgMMTGEX/itXg30/DYSA==
X-Received: by 2002:a05:6638:264d:b0:358:5fee:ec91 with SMTP id n13-20020a056638264d00b003585feeec91mr9559770jat.41.1663640387334;
        Mon, 19 Sep 2022 19:19:47 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::58d4])
        by smtp.gmail.com with UTF8SMTPSA id a15-20020a921a0f000000b002f5d9f49852sm191597ila.14.2022.09.19.19.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:19:46 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: rpmhpd: add sdm670 power domains
Date:   Mon, 19 Sep 2022 22:19:28 -0400
Message-Id: <20220920021927.2489-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920021927.2489-1-mailingradian@gmail.com>
References: <20220920021927.2489-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 has similar power domains to SDM845 but no EBI power
domain. Add a new array for them to avoid requesting a power domain which
is unsupported by the hardware.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/soc/qcom/rpmhpd.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 092f6ab09acf..319a2cf7e694 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -210,6 +210,23 @@ static const struct rpmhpd_desc sa8540p_desc = {
 	.num_pds = ARRAY_SIZE(sa8540p_rpmhpds),
 };
 
+/* SDM670 RPMH powerdomains */
+static struct rpmhpd *sdm670_rpmhpds[] = {
+	[SDM670_CX] = &cx_w_mx_parent,
+	[SDM670_CX_AO] = &cx_ao_w_mx_parent,
+	[SDM670_GFX] = &gfx,
+	[SDM670_LCX] = &lcx,
+	[SDM670_LMX] = &lmx,
+	[SDM670_MSS] = &mss,
+	[SDM670_MX] = &mx,
+	[SDM670_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc sdm670_desc = {
+	.rpmhpds = sdm670_rpmhpds,
+	.num_pds = ARRAY_SIZE(sdm670_rpmhpds),
+};
+
 /* SDM845 RPMH powerdomains */
 static struct rpmhpd *sdm845_rpmhpds[] = {
 	[SDM845_CX] = &cx_w_mx_parent,
@@ -435,6 +452,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sc7280-rpmhpd", .data = &sc7280_desc },
 	{ .compatible = "qcom,sc8180x-rpmhpd", .data = &sc8180x_desc },
 	{ .compatible = "qcom,sc8280xp-rpmhpd", .data = &sc8280xp_desc },
+	{ .compatible = "qcom,sdm670-rpmhpd", .data = &sdm670_desc },
 	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
 	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
 	{ .compatible = "qcom,sdx65-rpmhpd", .data = &sdx65_desc},
-- 
2.37.3

