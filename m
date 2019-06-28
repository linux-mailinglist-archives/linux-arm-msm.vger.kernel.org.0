Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A19059C40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 15:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfF1NAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 09:00:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50458 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbfF1NAb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so9042694wmf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2019 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Pjpd4K5w40M9bgj2qf6kIU4rY0+8OHMdLQZZ7HAbvAY=;
        b=K0RLeb0OmILRaH2CZ+NQFp02nyKniVlM0wUXuTGYUTj+zax4tEho2JvJW3/T01SUPx
         E5QrmXbqe84laPUyXe3tFGvHWR5jKQdSThO2E8iNKBWQj/6m13MzrmrPk7iITNXTwbOx
         EYyAkQMKHi35A4uQEFbKCTX+Itj2KxIzLXrIIn0x0q6qG1ogfhATMC6wlE1jDpeeyz33
         C4jxqJsdTAfj5XrSgKL+5cLnL4oCp2PLxYW1G4MQ3AJ07kEVPW1HaEKJn3fass68vqi8
         E7DWLucOE8629dR6yzWVjXUt4B2Edr74iH4SZVbZ0LWt7fyfSYz40G5NN9sx7gBMHE9J
         t8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Pjpd4K5w40M9bgj2qf6kIU4rY0+8OHMdLQZZ7HAbvAY=;
        b=efVqEGMfmnFaCpnxnwEwiFWqWduLJV1lmJjIs0VGYiG0UDP64dfVyBVkUA8Bp3JVvU
         1M7lN/x3kt47sPk+RrvmgGIrlUx5zPEUeFpR+bYMAr8Lv5ddCpWmtmiuTGYArTMQGBP+
         JJcILfPEZmBiEIMy4Fvv1s+4ICzt9xG3s5nbOo+X3JStavvHA1BmYBsO/P2bXSqZRMsf
         svLGAhVKujNpoleZUNicwBNFUZmhhPvoh6Ljt8KNO3uBX1e0wLEGzt1MzI1XvDqTHhpj
         y5atIBAdzz3xR0P9SH1rYOaoNewAwPGYpxTVnE50UKTID3nwmAtUW8KBY75WHCVlRGps
         q3CQ==
X-Gm-Message-State: APjAAAWLi2w0F1bU3t031v0mdIamvpuiPivnlcwlleHCg11gLCCPXNjr
        mNtICxGBhGzNy0wSytZx7xz0dg==
X-Google-Smtp-Source: APXvYqwiD1+HA+YiR3PauDB2BVEkQbp/tG13oPtpSqmsWbQNggDtHs29UDbrroOkGgyTVCI9AuVCUA==
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr7577395wmg.164.1561726829402;
        Fri, 28 Jun 2019 06:00:29 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:28 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 03/11] venus: hfi: add type argument to hfi flush function
Date:   Fri, 28 Jun 2019 15:59:54 +0300
Message-Id: <20190628130002.24293-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make hfi_flush function to receive an argument for the type
of flush.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi.c | 4 ++--
 drivers/media/platform/qcom/venus/hfi.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 6ad0c1772ea7..7c5bf5cb32de 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -375,14 +375,14 @@ int hfi_session_unload_res(struct venus_inst *inst)
 	return 0;
 }
 
-int hfi_session_flush(struct venus_inst *inst)
+int hfi_session_flush(struct venus_inst *inst, u32 type)
 {
 	const struct hfi_ops *ops = inst->core->ops;
 	int ret;
 
 	reinit_completion(&inst->done);
 
-	ret = ops->session_flush(inst, HFI_FLUSH_ALL);
+	ret = ops->session_flush(inst, type);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
index b121cb1427ac..855822c9f39b 100644
--- a/drivers/media/platform/qcom/venus/hfi.h
+++ b/drivers/media/platform/qcom/venus/hfi.h
@@ -161,7 +161,7 @@ int hfi_session_continue(struct venus_inst *inst);
 int hfi_session_abort(struct venus_inst *inst);
 int hfi_session_load_res(struct venus_inst *inst);
 int hfi_session_unload_res(struct venus_inst *inst);
-int hfi_session_flush(struct venus_inst *inst);
+int hfi_session_flush(struct venus_inst *inst, u32 type);
 int hfi_session_set_buffers(struct venus_inst *inst,
 			    struct hfi_buffer_desc *bd);
 int hfi_session_unset_buffers(struct venus_inst *inst,
-- 
2.17.1

