Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284A2291751
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Oct 2020 14:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgJRM01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Oct 2020 08:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgJRM00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Oct 2020 08:26:26 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5D3C0613CE;
        Sun, 18 Oct 2020 05:26:26 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q5so10012881wmq.0;
        Sun, 18 Oct 2020 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Asn000qPfTwhwp6yrG84nyQXiUO2Jao5C4/axSR8OuA=;
        b=ezeyncruhrPcpN8naqW6JdLbjmaBOZE3ctESlWubOL8aAk2/as5rGGv6cZ7P80ixl3
         O6oGCi6IM4ba2JZtvKHkyt/PNV5LxEd+WFm/QfQpeJKaSt21GKB5/3I5ZbqPD0WLtuIi
         p+3VEB8GBrHVCnd4FY6rKh3iFRyFrXyrVVylMJj9/PkPnN88tZqU0M6hWIPGUKt0jD2S
         ATt2oXnPVRA4KZOTp4hb2YH0nnYWqjTLgKNlZxwEIU1CirXefjrSH+SIkACnGBD3EsK2
         6hOY7gAsGX8qInBMeABGATlZVKbGoYBjpcdAPwt71HQmoZpoqjES6G50VDTQeFI7ALbu
         BoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Asn000qPfTwhwp6yrG84nyQXiUO2Jao5C4/axSR8OuA=;
        b=D7h4eschBMWjup/uTrxReFEZFj1w+hDu+KzFf62ZZSi6wScU7RdBTHcxn6R6RiFyM3
         O5SkLh2KgmbeD/1DrMKTyrk6r4sU6FEsAl2E6uqu6d7ztdsEDZZx4n5fv5yU/9elBg/k
         1wNjw2kzYIExLhn/uOJsSted+ed3hAESJVPQhhVHi9SFAxOMgkE6es3cok4eCqDpSu+1
         B7j61WlGMBkZ2FBMkM7SprE4lPE8VYzK1s1tufsHNC9E5qDmkkl6BIXOIps0rZdKE0iv
         DyBGz6yRapi3KngeMPUGWCMj6h9roygijs7nJmYnreTCpfWO6tjEmI4KAuMZIiWZeHFN
         zJuQ==
X-Gm-Message-State: AOAM531QG5l1nLKATd+bUVAfkCHyGG2iI2ZEHSud4/4/OuBSu4A5C8vl
        yy4dSmR0oyWKew3PKzAzKJAG7+EZRQ8OMrar
X-Google-Smtp-Source: ABdhPJwp2i7tumNk7hG+ad19PxESo4wbbrYEtA5XJO5GgLVi//KV6hHNsLkfRejsbmJtb/aofYmaRg==
X-Received: by 2002:a1c:a7c9:: with SMTP id q192mr3958061wme.117.1603023983641;
        Sun, 18 Oct 2020 05:26:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id 14sm11744400wmf.27.2020.10.18.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:26:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] soc: qcom: rpmpd: Add SDM660 power-domains
Date:   Sun, 18 Oct 2020 14:26:19 +0200
Message-Id: <20201018122620.9735-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Add the shared cx/mx and sensor sub-system's cx and mx
power-domains found on SDM660.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/soc/qcom/rpmpd.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index f2168e4259b2..0de40ac1b42c 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -220,11 +220,44 @@ static const struct rpmpd_desc qcs404_desc = {
 	.max_state = RPM_SMD_LEVEL_BINNING,
 };
 
+/* sdm660 RPM Power domains */
+DEFINE_RPMPD_PAIR(sdm660, vddcx, vddcx_ao, RWCX, LEVEL, 0);
+DEFINE_RPMPD_VFL(sdm660, vddcx_vfl, RWCX, 0);
+
+DEFINE_RPMPD_PAIR(sdm660, vddmx, vddmx_ao, RWMX, LEVEL, 0);
+DEFINE_RPMPD_VFL(sdm660, vddmx_vfl, RWMX, 0);
+
+DEFINE_RPMPD_LEVEL(sdm660, vdd_ssccx, RWLC, 0);
+DEFINE_RPMPD_VFL(sdm660, vdd_ssccx_vfl, RWLC, 0);
+
+DEFINE_RPMPD_LEVEL(sdm660, vdd_sscmx, RWLM, 0);
+DEFINE_RPMPD_VFL(sdm660, vdd_sscmx_vfl, RWLM, 0);
+
+static struct rpmpd *sdm660_rpmpds[] = {
+	[SDM660_VDDCX] =		&sdm660_vddcx,
+	[SDM660_VDDCX_AO] =		&sdm660_vddcx_ao,
+	[SDM660_VDDCX_VFL] =		&sdm660_vddcx_vfl,
+	[SDM660_VDDMX] =		&sdm660_vddmx,
+	[SDM660_VDDMX_AO] =		&sdm660_vddmx_ao,
+	[SDM660_VDDMX_VFL] =		&sdm660_vddmx_vfl,
+	[SDM660_SSCCX] =		&sdm660_vdd_ssccx,
+	[SDM660_SSCCX_VFL] =		&sdm660_vdd_ssccx_vfl,
+	[SDM660_SSCMX] =		&sdm660_vdd_sscmx,
+	[SDM660_SSCMX_VFL] =		&sdm660_vdd_sscmx_vfl,
+};
+
+static const struct rpmpd_desc sdm660_desc = {
+	.rpmpds = sdm660_rpmpds,
+	.num_pds = ARRAY_SIZE(sdm660_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO,
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
+	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpmpd_match_table);
-- 
2.28.0

