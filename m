Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE7E519A1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 10:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346498AbiEDIp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 04:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346507AbiEDIp5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 04:45:57 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E772496B
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 01:42:22 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id g3so646555pgg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etgYlkH3k2xXRU0EPxeVLwk/8dv8OjRMpkT84HZHGoM=;
        b=z1AO52bLTWmTJ8A7Q6s3QcGmTgAdj0o7TNsqfNXXAmUq8DvJHiILWvfwru19sfhbJ5
         5cAdlKhpx7fcCGwB0UveWcFIV1wnkIm5wd1h75Lri4h6nIcwvKxR5YmE4oUuImB1M6ZV
         uoV39+ELAre9YhW4MTrmF4DrOHcTwBC+vKeDBcJHhXexd4MbifLsrKBESSl9ebyZhmWV
         +7b8O/Iv/k+g4Mlmkk896ZNWqK3g40oPPpy2yJ5DoRbYOC7+bpga7xskzruUIaojD/bv
         lLWVeTTOXZIsQCGNmQQ+6OrZAH9kkYCeRUz2kAKtKGljvKRAEvC/RFNUldjTFV/dI2mr
         lg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etgYlkH3k2xXRU0EPxeVLwk/8dv8OjRMpkT84HZHGoM=;
        b=PMln4ZhnVoXLNlTKpaUQF18d26BjCAqAlfQH08wR+TZXF8tiiq6uX/xvqT9Zo/oIIf
         LRX4RYFzMYeNYzeqmc83ZpTj8SzSlTzNzQLIJSR/yB3/iCHUppKy3rd0KGcUJlGI0SnI
         NFgn/BaiWekO7QKqiroHxmyRIlqGn6z37em5LUlW7LlQknwK3R8UN9mtoWhDpSpS7Sc/
         Gl2DOuFiyHg1NRtaO5V4wJuuKrBI9A9N8yL7+XXFrAufGmpaw1jj9oSRcUXWam21DHDx
         5yZWJZIyme8z8/3JYiXcGNKdgdppzzMbsncnXBWjgRUzBFRsz618W8En+hosT7XBpwiS
         bqSA==
X-Gm-Message-State: AOAM532F9tlmkIsDf+jQTRW4OtnzP2QZW5Eh39F9XZTBvd3NAM1NCLKO
        n1jZojXW5gYePvxT1Egkl1dU
X-Google-Smtp-Source: ABdhPJx49Z+kce5s/YOsUZbN8QNh0gOcYuyEbYmWwzEjaux7d1kzE1ne3dcS8k+Pyq/HTyfRJ9WQCg==
X-Received: by 2002:a05:6a00:298a:b0:50e:8e3:b673 with SMTP id cj10-20020a056a00298a00b0050e08e3b673mr7996582pfb.28.1651653741451;
        Wed, 04 May 2022 01:42:21 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.248])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b0015e8d4eb278sm1386561pla.194.2022.05.04.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:42:20 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com
Cc:     avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bvanassche@acm.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/5] Qcom UFS driver updates
Date:   Wed,  4 May 2022 14:12:07 +0530
Message-Id: <20220504084212.11605-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series has some cleanups and updates to the Qcom UFS driver. There
is also a patch that removes the redundant wmb() from
ufshcd_send_command() in ufshcd driver.

All these patches are tested on Qualcomm Robotics RB3 platform.

Thanks,
Mani

Changes in v3:

* Removed check for EPROBE_DEFER and used the return value from dev_err_probe
* Collected Reviewed-by and Acked-by tags

Changes in v2:

* Used dev_err_probe() instead of dev_err().
* Removed the wmb() from ufs_qcom_dev_ref_clk_ctrl() as that is not required.
* Added Reviewed-by tag from Bart for patch 4/5.

Manivannan Sadhasivam (5):
  scsi: ufs: qcom: Fix acquiring the optional reset control line
  scsi: ufs: qcom: Simplify handling of devm_phy_get()
  scsi: ufs: qcom: Add a readl() to make sure ref_clk gets enabled
  scsi: ufs: core: Remove redundant wmb() in ufshcd_send_command()
  scsi: ufs: qcom: Enable RPM_AUTOSUSPEND for runtime PM

 drivers/scsi/ufs/ufs-qcom.c | 45 +++++++++++++------------------------
 drivers/scsi/ufs/ufshcd.c   |  3 ---
 2 files changed, 15 insertions(+), 33 deletions(-)

-- 
2.25.1

