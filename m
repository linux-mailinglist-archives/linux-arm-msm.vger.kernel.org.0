Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3971A2B48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 23:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbgDHVe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 17:34:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:47086 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730738AbgDHVeH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 17:34:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id r7so9258907ljg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 14:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZmtMLRatZyABHiSvc9LC9XLFnfSECfJ6FOVkP/fee/c=;
        b=n5xzq+jDqSU/R2czdhnEmBJs1a6WCKd3RUwOfSvFFcJ/OrtE69/SCmXefoP+Z6Dq9q
         7ZS3sphirpZb0ZoYJMN0UHaJkzddznQ4DGCfssvT7Cec3VwsYv447cxATz/pPyK4KchP
         rrPSMTLBqxgDiDOU39ErRVsZ1PAjmDWVgIBude4FjexcFOAQFNp18Mrco8+JLdb6Jyqh
         +lBbg+OZhTCXbpFdGBcz5gJSuyUiYpsn8Hnhb6dZYfA41PbJWYVd/zUuR5x/3M5CkagY
         xlIpdkeQGKZkJqHsx6IE3nuRK8gExqcDigP7bTiKCojU+bt1pxVcBwsWX1zufYlNKuEa
         JxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZmtMLRatZyABHiSvc9LC9XLFnfSECfJ6FOVkP/fee/c=;
        b=Xf7QpXXY7B+liIurCo0SuDKvNeACfyOMsc22+12MXqREn2My7vR2Jpp9PeFg/ixOBl
         +uvh6+cO+s8geE0MD5ekQgsg4KqjaRZAPXrheZ3pXFxoTjTyjZiCHsoG8bOxH9MWSW1D
         WS++MUbt92LywgNpY9tqXxFZLkPVgZuhxqfVJieuAL5wYnY7TYbKaObeMqoQFqtxy3xs
         Q8Z8wNsNRmYJJIGcXDE+4Wfppc1mh5yB2CHJ78gyMm2hkVtCjLKj2M3uyEsCeS6x8zc5
         G8jMa8X1PtJYtL84hwWnQ1jOE1URObQUXasVz3WSb9PlmkfTd9Dee4mjsgyhfCHBsh/8
         +qPg==
X-Gm-Message-State: AGi0PuaXqiN2wLrv6bdlakaLeGgCaCxasUYz7NiC98JKM0DdHo2hNhNT
        xrWTerU2bBGKw1nTIPxP9q68Mg==
X-Google-Smtp-Source: APiQypKIHx32aNL9j4vusR14vRnUwl6c9YL9LAAD4MO+elshP0otTpQEXAou1ldf8vpiu01UaHqjFA==
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr6207367ljo.152.1586381644715;
        Wed, 08 Apr 2020 14:34:04 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id t6sm15746688lfb.55.2020.04.08.14.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:34:04 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/7] venus: core: Constify codec frequency data array
Date:   Thu,  9 Apr 2020 00:33:26 +0300
Message-Id: <20200408213330.27665-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
References: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The array is not changed in the code, so make it const.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index afd76bcd9978..203c6538044f 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -456,7 +456,7 @@ static const struct freq_tbl sdm845_freq_table[] = {
 	{  244800, 100000000 },	/* 1920x1080@30 */
 };
 
-static struct codec_freq_data sdm845_codec_freq_data[] =  {
+static const struct codec_freq_data sdm845_codec_freq_data[] =  {
 	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
 	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
 	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
-- 
2.17.1

