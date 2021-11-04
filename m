Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39503444C96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 01:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhKDAgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 20:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbhKDAg2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 20:36:28 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136A7C03649F
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 17:29:52 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i3so8556404lfu.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 17:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EduzFSMcbcowyUdVsZOQ3QCCkHbswguLmvqxtlvq9E=;
        b=Uri1ZJ4sOBnkqVeNZATlFLFym7O57XBdOt2cp4G/TYL4brN6SeInkdYDL8fPAZmmuy
         XE/jh/ybJzMHi3zTIJb3jYHFhBHNeeya9zftw7iHq7tc2dxv+SAjfUasI0QYW1rAuf5D
         4CbEZ6ipd02fBUXbkeYWLJYM0ieIPnLgkV4wQgKIH068RqdalDq7gwIyJQX2ZkMaFksh
         K6uhGLkN/w5VTjPoFJDfE3AMEBHQAtFDqc2577VwULzFkkINhoj390oQ8l/gfmo7A/Mw
         l9b+UpuThAVpV555BdEd7KCzoR2SBda3HyCu0ZDxlJRZK1PSqh66tA3oxxoY8nMtKbK2
         xnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2EduzFSMcbcowyUdVsZOQ3QCCkHbswguLmvqxtlvq9E=;
        b=HrQYGEX7JaFUfJL9J+J+0G0m+mYFo6ki86FCgZBtPOV/8dQ46a6FVfUN5UpW9UKvRj
         505+zYlrY+xsgZ5GgmoO9ACR25QqQUKMT0hQ82uaDdqcwEppVT76AAs3jS+7BDgnZPAA
         wyPzGdpihG3q74B4IlLMZn72JKx0aAki0rYVXTStWWORE0HId+OlAa+VSg8jQesXulp4
         VAlw7nHP9as0bndHTMnYvIQLbgnRat4kA4ctxl6ViKEo/2rwSoKW+SY/QQQCNUcbgCWc
         sd3Ox7GcUq9cSIVwhkbH/qA0Qd2Oni6LLWa5P3GP/GCEkp7nI9iqUuoEGcrhpZl8cAGR
         0WmQ==
X-Gm-Message-State: AOAM532SHzf5qui5/It0NCrO6cXFowPE6KsWBAoNAngQypOMRg6J00Vw
        NSZV2Y3lDKowmzeS/pzG++Qzow==
X-Google-Smtp-Source: ABdhPJzdKfgEjgEsbBOTNDYDWlmBdFd5rdOA6licbA+x1ZwxVMZh8TixHMhiqgccxudcmU2SJyU1Dw==
X-Received: by 2002:a05:6512:3b28:: with SMTP id f40mr43243755lfv.639.1635985790435;
        Wed, 03 Nov 2021 17:29:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 188sm329861ljf.71.2021.11.03.17.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 17:29:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: qcom: apq8096-db820c: specify adsp firmware name
Date:   Thu,  4 Nov 2021 03:29:45 +0300
Message-Id: <20211104002949.2204727-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify firmware name to be used for the ADSP. Quoting Bjorn from the
respective apq8016-sbc commit:

The firmware for the modem and WiFi subsystems platform specific and is
signed with a OEM specific key (or a test key). In order to support more
than a single device it is therefor not possible to rely on the default
path and stash these files directly in the firmware directory.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index d01a512634cf..7e7b416e7d21 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -166,6 +166,7 @@ bluetooth {
 
 &adsp_pil {
 	status = "okay";
+	firmware-name = "qcom/apq8096/adsp.mbn";
 };
 
 &blsp2_i2c1 {
-- 
2.33.0

