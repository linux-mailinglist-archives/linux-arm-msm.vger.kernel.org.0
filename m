Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512F46720A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbjARPJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:09:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbjARPJ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:09:26 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5906523C56
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:09:25 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id q64so36064717pjq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHz9zYD5zWjkD8amepkm4Ag4nZgnemTquTNMqE0/uHs=;
        b=DvG3z0PrAX2OmF7qqZN7PGoPsDNVuUNEI89aLDn1NF6d2o/5baohFax/eWhIeKqpq/
         rbamm9+n0b/lpy1CBkAHAQs9Y8CbUVh34qJ6ryAiaIS+9m8FK9gzF+ypTeZ+b5JA3AlR
         awuLOsJhyBz/YZONOdEjdutlhnPoPKuEvE4NXH5RGlczUSYubhqTQm3O+H6Oq+r2dyKa
         iXEf8yQwXNnUPAtQKc7H6yYeY7Gtqlg+IPTi4SRdwGWhdotAL6SyKP7HOOYG2hCVLFWt
         d/qS8Jey0FQrmC53p8IIaj1bTRHkYtxjbWsmAPo2pb3j/B948f3fqVOJmRBxK860CJ6g
         744A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHz9zYD5zWjkD8amepkm4Ag4nZgnemTquTNMqE0/uHs=;
        b=n0A1ohoo8w4a58PtJe/YMEIjzypiyDBB8U8t0SItTVB8Ziun1yX5birH7SKBiheWYA
         wS3a6uN7hP8pZUg+0So4KdPVNzi/nKJnouLtL9CuUzQLgXZ0U4bkhaqnW6K3A32L3JWc
         i1CrI2MuoEkVKa2jS2XaLZuEu0JlnsWjC2LSVogh0ZeWDxfoFtUk67BgldvPOm/B5oq2
         ZN/p9YPtKodzmAlMgoqFfY50sBZPVUQ+bYtqC2dfnU1MiuY6b+WMgbvwx7SebleD4TqQ
         6wotyn9elvMf9F6N7HDqOiE6O3PMSN1yhqgjTYYcqk9KjuuV/3TDgogAJyzwZEzcjlzY
         V5Lg==
X-Gm-Message-State: AFqh2kqAzGHa+02WruPKmgXEcMLCtfk5B4pE5n4mk8ksGKuDN7JgjZv2
        57nXzFmxyKhYT2PAcBGjLvHj
X-Google-Smtp-Source: AMrXdXt2n/Nvcj0dykZ21GfNKVTsaDXuu990q/HRSmG6kTrDTE4waMqYkyOb3/hg87VyY/AYXuVaVA==
X-Received: by 2002:a05:6a20:7a89:b0:a2:c45f:f0fc with SMTP id u9-20020a056a207a8900b000a2c45ff0fcmr7563618pzh.27.1674054564865;
        Wed, 18 Jan 2023 07:09:24 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.61])
        by smtp.gmail.com with ESMTPSA id i15-20020aa796ef000000b0058d9623e7f1sm6721544pfq.73.2023.01.18.07.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:09:24 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 02/17] EDAC/qcom: Add platform_device_id table for module autoloading
Date:   Wed, 18 Jan 2023 20:38:49 +0530
Message-Id: <20230118150904.26913-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
References: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a device ID table so that the driver loads automatically when the
associated platform_device gets registered.

Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8540p-ride
Reported-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/edac/qcom_edac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
index 97a27e42dd61..9e77fa84e84f 100644
--- a/drivers/edac/qcom_edac.c
+++ b/drivers/edac/qcom_edac.c
@@ -397,12 +397,19 @@ static int qcom_llcc_edac_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id qcom_llcc_edac_id_table[] = {
+	{ .name = "qcom_llcc_edac" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, qcom_llcc_edac_id_table);
+
 static struct platform_driver qcom_llcc_edac_driver = {
 	.probe = qcom_llcc_edac_probe,
 	.remove = qcom_llcc_edac_remove,
 	.driver = {
 		.name = "qcom_llcc_edac",
 	},
+	.id_table = qcom_llcc_edac_id_table,
 };
 module_platform_driver(qcom_llcc_edac_driver);
 
-- 
2.25.1

