Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB82018021F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 16:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgCJPoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 11:44:05 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35384 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgCJPoE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 11:44:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id u68so5945442pfb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FIsaWOEHxjug8g0g5/0Qzw0eVOmGpg/y1+33ZgTLwjA=;
        b=MVCO8OjA2rtv741bXG1qlXebeKR27QDNKzfmeVtPyXZ3TPZxs8YcC5fXvblTfIBMhr
         8Rmptzy+mmCMqHvur+VwzSbINSqmoQg5cSrlz2uK4tkvimd6+BhsZRQ8khU2SK+nSW9s
         mnPgJn1YJhmaDx1WkFIvZfZZXjaywRPuIjCTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FIsaWOEHxjug8g0g5/0Qzw0eVOmGpg/y1+33ZgTLwjA=;
        b=UhL1sgEBxzLsiKpFj6xobBlTg8RbZA1AEimN903WStNzg8001FvTdQ/JZpRYeUs51p
         XxBQyhFZrtEqVxhUW9do9OUXa3BXlTWSIT8bQEwV9J+6pWQ1ra5Bkv+tMDGODnPuSstJ
         Y0yuq7I3Qq08dO0UAup80cEZCCRKwW6Mu8C0DRlTIHAYAbc5/WD4Wq+KLv37oaVFutpL
         SFOaeWHPuieDk2JVw9yvjQMgGvsi69IJHzHEbNrtLlrQqBo6R50sUb7JDC01Vwf8m6oV
         tHfKmY5e6YTOVct3NdPbS5kmeSUHwKJvsvZXK8wuVRw0z9uA1k3DYRLAkm5YENqq0vh4
         xbRQ==
X-Gm-Message-State: ANhLgQ3SQRVvIVg2tLTVKA1u4adbnLkczZt5R5o8SnQCsSBl3wa2disd
        rI+Xt+J8VlRC2nG3KOa6sxXL8g==
X-Google-Smtp-Source: ADFU+vuQQtHPpdmf0a5BQtG857BP7ac/ZYqv494NvarEUDhctHRIIQgLBGaNCs3sMduSmQusLdJrHQ==
X-Received: by 2002:a62:e808:: with SMTP id c8mr23178666pfi.111.1583855043409;
        Tue, 10 Mar 2020 08:44:03 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m12sm2731090pjk.20.2020.03.10.08.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:44:02 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 3/3] i2c: qcom-geni: Drop of_platform.h include
Date:   Tue, 10 Mar 2020 08:43:58 -0700
Message-Id: <20200310154358.39367-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200310154358.39367-1-swboyd@chromium.org>
References: <20200310154358.39367-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This driver doesn't call any DT platform functions like of_platform_*().
Remove the include as it isn't used.

Cc: Alok Chauhan <alokc@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 2f5fb2e83f95..18d1e4fd4cf3 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -10,7 +10,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/qcom-geni-se.h>
-- 
Sent by a computer, using git, on the internet

