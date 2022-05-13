Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D19D5262C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 15:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380613AbiEMNRE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 09:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380615AbiEMNRC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 09:17:02 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFD765F9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:17:00 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu29so14567611lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E58QkXjEx+u+32umtNZ3ENARtSCSgYwXJPH8+EbS+fs=;
        b=bkPveqzFmD2s9BnSoPmLiACMv5BFmFr6AGIxFRN1SK4kyBa19KjPTlkpZz19wwRRN7
         XDTf1JDHmVValh5E+exOp38TPa3QdahmMZ6Dnls3iBll6UegR0PsNAI2ivWOfuj576Yv
         LArT4tdMn/VQQjYraSYYU730Z6XWpiOX69gqoAqdkPsVF4u/QZ+an8cZX1xCHbUiFic0
         oqrkwUJXa7bUiCfL6CEzsJHPTCk0dgBoC2VTkYIn8ej/4ZXuqVIGI2PnG9PZGv85OCbS
         8rUNheSyqCiMRDO7Z2Mfm5i/6Ta/SBueh1SR1M+/+xbXAPtbMhO4Cx3WRg4xW6UQ3H+U
         7PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E58QkXjEx+u+32umtNZ3ENARtSCSgYwXJPH8+EbS+fs=;
        b=TWt1urd0ZhDV0oSK/La0R+kb25WPn52SJIAKGYe/8ca6vsteDcGDaLZOhiA23yi4bE
         CEKGG2Zrnl06DEp3YcLo+babLWD/hpZbKmxWoOPvbm+ZQ0Gs8MoEkzQ8T+XAvopI6JKK
         By4c6VDBVzCh1wzWVF8OE7tjY4AUd3H1A2k7XvtTIAH1YRlyGBhkTmpQrbaOJOjZyZat
         Mi3exVQUpbJBYwNzgt+Eb3Dx0ACCvKAgjjZDlMW9sULopA/YcHLSYDhPNX4Eu1V2jJ74
         eywqrlgkfHWaA9vJkoFarn0m6a9kwOj8ZW01in/xw9wBgBJ7/sS0TvPOeo1Kp+6WviQ5
         bxRQ==
X-Gm-Message-State: AOAM532vsRqkLx1xuBFopeO1tplUZiCcu9ZCqE0KwG6dcYwyiZicuVUv
        XBJWPAQQa1eCenbtMfILBpNAzFy1QkDEiQ==
X-Google-Smtp-Source: ABdhPJybKQyqTenoquMxfGU84HmmJCqlI7TONfwTGeRoUvz0T0U6Z9WrRHma4nvwQucy0sW+BRjRYA==
X-Received: by 2002:ac2:44a7:0:b0:472:19b6:1f08 with SMTP id c7-20020ac244a7000000b0047219b61f08mr3440408lfm.266.1652447818830;
        Fri, 13 May 2022 06:16:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u22-20020a2ea176000000b0024f3d1dae8fsm436991ljl.23.2022.05.13.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 06:16:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v9 02/10] PCI: dwc: Propagate error from dma_mapping_error()
Date:   Fri, 13 May 2022 16:16:47 +0300
Message-Id: <20220513131655.2927616-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513131655.2927616-1-dmitry.baryshkov@linaro.org>
References: <20220513131655.2927616-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If dma mapping fails, dma_mapping_error() will return an error.
Propagate it to the dw_pcie_host_init() return value rather than
incorrectly returning 0 in this case.

Fixes: 07940c369a6b ("PCI: dwc: Fix MSI page leakage in suspend/resume")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 2fa86f32d964..a9a31e9e7b6e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -396,8 +396,9 @@ int dw_pcie_host_init(struct pcie_port *pp)
 						      sizeof(pp->msi_msg),
 						      DMA_FROM_DEVICE,
 						      DMA_ATTR_SKIP_CPU_SYNC);
-			if (dma_mapping_error(pci->dev, pp->msi_data)) {
-				dev_err(pci->dev, "Failed to map MSI data\n");
+			ret = dma_mapping_error(pci->dev, pp->msi_data);
+			if (ret) {
+				dev_err(pci->dev, "Failed to map MSI data: %d\n", ret);
 				pp->msi_data = 0;
 				goto err_free_msi;
 			}
-- 
2.35.1

