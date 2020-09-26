Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00958279976
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729777AbgIZNDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbgIZNDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:03:13 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06168C0613D3;
        Sat, 26 Sep 2020 06:03:13 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t10so6913811wrv.1;
        Sat, 26 Sep 2020 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FAc2c7I/7YEuxUzctA0YH35pOjmz1ksRdsyMMrlFOcI=;
        b=bGRR18hzsA2Fo6YoEc8o6GWL8EVQ3GLguIhP47dCAnYhC4zcB0rZ07zhgHdwIYwTjA
         2SCIAf7FWD4FG4W16fmzSb4J79spKbMV3Bbny0B2wQVo8TpOuGjz35HSeTn1UzWIROZw
         iGVr4KisT1Hq6CzeD2xQFMRf/YSNgwyew6/WmzVx+tW2qmRRoVYpNC+QiESp3T9cLvvj
         mzW7yHWnb9R62AJezq8FuNLu5EgWBPckSWl350St3Gj+cxCB4L52+BsiOGyi6VYXO06L
         3EjH381j/xSIxgZLsydF+e/Uh9WAJNEYIryiElQVhp053k6Py2sPcRHdrHiyb8++2L4N
         AgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FAc2c7I/7YEuxUzctA0YH35pOjmz1ksRdsyMMrlFOcI=;
        b=gjGapfpQzUXFG5rvH/plhV/YTpoSEXFH2lApPTSPa3CFU492FxTf2bdHsZ7eVnOslK
         AQsNpMm/nFWZgPWmFOFeJRQZEK5mfP++WYbdsqFRtdsgoIG+/2LKQdpBwJKVcASMCeiK
         /1ScHPoyQOR30xZMuweV5W9VHmedlNyJH+++crhVDce75Z4TST7SOpvyhfP7H4O/uxZy
         Hhl+kaEV3yrCsEL5KQDBP5mcvGbXee7qX4TCoynZK/5D1siZpQWLkLcrTi4Ot+imKSvF
         MIF1hCtFvGxtoTUr+R7E6qzudtiFnVwaRQ+6FsC1MEG/bgnszSbMGQFAvlHFMMv9ZL6D
         glEg==
X-Gm-Message-State: AOAM532moCVKwKxbs8tJqb0YFGRmRAxboAmGoIncQrW0w1qBC1iAKiWd
        IDebKQ+HBDtk3A71MIi3WlQ=
X-Google-Smtp-Source: ABdhPJyFSWOfpYdYrSVP28ElgXESAJLVp3y2EneLR7ymncQP0H/CPGOmyO045Qb+a7Fr3DEHDqeXRg==
X-Received: by 2002:a5d:60cc:: with SMTP id x12mr9359265wrt.84.1601125391673;
        Sat, 26 Sep 2020 06:03:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id d83sm2853213wmf.23.2020.09.26.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:03:11 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: clock: Add support for the SDM630 and SDM660 mmcc
Date:   Sat, 26 Sep 2020 15:03:03 +0200
Message-Id: <20200926130306.13843-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130306.13843-1-kholk11@gmail.com>
References: <20200926130306.13843-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Document the multimedia clock controller found on SDM630/660.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index af32dee14fc6..8b0b1c56f354 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -24,6 +24,8 @@ properties:
       - qcom,mmcc-msm8974
       - qcom,mmcc-msm8996
       - qcom,mmcc-msm8998
+      - qcom,mmcc-sdm630
+      - qcom,mmcc-sdm660
 
   clocks:
     items:
-- 
2.28.0

