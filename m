Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA063399F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 00:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235783AbhCLXTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 18:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235780AbhCLXTA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 18:19:00 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AC7C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 15:19:00 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id d20so28504669oiw.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 15:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqvOzI2zLGFbJ4M0ftg4qd6WsZiHet0rFkxEAgLUmfE=;
        b=YT6UKyVuPLm4XGX36k0chID5JVFUTUm8zaC+8n0ONRpoHzG7rrb+CAtxz+dNj1/idI
         XZQ3hYQwvEsFIZYhB0FlM5dHlIWLS0AgfNLTQpqn08wjRutjktwcT7WWJAnTboSY672l
         vbmx9Kycbh/EUq+HLiM2n/3rWT6fas3Vn0KBlj1PM9u5QGwn6F1p09hvTB7gWbLESuIC
         pEfmxn9BGn0UCJXDhkyL/blBVSRPOPoS2a9JtHhLooOGF/8+tY1o+FW1OM3j65u2CIoE
         VSinbeu0oomzXzf0R+3MAxDWr/F1pCNDlik2l6Df+q7Fj1Wg4v0ScbwfV/S7pLkNjMbL
         U8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqvOzI2zLGFbJ4M0ftg4qd6WsZiHet0rFkxEAgLUmfE=;
        b=lqNHKHZu813qORelKsPVsODeDvt2JuDV3Ff7on0deOXtvhJpxqKCgy7YaDAXYbUAGv
         4fiYmBROmXcPcHC9S38Z3GdGYq2GsFcbylryFrDZsBp9K8vdwhYE/2bMXLNCw9rNVDNi
         Egb2feuS+tOMZa7hjw3ptBAA1Vvia4AW0OAxTe40c2RIngcBjLvrsaDonRvRB7Ynj++7
         KnWV1sBOOfCfrcrf90l++hJbIJF3CwHEhqu1sLJB2FTO7eoWx/Y3WTN3ff5Ht8DvLk+s
         XHF1zXZ64sOHMH13O7g8ewieYBQd2yzarqFGfvsAlQZZZaltSjujP1CQKumxu7yWihSn
         R9Og==
X-Gm-Message-State: AOAM532zZ6CR7oMiS7B8qY9KV5bRHWSrRQs8sMmDJ+R36JRfPH39fac9
        cBWLPy+F2pzhBMKdR9hPli4vvw==
X-Google-Smtp-Source: ABdhPJw/TE826y3cCk5GoSXdsaveulfLIV2FWeeDDqCYgmnOZpSqOXgwjmiPKrITASCSH4LmS2zi6Q==
X-Received: by 2002:aca:3cd5:: with SMTP id j204mr11413488oia.29.1615591140160;
        Fri, 12 Mar 2021 15:19:00 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a6sm2326663otq.79.2021.03.12.15.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 15:18:59 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF loader
Date:   Fri, 12 Mar 2021 15:20:02 -0800
Message-Id: <20210312232002.3466791-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Analog to the issue in the common mdt_loader code the MSS ELF loader
does not validate that p_filesz bytes will fit in the memory region and
that the loaded segments are not truncated. Fix this in the same way
as proposed for the mdt_loader.

Fixes: 135b9e8d1cd8 ("remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Don't just break the loop, goto release_firmware.
- Release seg_fw as well.

 drivers/remoteproc/qcom_q6v5_mss.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 66106ba25ba3..14e0ce5f18f5 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1210,6 +1210,14 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			goto release_firmware;
 		}
 
+		if (phdr->p_filesz > phdr->p_memsz) {
+			dev_err(qproc->dev,
+				"refusing to load segment %d with p_filesz > p_memsz\n",
+				i);
+			ret = -EINVAL;
+			goto release_firmware;
+		}
+
 		ptr = memremap(qproc->mpss_phys + offset, phdr->p_memsz, MEMREMAP_WC);
 		if (!ptr) {
 			dev_err(qproc->dev,
@@ -1241,6 +1249,16 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 				goto release_firmware;
 			}
 
+			if (seg_fw->size != phdr->p_filesz) {
+				dev_err(qproc->dev,
+					"failed to load segment %d from truncated file %s\n",
+					i, fw_name);
+				ret = -EINVAL;
+				release_firmware(seg_fw);
+				memunmap(ptr);
+				goto release_firmware;
+			}
+
 			release_firmware(seg_fw);
 		}
 
-- 
2.29.2

