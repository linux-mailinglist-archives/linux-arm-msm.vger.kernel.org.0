Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C2B6B5353
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 22:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbjCJVr3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 16:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232136AbjCJVrD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 16:47:03 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22895148631
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:45:01 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id k10so25991966edk.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/tNj9gS25pI9VyRe21DRJsXFmXi538O3sDmJsaIhbM=;
        b=mHe+pKeIu1CXbogKykneE+Fc+HhQ3E2/eoguPMQut6YTvOAz1EhASWFdf/7bfL247/
         z7QRjGBRyKglxyCfaEAwl3mzkZlUOiSlzskD/okpjWOrGvwcDsyatzbEXNKNZfDvRkQ6
         WzGjeE5QzI7y3yg9pMftyw6nAGAPsLUZA27z00CtMF+/+cCRmc4mBJxLiG8HuSgOupKf
         QmZa2V1EY12i0B60PKfX2Fivzd9kV780zd60tYf7MMADlormeIe1BOWMbUUD2E7XNBoj
         f8dksX5HAgHm2n8OJQzR7k61dlBN+uEAbUHOq+A3yL+uNAy0SWLHBy7NXjJLWZKBmi0S
         fTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/tNj9gS25pI9VyRe21DRJsXFmXi538O3sDmJsaIhbM=;
        b=VZ05XC8uoBEvQ+xUyyYv+9vHLatCTeHZzR8C2ZtwNalyy5PGZTsqt/ZvQuo0mR9sd6
         1Dj5uWraGbVqZX9cR2LdhMEkqr436RDBDCcQEvNxDnw3WG6jetCH8Abu6PV9T15iIz8u
         1XlVyiRe2f8d235C++K6UdElXbFQJSGHL53x5jAmYEgmx9QCMK0RQpdVCzDXBQrxawa1
         98TlOFfVyM7jTAe/rS46QmDIZ6kDjN8JQ16PIpshkPovH/b8xb7cb8/BP97ekt+lkFU4
         SyYIjHTyuhb9Y2HsvmHWcwokAdpN35PD5oQQfC1w7MdO2erN5rtKBfL7Y0D3nucqVDaL
         MGeA==
X-Gm-Message-State: AO0yUKXsA6wnkdhN6p5iSV7ZBdE8lz871Ju6PX9iyeI5xzSC0SD07fVr
        nAOwyYi4v29Vck8yIhZke+4NMRxD7ok8jm0S+Qs=
X-Google-Smtp-Source: AK7set8DLp9mJ4FR8mx3RvxrKuccd1KMSGK8/5PRNVTAH2zIEOB1tnCrI4pH8lb5tGq2IO0YUqWmjA==
X-Received: by 2002:a17:907:6e0f:b0:907:672b:736a with SMTP id sd15-20020a1709076e0f00b00907672b736amr33166740ejc.31.1678484680278;
        Fri, 10 Mar 2023 13:44:40 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090627cb00b008cce6c5da29sm334571ejc.70.2023.03.10.13.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:44:39 -0800 (PST)
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
Subject: [PATCH 2/3] ufs: exynos: drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 22:44:34 +0100
Message-Id: <20230310214435.275127-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214435.275127-1-krzysztof.kozlowski@linaro.org>
References: <20230310214435.275127-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/ufs/host/ufs-exynos.c:1738:34: error: ‘exynos_ufs_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 7c985fc38db1..0bf5390739e1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1761,7 +1761,7 @@ static struct platform_driver exynos_ufs_pltform = {
 	.driver	= {
 		.name	= "exynos-ufshc",
 		.pm	= &exynos_ufs_pm_ops,
-		.of_match_table = of_match_ptr(exynos_ufs_of_match),
+		.of_match_table = exynos_ufs_of_match,
 	},
 };
 module_platform_driver(exynos_ufs_pltform);
-- 
2.34.1

