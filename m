Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7103C31D862
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 12:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbhBQL3t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 06:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbhBQL2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 06:28:23 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7335FC0698D9
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 03:22:29 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id g3so13458161edb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 03:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H55oVf+vtyN7HxdCueCU/Bo5w88G1JjR08FHZLo79yA=;
        b=XhKs0MUefQHDW7iatF5O0gaVei4Uxibk81Op6qqXDuyWDvoGs36UXSk/neMSHUf7oc
         zqJhv0Ufd+OsoFyG9Bgh2qzc4BSy1NA9JtTcKdtE6ss8XZk8lBAaoVYySsJDrRHaFKHA
         MWFUcjXnNoKwuvly59NDsL6TodD0KKInn+4wCkqggSvE/i4sISmcKpHaFalJIUavBgI+
         CbfyzEKQ9YEPpLRH+VuytNGytFC4KJSmY2XLSY6dxKna1mTZVUoALYh/vNlykGxF+VMq
         TB56OzagBLGF51ps7NNQudWzwciDlNBYQ3J7yHG3dGpB0NULwRCyFZonNjlX75VMrhAl
         W+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H55oVf+vtyN7HxdCueCU/Bo5w88G1JjR08FHZLo79yA=;
        b=eW1yyjexGY+ihDKReKDPNBlvuEampSDah4xNek1kOFWaSNYo5a33ZrXG4d1JGPTPgr
         WUOUPUnx/yf+CYBO/dP6JwfC7MyyDdqhoQsnoIzB3K80j5TlWE3Gp6jTIZJBj9B1RSZP
         oDLRAg1jrPKGa9xh8bZ69ttpm2hqfVK5b9eNO7fZvOJZPwK9ZH4OqiRX4484YYUHRpzH
         aDM2PR1LBcHV1CDAGTQV3xVpZuDISPbB163DVBJ5urIXrjsbniE1wVNtO201jf6xcbEd
         i6ZB7SkPY6d51XX0xEUVdXCpnyG/qKXLlqvNd5bUsbFB/lJeEf2zHum+upf96awkqdnh
         HDLw==
X-Gm-Message-State: AOAM530ngYnrCtFA0WSL5qWHhI1rQq7iw1c5nwZ1NLlCRYBVZKfoQdJ4
        2cE7ZVqc7GpbfdPEDFCKhHGoHQ==
X-Google-Smtp-Source: ABdhPJwwWGwCJUEOQcVq1UqBCmTuYY4HrumtezUIBMHk7mgBhVbPR2u6j6vJ91OUGb55xmLhr1n5Sg==
X-Received: by 2002:aa7:d35a:: with SMTP id m26mr19600992edr.292.1613560948258;
        Wed, 17 Feb 2021 03:22:28 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:22:27 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 18/22] MAINTAINERS: Change CAMSS documentation to use dtschema bindings
Date:   Wed, 17 Feb 2021 12:21:18 +0100
Message-Id: <20210217112122.424236-19-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Due to the complexity of describing multiple hardware generations
in one document, switch to using separate dt-bindings.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0da3255abb91..ed3894b653f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14687,7 +14687,7 @@ M:	Todor Tomov <todor.too@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-F:	Documentation/devicetree/bindings/media/qcom,camss.txt
+F:	Documentation/devicetree/bindings/media/*camss*
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
-- 
2.27.0

