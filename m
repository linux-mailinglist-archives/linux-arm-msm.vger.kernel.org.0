Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2772F600E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 12:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbhANLar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 06:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbhANLal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 06:30:41 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0193CC0617A0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 03:29:42 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id r4so2743993pls.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 03:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=IO4QpFuJoMhZ/LKcmmgItZhmKdHSxokOd+AS8D7ySjs=;
        b=nX18WGcB6ZElWXvbfc2hBUD1rlMYcB08pjiXZOH/lOKiRQ4quuoITsQACqXETMgsFq
         mxsP2qjSsofSjfZs/PyIiSUqc4usr/2gY1Ncn4S6TXbcu2rdMUdQfjZdtjTRDBawri29
         VvssE2Qip3K/dBe6JzlHBTPL6hd6QLodOH1yl67MnptjkMQxiK0FFO1oDDwT2tZqZBWB
         88cVsx+nBfL1GPBzYUrbYp3PAeKHRJ39eDhlsV58H7fwcPfxccA1eN3uzke1QAWUPo2p
         1Les4HKQMEVfAXrgtrMUmL9KfH9+9DR2MOWYrqypikC8Vx31/KTHQi9AjdXnKkLdmQR0
         Oy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IO4QpFuJoMhZ/LKcmmgItZhmKdHSxokOd+AS8D7ySjs=;
        b=Q/NE8iprPA/M1LJhEUyEVC8deeGS+/WUUqEFDsVqOddUc8tQ8lzMji/5+koC45d5zP
         IPN8fQWYKU//qicmR0vCKfc3USb/QSUFxkxnaiqWfGWiXsKL6Tbbj8BDaUbswndKaXGc
         +TWWn8pNY37Umg7EPZ15BhgD+PeokntN5gJGHCA3lg2iH7fK+JPWXsU5tL9hswjRUay/
         Slvxn5ERdOY09XB2zkAN/uSiLx+Ewl+jawYEW3BteQW9jB2U/ljPvNbUx5XTbSKAUzaw
         1RzejYzkDC4rLK05FvqCWLtskwmHj0s/I1DJadUyjQj6XDiqCgwv1uy8L7JIj7aIlSYp
         MBqg==
X-Gm-Message-State: AOAM532GbcnmLP8hkZpzQfON10ZF0I4p+BpoR2x9nnyhz0DGEyvlPL60
        7/ZxiFOhcvqZONTaJOgY+Qn0xg==
X-Google-Smtp-Source: ABdhPJwBFYX8gooKQDnxCQzMltsBv3oy5eJ8cG1LuzZIVUF9CSkML5ibaA1m4IiIFyOGVqDTZVXOIg==
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id f12-20020a170902e98cb02900dacb88f11dmr7064679plb.17.1610623781429;
        Thu, 14 Jan 2021 03:29:41 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y16sm5417503pfb.83.2021.01.14.03.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 03:29:40 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2] soc: qcom: geni: shield geni_icc_get() for ACPI boot
Date:   Thu, 14 Jan 2021 19:29:28 +0800
Message-Id: <20210114112928.11368-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, GENI devices like i2c-qcom-geni fails to probe in ACPI boot,
if interconnect support is enabled.  That's because interconnect driver
only supports DT right now.  As interconnect is not necessarily required
for basic function of GENI devices, let's shield geni_icc_get() call,
and then all other ICC calls become nop due to NULL icc_path, so that
GENI devices keep working for ACPI boot.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
Changes for v2:
- Only shield geni_icc_get(), as all other ICC calls will become nop
  anyway due to NULL icc_path.

 drivers/soc/qcom/qcom-geni-se.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index f42954e2c98e..c7c03ccfe888 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -760,6 +760,9 @@ int geni_icc_get(struct geni_se *se, const char *icc_ddr)
 	int i, err;
 	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
 
+	if (has_acpi_companion(se->dev))
+		return 0;
+
 	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
 		if (!icc_names[i])
 			continue;
-- 
2.17.1

