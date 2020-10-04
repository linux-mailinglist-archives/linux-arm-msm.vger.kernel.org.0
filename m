Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D8B2829B3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 10:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgJDIvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 04:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDIvc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 04:51:32 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC330C0613CE;
        Sun,  4 Oct 2020 01:51:31 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y11so7316292lfl.5;
        Sun, 04 Oct 2020 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aGFXgEn0SxcMT/ZVIS2GPg6RYOOumP/yUgc9Wla5ZPg=;
        b=rY3enCRb75veRHBp+kAHxdqJ1uQgL+agHWoCVx8PfVHbG0SER7hrMqN17PQF9/7hLm
         uRxkbJJISoZdMG469CdMGCtZW6oQLu2vfNJv0Tu4uoijSRxY8C5ugdS87FK32pZlp0WW
         B/zRG60vL1OJcyHhbp1rGKRZSfjpWhFTk0Z5IduVFULhecqriUQ3xQdAj7azNHV2ORXI
         7zKDpu2MenuWlKwCW+wMPiTe8avE4iY+BQD3iD30dxMFKtRm5KrbG05qE6rOqICmxy0M
         2aFLBsSjywUorHIvPm0WJQkD5dmNH1seVLgTyjw7WwS6mcHNqATfJW4ta7z9YQroLMXm
         En/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aGFXgEn0SxcMT/ZVIS2GPg6RYOOumP/yUgc9Wla5ZPg=;
        b=PCpkEOlyN3u220RPva02kj0xi1lk7l3Yj5TfXVFW3vQ15EUfcLzwLooh5k+V+ksx0c
         2vdKj9ZRfSF5wHPPougaOCsjyuIYmfp8nsANBteKV4u6LQrGGs+0dna/R1PeQRITTn2A
         bHejGRE82v81dFuZt23NcRtFZ2oXHIya02ZwSLakqEAfgROlAWDYeHle466D7ZJbzEM/
         ako3B5JeVW/BlOurcslaV3O1XmrOEE1hCRVAidCaGadoIiOL/yP+Rn6E5SY+kNxisu6Z
         Iu24Ii16AYDV3GolVlwJOGqCKlyRC/eH3/0n9uLnMFYsz0h5dHMPTKG0jT52/NzXtyfj
         5clA==
X-Gm-Message-State: AOAM533x2wrhDFJ6pcEY4lsCUWnBxU0cpDN1FpztZGT/vdasGCoURhPI
        OwejyCLvh8auSOtYFTC6gX0=
X-Google-Smtp-Source: ABdhPJyrZUk6+g3LwOKj7ab51kOOSrFRJr34wnHpOVROSsjFcNR9RnsQ392UQDfE7KU9uw7ELqRFwQ==
X-Received: by 2002:ac2:5e9b:: with SMTP id b27mr3425903lfq.312.1601801490314;
        Sun, 04 Oct 2020 01:51:30 -0700 (PDT)
Received: from localhost.localdomain (host-5-58-109-138.bitternet.ua. [5.58.109.138])
        by smtp.gmail.com with ESMTPSA id u1sm2217468lfu.24.2020.10.04.01.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 01:51:29 -0700 (PDT)
From:   Vladimir Lypak <junak.pub@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Vladimir Lypak <junak.pub@gmail.com>
Subject: [PATCH 2/2] dt-bindings: regulator: document pm8950 and pm8953 smd regulators
Date:   Sun,  4 Oct 2020 11:34:13 +0300
Message-Id: <20201004083413.324351-2-junak.pub@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201004083413.324351-1-junak.pub@gmail.com>
References: <20201004083413.324351-1-junak.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add list of regulators available on PM8953 and PM8950 PMICs. Also
document compatible for PM8953.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
---
 .../bindings/regulator/qcom,smd-rpm-regulator.yaml           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index 8ef3033444b9..a35c6cb9bf97 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -33,6 +33,10 @@ description:
   l12, l13, l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24, lvs1, lvs2,
   lvs3, 5vs1, 5vs2
 
+  For pm8950 and pm8953, s1, s2, s3, s4, s5, s6, s7, l1, l2, l3, l4, l5, l6,
+  l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19, l20, l21, l22,
+  l23
+
   For pm8994, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, l1, l2, l3,
   l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19,
   l20, l21, l22, l23, l24, l25, l26, l27, l28, l29, l30, l31, l32, lvs1, lvs2
@@ -68,6 +72,7 @@ properties:
       - qcom,rpm-pm8916-regulators
       - qcom,rpm-pm8941-regulators
       - qcom,rpm-pm8950-regulators
+      - qcom,rpm-pm8953-regulators
       - qcom,rpm-pm8994-regulators
       - qcom,rpm-pm8998-regulators
       - qcom,rpm-pm660-regulators
-- 
2.24.1

