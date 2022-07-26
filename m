Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36873581606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 17:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239538AbiGZPGg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 11:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239499AbiGZPGc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 11:06:32 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A575E12AF4
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 08:06:31 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m12so21991551lfj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zf+Atw6W9ce++rwB/xGOClK+4e2ERQWgmlZE86UF1IM=;
        b=t8jRIVH2Jgs+63JFHB6dXrvZFEi4zlLDp2OJE9G5VlXCyt7niyPHgamL8t76KtfPbw
         ORV+yASi4K3O4rC98H/5Q8urTjXwJyYMW7U/G1VXcjW6G6y5jIfaFjBwtTGcl41XioMv
         k0Iu8XmIVDipPe7xNofQ1BwQtDSIRhEeabl573mxEtZwqO/bo8buK/tsr44UPko2cJNa
         leibi2hTCXEEvnsqZsLDCGwh5hoKjx3F7r+e3gVS2JO6wrNzSJNFEVF99yDsYhoxvb6T
         sZiatvzgJvtdONXiNGJDDTTLH7yl4eLCDawH06MMHI3Fr2VDvJYHa2pE/7ALL/+5VpSe
         Tn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zf+Atw6W9ce++rwB/xGOClK+4e2ERQWgmlZE86UF1IM=;
        b=JATfRX9R9PRHsvpT3TCSs9koclMVIKusuCKJcbv9s837sjy4Wwg5FNOBdNnp/5wH0t
         MOOQN3XPB6gUxxM882M9jExmG0Jn68O8HtE9kre0fxkc6Nd3E32Xm72v3S388DmgpM57
         EueDNJequwIGauTK85DxsBmKMjp+CeM/vmNBimJ6K1UnbQADHpDVoy+SwXysaFU+z1JC
         6eZHZ8w63LaeEbJebGgc/cQVdHCz+rB5tCkPPv4iXAMdgZVAL4Xl97uTNGAYAzrysIu3
         UIYWBDJnDzT4IAAlcRXBTAtuR+H/e+QYynFmhvRyn1jG6EFDucxB85kuSgUiVQ1EMQ4l
         lj8Q==
X-Gm-Message-State: AJIora/7fWJ/RdEzijRZDqrH+LPJskI4R81jcT6JsF1zroomVovg03G2
        akV2VOLaIaSzMLCSwN4OU9M858yArcpGzA==
X-Google-Smtp-Source: AGRyM1taY4mwJsiQlIKI4aO7XHnTqlgPEIVbk1Oxa7W76jDrggoak906bc9JOjlPsftGTvndNx9vOA==
X-Received: by 2002:a05:6512:ea5:b0:48a:77a6:f9f with SMTP id bi37-20020a0565120ea500b0048a77a60f9fmr6214328lfb.60.1658847989774;
        Tue, 26 Jul 2022 08:06:29 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id a26-20020a194f5a000000b0048a95c16849sm836620lfk.282.2022.07.26.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 08:06:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/5] ARM: multi_v7_defconfig: enable more Qualcomm drivers
Date:   Tue, 26 Jul 2022 17:06:06 +0200
Message-Id: <20220726150609.140472-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726150609.140472-1-krzysztof.kozlowski@linaro.org>
References: <20220726150609.140472-1-krzysztof.kozlowski@linaro.org>
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

Enable Qualcomm drivers:
1. Command DB (used in SDX55 and SDX65).
2. On Chip Memory - OCMEM (used in MSM8974)
3. RPMh and RPMh Power domain (used in SDX55 and SDX65).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 5a5c772eedab..a23cdd352d23 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1070,9 +1070,13 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_RASPBERRYPI_POWER=y
+CONFIG_QCOM_COMMAND_DB=m
 CONFIG_QCOM_CPR=y
 CONFIG_QCOM_GSBI=y
+CONFIG_QCOM_OCMEM=m
 CONFIG_QCOM_RMTFS_MEM=m
+CONFIG_QCOM_RPMH=y
+CONFIG_QCOM_RPMHPD=y
 CONFIG_QCOM_RPMPD=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
-- 
2.34.1

