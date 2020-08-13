Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D043243C22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 17:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgHMPEO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 11:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgHMPEN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 11:04:13 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C675C061383
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 08:04:13 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id m71so2965733pfd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/uG16YSFbVigxh2ulTPjwxYz0Q43CcPT6lWTPkr7TM=;
        b=Uq8roSSrTPLJrRX+IS4VNXSh+8BESaz8fsYpbcchEUJxks+Vpi1WB/ct87UuNCJFuS
         GCF/ItZExgF24pDds+wY0DPZeRWttqVzIINqmJY6CKkvMcv3mjNWshYYSGHRJY7eJ97n
         DndePPUxxzKC+JOSF29MsM5bV+7uuc7nxUG2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/uG16YSFbVigxh2ulTPjwxYz0Q43CcPT6lWTPkr7TM=;
        b=S3xstIUxxvtyDINiXEjphsLioM2RcfFl0RdymDQfsDgnpJnRx8bmFC6xpZOBRdZz/Y
         RVltkMGUs2H3acTaH2trinmwB5ezD9A03XAD4yTDO7nvqTuSYiPyxlPIsZO5t9gahkbp
         ZqobmDjcBFl+k6GeobNOm20Vj5GWj2sy/U7CjmFKj8n1JKe0DZ066gEJfUble13ueXB/
         g1FAHkFkwaDyXceeXw78xT7pg2JzTzCJEtnu1xCulYL1rT0aNghXS2m4riBgVxQfU89S
         Z0reQWGT4C7MkHFquHAG1vwgmf0p5RpcbmZyJ7dB5oL+VdQTV+kzJoV9/GLeWRS+9tbP
         msUQ==
X-Gm-Message-State: AOAM533xE3pwrNpgtcST+kdpAU4bUN83nACwihsOPQCreTtRB/hRzFwk
        WJAcliRKGoLceUpPiOmI7Q5Tow==
X-Google-Smtp-Source: ABdhPJyLOM2g6yjludzH2H3jgbK94iPEoOUGxhCXlOCcMyKMC031EtH8LkWfR6yuDRzDiylOc7zbxQ==
X-Received: by 2002:a63:ed07:: with SMTP id d7mr3933550pgi.414.1597331053190;
        Thu, 13 Aug 2020 08:04:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id b23sm6117014pfo.12.2020.08.13.08.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 08:04:12 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     saiprakash.ranjan@codeaurora.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: add SC7180 entry to soc_id array
Date:   Thu, 13 Aug 2020 08:03:52 -0700
Message-Id: <20200813080345.1.I85bb28f9ea3fa3bf797ecaf0a5218ced4cfaa6e2@changeid>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an entry for SC7180 SoC.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index e19102f46302..e56eea29615c 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -223,6 +223,7 @@ static const struct soc_id soc_id[] = {
 	{ 321, "SDM845" },
 	{ 341, "SDA845" },
 	{ 356, "SM8250" },
+	{ 425, "SC7180" },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.28.0.236.gb10cc79966-goog

