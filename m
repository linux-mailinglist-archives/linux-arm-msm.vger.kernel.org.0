Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDFC17942C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 16:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388119AbgCDP6X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 10:58:23 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36374 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729696AbgCDP6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 10:58:23 -0500
Received: by mail-lj1-f196.google.com with SMTP id 195so2601320ljf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 07:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=U2afUUo7gcqKGsZXm1132Z2DinxFoznPEB9ahOfUs5k=;
        b=qzK0hDhWmDi+wb9g1tsq8Vo5sOBJTKo4poMC642is7FDaHHY4CS4jN9R0281x/wl09
         +fj8oA2vifprD7EudIOKS9bTNeGAUeZp4pIN1hkCunkV7mCBMdlg/TNgSWY6pqCzY39D
         CJJ+ocA4d6uPBooiF1JT6sz/DrFIUXLdp3WheLBY5l1eS5BMyxKyjJgn+Di9PyQ+Hwku
         6w4h7gei5ClbyOut1K4C1Ngo9l2UL//7RE3FUveNqXPM6UnOS/PdWjGQXp+30ToOWM2a
         Po2HUBnz+l9fDhn9/KvP+KwUTwZj/o/Lhw4Sq6DWcsCteEVceLZh4fIZuILnhaPyRZ+g
         j1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U2afUUo7gcqKGsZXm1132Z2DinxFoznPEB9ahOfUs5k=;
        b=s+vPKKXtQ6stdTfqFNdqoXaywqYp16Qw9VIl9PawThPduqJykqTcREbfwXOcQElQSd
         ESIFQRIRovUIYtld22WJQUuxDghAENt5kxA6bhItVXkBzQoz9V8tv/3pp4dFPqsUnzaL
         AqFil761yqKudIP9/1V8+Hqmhk76trdow1Njy14CxlBeZJvdHn5VwA2lKkcrYMMqlWyN
         BPKXx1HGJ8f2XlUCOfoUSjvqmEuUeq8apxRT1NoLk+C9om+jGWgEJl/zL0x+N7qWOjoA
         AxDG3MGX0Mcv3icmjCNT4u0/xyC02IQYhzCjYS5ChZnagQYF0R+GECxBSWqw73zA60D3
         yp9A==
X-Gm-Message-State: ANhLgQ2anl2/EhUtfeaaXeVFv7ki6hOvYdG/yfPyA9ZxDn/BNFSw5g9L
        MVM3fOq+x2Qwn+F7LVDZ+Y+PTg==
X-Google-Smtp-Source: ADFU+vsVg5RJIaMPwnWAYk62YemrpgFiO40xq3WzGuOXCGINg04alWqT3DGb5/ui1ePPvjmIW5XPjg==
X-Received: by 2002:a2e:a486:: with SMTP id h6mr2300591lji.202.1583337501273;
        Wed, 04 Mar 2020 07:58:21 -0800 (PST)
Received: from localhost.localdomain ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 67sm10531217ljj.31.2020.03.04.07.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 07:58:20 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: firmware: Ignore secure call error on first resume
Date:   Wed,  4 Mar 2020 17:58:09 +0200
Message-Id: <20200304155809.19637-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the latest cleanup in qcom scm driver the secure monitor
call for setting the remote processor state returns EINVAL when
it is called for the first time and after another scm call
auth_and_reset. The error returned from scm call could be ignored
because the state transition is already done in auth_and_reset.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index de6812fb55f4..8801a6a7543d 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -44,8 +44,14 @@ static void venus_reset_cpu(struct venus_core *core)
 
 int venus_set_hw_state(struct venus_core *core, bool resume)
 {
-	if (core->use_tz)
-		return qcom_scm_set_remote_state(resume, 0);
+	int ret;
+
+	if (core->use_tz) {
+		ret = qcom_scm_set_remote_state(resume, 0);
+		if (resume && ret == -EINVAL)
+			ret = 0;
+		return ret;
+	}
 
 	if (resume)
 		venus_reset_cpu(core);
-- 
2.17.1

