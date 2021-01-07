Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628B22EE9C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 00:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbhAGXbi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 18:31:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbhAGXbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 18:31:38 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2EDC0612F4
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jan 2021 15:30:58 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id d8so8022183otq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jan 2021 15:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KsP/yoJjwDCMt7N2rFKs08bZNh7p5m4IePfBuVMv1Fs=;
        b=JMHZY2LmE3U+Oohdp9zbT3pJlzo/L+Gjx1fUWP5xcs9Ot+CCkqKZplP26oMXqVqxzx
         zy4fTwkzEjfVpNHZZ74GnSJfUDBgdz2cvvuQTTW6pm7UPI9bUAyS2bY9BkSkkcXZDAL+
         p1tMDufQEy17xMcRWIMGmvFr7ePDIBrWZKpIXXl72tr7xu0fsdL5Ek/DnRKoYf2GhkjC
         qLmEDKI9rxLz13W0WQiP2XeCtb4rrUyEz08If4T1wCYd7pTLkKFVPQwSj34BSqQ3XJpf
         r1CPwZMRevWiOKu89FAUnu/tkWazEbmt2hlzLI+ZAjQbgVW5Cf19RMdwNz2LBvi8PssG
         U5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KsP/yoJjwDCMt7N2rFKs08bZNh7p5m4IePfBuVMv1Fs=;
        b=Z8Q4Xh7G9Wqpr09yys6HDj179kkAYODopTBShGbhFVgQKbrtqx0wQqJSeAcG3mrQmk
         5N0StQ9I5ryFhq1PWqq4HrvazEZJQUQzuVGcT0frZLHwql5frnXpALItSHE7QuEEJ7eY
         GXfZdpMipuJYY6+6MhPClejhj4wLeH3Wvpt2Mwi7wfhfom8Z1jE2z3zBe++JdwFhmMCV
         BWYBPyvB45e9IhnL2mh3XfNVUfrPw9V7Nyzm1yErcC5j2QRhPJ1ggYt4+3a77NLheZvS
         E5VchXJtZlur/Mt8o0rkfg92JV77/kPvOXs61F7koiedYIkxkDcMbcaQK4jAfXD4tgOE
         x5Cw==
X-Gm-Message-State: AOAM533ZudftAE8QpKrFoh9PvaCOhQ6F1dn+90Nr9TwaeIFdXXImd+Gf
        rkP9Q18UHXS7WTo22g/GVJdJew==
X-Google-Smtp-Source: ABdhPJyLfV5VsSmmOLGSgMJjrcfxNNsl0wmiMIgY4VzYX2JpE2QDBEj+cGZZN+a/m4o8u/ID2cr3NA==
X-Received: by 2002:a9d:208a:: with SMTP id x10mr656889ota.260.1610062257343;
        Thu, 07 Jan 2021 15:30:57 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t24sm1425945oou.4.2021.01.07.15.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 15:30:56 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: mdt_loader: Validate that p_filesz < p_memsz
Date:   Thu,  7 Jan 2021 15:31:19 -0800
Message-Id: <20210107233119.717173-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The code validates that segments of p_memsz bytes of a segment will fit
in the provided memory region, but does not validate that p_filesz bytes
will, which means that an incorrectly crafted ELF header might write
beyond the provided memory region.

Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index e01d18e9ad2b..5180b5996830 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -230,6 +230,14 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			break;
 		}
 
+		if (phdr->p_filesz > phdr->p_memsz) {
+			dev_err(dev,
+				"refusing to load segment %d with p_filesz > p_memsz\n",
+				i);
+			ret = -EINVAL;
+			break;
+		}
+
 		ptr = mem_region + offset;
 
 		if (phdr->p_filesz && phdr->p_offset < fw->size) {
-- 
2.29.2

