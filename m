Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E622623FE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 11:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbiKJKdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 05:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbiKJKdy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 05:33:54 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6AB65E73
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 02:33:52 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id p8so2325625lfu.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 02:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf0KxYjTQhZ9cbNoU3M+UcqCiaOWtVYPcdD8LAR9jPA=;
        b=lu23DnalQprjxAyWG5D5mwMIRPL8gyolzgf1Cz8Ywhtwb1kCOS3l7G7vjImGhjC4AR
         RsNBCJaRyC0+tyQcWteG+UK5yisKD38kGnFF6ejmPoyPZPmNzyG4remuY5NlU3ELtlDn
         jOXD4jV2/j/4Nc/UcpmsJnrFHWk90OkdUrCyP4mCKRC2OWf0yu51hlSux2fBJgTmcDBJ
         CeusdkY0sahe+VDgdbVt84knnwpSUsTJq4sLNV34RYSrewi8Dnq+4Kv0tC7mTeHHo7od
         nrFZml2PyCGC95QxcXnHsk3pEC3GJ5rEvVSgwgmz/Ei1cIgB575GfaQAj3iBm7EZEsul
         YJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mf0KxYjTQhZ9cbNoU3M+UcqCiaOWtVYPcdD8LAR9jPA=;
        b=hnRgO8H+KOXySb+y/1D6ma54huKtCEUBnw/+ed1LoC8Up0bpFhh6ZzZaUNZNW4Ylu4
         4zJdOxJM/LMJeD+AqHkY+T/hLjV96cwBbIhyur4Jy/gb+FahejsSNYhWdRL193QXzBgI
         mxNuK+2MJDeUByXebmmK5wsQ+21OmfnFQVCFseX4xnk2QJs+5k817HNIm7O8FIOANrJa
         yKuep3lLdFSX6aDYlchqNp2SpivlDywix1CCu6VqmcoSE2GNqEsFaCrPxMjeiY8JOGy0
         cA9/TA2BXxKbybJW28bAiByoXEZOT6ZGfVSO/1AMBd/xTLtyntQ34IACRd3LF6UGlsCw
         P7sw==
X-Gm-Message-State: ACrzQf3isnWaZ68coWeaMuuy0zkjqmZsBcGFbOdNdnssBq36tysGPLOT
        MvEZZm5Gj6exeC3C2UzgYmEqXA==
X-Google-Smtp-Source: AMsMyM4Hpxo68V74qfwDOYRU6oHVklleTfTFoyqHjkRmalObtuUCGjJKG2F2AhosxDXwNLTR8STMYw==
X-Received: by 2002:ac2:58e3:0:b0:4b0:fa45:9423 with SMTP id v3-20020ac258e3000000b004b0fa459423mr1375372lfo.154.1668076430517;
        Thu, 10 Nov 2022 02:33:50 -0800 (PST)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id p22-20020ac246d6000000b00498f32ae907sm2687837lfo.95.2022.11.10.02.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:33:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 3/8] PCI: qcom: Add support for SM8350
Date:   Thu, 10 Nov 2022 13:33:40 +0300
Message-Id: <20221110103345.729018-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110103345.729018-1-dmitry.baryshkov@linaro.org>
References: <20221110103345.729018-1-dmitry.baryshkov@linaro.org>
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

Add support for the PCIe host on Qualcomm SM8350 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 7db94a22238d..3404c737afba 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1750,6 +1750,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sdm845", .data = &cfg_2_7_0 },
 	{ .compatible = "qcom,pcie-sm8150", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8250", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,pcie-sm8350", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ }
-- 
2.35.1

