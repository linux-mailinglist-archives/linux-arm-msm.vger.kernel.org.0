Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4A42EE9CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 00:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729114AbhAGXf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 18:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729101AbhAGXf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 18:35:29 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD017C0612FF
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jan 2021 15:34:10 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id q5so8443856ilc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jan 2021 15:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xiaTitkw4KzTKWeohNq2UnqJT3ZfYyxC40xKZK6Dfz8=;
        b=CVTYFTud1QL63XEsmChmsUfOdQmb3nvZYMrbDXMQ/mlq25YO9zpkE/7e3HSxXsfBCN
         dwiPNAXZwyLkQq2HuV7KsoQathgYnBYPe6l+UBuOQ9zL/GqM5+/0JXIfs9ZRt8DCnLtH
         J8ZPSiujp/86QMWQksJQQhTa+92moAUXS55Ui/QVkNH5+Lp8dRGzhEmUKM8clgspln67
         1YLy9DJwwCBfUdkSwXCCBb4YGApVZ7KXauHAqTrwbHCRCjcovz3O8TshW2JD0VKxpLpG
         Nodc+RDcnItSz6qQ+oKHReSJHTeE0ZHF4UvxNCYh3phS2903Bqfbprq8CXBawwN9b0hl
         KAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xiaTitkw4KzTKWeohNq2UnqJT3ZfYyxC40xKZK6Dfz8=;
        b=sUggF2nb7BEOdvX8ZQGf9aX4gTjuafP1rn48UMSrHx1jkQJ0xyLR/6Oa959fGFE/Yv
         Q+zVjCUBe/rJNaF/fI5j1i7v2kTpz4x+QaFhvfDSqZDpQiKkNBVbO+tJhd1UX9fc116H
         pSgHHOp3rQb3pgqHnJsWEmctWiJFZfSlWfJDFtJLkZiX+9d6+VJDcOOKfe+WsipiR1kJ
         CT79EvhhmjgMITjdtN3Y2aCVEcvuHFxq7scr4aKQc3T04fz/1S3kALj1Xsdkh7PVhdnq
         yXA33VI4FJ972xeMEUPiEI3ongVXxzZ9DCgUmz9czWPf0ICpgMOGqc50+lbqoJ7D2uHk
         pMVQ==
X-Gm-Message-State: AOAM530NOguIfggBpucIJodA0ysYUtVl3OeRqFNoTC0ULzcRIsrJmoaK
        HZDN0PNf77mg9fsCIEoHAACl4CcOgyRcrw==
X-Google-Smtp-Source: ABdhPJxwf8C24X6AFWpLCk4TfPWDSqqQDj5m686UoGGcUyeMXiDxmCUmQLCrEnBx4fh63BSqTuO76g==
X-Received: by 2002:a05:6e02:1605:: with SMTP id t5mr1223825ilu.232.1610062450195;
        Thu, 07 Jan 2021 15:34:10 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o195sm5648521ila.38.2021.01.07.15.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 15:34:09 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     davem@davemloft.net, kuba@kernel.org, ohad@wizery.com,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/4] soc: qcom: mdt_loader: define stubs for COMPILE_TEST
Date:   Thu,  7 Jan 2021 17:34:02 -0600
Message-Id: <20210107233404.17030-3-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107233404.17030-1-elder@linaro.org>
References: <20210107233404.17030-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define stub functions for the exposed MDT functions in case
QCOM_MDT_LOADER is not configured.  This allows users of these
functions to link correctly for COMPILE_TEST builds without
QCOM_SCM enabled.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 include/linux/soc/qcom/mdt_loader.h | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index e600baec68253..afd47217996b0 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -11,6 +11,8 @@
 struct device;
 struct firmware;
 
+#if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
+
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  const char *fw_name, int pas_id, void *mem_region,
@@ -23,4 +25,37 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  phys_addr_t *reloc_base);
 void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len);
 
+#else /* !IS_ENABLED(CONFIG_QCOM_MDT_LOADER) */
+
+static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
+				const char *fw_name, int pas_id,
+				void *mem_region, phys_addr_t mem_phys,
+				size_t mem_size, phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_mdt_load_no_init(struct device *dev,
+					const struct firmware *fw,
+					const char *fw_name, int pas_id,
+					void *mem_region, phys_addr_t mem_phys,
+					size_t mem_size,
+					phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
+static inline void *qcom_mdt_read_metadata(const struct firmware *fw,
+					   size_t *data_len)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+#endif /* !IS_ENABLED(CONFIG_QCOM_MDT_LOADER) */
+
 #endif
-- 
2.20.1

