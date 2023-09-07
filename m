Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C797978AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 18:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244262AbjIGQvW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 12:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244277AbjIGQvU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 12:51:20 -0400
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECE81BE9
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 09:50:55 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso1137527f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 09:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105076; x=1694709876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DBkJj6t1gRX5aZK5tJ1KyLlxRpK3N5foL763peQ1Wg=;
        b=F6NV8vV2qU6jGTyLHC6Y6oarycAiWqFiNMc0mS33CnnLlO8s8UC5I77OWj7RdbC0bc
         KUcp+es6arD392gME/fgqreF2nEf448gEInjPmu7vFJfG3zkfMEq3w05rF+4eTjjh7yP
         5mIKe8e99Rvr0QLPoiNbDKVcvIr0u1SwAefxXhNa15AYMkE7dTiSNQya6Fo06GbGGIxD
         4mmATUQnvhDXqJ0g4NdU4Q+NFs/aHrIiO2VIx6jJ1B5B5cjtGnhzGDjV8fmAT+Nh9aMc
         9iYVSWUUKBfsdVn/M+DNzebMpWHVF4x1PXZRghq+0JVa0RqoFX8rtSAX0hWjUpwAHH6s
         +6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105076; x=1694709876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DBkJj6t1gRX5aZK5tJ1KyLlxRpK3N5foL763peQ1Wg=;
        b=EJN7fbMuYLnhRmQLjk47vYGD8ja1NGPx+WqhWCpESvbOUQKdZ+68umwRELFXLfeaMl
         70w8cTAQuRSYeQEEgRaG9o6XaIsd3mYWTDEKYQnyTyxBaovhB993iQxekHMzfjljSDVK
         f1D4j38mTx7KHUsWxINB2ZIi0kjZ3rIcrjFMn0+VPvW7+2y6kmMFh9B9dQW+ihC3DqCp
         ZoNcAvn5apVSmhjN/pMImF/lriQYyFviGkiHdRM/pZ3bISvVucTviIMkE80p8dAXuwEN
         a7zJ9/1Oq4PUNbWYgsd5bp3HuW0R+MXmBn4CywyBD6pZyac2yoUe82qDy8t+I46zP+I5
         FZDQ==
X-Gm-Message-State: AOJu0YyoRgVQAdHot3UW6FtBp5ZDP4rI4j6JOSLKyfUvJxJrcIOR1LYM
        WxL6H5k4LCYhWQvJgBgfqhBUrg==
X-Google-Smtp-Source: AGHT+IFoXG6hPmdGbK3c+YMW3n5SuKQkxSl3oJs1X+mNHJr9JBpHBciaJW/Anw6OgngsMIAc/RGSgQ==
X-Received: by 2002:a5d:4e42:0:b0:319:867e:97cb with SMTP id r2-20020a5d4e42000000b00319867e97cbmr5862684wrt.42.1694105076065;
        Thu, 07 Sep 2023 09:44:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:35 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/17] media: qcom: camss: Propagate vfe_reset error up the callstack
Date:   Thu,  7 Sep 2023 17:44:09 +0100
Message-ID: <20230907164410.36651-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A previous patch I had removed the returns from vfe_disable() since we
didn't trap any meaningful errors. Konrad pointed out vfe_reset() could
return an error, which is true.

Trap the vfe_reset() error code and throw it up the callstack.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 26817f9ca4f1a..256c0d8b8949d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -438,8 +438,11 @@ static int vfe_disable_output(struct vfe_line *line)
 int vfe_disable(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
+	int ret;
 
-	vfe_disable_output(line);
+	ret = vfe_disable_output(line);
+	if (ret)
+		goto error;
 
 	vfe_put_output(line);
 
@@ -449,7 +452,8 @@ int vfe_disable(struct vfe_line *line)
 
 	mutex_unlock(&vfe->stream_lock);
 
-	return 0;
+error:
+	return ret;
 }
 
 /**
-- 
2.41.0

