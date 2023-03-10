Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5437A6B5352
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 22:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232106AbjCJVr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 16:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbjCJVrD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 16:47:03 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CA914860E
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:45:00 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id j11so26094005edq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDeD1c8jiZFvcLWzJgOEOd/4N4UZiwFHXqIKU182kOk=;
        b=JyG+ACdLOcfxTA50XxnxCh7wM4cKF89tKtqh8zVaGOWFSYzYQNvJ7J2uZlfRT8aZ+G
         R71uFFNjMuMMD2tdQUtH1CNlwQzkGWCOCUc48IBscZi/1PK9Psy4n23tdGK+z/UzhVP4
         rBdkNufoyjp+DISa6DHjPPU4BAS2Ku9Us+TPqkPS26TbUVrRh696GRxYG+k1kh8I4TE9
         Hc7TafaabsQMK7scV2MYcOxM2VGoOxuNlbyCj0D+ENnIMdBeFF9rbeqUWVRJmn33fYpq
         bqAcRt+q6tzQ7XD8U3RnOwT2N1ukDFJ9eOQk/gNvRfExvpFW+hmDS6rR3qNH9flTSSZB
         Uteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDeD1c8jiZFvcLWzJgOEOd/4N4UZiwFHXqIKU182kOk=;
        b=lz3VOjOZur6+dRpaZJejgmVTAIdDaCz7Mn1yspVmMpDiAyppjOWizDa/U8WQOw6dpf
         VAYBKDnrIxoKBoo4KfKWvE465mHN4c7u2Swfhm2Pm06Qv05v3U8b30jXjHmyERURzJWk
         DfgEdxPSwnYwgttD5NSvb1mxXrkYtyZ8QZOrQ8rLMZqUUZLrQxrSz65vtGARND5Zqfz/
         uFLbSOkprngvelT4qAcZRPRT77baB3ccXDwn63KKMu12YIIbbuvDZA60tycW0nf6/22S
         1PJZrwv+gEAcOgy4MuE8gmsgCruZLJ8fAjuBQJ1EuYeC6Psv7ZEvvqws4wTtl44Cck7U
         KvdA==
X-Gm-Message-State: AO0yUKU93wU1Kwt/KHH6tdAbALeQAEodrnbXKPIZyGOH/llq9ypyvjUS
        gJBXadRQdKDvEmz09YGOneBMAw==
X-Google-Smtp-Source: AK7set+M49wnt3MxSeCs0h1xmBgIiP4OJipKtz39vYdOVUEOao/bMt7H1KnDHnhgyi1uB06shGL3JQ==
X-Received: by 2002:a17:906:539a:b0:88d:f759:15ae with SMTP id g26-20020a170906539a00b0088df75915aemr26028674ejo.42.1678484679060;
        Fri, 10 Mar 2023 13:44:39 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090627cb00b008cce6c5da29sm334571ejc.70.2023.03.10.13.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:44:38 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/3] ufs: qcom: add __maybe_unused to OF ID table
Date:   Fri, 10 Mar 2023 22:44:33 +0100
Message-Id: <20230310214435.275127-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver can be built on ACPI and its .of_match_table uses
of_match_ptr(), thus annotate the actual table as maybe unused.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index a02cd866e2f8..82d02e7f3b4f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1693,7 +1693,7 @@ static int ufs_qcom_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id ufs_qcom_of_match[] = {
+static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,ufshc"},
 	{},
 };
-- 
2.34.1

