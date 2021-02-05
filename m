Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6C33109AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 11:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhBEK57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 05:57:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbhBEKzI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 05:55:08 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35455C0698FE
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 02:45:30 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id t142so3451335wmt.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 02:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rtnlfnM1gUAXVxSsCOu/wsiGW/5dkOKL2/2b79ivYgU=;
        b=AMjieip+i8IyHf+fHPKCAqXPvt2zmy6t8q3fKSH337KjeyhgBkoERmTqMjRhO7jR2Y
         7NQ+gwbxnrLSOCbAGfyQhMdy5gIl32oxauYqb2b3tJYUOTy8FnqPgJ6/+Z85+L2sNoV2
         +djNzR/IETaH5kGTzVjgFMInmKUC23fdVCzqwjEELq4ZupZFDBqS35gak0FWbNFQV0H1
         9m2OFmOyhpjF5sRXvE42uXmKz7asU/xNGQzjFleTaOE9YW35S6d7yBMRZkdy28lt3gUC
         ZdwIiExQaqBgKlJ4Mrg+R3sG40lBKX2d+yQsAFtshEdpQKyVPXQZHp/nSS+qKUL3wWpc
         /ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rtnlfnM1gUAXVxSsCOu/wsiGW/5dkOKL2/2b79ivYgU=;
        b=cHCyDqFVrJ5th90JcoUMx5CPgudZKXnpDmLBEjemJNpu/ofI4GoxgV5I4oTQHZkchk
         lU0YzE0XkZT4187JhvLqR61Fcy1SQPSOcAfGKEpJQPsWANKiMQCtzVRZMD3xhI4g8fcM
         4vXa4EGW5tKlTptO8tCY9MScGpkZWU1XgpbBM+S0uV/VM0rlAHQnS/4yNNsXQg/ooPEV
         HMSRMuBIFJax4kp4Fny2SdzfXXefvI0huCsWDfaccUEoGXW/YbQIaYIDbAJU3HfJbqB5
         hNoZPEx4PtKWnLfea/MW+2sH4ic0LoKo5xEqeK1alNK2COGE61r9UFn/Or3N8Xvjqjec
         C7GQ==
X-Gm-Message-State: AOAM530lENdv+OcDU7Iio6H+7fMkNOPp+f6PwQ+TcVnkqJyA3CA9MYfC
        aqW3gCcKi/Cm3sHB5y1xNjvw+w==
X-Google-Smtp-Source: ABdhPJyPmX9Sl9XA4LzpOD16JxKn1WN7DDMPq7VRg5MRcd9VexeiXGL4nCIJqznXMqqPJ9kcyoHrXw==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr2989205wmj.57.1612521928986;
        Fri, 05 Feb 2021 02:45:28 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:45:28 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 21/22] arm64: dts: sdm845-db845c: Configure regulators for camss node
Date:   Fri,  5 Feb 2021 11:44:13 +0100
Message-Id: <20210205104414.299732-22-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add regulator to camss device tree node.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a943b3f353ce..5842ab65789c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1106,6 +1106,10 @@ &cci {
 	status = "okay";
 };
 
+&camss {
+	vdda-supply = <&vreg_l1a_0p875>;
+};
+
 &cci_i2c0 {
 	camera@10 {
 		compatible = "ovti,ov8856";
-- 
2.27.0

