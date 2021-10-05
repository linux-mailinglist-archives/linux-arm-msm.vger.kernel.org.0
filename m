Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D689A421CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 04:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbhJECke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 22:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhJECkd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 22:40:33 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29868C061749
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 19:38:44 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id c6-20020a9d2786000000b005471981d559so24067273otb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 19:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1As026ACI4z9YD96O++wp62zq89tC9v8WEwP6uOHA3Q=;
        b=vXpRyMqPwXNb72D57hhI4NHgKmlXiUnei9EP464AoeWz5vTjuptZaLgYvvVDnvabQG
         9mhIICTWBcimd/3joOUhskzfcpKUTBSy0hRffkSuCsmviPBN/+5LEs7igLNLctCwA4Bw
         GcwOhqq+r44YpCscCoKvd1bV+JVnRA+1DTJBboHBrwHKMbVKGglQsM3IBeBBG20c9zBy
         GMwt3DtkbbQVhWDy+KU1MhvtsZOH0yzl9eKjhrQo6B3wxUNtwsEWPSGntw2DHaLa+6i/
         DNzqgb3IZIH0xMM3OUQSe7YsXwNCgVyDjL6KnwzZuyBw4llaj1C5wPr0vZFrwXCngTjD
         +iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1As026ACI4z9YD96O++wp62zq89tC9v8WEwP6uOHA3Q=;
        b=al8aB4Wj1sFckUiizSlAdTgxMUOlDruWuq/XHC5YKfEADQwMu2hXSx4xIsEWDjAtkF
         IHOdkHWyEi7GCsL0AGU2qrgsrVu8RLC2xvlGLX2kdyecw8hg26NBN28r0CuTIrJ/LYE+
         8T/LKGToa02126jM2iuwmbmDv0MkXMefwtnDAivl4N455X7/Py62GFlseQEHvPsfYb2b
         cIlYEXubyBWzNqp3FqNs12K0jH/+8gRJLnbxHwxNO/ocLE9Yk1weOqQ0lv4t26h4WTQP
         KVOzitlQYdyhVMXANd0DnHbb1untxBuUdjWvB5S+dKxfyT/3ihgFTuRv1eI3n/qLVOQl
         bzyw==
X-Gm-Message-State: AOAM531DkUvLzHmzV9NYRUfDvv+o1kAgnSlGCftvuVINZBs81X0HXDL5
        3U8tFf0818YdYGFZQtOwcoUP+w==
X-Google-Smtp-Source: ABdhPJyOTKZ8Z3/YTyNFYGmOm2qLjJWfeVpUzOYTbCxJHeNc4SvCriowzyofTnld/IBQEVUsMyut5g==
X-Received: by 2002:a05:6830:359:: with SMTP id h25mr12206875ote.48.1633401523430;
        Mon, 04 Oct 2021 19:38:43 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id d7sm3238711otl.19.2021.10.04.19.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 19:38:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: Add PM8150C and SMB2351 models
Date:   Mon,  4 Oct 2021 19:40:25 -0700
Message-Id: <20211005024025.2037810-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PM8150C and SMB2351 to the list of known PMIC models.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 47e9ed03882a..bd80db3181df 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -102,6 +102,8 @@ static const char *const pmic_models[] = {
 	[32] = "PM8150B",
 	[33] = "PMK8002",
 	[36] = "PM8009",
+	[38] = "PM8150C",
+	[41] = "SMB2351",
 };
 #endif /* CONFIG_DEBUG_FS */
 
-- 
2.29.2

