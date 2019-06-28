Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E882E59C5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 15:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfF1NBP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 09:01:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36265 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbfF1NAe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so6230402wrs.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2019 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GDdYN5kQt5oodJg9h0fQ+PGqnlQ6057Y5ThAbiMCFHE=;
        b=aStCg4HrF6BmAN5ZprxLweMHT3TIAHKj9unAhcfV7uHqCXxK/8cTWppGWhbH6ZIp28
         X1QPv8tS/qz0Nlfbj4S7cWYVVp7LxyG+w+c6yBHwIHX3raV4D1AfsFzmFUuBghwvbcFv
         b+W4geq0zgQs+TlGDuYDGhYHSWbOaXWX1d35Ijn1iH7mZcWV8bjjBoQo3AFPPkWcg1eW
         24QBV7tmPeX4wF/K953B6FL5UGulav6XLBmO+/XtUGvPCh42HQObW993Q35MrOM2mhxa
         7fHSc/28OoOlsMRatKMoqX1LuISEQ6/3YoixCLbhReBc7C4wC8aX16RVtlAOmpCJEZha
         30IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GDdYN5kQt5oodJg9h0fQ+PGqnlQ6057Y5ThAbiMCFHE=;
        b=mklE9uDdYtr/g7ee10gbSoNfww0K+X9wzWZtfeI3dVvGZi3Y2pm4uD5Giy19YhRch0
         v8GUU+0vfKHMe58ZU0h88D3J0toDmffIwsOBgzgCzwYX1lYvwwqsqlgu8VMBKw04z1YC
         qWzggs1Rb5bq2afqR4kzw6x4Jno2r7CIrfFJ3oyoEKrAcfMUb5S9QD02WLeja9/Twhwx
         TwJF+dPAOyZZIjSS9a3MoY1gE+KcErg3iZ7LXVLA4b8X18xvsEch7nKGBJrqaFlUVUIv
         QQFyGhcLqWGNalZSoK4lalLwGt5CtiwigmOFluE043GdZ+ZmOxpNXcHFeT8cGowExlCv
         4g5w==
X-Gm-Message-State: APjAAAXNTtefB9fVPizynjDLkw+A/LICqglsawkxQov5HEURD1erjI8t
        bz0iQT5gcOMCvYd+x9O9wfaPWg==
X-Google-Smtp-Source: APXvYqzAMjgfvkBAsqsXR2nTrtCLwi+m0gA4PqiKPkXUxBqR7O8NMRf7ciY88v3cOTrTAD5w1d/2nw==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr7602029wrj.272.1561726832700;
        Fri, 28 Jun 2019 06:00:32 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:32 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 05/11] venus: hfi: return an error if session_init is already called
Date:   Fri, 28 Jun 2019 15:59:56 +0300
Message-Id: <20190628130002.24293-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes hfi_session_init to return an error when it is
already called without a call to hfi_session_deinit.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 82eb889ab541..3d8b1284d1f3 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -198,6 +198,9 @@ int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
 	const struct hfi_ops *ops = core->ops;
 	int ret;
 
+	if (inst->state != INST_UNINIT)
+		return -EINVAL;
+
 	inst->hfi_codec = to_codec_type(pixfmt);
 	reinit_completion(&inst->done);
 
-- 
2.17.1

