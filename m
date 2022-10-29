Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9BB86123C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 16:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiJ2OTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 10:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiJ2OSQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 10:18:16 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC226053D
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 07:17:43 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id b185so7090709pfb.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgO0itPmS4SJd2mGNhvjlL5RdA1WKEDpldIzySFpulk=;
        b=MJjVSK83iQnWC3FbZ0ZRDQChEUVe7Bjq+6ETKYFya+P5BVO2U5HlxLoIznDcVbYRCE
         052c0Gg+Z8F1NLlmjjJ/EML2o3rf50w54gItVnczSvye8+/4hXacL7W3YQwsc7G+q/TH
         5b6VhYKuwG4PA6NQP+H6Q1HlxA0GA6NYcHI5MwhU/UtQo3jeuyn2UBD0AV+qJzNNea+W
         At3h3PJBxBk9Y8S1ITDbrlUA9KWQ8NsD8wadvohht4FIxeaMOATOCTcxltotD8HrGFBV
         mGcX6YeYnsD8U3F2mRb5Ft+/XdH40QE5aMI4Fd19w2oQFYiGj8QlRBKch/rBWP26ljRu
         vvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgO0itPmS4SJd2mGNhvjlL5RdA1WKEDpldIzySFpulk=;
        b=aW7xkomseBGFdFomqQW/wLi2qSt2gPV3V5zLlEdFqMuLYdBiMy45wKyv4crpFoaYIu
         aoJ8Y4Ql0MTxXOnHqJrrTOdyLUI+z0F4o90Ibjpgy3XwnIa720WJkWoBHEgc4SegpTtj
         bvTx4mgtZKpjEVAc/deXD73vPqyLgOs1zUTMKgYPl5eML90KHFDa6oRPG9lEcXeEEJwD
         Hp3Q9qyJiq+VrNZkc+dxFkLZGO0xFaN90pj3rqJPUUrDt8cPOSI07t+BKwEhy8JtEuyK
         kIBelUgIlZZD2xWptMJB7LaXgYB0k6a7tHgMFycSLodtyEwZkAYqcSyWjmKkDr+8BTG+
         zeCQ==
X-Gm-Message-State: ACrzQf09oXH2PD2tLCe4xQUyJgffx5gFRuEw8dovND57selAnyvn1MwR
        8GIc7PZ4AXaueLIbCzl1yUh+
X-Google-Smtp-Source: AMsMyM6D7Gjtv9H4nPResuFkUX3gQ9TEpK+Cg7QPFWtb8q21cNu2cDaoubgeYAXJKmtPC6giM806pQ==
X-Received: by 2002:a63:d60e:0:b0:46f:8979:30ba with SMTP id q14-20020a63d60e000000b0046f897930bamr1913693pgg.332.1667053062610;
        Sat, 29 Oct 2022 07:17:42 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.18])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001866049ddb1sm1370157plf.161.2022.10.29.07.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 07:17:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 11/15] scsi: ufs: ufs-qcom: Use dev_err_probe() for printing probe error
Date:   Sat, 29 Oct 2022 19:46:29 +0530
Message-Id: <20221029141633.295650-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
References: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
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

Make use of dev_err_probe() for printing the probe error.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8bb0f4415f1a..28ac5f0ab2bc 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1441,7 +1441,7 @@ static int ufs_qcom_probe(struct platform_device *pdev)
 	/* Perform generic probe */
 	err = ufshcd_pltfrm_init(pdev, &ufs_hba_qcom_vops);
 	if (err)
-		dev_err(dev, "ufshcd_pltfrm_init() failed %d\n", err);
+		dev_err_probe(dev, err, "ufshcd_pltfrm_init() failed\n");
 
 	return err;
 }
-- 
2.25.1

