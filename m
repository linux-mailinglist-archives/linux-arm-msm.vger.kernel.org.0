Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB607979DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 19:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbjIGRXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 13:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234609AbjIGRXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 13:23:20 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6232D1FC4
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 10:22:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-500b0f06136so2060932e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 10:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107301; x=1694712101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSVSANzjwjWJL58JqdMOyxf39JxdZOjplNSWyv8wvaY=;
        b=xALuThfYddoyygFpqHi1J5wcG2bjqihD8Emx+u/Ttfa3a1dv9yOkIKKfM2zMZToW1z
         z6X3rJsJ+dQmdByJH4RK3KlfA/TV6X5VKQZIcirQXatGBvtXlrHRXxr7unIb/ILrnO/S
         HNyg9aDyH0Hogy2gJwCK2BRHIJtiILKOfJwhej9TFGZa6m21AQKA6p+mR67vhLJGnSOp
         78fXgKCgbGuBe3UWG2Rin9mE6PXNcuivLJ0tKkSZxREektI0xspb9nHXzGk1Z10JD8gL
         rIDrM3czWKvJ9JalvqcyKfrVbvuticNrBOwqdi5Yf6PM4ANnGeBvqLrOTtrh3lU8tf3h
         HcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107301; x=1694712101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSVSANzjwjWJL58JqdMOyxf39JxdZOjplNSWyv8wvaY=;
        b=Xv6Oezo4Jmj6KBO0YYKOi+aLcOTcHmTDAjbY5kJlZeH/omIShjPWiLbFHyoNuaO7Qw
         SF/T8alnVfSUG+JAWnR60M55zsqzdGHRmaamXRvX9iuMvzRJRCEOfPAcP1dopyWEt4QH
         K06UKb2g4eftM84FJVCIhyiGapUtpmGLf4WuDIdgELSmaDKiEKqW1KmIC/iqcNu+5an6
         tnosZCM2Sw7SZtzsiUrZGSNpLLeZVKc9ffrk8J8lc7u5AVoLLgQUOhb5Wt7cnuVEOSj7
         umfuT6xmQoqsJS+gAknOWil/HWmcuUedwL8kpZTnk+XwSetYE90vIOHF2jMkIK16a5c6
         +oFA==
X-Gm-Message-State: AOJu0YwHIENTOIMLxrUa9uPIAVdPPfms/nEQ440wj8WoSXX9EDDpd4pC
        Oz35k2YDvwkTf8Dk5N6QhUbg4QkaGSLeVMCQnSA=
X-Google-Smtp-Source: AGHT+IHKo1JmOMb4+djt+NKGu6fxIHBbTNo3gqmI+h53oZDKltsofVpbHkVMvWTKSuUVVecRTOFMHQ==
X-Received: by 2002:a5d:5643:0:b0:319:7471:2965 with SMTP id j3-20020a5d5643000000b0031974712965mr5838wrw.21.1694105066449;
        Thu, 07 Sep 2023 09:44:26 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:26 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/17] media: qcom: camss: Remove special case for VFE get/put
Date:   Thu,  7 Sep 2023 17:44:02 +0100
Message-ID: <20230907164410.36651-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From sdm845 onwards we need to ensure the VFE is powered on prior to
switching on the CSID.

Currently the code tests for sdm845, sm8250 and then does get/set. This is
not extensible and it turns out is not necessary either since vfe_get and
vfe_set reference count.

Remove the over-conservative SoC version check.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb3 # db410c
---
 drivers/media/platform/qcom/camss/camss-csid.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 99f651e2021cb..02ae3f5cb0c0e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -159,15 +159,12 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	struct camss *camss = csid->camss;
 	struct device *dev = camss->dev;
 	struct vfe_device *vfe = &camss->vfe[csid->id];
-	u32 version = camss->res->version;
 	int ret = 0;
 
 	if (on) {
-		if (version == CAMSS_8250 || version == CAMSS_845) {
-			ret = vfe_get(vfe);
-			if (ret < 0)
-				return ret;
-		}
+		ret = vfe_get(vfe);
+		if (ret < 0)
+			return ret;
 
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0)
@@ -217,8 +214,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		regulator_bulk_disable(csid->num_supplies,
 				       csid->supplies);
 		pm_runtime_put_sync(dev);
-		if (version == CAMSS_8250 || version == CAMSS_845)
-			vfe_put(vfe);
+		vfe_put(vfe);
 	}
 
 	return ret;
-- 
2.41.0

