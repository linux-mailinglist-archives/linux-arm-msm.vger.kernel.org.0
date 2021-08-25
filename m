Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C39D3F7B15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 19:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbhHYRD2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 13:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhHYRD2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 13:03:28 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8F3C061757;
        Wed, 25 Aug 2021 10:02:42 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t1so362485pgv.3;
        Wed, 25 Aug 2021 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1n43wAVOxzBGxSvP2fIXgbQ4WfFdyefeLR8GbhuguqA=;
        b=Mu2nZ59PVjVsaiKHTG3kBPc4KRFmCJDLmYpE8ypEttdaC6YWXRpulAmRalse/h7W1z
         XfG9aE+JeCSC/raTRox3nAtoqq8tz6jb72FecZFyR9RjvhWm5moBcrIFAssjLNFwGSHM
         AlAazVcKWX3oOC6E4gRN0e1ALwwlpElJiS77Ch9CukWm/cQSCdd271RbnBq6fQfnhUU3
         h1Ooi9eotdvbmFG97nk/pBb5XqLwf4B72dCL1F47Ez6Nbc+XlYTWzx+8gppCQzPTMDtV
         SWsnW8ou2UzAqjdnBSnYIjRcpey9pBthDnKyfvpzbsDuClYsD6O3QM5Uk0igIFRRbvv7
         snPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1n43wAVOxzBGxSvP2fIXgbQ4WfFdyefeLR8GbhuguqA=;
        b=WnSapHjOVuxIOFVkAkCFrgKHXUA9sg7sboJNjw12dtFN9HOgg1iS8lEdDmBhe/q2W2
         D28Y6o5xLUMF8TH+yNYuD+3I44sU1GiDibNXyiGo/fx54z6BPBJixSO/OFUcEaGVYc5a
         sNLygICzls8kq6/sQJDB/2UVznhFaiDyt7Z9vXJJ0uekAqpCxF46XIX1iTKbm4dov9iV
         qHayLiE/qGEBMhcscpIzCSZUt2wU3VlOod7V2/UR2h5hu3gumcbRlq2HevJTI1Ypn7tb
         1coOz0owGUx3SIbQSSLL3m7LuE6ErJnzLWclSTxiJN/QsWPichzKaHPNx0OP17KygmbJ
         HUpA==
X-Gm-Message-State: AOAM531+s/GUGTQlgvRj/iWHOHy1SCjGcHV6xuLJEOC+oLOrxyMg0I+U
        LQlmSLGuqcxTTcYPmamIYGI=
X-Google-Smtp-Source: ABdhPJwM051cFqCEEJ82+Yv99/nhyMvvA+QxTYsfudZlwdiKiNDIBW45+FWvPbJ6qGjH2c3ZyCDI9A==
X-Received: by 2002:a62:5f07:0:b0:3e2:7556:95a0 with SMTP id t7-20020a625f07000000b003e2755695a0mr44830565pfb.55.1629910961679;
        Wed, 25 Aug 2021 10:02:41 -0700 (PDT)
Received: from skynet-linux.local ([106.201.63.141])
        by smtp.googlemail.com with ESMTPSA id s46sm340940pfw.89.2021.08.25.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 10:02:41 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     sireeshkodali1@gmail.com
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/4] dt-bindings: power: rpmpd: Add MSM8953 to rpmpd binding
Date:   Wed, 25 Aug 2021 22:32:32 +0530
Message-Id: <20210825170233.19859-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210825165251.18358-1-sireeshkodali1@gmail.com>
References: <20210825165251.18358-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add compatible and constants for the power domains exposed by the RPM
in the Qualcomm MSM8953 platform.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 include/dt-bindings/power/qcom-rpmpd.h                  | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 239f37881cae..996ddd360de9 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,mdm9607-rpmpd
       - qcom,msm8916-rpmpd
       - qcom,msm8939-rpmpd
+      - qcom,msm8953-rpmpd
       - qcom,msm8976-rpmpd
       - qcom,msm8994-rpmpd
       - qcom,msm8996-rpmpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4533dbbf9937..f367cf6fedf3 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -133,6 +133,15 @@
 #define MSM8916_VDDMX		3
 #define MSM8916_VDDMX_AO	4
 
+/* MSM8953 Power Domain Indexes */
+#define MSM8953_VDDMD		0
+#define MSM8953_VDDMD_AO	1
+#define MSM8953_VDDCX		2
+#define MSM8953_VDDCX_AO	3
+#define MSM8953_VDDCX_VFL	4
+#define MSM8953_VDDMX		5
+#define MSM8953_VDDMX_AO	6
+
 /* MSM8976 Power Domain Indexes */
 #define MSM8976_VDDCX		0
 #define MSM8976_VDDCX_AO	1
-- 
2.33.0

