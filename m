Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1C31B3FB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 12:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731025AbgDVKkB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 06:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730145AbgDVKVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 06:21:13 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A885FC08ED7D
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:20:58 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k1so1728369wrx.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=btgS3gZtNuEgvZcnKQBJu8IZKoX68St04X3bJOueZjs=;
        b=RdX4x+qG2UFE+QhOHI6m/WG5N1YO047NipJhXxhtmxO1wCHOS8qzIL29QlqDE7yr9H
         OHBMwTlvd1+++4ldv5G6gl9mP334Us7ARgCeAEWL3biIqT4cFXBJmqDzz0H04CSilSzT
         pwBEAdAvAz3DbhashwJepmXTNHJBkwLs+JcVzYgZ6PcYBbVlEf6qHIUNYNgOHz3MX6h5
         DGpsLcInlW6sE8CTjl+rRFRVhXcw3L2gQKKZge24/6kwbpsUnLh5rF/2ZzGrUfkNcb7n
         vF1NAGvkei9P7VFwGzbzULDYej5mF/pNhAhlP9H/rot4R6sUZhjKEivwv50Qyf0Ai/ta
         ENJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=btgS3gZtNuEgvZcnKQBJu8IZKoX68St04X3bJOueZjs=;
        b=KcN2LxHk2RuzYsTp1xbwQezWmWH3N53xwQQksQIxrzrVVZaRbb9K3wECGGgxBAqAke
         B28KmlZYi+gkkm5AKu5Dc8Xoat2oDp+LiAzNhdNPgG/QqmomrL7PlLoVK8jBv2VHNGsa
         if73Pa2K7skpcM0Gm9W0cM7e1iPzvTpLsGiMVIq0ctKs4IfTUSfi8V+kHyIC9wlqSqMT
         Im0E967Zo9DSlFFAzC+dIm39I34W1uj/lYM951NbYcOPMrOSOAA6tkdAtnOEfWHaiCf4
         0MVUlV7lKN5XLlzvM/tlNwq3i6lmgqY8sxh5VTvAKm6lL/6PElUE9554N1nN9tfEPTJC
         GRRw==
X-Gm-Message-State: AGi0PuZuesv0TlDTKpKSKIVfI1f6Ps/EHgVnTUvswveUxRlHVDd8VWc9
        QEzn8IZG2XbSLeADBROoMRAgGA==
X-Google-Smtp-Source: APiQypKjKYzHH5tG6rqSmZh+fWA4+JF/Tqqua8JrTKfSwJh2q7hIqmT4lA3T3+A5zTwwXumOLBgnPA==
X-Received: by 2002:adf:9793:: with SMTP id s19mr10286450wrb.147.1587550857374;
        Wed, 22 Apr 2020 03:20:57 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id h10sm7792460wrq.33.2020.04.22.03.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:20:56 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: db845c: fix asm dai setup
Date:   Wed, 22 Apr 2020 11:20:44 +0100
Message-Id: <20200422102044.8995-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200422102044.8995-1-srinivas.kandagatla@linaro.org>
References: <20200422102044.8995-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"direction" property is only valid for asm compressed dais,
so remove it for non compressed dais

Fixes: 89a32a4e769c ("arm64: dts: qcom: db845c: add analog audio support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a2e05926b429..21fd6f8d5799 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -442,17 +442,14 @@
 &q6asmdai {
 	dai@0 {
 		reg = <0>;
-		direction = <2>;
 	};
 
 	dai@1 {
 		reg = <1>;
-		direction = <2>;
 	};
 
 	dai@2 {
 		reg = <2>;
-		direction = <1>;
 	};
 
 	dai@3 {
-- 
2.21.0

