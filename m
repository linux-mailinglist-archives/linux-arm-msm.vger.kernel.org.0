Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4719A50CAF7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 16:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235924AbiDWOF7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 10:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbiDWOF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 10:05:56 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D36926E4
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 07:02:56 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id h12so13286605plf.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eEjazlko42eSNmnFMsfNKIUK4vM64jjnmcAEak7jHi0=;
        b=iP9m10e793inlZ2ZLBtIFPZHMWtI5P//T8Xff/vqtRCW7j7MAYOviwwi1DCNvIrMfl
         eSHPprXTt0oI59HEy39Qb5eMsQ+JSR79yD+C/RjiKScG83UoQ/pxqdyo7HXx7K/4ynpG
         Ad5HvdD7u1flATXoWas0ch6pXnrnVHw0STu72l4OLViFqc1D++9rilTq9UV+D98bbqjz
         U89Ck/DaGj26Kh8BPIYpjbXMtvTxa10H/AoudlrxRFSn5DhmyEzDqi3TIqLTKzGjhf0u
         a7K/5N9Et1jKuwEnfX/0ouvMHKN4mRrZ6i53mbRlJaEtcUqN9Cp1lNXD/bxUsihOvfgK
         pwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eEjazlko42eSNmnFMsfNKIUK4vM64jjnmcAEak7jHi0=;
        b=O5nwdxMpdkYlBnV4/P7i47m6p7sy217xbNl2mrofZ+9BQaUa6F8cbK+AdN9i0CDw+l
         uflPagZNGUYPPXq/5db7oUf0einKSNBoqmSxQ9B5hPh9gvP/U7EyzgQTEjmkU/gnm09a
         Pe8jFIPJOE5aa3afT8DCDa+mUpxuEfQuunVjZQDY9rxdUlnAcMFGp8KfpSWmgzIiYFZZ
         m5dNCh42hKubei31JQoV7BuIdjkyOW2azD+ODJBC/MyzCUKFA7UOoGDDijs8vyuqoXkl
         LfL8k65jgqhXxu81YKaQuiec1pYxqjQXImAn5HszW9aWW5OFjAT50x4WU8JHZXDuCwsI
         2nLQ==
X-Gm-Message-State: AOAM533lCVTMW7yRtDguNQBGJ4aQdmtr67MW8M95NQ2N837DbRBnpzim
        4WaQFNd9ClWmO8mpPXbke/rL
X-Google-Smtp-Source: ABdhPJx1CdrSbre0YGZ3YHo3FGaMSmsHAG681BKNraCo512Pprq5EID44zMPrLsNu9TVMZ0r/BwAHg==
X-Received: by 2002:a17:90a:b10c:b0:1d9:49de:81c5 with SMTP id z12-20020a17090ab10c00b001d949de81c5mr1103994pjq.120.1650722575789;
        Sat, 23 Apr 2022 07:02:55 -0700 (PDT)
Received: from localhost.localdomain ([117.207.28.196])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090a390500b001cd4989ff50sm9452728pjb.23.2022.04.23.07.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 07:02:55 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com
Cc:     avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bvanassche@acm.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/5] Qcom UFS driver updates
Date:   Sat, 23 Apr 2022 19:32:40 +0530
Message-Id: <20220423140245.394092-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

 drivers/scsi/ufs/ufs-qcom.c | 44 ++++++++++++++-----------------------
 drivers/scsi/ufs/ufshcd.c   |  3 ---
 2 files changed, 16 insertions(+), 31 deletions(-)

-- 
2.25.1

