Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF9A7C00F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 17:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbjJJP7k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 11:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233673AbjJJP7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 11:59:38 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CB597
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 08:59:34 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-351574aca7bso19660055ab.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696953574; x=1697558374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XHRCY63hQtzpYUIBv5+mXIDtPmwcujXauM/JNVB8nw=;
        b=SDf7MCmQAEga71pshauObsxutTVz/eEpcgeWbSTX4ZcfhwDPBsfKPGDQYgjFXkDfhX
         A6mjI6wRkp1LfpNm2GTezfYQ7F967XhMFaK+8fCUN6rStRmb3QgtMjqBpp7RaqMeOMHy
         qY5sw2cfcHX+kLGtCU0SSw6kP+CD9GVwub+cMkoU5tGd2+4gRaI0KcetpEgTzh05RcH5
         7y39wsrrbEUr3WLU6fZ0wAu0psYY0hKw6xw1quZPVQeQlE7G+uD0nrLj/J6YvXEZM73W
         BkGpqw6haT22QcjsKOh0exh0caENmVwW3UGHHEUdbo3rFK+teUEKX95nzZAU3QGM1jDo
         lnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696953574; x=1697558374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XHRCY63hQtzpYUIBv5+mXIDtPmwcujXauM/JNVB8nw=;
        b=R3wZP7+SDMUsqytU3ZyS0OASAFwvpFy82i+HtBYMpKcvG0UW8zKAxs4Oux+8EmouQj
         ZLX4yMh0XqWdsQYa6y/iYvyjMKjfY1kfHZbRGVuk/jbhXzipYduzF2ynSdUaqzDouyaN
         BwPQ+q0vXTXi5m0qXmDf3sy+B9Q3KY1dn5EXo1MDJI75CoMQTRMLoujndKAOfGgVRZwI
         FYSTEMevefzORYrgSUnZg6dcK6lvxtMxnWcpXidd3KWuI+CVEhFyR5Jp2AOBuBSb9a4A
         DLtkneqXk/sSjT3/uMvLCSlC3mrQSxmrjSIFS/TIk1snxQeIAwyUzYawibzhD8+bHrEh
         2Pog==
X-Gm-Message-State: AOJu0Yx9/70z83yqwVxJkjaF06aPyhBrhhsLNkUCS0uLHrtCTT8gqhPY
        E3wlwID92fhZdro8epKKjnlH
X-Google-Smtp-Source: AGHT+IGk6lhfteareySKoKmtG0TR3ZpRvS2BBgEg1dkurU1opNq04IT4XZ1Vl0Lw4Y6MvCuF22L94A==
X-Received: by 2002:a05:6e02:ecc:b0:34f:c9b4:5f9c with SMTP id i12-20020a056e020ecc00b0034fc9b45f9cmr16813737ilk.31.1696953574071;
        Tue, 10 Oct 2023 08:59:34 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.234])
        by smtp.gmail.com with ESMTPSA id c24-20020a637258000000b0055c178a8df1sm6537023pgn.94.2023.10.10.08.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 08:59:33 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, gustavo.pimentel@synopsys.com,
        jingoohan1@gmail.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/2] PCI: dwc: Add host_post_init() callback
Date:   Tue, 10 Oct 2023 21:29:13 +0530
Message-Id: <20231010155914.9516-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010155914.9516-1-manivannan.sadhasivam@linaro.org>
References: <20231010155914.9516-1-manivannan.sadhasivam@linaro.org>
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

This callback can be used by the platform drivers to do configuration once
all the devices are scanned. Like changing LNKCTL of all downstream devices
to enable ASPM etc...

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 3 +++
 drivers/pci/controller/dwc/pcie-designware.h      | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index a7170fd0e847..7991f0e179b2 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -502,6 +502,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		goto err_stop_link;
 
+	if (pp->ops->host_post_init)
+		pp->ops->host_post_init(pp);
+
 	return 0;
 
 err_stop_link:
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ef0b2efa9f93..efb4d4754fc8 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -301,6 +301,7 @@ enum dw_pcie_ltssm {
 struct dw_pcie_host_ops {
 	int (*host_init)(struct dw_pcie_rp *pp);
 	void (*host_deinit)(struct dw_pcie_rp *pp);
+	void (*host_post_init)(struct dw_pcie_rp *pp);
 	int (*msi_host_init)(struct dw_pcie_rp *pp);
 	void (*pme_turn_off)(struct dw_pcie_rp *pp);
 };
-- 
2.25.1

