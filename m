Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471075AB22E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 15:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238259AbiIBNwi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 09:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237675AbiIBNwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 09:52:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74380162166
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 06:26:48 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id og21so3916087ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 06:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1fcl6Kulh1x6/Y+M+GkZaGHNlzH6/YOoS5vivMb0MlE=;
        b=jYtnCcq11fPJFVWuACWwCv8StrnrBoj1r/h5QOzjdQptXS5XE/AOZ1xecQj/7sc9dz
         SQBHt8+2x9+XIKEm3Wxs+aE2fUEVI3PGsNepnHlV2Pa2Hcc+chx7J0cKEavR5748bD9R
         gdwL3crCVGS8PlPRtrF3Cw1RRkzG1JDltQxp5kgFIf2UnprP9sH4XIqYtiRbbBxd5jj7
         ExfBCasVJLh4ZJ3EORG1iVuibSuA/szOSF8nPEgnij4aDnLjJYwf/NgUZUA1xgxnnacX
         H075E4UvQkUU+vqdYBL/s1hoT0INggDWhXvPCDJJ5yRzFkqg9z2I7FKB2FsyVPh+UtQw
         Exgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1fcl6Kulh1x6/Y+M+GkZaGHNlzH6/YOoS5vivMb0MlE=;
        b=qgx/h7HaBmBRCh24kPT/23wEeo6HVjkoDVdXgJnu6sBPlmbbC6TLaRjUCQNvHj5Sww
         YVqOytSwuxsO1XQyX2kf5c9qoWcmhooxT1YoiPSEmK9GP/E6DNwtPDHpOlHbDyPu7E5g
         B68GPqUNdiTCHBl9t4xZxcj/ucpxz0wPzVOBkkG7HLAeO5vt3U+Emt0xfcdxq4QI+ri4
         f2xzQeUbMMzuMxJjjnYgRynRCvXBMi5nIJlLvq4gx0esB/RbF46w5j5LsY6wK8rd/KE6
         CuH1GgKEZDQV+WZltoSyyG4GLCA/pR3r1J+J5mk6Os24bIkGHgz3d6ItRZEaIQGmxJjq
         LfIg==
X-Gm-Message-State: ACgBeo0DIS6AJ7eiMOre9VlRjTEeVynrDHJ3nuG8Faw9lbqbRJBFJMhv
        24DUN1kjKUhzwyAQqCG0N4arLYymPjtMIiav
X-Google-Smtp-Source: AA6agR74ahPptcNrG18gQjunnP/JImLsIRID6lpLSAw9N2eDslUUyr/HPEnbg4sccZhv39qXwi8+BQ==
X-Received: by 2002:a5d:6609:0:b0:226:ced9:be58 with SMTP id n9-20020a5d6609000000b00226ced9be58mr16701330wru.80.1662124470743;
        Fri, 02 Sep 2022 06:14:30 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020a5d43ce000000b002253fd19a6asm1766253wrr.18.2022.09.02.06.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 06:14:30 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorande@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 07/14] misc: fastrpc: Add fastrpc_remote_heap_alloc
Date:   Fri,  2 Sep 2022 16:13:37 +0300
Message-Id: <20220902131344.3029826-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902131344.3029826-1-abel.vesa@linaro.org>
References: <20220902131344.3029826-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Split fastrpc_buf_alloc in such a way it allows allocation of remote
heap too and add fastrpc_remote_heap_alloc to do so.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 52271f51800d..6730aa324e10 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -379,7 +379,7 @@ static void fastrpc_buf_free(struct fastrpc_buf *buf)
 	kfree(buf);
 }
 
-static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
+static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 			     u64 size, struct fastrpc_buf **obuf)
 {
 	struct fastrpc_buf *buf;
@@ -407,14 +407,37 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 		return -ENOMEM;
 	}
 
+	*obuf = buf;
+
+	return 0;
+}
+
+static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
+			     u64 size, struct fastrpc_buf **obuf)
+{
+	int ret;
+	struct fastrpc_buf *buf;
+
+	ret = __fastrpc_buf_alloc(fl, dev, size, obuf);
+	if (ret)
+		return ret;
+
+	buf = *obuf;
+
 	if (fl->sctx && fl->sctx->sid)
 		buf->phys += ((u64)fl->sctx->sid << 32);
 
-	*obuf = buf;
-
 	return 0;
 }
 
+static int fastrpc_remote_heap_alloc(struct fastrpc_user *fl, struct device *dev,
+				     u64 size, struct fastrpc_buf **obuf)
+{
+	struct device *rdev = &fl->cctx->rpdev->dev;
+
+	return  __fastrpc_buf_alloc(fl, rdev, size, obuf);
+}
+
 static void fastrpc_channel_ctx_free(struct kref *ref)
 {
 	struct fastrpc_channel_ctx *cctx;
-- 
2.34.1

