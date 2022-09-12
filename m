Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA54E5B61CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 21:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiILTko (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 15:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiILTkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 15:40:43 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62B1474E1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 12:40:42 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id o23so7813166pji.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 12:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=d/S5H/WnwuAtOJeyIv4QvW6uZ9bAOFBVC/ltp5nTW3w=;
        b=nfWOApm8lmP7/grPPcTtRVe3i6UdLx9/z++2xZm+r0VTJsQPwumy9LwQ+wrYTL1ypS
         bbgzUUqJVfBQa6C6T+wEIFOh1tRzpo6D8bPx+F3yNiV0jsKpRwWlX6CjkTA2jwTB1w4Y
         ouzykhXDEOS7zVFd2ky1L+wILQH/domnrwZzzB37i01Cv5Nynm9+kEuCrr+LfkkBdczw
         jSWTRlRG2Xxy8TV38Mm30x+my1dHezraZSC5yXi+km14qYNMRK3edEhOOQQP1U6SFDJK
         G/zsmpiN40hQ2W0PYiBBhaKJVfsybESpCYKI4D0pA7yp0nOH6BqosKW95srGkbrzuPCN
         DWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d/S5H/WnwuAtOJeyIv4QvW6uZ9bAOFBVC/ltp5nTW3w=;
        b=a7uJi01qcBNkDXJlNy/cOd5X9I0/zSOPP+qRyqLfpSRZ0nrxZE6rzj9XR3EEsH6QL2
         aGrT2rA9iYIo8RrjyVxi+oc0+ShHFv8iLKMSZbvG5fmmaL7CnbfjgnjUMYXzTwlQFv0z
         wMDQJ9UeRKzgp9p5wnHsmRKtZ12SOS7ePIk9h02yOIR+ksn06EcqlJPWL6cm4mZPO7R4
         VUmXLn7bjz4KjkGG3oQPDrvUp1o3uolr1S9sCWhp13wql2xjUHRrx3N+3+jUUdWHkSUQ
         TbeJCUbZTDE/gVMvBysmpDtGpofPudkaxQ+Ncl/ow09fcTBddY7RaiW7JPIVXQLOA4u2
         02fw==
X-Gm-Message-State: ACgBeo29oW9QxNvR3iJDfaiMsIis9uno6e3bC2XGYplIqsmEoST9pSV4
        cuX7kODI1DcecieiyKAzxUipXQ==
X-Google-Smtp-Source: AA6agR6p+bCQrgePcLUw9z+y3E1IOowtxMAQqKpO2T9Bvunzp40co8HpWgjvMiZI96srWdyat5EaRw==
X-Received: by 2002:a17:902:f684:b0:178:2fe:9f4b with SMTP id l4-20020a170902f68400b0017802fe9f4bmr18529717plg.60.1663011642598;
        Mon, 12 Sep 2022 12:40:42 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:5362:9d7f:2354:1d0a:78e3])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ec8c00b001709b9d292esm6486362plg.268.2022.09.12.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 12:40:42 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, rafael@kernel.org,
        dmitry.baryshkov@linaro.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Subject: [PATCH v2 2/2] MAINTAINERS: Update Qualcomm Thermal Driver entry
Date:   Tue, 13 Sep 2022 01:10:28 +0530
Message-Id: <20220912194028.3584378-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220912194028.3584378-1-bhupesh.sharma@linaro.org>
References: <20220912194028.3584378-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since there are several Qualcomm Thermal drivers now available
(for e.g. LMH, SPMI PMICs and TSENS) inside 'drivers/thermal/qcom'
directory, so it makes sense to list all the supported dt-bindings
YAML files here.

Also, the entry header is updated to better reflect the same.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Amit Kucheria <amitk@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d213a831133f..e72839f5629c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17043,12 +17043,16 @@ F:	Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
 F:	drivers/net/ethernet/qualcomm/rmnet/
 F:	include/linux/if_rmnet.h
 
-QUALCOMM TSENS THERMAL DRIVER
+QUALCOMM THERMAL DRIVERS (TSENS, LMH and SPMI PMIC)
 M:	Amit Kucheria <amitk@kernel.org>
 M:	Thara Gopinath <thara.gopinath@gmail.com>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
+F:	Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+F:	Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
+F:	Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
 F:	Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
 F:	drivers/thermal/qcom/
 
-- 
2.37.1

