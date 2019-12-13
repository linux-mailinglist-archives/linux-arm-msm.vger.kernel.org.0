Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7116B11DD7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 06:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbfLMFPb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 00:15:31 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36622 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfLMFPb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 00:15:31 -0500
Received: by mail-pf1-f194.google.com with SMTP id x184so835743pfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 21:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sbtRF5Z/ahvzn5o3IzEj07oxQoWzK/KEBcmikz1JbyE=;
        b=qv/jt8f43rEwLuK1BFTbLJ6+7o81AFjtWlf+XZM7xlZwBjU9EBUULp3DRdj9EJK9Z9
         06ikCa5UM08SQuYnvHmK3+sw7A3H0LV3O/tK+l1pt8qZJYECSb/CVB0NMhXu0LpRjges
         Hcp/zUrZbNDCpH6zzp9K09QekhnyybPQDiFpT7araq+kSEDdK8EOM88EGRVpRJ3Hesgj
         /UqtSjB+11wk8uJHnMWKAemhrN7TRxTO7LFDtAGjgcKmfKAo3MM2wmue9hj1BJiZJSX0
         UZ43UUdDl5X5zkpgXboMTGLHNoI6D2jxZqAyPltbbrdmSsghbopCvYRSdYaII7uzpAk1
         brfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sbtRF5Z/ahvzn5o3IzEj07oxQoWzK/KEBcmikz1JbyE=;
        b=OPCsr+5nJ3Nj2Zc5wRh+o7RkgpHS0qYVJi+HuPFujMfm2675Z00wRzgUZ4i2WoNkMd
         yZygVUQS88/aXNtxg2TgLQxYE0DF3N/XqCgaAyZPq6zh1rl6XDIRg4PmY2PqJP3K0qi7
         Hfn4NScaU8pxycsEoBlu2dBI6Mcml0qpmMWEVfqyYZd9Hrw0ExYyoydFyIW7Bh8he7Iu
         yObfU+BVpjw/SMbP/hvtjGZ0jcw8tsRjM00Hug8Q1OjOz80xb0t0z8omqMoWeWPdyvwr
         jqNjQqJg1j0BAsUVApqgabwFXa7YoSacK5pRkbLV69hwrIcQgDcceI62CAbWw0JV/ooF
         PRPw==
X-Gm-Message-State: APjAAAXLnFC4KJ95400iCxKxFWXbUoCr59WpxG3DP2+xydsHFkTsqTgL
        +vCFCdboxbSITImfXxB6LI5ZWg==
X-Google-Smtp-Source: APXvYqz4mcMJPzEzQy+4uDs1ARiJPCs9zpMbJF88wbt3IB15kjw36q8O8qDdJCEoFMY3p8+32Lw/iQ==
X-Received: by 2002:a63:134e:: with SMTP id 14mr15121570pgt.115.1576214130322;
        Thu, 12 Dec 2019 21:15:30 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s15sm8475987pgq.4.2019.12.12.21.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 21:15:29 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: mdt_loader: Support firmware without hash segment
Date:   Thu, 12 Dec 2019 21:15:25 -0800
Message-Id: <20191213051525.3688682-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At least some of the firmware found on 8974 does not follow the typical
scheme of having a non-loadable hash segment directly following the ELF
header, in the modem mdt.

Rather than failing the read of metadata, fall back to passing back a
copy of the full first firmware file and let the metadata validator do
its job.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 24cd193dec55..dd8a27f866db 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -99,7 +99,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 		return ERR_PTR(-EINVAL);
 
 	if (phdrs[0].p_type == PT_LOAD || phdrs[1].p_type == PT_LOAD)
-		return ERR_PTR(-EINVAL);
+		goto return_fw_copy;
 
 	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
 		return ERR_PTR(-EINVAL);
@@ -123,6 +123,18 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
 	*data_len = ehdr_size + hash_size;
 
 	return data;
+
+return_fw_copy:
+	/*
+	 * Some older firmware (e.g. on 8974) doesn't have a hash segment
+	 * following the ELF header, just return a verbatim copy of the
+	 * fw->data and let the metadata authenticator consume what it needs.
+	 */
+	data = kmemdup(fw->data, fw->size, GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+	*data_len = fw->size;
+	return data;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
 
-- 
2.23.0

