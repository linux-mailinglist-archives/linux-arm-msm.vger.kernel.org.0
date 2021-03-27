Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C216734B4E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 07:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhC0G5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 02:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbhC0G5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 02:57:00 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC75C0613AA;
        Fri, 26 Mar 2021 23:56:59 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id hq27so11646530ejc.9;
        Fri, 26 Mar 2021 23:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IZQev9x5PD4Mej3WmPU65tTBRQXE41t3yLBZixZyLgM=;
        b=hxRGMzUV7bCuKZqqFdbZD5reeRnjYjT93mMoXGLZ1TDsQtemfZA+MOLsBx5BbVw044
         PMiCbfOxScRy83ZkCxteXUJUoauRNHsYGXr1FC5A+AAH7nnWuEwGzGgwFTpIEVAEFyxC
         Dj+gNKr5NmoQsx38dluqEZcoW7DEjGqjFSfHCeugQ7+sObpZPJKRD5iFlfqq0nxhCcOv
         jsJlCsMxXRpUbU2eIniPn517WLToQyh1OyE8mWyPN67KO3/n4VS4mX/vcAAx45SjRMxV
         iMs2oM3Zlu2mVoTKoNQ9fAAfvVf6RAY41ZjQUBo4Q53b9u+DCXWXCEhV3uDas7+SJRol
         GDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IZQev9x5PD4Mej3WmPU65tTBRQXE41t3yLBZixZyLgM=;
        b=KJZADOlyadKq5vk9fnbRmkSeQ1serNkjEzCG0fw/3pD0IBRnw1OB/90R0P1qiuX04b
         dHGQt2HbKMQ5Akan74hHkcPVFop8ExtBpT85SqoKYIqex4OTD0m9K6wQRm1JVnPDdDCX
         znoi9CAHOOsiRdPq5GS4S5Mm8nW+ZSvt8napyRwnuaHqXvetw8AEu1D0J84pMUDFvf+Q
         cC1qATl60aMX2Rss5zh6XciJ7AvdW/JlDY07Al2Dc4Ilm8TpgjtLUgzMQ9VoAtYoK2ji
         RzJ5iMOcsdYZ+kJU1/iKOFztWpgjfA+MzrTQ+YCcNDoE4DtwhMYBW2X882M5vH6vxQql
         ZAyg==
X-Gm-Message-State: AOAM532ytyJEZ29CmtQl/xplSIBALAdUIRXU+2xkXSmLe87pywu++Gvt
        Kxcm8wlDD58gsi4H7ZnHONY=
X-Google-Smtp-Source: ABdhPJwoI6YqdDHESEsf8uUyHEYwPXjp2+DIKPW5XMTzrJM09onMY9dNqDILRbj6f9p3jZ9XfCgfoQ==
X-Received: by 2002:a17:907:204c:: with SMTP id pg12mr8551581ejb.225.1616828218239;
        Fri, 26 Mar 2021 23:56:58 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2de6:9900:7d51:74f6:ebfb:3cdc])
        by smtp.gmail.com with ESMTPSA id i11sm4774005ejc.101.2021.03.26.23.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 23:56:57 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 2/2] soc: qcom: address kernel-doc warnings
Date:   Sat, 27 Mar 2021 07:56:42 +0100
Message-Id: <20210327065642.11969-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210327065642.11969-1-lukas.bulwahn@gmail.com>
References: <20210327065642.11969-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The command:

  find ./include/linux/soc/qcom/ | xargs ./scripts/kernel-doc -none

