Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B533650EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 05:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhDTDgi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 23:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbhDTDgg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 23:36:36 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016C4C06138B
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 20:36:05 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id 18so14371514qtz.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 20:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FUSrZlERR89hZzHNyP4QRMbV2CihmITrCmz3k1LlYk4=;
        b=JKfUHhwohTAlIErOZ5oVcBUy/U3OOTDr2G7VEB2UxHxsSijfkzoHaIRv30O3iTSSgb
         IAAQIpxOUIL8Cj1R5RBtffr7tOw83iHNxZnF1N5xredPDOrc/+cqC85bswlh8q+EySk7
         8dwWPjm06xrtLktshNebkbjlV07CloyqAOPlpB42aVCMZXTOrxeunMYJMRRqi3CFCT5c
         HdmyoO8W/86tk2pYta/3XmrfNJNgJ5MqnoZXP9Ii3z0qkteGfg9l7Tt15GMHGBbIuww+
         Y8v8HAh9UE9wiPuayC68mvhuvfJC8L/xg5wof7AjZO7SsUenw3LyWh/RttBVZcyPKiMZ
         YpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FUSrZlERR89hZzHNyP4QRMbV2CihmITrCmz3k1LlYk4=;
        b=C96WaxucbgS5l9ulmxsN0n4SKScgi7slzzPXCcRzASpcbQkJCZA3e0L0UcEftM7dMb
         XcNiCvJ3/TMBWCOGVLJS9PUJczb2hr5YHPxgrsKbxRUpX5KiMwNgXBbda/pmrnONQqpX
         X7g9Mn2oNsk20XFF4Y1ev1b7RVcOwo5lNL1RVQgfpXRhNR2EF08wgR0r7NY9UZOSsNyI
         IirVfy01vMxJWS2crDbkLf1zA0bxV9mu6U+YS78v70uFtem+Zxjn7iMqBszSHXaybr5Y
         xMrfkuylEtugwbtlxNuy37m1OPaFjEQIVOGLVsHmFMz5l/PW22tcZh3iU0YVSA6c5I3D
         yN0g==
X-Gm-Message-State: AOAM533nKpWhVALLdIsNOWbgAO+Cw7ABT0ILoI7jUQJPpbj50o96l+wy
        zpvTWgYhR8uuvAXxcdxPXMW+dA==
X-Google-Smtp-Source: ABdhPJzKd+ZMz2eSTUaVL36KyA695VaU5Fn50hDEKwGyZAXSPvHSEi+qJ5PcjO/NTwQR2xEWz2dEsg==
X-Received: by 2002:a05:622a:13cb:: with SMTP id p11mr14753149qtk.349.1618889764259;
        Mon, 19 Apr 2021 20:36:04 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id b8sm3562643qka.117.2021.04.19.20.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 20:36:03 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v3 1/7] crypto: qce: common: Add MAC failed error checking
Date:   Mon, 19 Apr 2021 23:35:56 -0400
Message-Id: <20210420033602.1729947-2-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420033602.1729947-1-thara.gopinath@linaro.org>
References: <20210420033602.1729947-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MAC_FAILED gets set in the status register if authenthication fails
for ccm algorithms(during decryption). Add support to catch and flag
this error.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---

v1->v2:
	- Split the error checking for -ENXIO and -EBADMSG into if-else clause
	  so that the code is more readable as per Bjorn's review comment.

 drivers/crypto/qce/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index dceb9579d87a..dd76175d5c62 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -419,6 +419,8 @@ int qce_check_status(struct qce_device *qce, u32 *status)
 	 */
 	if (*status & STATUS_ERRORS || !(*status & BIT(OPERATION_DONE_SHIFT)))
 		ret = -ENXIO;
+	else if (*status & BIT(MAC_FAILED_SHIFT))
+		ret = -EBADMSG;
 
 	return ret;
 }
-- 
2.25.1

