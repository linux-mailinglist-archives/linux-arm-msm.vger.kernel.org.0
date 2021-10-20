Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020AC4342DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 03:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhJTB2z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 21:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhJTB2z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 21:28:55 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D55FC06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 18:26:41 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x27so11500506lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 18:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qro1wJIGCqru81XXpqeqSL3k64k/ig003to8ecDW44c=;
        b=IMpw1XwDw9QiZ0flGydU9LML5dhcve6LzMjGuRJFb0t1yrG+g1vv4MkeJ+HN3ylrQf
         P1xJFauDIsq5Eb2utHoiW6qqPqaEHl8EI4ZuL8/GQ9q1Vgid+1EkhTK+YsS0OMYE/TEA
         LJ7782HKRep10Js/A1wMrYzEiKyX5c4wssgVa1l/pEyjtHy5XcAY45r9vOi/AJxufBbs
         y15fskRLt0lXI6PE5a9xQX5CLEMqjKOk+aIu+vY0FDh+Faujp0/TfQnDHvqfb7SpH8UR
         x0CfkPelAG75tsQYk/wa5GoeKrZGWkasUjXKjtR5pteSSx6/iOjc7cMIRyMX3JFnX9r9
         Lq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qro1wJIGCqru81XXpqeqSL3k64k/ig003to8ecDW44c=;
        b=jNSPQLMITwTwtkb0KXoZ0mrO4amtjVj3qrgVnlJcedFFFjpjbvSXda5mA/PdL5yS6T
         GfRPsm8MiQuIVHLgnpsCRvds8qIk4RRc/6Eb0JGLbM7fwTASYoy4/EyyAF7wptwB2UoB
         XnylXA/xGNtqwX6YzdVFHMEKTfsORWEuhxySKi0IkWfi3y9aUdlKkF6YkJk19IDdEMGY
         p9B7eWsGLPGD6wlwfx6j/c6JXYm6daRrd5W5uvdLoXmpLqYBT/E+SJvql1+iXReBuvbs
         T/GgzjWidY7RYeaPcAY0qq7F/xi7oldJKtLnhMjvR3awKHn9otbNDGo+PNyNjHWl5qK1
         CIGA==
X-Gm-Message-State: AOAM531BI2LIabIehVqZX1u5lIo44jgFjAmbzyTlTfuLkIvtDSlxbxio
        7XvkiSz5rR7lEkiN8NdNYrjexw==
X-Google-Smtp-Source: ABdhPJwsZK96YPkbJHXkbcTfhew8EENSeoJejVy9+HDtkg1ux1cVLwpD/+10j+qhrMMstiG+TcfJlg==
X-Received: by 2002:a05:6512:a92:: with SMTP id m18mr9139003lfu.427.1634693199968;
        Tue, 19 Oct 2021 18:26:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r10sm66252ljg.10.2021.10.19.18.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 18:26:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3] soc: qcom: rpmhpd: fix sm8350_mxc's peer domain
Date:   Wed, 20 Oct 2021 04:26:39 +0300
Message-Id: <20211020012639.1183806-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sm8350_mxc's domain description incorrectly references
sm8150_mmcx_ao as a peer instead of sm8350_mxc_ao. Correct this typo.

Fixes: 639c85628757 ("soc: qcom: rpmhpd: Add SM8350 power domains")
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v2:
- get the peer domain correctly this time.
---
 drivers/soc/qcom/rpmhpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index fa209b479ab3..9dfece2b8a9e 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -204,7 +204,7 @@ static const struct rpmhpd_desc sm8250_desc = {
 static struct rpmhpd sm8350_mxc_ao;
 static struct rpmhpd sm8350_mxc = {
 	.pd = { .name = "mxc", },
-	.peer = &sm8150_mmcx_ao,
+	.peer = &sm8350_mxc_ao,
 	.res_name = "mxc.lvl",
 };
 
-- 
2.33.0

