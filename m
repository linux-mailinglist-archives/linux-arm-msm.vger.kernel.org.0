Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3BD797895
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 18:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243226AbjIGQtb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 12:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243161AbjIGQta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 12:49:30 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF701BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 09:49:04 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31f737b8b69so617126f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105291; x=1694710091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DBkJj6t1gRX5aZK5tJ1KyLlxRpK3N5foL763peQ1Wg=;
        b=pOd5v30lIlAGxYDLk/PFn9Q0jrI0cjTP7y1DMj4bdsjdUIIlfVFvdL0voPIBrlJZZA
         kun210WK4CpCzJf+ARoXnVxJvOPIKeTkUX4tj5BEUBHjdPuP/drNnk+iJi2zn6xUosb6
         CQ+lJD9mjg5GBP3glCs6B6abzpDruvvbWUU72KnjzH+39hSGe2XGj1Qc15fuidV1kldl
         7Xu+eP4L1wYYdEryt+cPhvyHB3yucUgcnNm3k88Oogx0KCn3QKgvMWwis2Ds84DuYCuV
         Z763bNa+50E1Ww0QgGJyq41xXp7QeglLKBAystnt5lpMdTpY6LTtTZVwLkyNZPekKUJ7
         eKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105291; x=1694710091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DBkJj6t1gRX5aZK5tJ1KyLlxRpK3N5foL763peQ1Wg=;
        b=EQqXVqg/EPpQ9o+RrAN5S1QAnvbwUBbz1DcLidsWLXevGROBhofjjHkVTM4GfHd+5J
         ZCHWFczdasd2NqedIbUP7nHazfB5qzhxMwOhEs2WEeuhYf4SUvku7IYJGoqGWhvxH3pc
         zXn0ybsxqcDHwOj0vDL/xsQWVzLSIloFBOvE7XNsxNb1XarPj6AlnLFLq623BA93AkWc
         xyfbj5koArchnWcI05I7amkRFcLrvNQ/uoEt+P2KGO65WYRT9QGMjIkCrMYUsqi8zOyz
         PPyjKVaTjuzdFBNuNcgwEH1GgjzN9oLHShOQoLt/vypg3pVOeFQbgWmA4NGNRZ7OfymS
         WAjw==
X-Gm-Message-State: AOJu0YzcbyYpyWob2hbQY89kMLNMhqEU47vgx4wvsov++O+7rsxQI+wz
        pIXRJMLd5DnG9hCxtziN6KbME7PXrGDK7XYdA/w=
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

