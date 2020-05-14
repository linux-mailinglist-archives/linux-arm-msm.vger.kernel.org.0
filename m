Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1231D2810
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 08:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgENGl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 02:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726087AbgENGlb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 02:41:31 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A20C061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 23:41:31 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id m7so804234plt.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2020 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gk+N3LutZMyHgr08P1PZQX76ikfahgQaVgvg9g2G9nU=;
        b=PpVJWvwQPxce5dVGvG5hizL3Rc9U9oMwao2rh5kLORY4zJSBDQk/MePiBaSnFQn5ep
         y6ns9BoPf/cQVMfY77+G2KvuclN9Nna+3rnEFCHCmq63FmXRDnWrG2zbIvwhlRTVnsPo
         Kjy/pDEHsn4mP4rZwO5GJMijW8T/B4Kd8odVxWxmlt9Gj5Y8/PaYMW7xhYCGT5CGexdJ
         W27POU8ForZUXeRpfKjqzgpYn5JRBjRIi+i4C65JjrC9b5oXwqcryl+eK+6TaXVzsmi6
         1CD0o5Y28004meh+9hTnCJGRLQ9DGwtwF7EhTCOhzsvZnmaKqAf47yNFmE0WfichDisv
         WvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gk+N3LutZMyHgr08P1PZQX76ikfahgQaVgvg9g2G9nU=;
        b=dLv8FHzEvak7qgD2AGiUKB82Sp72CZR1B6EGYT3bpJKOMltuuuNgBsX5l4BKFy48av
         bPBLPJ1D5VOOqNiEWozERXW7C8km0IJuUYSuwqMM5WctUsC6tPRhmkAMHFHcJnE6H6rl
         UINru0LDJaALDutOtjVyGBe4jtDvftHkrQKc1u/3I2nXzG9olQadgxrTmPz7r+SKZnKG
         W4zcwcjF5+2tlGoykoyPs/AhaINk//wREDGJK0wGndIrqPC3y8r4dlmjfPi6Z7xh0kft
         Ifg3EiGtTP6mvVgcE0/zcmNbYSVO88eO9YvuhO1hujxMM2vmcwF5zE3cWKz6IyOGd/5I
         9K+g==
X-Gm-Message-State: AOAM532WVEFITltQbcYp5v60yywa0h5Myy6oIxPND5X/dHQKQIglT2pd
        5w4vF9Gp+TnpGgiQvWaGd9in23vS0kY=
X-Google-Smtp-Source: ABdhPJw3+P36PXleQ9B4OdKjfE9KdvFKTv1RVRurbpqRfCTR6zS+inu1p52jnemBxmbdnWUTcz/kqg==
X-Received: by 2002:a17:902:b78c:: with SMTP id e12mr2849628pls.88.1589438490429;
        Wed, 13 May 2020 23:41:30 -0700 (PDT)
Received: from localhost ([45.127.44.21])
        by smtp.gmail.com with ESMTPSA id d8sm1335956pgb.42.2020.05.13.23.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 23:41:29 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH] firmware: qcom_scm: Prefer initialisation during the descriptor declaration
Date:   Thu, 14 May 2020 12:10:57 +0530
Message-Id: <9dac309d985931a02b198714a5ae64fdce8c47ff.1589438283.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_scm_iommu_secure_ptbl_init() initialises the args twice, once while
declaring the struct, and then again by assignment. Remove the duplicate
assignment.

Similarly, move arginfo initialisation to the declaration in
__qcom_scm_is_call_available for consistency with other .arginfo
initialisation in the file.

Fixes: 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and legacy conventions")
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/firmware/qcom_scm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 6ba132be1b6e..eae9c28679cc 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -228,10 +228,10 @@ static int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 		.svc = QCOM_SCM_SVC_INFO,
 		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
 		.owner = ARM_SMCCC_OWNER_SIP,
+		.arginfo = QCOM_SCM_ARGS(1),
 	};
 	struct qcom_scm_res res;
 
-	desc.arginfo = QCOM_SCM_ARGS(1);
 	switch (__get_convention()) {
 	case SMC_CONVENTION_ARM_32:
 	case SMC_CONVENTION_ARM_64:
@@ -742,12 +742,6 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 	};
 	int ret;
 
-	desc.args[0] = addr;
-	desc.args[1] = size;
-	desc.args[2] = spare;
-	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
-				     QCOM_SCM_VAL);
-
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);
 
 	/* the pg table has been initialized already, ignore the error */
-- 
2.20.1

