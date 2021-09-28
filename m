Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4544441B1BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 16:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241248AbhI1OLa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 10:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241232AbhI1OLa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 10:11:30 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D3DC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 07:09:50 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id t4so14332219plo.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 07:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e6lM+hhK/m+urfAtZGkPcFyDFl9j9yUWbcgtPEkj/iQ=;
        b=Dt9ouw+JdZulu+bRiOV4Lp9X3ScPrdsjO2Qv+L+u+V3rPvU7+03porVjdXfZyuZRxD
         mCkJRt03j/D9QWSq7dmPtUGlFPtUrL6BuOOJLvcnmvZKJkL/n4J+Wi0zo/AetMs73FCI
         6nKmBrPXY5m2RyWZAmpzCKKGCIbFd514ENjGCLux2lskkaIn3CGvA+/8renkxtYLHhUr
         vMDWfnyhKF3BqIRqmWr/wIsrCExEbx9Y/mA09kVm0w4waduxzu4XG5xtArvjrn9A6pp1
         T410f5BSXZ1IHT2CZrtrUj/pnil1ryDeLe4j6morrpm0cRCE7HkQX9j9tC8lCdTaijjj
         KAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e6lM+hhK/m+urfAtZGkPcFyDFl9j9yUWbcgtPEkj/iQ=;
        b=C+2zQRPbgYabj8mWdn1+ogfdNhn3MxqFShcM64TksR57Y15Up8LqLwmkqV4PjIotu2
         x5OnIYa/StFMF3u7M/3J37gQ2oCUI9RraaEIzR50HW2CFq0DIcLzVlfOKml+OPv0MM/r
         DU5NChTgwtCPruhQ5glFs9c58OPwXNvxzib7a9IWY9zoc1zm8jws113oVDVHOcoO7pQW
         9cVQXztWp1l4bKwCKX1hqcaLShKJ+nzFnTp4+0R92ImxJk9k8jQp10/75//7tx3LPLPH
         6FLnkvqQfVtMBYreKnRQwP3H0Qe4UF/gRihEvBfCwhz/yZmLFuvGiyWobqgotUoktBKI
         kaAg==
X-Gm-Message-State: AOAM532EiuSmmLMW5FayliobvSrINGmOenjEmfD6AsjZtFa6b7rckEe/
        eA/xvL/Q+glwuqcSbBLAs6rAMdV+A8xtuA==
X-Google-Smtp-Source: ABdhPJz25zUnloDPoCMgJVlwXtuTN4jaKyfS/PLdPZwxMzx6ZmLttqESRJXv7/5UfNvMt/igoW30vw==
X-Received: by 2002:a17:90a:154b:: with SMTP id y11mr202534pja.116.1632838190147;
        Tue, 28 Sep 2021 07:09:50 -0700 (PDT)
Received: from localhost.localdomain.name ([122.161.49.251])
        by smtp.gmail.com with ESMTPSA id ch7sm2704578pjb.44.2021.09.28.07.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 07:09:49 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8155p-adp: Enable remoteproc capabilities
Date:   Tue, 28 Sep 2021 19:39:29 +0530
Message-Id: <20210928140929.2549459-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928140929.2549459-1-bhupesh.sharma@linaro.org>
References: <20210928140929.2549459-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable two remoteprocs found on SA8155p ADP
platform - 'audio and compute'. Also add firmware for them.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 5ae2ddc65f7e..7b703a8e0cd7 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -307,6 +307,16 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	status = "okay";
+	firmware-name = "qcom/sa8155p/adsp.mdt";
+};
+
+&remoteproc_cdsp {
+	status = "okay";
+	firmware-name = "qcom/sa8155p/cdsp.mdt";
+};
+
 &uart2 {
 	status = "okay";
 };
-- 
2.31.1