reports:

  ./include/linux/soc/qcom/qmi.h:26: warning: cannot understand function prototype: 'struct qmi_header '
  ./include/linux/soc/qcom/qmi.h:101: warning: cannot understand function prototype: 'struct qmi_response_type_v01 '
  ./include/linux/soc/qcom/irq.h:19: warning: expecting prototype for QCOM specific IRQ domain flags that distinguishes the handling of wakeup(). Prototype was for IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP() instead
  ./include/linux/soc/qcom/apr.h:126: warning: Function parameter or member '__apr_driver' not described in 'module_apr_driver'
  ./include/linux/soc/qcom/apr.h:126: warning: Excess function parameter '__aprbus_driver' description in 'module_apr_driver'
  ./include/linux/soc/qcom/llcc-qcom.h:43: warning: cannot understand function prototype: 'struct llcc_slice_desc '
  ./include/linux/soc/qcom/llcc-qcom.h:60: warning: cannot understand function prototype: 'struct llcc_edac_reg_data '
  ./include/linux/soc/qcom/llcc-qcom.h:86: warning: cannot understand function prototype: 'struct llcc_drv_data '

Address all those warnings by:
  - prefixing kernel-doc descriptions for structs with the keyword 'struct',
  - turning a kernel-doc comment that does not follow the kernel-doc syntax
  into a normal comment, and
  - correcting a parameter name in a kernel-doc comment.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 include/linux/soc/qcom/apr.h       | 2 +-
 include/linux/soc/qcom/irq.h       | 2 +-
 include/linux/soc/qcom/llcc-qcom.h | 6 +++---
 include/linux/soc/qcom/qmi.h       | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 7f0bc3cf4d61..137f9f2ac4c3 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -113,7 +113,7 @@ void apr_driver_unregister(struct apr_driver *drv);
 
 /**
  * module_apr_driver() - Helper macro for registering a aprbus driver
- * @__aprbus_driver: aprbus_driver struct
+ * @__apr_driver: apr_driver struct
  *
  * Helper macro for aprbus drivers which do not do anything special in
  * module init/exit. This eliminates a lot of boilerplate. Each module
diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
index 9e1ece58e55b..72b9231e9fdd 100644
--- a/include/linux/soc/qcom/irq.h
+++ b/include/linux/soc/qcom/irq.h
@@ -7,7 +7,7 @@
 
 #define GPIO_NO_WAKE_IRQ	~0U
 
-/**
+/*
  * QCOM specific IRQ domain flags that distinguishes the handling of wakeup
  * capable interrupts by different interrupt controllers.
  *
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 64fc582ae415..437c9df13229 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -35,7 +35,7 @@
 #define LLCC_WRCACHE     31
 
 /**
- * llcc_slice_desc - Cache slice descriptor
+ * struct llcc_slice_desc - Cache slice descriptor
  * @slice_id: llcc slice id
  * @slice_size: Size allocated for the llcc slice
  */
@@ -45,7 +45,7 @@ struct llcc_slice_desc {
 };
 
 /**
- * llcc_edac_reg_data - llcc edac registers data for each error type
+ * struct llcc_edac_reg_data - llcc edac registers data for each error type
  * @name: Name of the error
  * @synd_reg: Syndrome register address
  * @count_status_reg: Status register address to read the error count
@@ -69,7 +69,7 @@ struct llcc_edac_reg_data {
 };
 
 /**
- * llcc_drv_data - Data associated with the llcc driver
+ * struct llcc_drv_data - Data associated with the llcc driver
  * @regmap: regmap associated with the llcc device
  * @bcast_regmap: regmap associated with llcc broadcast offset
  * @cfg: pointer to the data structure for slice configuration
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index e712f94b89fc..b1f80e756d2a 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -16,7 +16,7 @@
 struct socket;
 
 /**
- * qmi_header - wireformat header of QMI messages
+ * struct qmi_header - wireformat header of QMI messages
  * @type:	type of message
  * @txn_id:	transaction id
  * @msg_id:	message id
@@ -93,7 +93,7 @@ struct qmi_elem_info {
 #define QMI_ERR_NOT_SUPPORTED_V01		94
 
 /**
- * qmi_response_type_v01 - common response header (decoded)
+ * struct qmi_response_type_v01 - common response header (decoded)
  * @result:	result of the transaction
  * @error:	error value, when @result is QMI_RESULT_FAILURE_V01
  */
-- 
2.17.1

