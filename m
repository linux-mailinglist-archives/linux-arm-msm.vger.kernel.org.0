Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCDE0EADB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 11:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfJaKoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 06:44:13 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37023 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfJaKoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 06:44:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id e11so5678659wrv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 03:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ekKfkWDCfgvdYFBqJ7b5n66skD2pbjEj/Fafy9wVYoE=;
        b=p0OVbe70YJ3RbJ4RWYVXcCAEw3/iNsvZ3oB49YKg88yOpRl/02se9mwZF0WkYijZeZ
         ImG8ouyKUEdhrL3zGAO3p547KVwY1NwUr0MwmDW4me3nkHz9c8TxZqO8p9C7wQ9O84ya
         Fi1Bat8I+S6ikAilP7xF8kRaCSXQsnSpoMf1tQoDbPochwjtjeITXUMgj+MOWwHifv0C
         P+m8gWBNc92UyF3M4g+DIkR/74N/O2NgaUEvMR54PMxMq61DgpgRTX75jvc2bsYqceJd
         UBejyM+RIpcf+pTcGMIy+Gcj/g/nAFO3AKFejlmdAucOxh5XpqDuzg43WTM0lsXfwQJq
         XLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ekKfkWDCfgvdYFBqJ7b5n66skD2pbjEj/Fafy9wVYoE=;
        b=pa9Q4BsHMxK+IXNU2fXZvVpiJosVAeBJLmZEAX119Pnu2U/6SoCWB/YgLugl/DxQMn
         JoM+CNIQDMqP40KmfFrPHPXAsq66p50I0U0GbFO7nD69PhenIIB/y3Gxk8f4IhwIINbv
         TXIK0B3gEWJikFtc5VoIt5RiUkHdDz2DJDIaFqqnwhazXC8YJpo+vYf625XweBBbSjcU
         uaaHw8T9GHMzrkXdp+kL8Y7bHxrJzgnCiz/iFN1JPJhV3BC4boguanayuLiGXyByyu1Q
         qoZho3I1x2d2WL7fp6FQcAaEw9ZoDSs2OnighGbyOC4peQnoMyUdrr6FHuII+9KDtfYC
         JeEQ==
X-Gm-Message-State: APjAAAWh12EMGByihv1t//NDZyLJW6bMcdLjxNu0s3IFieb8XwsgS6DR
        RQCALNLzgZenpDsGH3gCbi8VnThPt6I=
X-Google-Smtp-Source: APXvYqwkj1tdfMd7sFp61o4YJ6Z6LJARFJVTUzZlGz//Zb+BVBYTcPJi9esZBNQ2DBME+krRoRPLXQ==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr5209626wrm.340.1572518650726;
        Thu, 31 Oct 2019 03:44:10 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:44:10 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 2/7] dt-bindings: msm/mdp5: Document optional TBU and TBU_RT clocks
Date:   Thu, 31 Oct 2019 11:43:57 +0100
Message-Id: <20191031104402.31813-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

These two clocks aren't present in all versions of the MDP5 HW:
where present, they are needed to enable the Translation Buffer
Unit(s).

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 4e11338548aa..43d11279c925 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -76,6 +76,8 @@ Required properties:
 Optional properties:
 - clock-names: the following clocks are optional:
   * "lut"
+  * "tbu"
+  * "tbu_rt"
 
 Example:
 
-- 
2.21.0

