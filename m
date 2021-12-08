Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEADF46DBE9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 20:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbhLHTUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 14:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234430AbhLHTUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 14:20:35 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E701AC0617A2
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 11:17:02 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso2899779pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ckPPRmZQJms30zGFOtOybADVQ0v9vZLpkOLixodOhVQ=;
        b=SlG0Y8HjNX8qfW46693u1N0K6eekxrcV/RkEeyjeYw8NwniVNJVe9pvL6fOdADy9nO
         GTRZ+0EcaBqoTwNy6PG+Cs4Bkf/8QuBCneAJwUQO/4AgMgQ1QAehyK8L5Won1dm+F4UA
         69ts/GjUVtL+QRRS5lsPFFQxYjD5ynofvKjUkcnRiobgh+zhEYW/+lb92eq7tUs3cqF2
         HTvH5MSNUYh53w4xaJfv/V0Te2ufs+s0IuUXJoHt0WpAABUEtzepZWn2bGvJIOHkHQKq
         Pv/0YlKB2+VGuYtZulftbQ67mGgaIDrtZc6ITF4PWlBdNxFeDnHyNLy1gcnfLAEXjljw
         QL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckPPRmZQJms30zGFOtOybADVQ0v9vZLpkOLixodOhVQ=;
        b=kCGU4cio0blTDY1a18sgQjgmGxElHbMOkSz+q9QzeFu9+i5mPAI1FWVljniQBTWQeh
         F0vRIToDQQZTUO13UPRU22LQDofEcknZZYloYjNv9ocY0xthBsvBi1el7CNVw/M7wuZf
         9XGSixMXrj9oL69gH+kHOmvH2NjDHtuxaLGVBTNikHlAakPiwMQz1kYNdK86X7x5NbQO
         r/90NgBfwLNeQSXlRQCNyuj6Lm7O2RSURISZrWBUiu9LKByuiA6PFutBjcfcsmYqANki
         6+bxMqc1K04lr/54YvetSDfo2iXFk3Gz2DbqfhW874Fyv3mavQCRsKjIUbLqLOod1iXH
         vCgw==
X-Gm-Message-State: AOAM532ffPAqcHx6mISV/7mMHCFTnXAkyQlVSyR7cC6qcUM0SMI9mUy7
        V3wcGTBLGUGmHHsXv3ZTG+Q=
X-Google-Smtp-Source: ABdhPJxLuNyV7gyBX1nOG3DiBD8BtcvDSoueXKqrQ3DPEBuAty6RR+rEIiQKJcXaVzp0mFQ3+gXiHw==
X-Received: by 2002:a17:90b:230c:: with SMTP id mt12mr9520690pjb.63.1638991022431;
        Wed, 08 Dec 2021 11:17:02 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id g5sm6799010pjt.15.2021.12.08.11.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 11:17:01 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     igt-dev@lists.freedesktop.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: [PATCH igt 1/2] tools/msm_dp_compliance: Small arg parsing cleanup
Date:   Wed,  8 Dec 2021 11:22:15 -0800
Message-Id: <20211208192216.743364-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211208192216.743364-1-robdclark@gmail.com>
References: <20211208192216.743364-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tools/msm_dp_compliance.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index 5e491c89..a15a8dd9 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -629,7 +629,9 @@ static const char optstr[] = "hi";
 static void __attribute__((noreturn)) usage(char *name, char opt)
 {
 	igt_info("usage: %s [-hi]\n", name);
-	igt_info("\t-i\tdump info\n");
+	igt_info("\t-h, --help           - print this usage message");
+	igt_info("\t--help-description   - print test description");
+	igt_info("\t-i, --info           - dump info\n");
 	igt_info("\tDefault is to respond to Qd980 tests\n");
 	exit((opt != 'h') ? -1 : 0);
 }
@@ -709,6 +711,7 @@ int main(int argc, char **argv)
 	struct option long_opts[] = {
 		{"help-description", 0, 0, HELP_DESCRIPTION},
 		{"help", 0, 0, 'h'},
+		{"info", 0, 0, 'i'},
 	};
 
 	enter_exec_path(argv);
-- 
2.33.1

