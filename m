Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3D7657403
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 09:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbiL1IlR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 03:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiL1Ik7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 03:40:59 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E82DFE
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:40:50 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 79so10169447pgf.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 00:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neDlpAxOqPxKQsX09z7HIhUpqVcLiuVepxClOJ3AnCk=;
        b=TO9dKYGst245T1FMDa9SJ7Cxs4BbwS8yCPhWehj2oL1iNJWyO2XcJefzEiXWM6sR+z
         1Fa3k6LqqS9mh5h5Iisk7cYKSGWAQsUAlL6CtNJou0B5lAhT9FP30D2aMfRfXixnha18
         u3gSjZtQtaZWdpEzyasM0yOETDO8dugLpvvf9fLCZKeLO/kZnCTg8qvsuI1f/Ym7QKRj
         HV5VrmX/gP8FkhRCkIsLu3QZTwJoVBOpTzA5nBDPrt8tT2THbC2MVh15GpVEICGLEtWN
         enEq6qEW39ZV1z0Y3QUdwp02JupQ22ZktOsyg+AfteXCuQP0QaNBDjHeDBz0w5ZD9cT0
         EIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neDlpAxOqPxKQsX09z7HIhUpqVcLiuVepxClOJ3AnCk=;
        b=7Xrqozk7Ko7sKZrTXAVffEjLPjHs4yzY5xVFddSikXXSQqtU8BYbsp+myOOhdGSmde
         bZogwWNQTFSBCjiVhZZ5QVv0Z7CKiGbt+LCNesgqcLsmPgNM3oeTF0CxUy+1b+10zy2e
         fn7mlaPTj4X5bYPhDpXT6WdtBeWruuvaGFBhWpND+8T8/xFalNIp6Zplq43FFDetApdK
         G27NMoqgbUepdCkD+SuyXbGCMza4WQT0tJQ5ciOjHpbx2mAldJc0DOKoKefYkqofzjhp
         XIDdKpSqGCRQB3wsx7T/UOgB05kLemoec/ttScaDmUjYgZHO6EiJZ1yjHL8R4J/bRSX0
         Veuw==
X-Gm-Message-State: AFqh2kpbPpz93eYKiZzjySCV9nD8cytl8zP5cWSA9cn8rAc3N9ukBLQJ
        MaecZkkSZ8JSCY9HD8WlRzE+
X-Google-Smtp-Source: AMrXdXuvED813YpAwBQ4YACRPHJyw43PMQJzcUevAevLVbG0LtLKRvEHNJeKmpG42psm7SVaqnFw1g==
X-Received: by 2002:a05:6a00:1da2:b0:57d:8b30:db0a with SMTP id z34-20020a056a001da200b0057d8b30db0amr27459818pfw.9.1672216850324;
        Wed, 28 Dec 2022 00:40:50 -0800 (PST)
Received: from localhost.localdomain ([117.217.178.73])
        by smtp.gmail.com with ESMTPSA id d188-20020a6236c5000000b0057a9b146592sm9786286pfa.186.2022.12.28.00.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 00:40:49 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v5 01/17] EDAC/device: Make use of poll_msec value in edac_device_ctl_info struct
Date:   Wed, 28 Dec 2022 14:10:12 +0530
Message-Id: <20221228084028.46528-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
References: <20221228084028.46528-1-manivannan.sadhasivam@linaro.org>
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

The EDAC drivers may optionally pass the poll_msec value. Use that value if
available, else fall back to 1000ms.

Cc: <stable@vger.kernel.org> # 4.9
Fixes: e27e3dac6517 ("drivers/edac: add edac_device class")
Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8540p-ride
Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/edac/edac_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
index 19522c568aa5..19c3ab2a434e 100644
--- a/drivers/edac/edac_device.c
+++ b/drivers/edac/edac_device.c
@@ -447,7 +447,7 @@ int edac_device_add_device(struct edac_device_ctl_info *edac_dev)
 		 * enable workq processing on this instance,
 		 * default = 1000 msec
 		 */
-		edac_device_workq_setup(edac_dev, 1000);
+		edac_device_workq_setup(edac_dev, edac_dev->poll_msec ? edac_dev->poll_msec : 1000);
 	} else {
 		edac_dev->op_state = OP_RUNNING_INTERRUPT;
 	}
-- 
2.25.1

