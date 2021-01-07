Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B0C2EE9F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 00:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729432AbhAGXvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 18:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729005AbhAGXvM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 18:51:12 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B96C0612F5
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jan 2021 15:50:31 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id q25so8045796otn.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jan 2021 15:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqN+liZ8bQOGKYLOo+A64hpDDNU7IHxrgUmkHKS7+20=;
        b=vnc0LMRTF59D+KMFH856gCjA9A/mEA6GmOSoE3AUIRX+Uu0jbIGUfFKSwfGAjT6NWE
         wFR/lBAfTeQ4Ul+DC7gjtKNriSjPGwaDe8St6FKwMMtaREuIWOWTXNYlP2yNccu6yROP
         6K73NL+U4CdmCrUKalYG9xHVfE9CY0ynRCaEtcAOYMdKG4X3iGvNqvL8Zby6fYaU/LTL
         mDlkcuhcj883kNn9NVyNJYk6s9oYQ/O8wLc0MKnMQ8IRUPpscSxcfYy2njpuJyJOdxun
         4o5rL97dfUlyfrJl8UH+IMBDXpgz7l2kNdu3zfPrYsLQlVf1BGt0Nvb7dI9ngbqBF9JW
         2+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqN+liZ8bQOGKYLOo+A64hpDDNU7IHxrgUmkHKS7+20=;
        b=ZMZzA19Nfj7M8B7VoNaaX24b4Mor+gRUewz4jDJWd5+6imjb0MqzA0ReI9Q5vdW3K0
         6EG7SxF65IJZUMIISaes2dHbsEDpI7Iv9wcfwZ5fnS0DoOJdTUfhJzx08NaFWFSVejn9
         hs1DWGWpQuvdKG8FfMDpMr0xCxRbYTOVXKYQzUgGuOApjAAVmB5tL+bSiQj/NdFNHsnL
         xVok336NOCtQMN7qZW1vKg98r6HzIU+nYw5xC34OcNrjvYO3EmCpt3V6E7k1wwwgPVg7
         k3SrAXONq1q5GdcviXSuDeehQoRGAH/Tbi8wtaf6vIjDbGiT1Y3nwVZtVUZ1dwNyHQ8a
         Pm3A==
X-Gm-Message-State: AOAM532BqqtmhJuFE5ze4oyngzFobwbkGoP+cCuyJ6ivWeZg/XEHq0jg
        EuzuTINAukDGkzwS1a0L1ZE42g==
X-Google-Smtp-Source: ABdhPJz+5OZ9RlFYIXbkmJPStvwQ1ELiEsdLDm6xDRL2BPYhWWAJD2dgMsXw/Cv2KoI1Yu07I1kFiw==
X-Received: by 2002:a9d:7e8c:: with SMTP id m12mr734389otp.38.1610063431220;
        Thu, 07 Jan 2021 15:50:31 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v207sm1620439oif.58.2021.01.07.15.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 15:50:30 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF loader
Date:   Thu,  7 Jan 2021 15:50:53 -0800
Message-Id: <20210107235053.745888-1-bjorn.andersson@linaro.org>
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
 drivers/remoteproc/qcom_q6v5_mss.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 66106ba25ba3..2b59e0cbdce1 100644
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
+			break;
+		}
+
 		ptr = memremap(qproc->mpss_phys + offset, phdr->p_memsz, MEMREMAP_WC);
 		if (!ptr) {
 			dev_err(qproc->dev,
@@ -1241,6 +1249,15 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 				goto release_firmware;
 			}
 
+			if (seg_fw->size != phdr->p_filesz) {
+				dev_err(qproc->dev,
+					"failed to load segment %d from truncated file %s\n",
+					i, fw_name);
+				ret = -EINVAL;
+				memunmap(ptr);
+				break;
+			}
+
 			release_firmware(seg_fw);
 		}
 
-- 
2.29.2

