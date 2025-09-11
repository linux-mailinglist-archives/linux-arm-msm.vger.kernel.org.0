Return-Path: <linux-arm-msm+bounces-73144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963E2B53615
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 16:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4EB07B440E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D82345726;
	Thu, 11 Sep 2025 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oybqtl+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476D231353F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601949; cv=none; b=ndSMwQGnW6CCq80MO4OX2MYvPAS3mYjR7JQO2UpyOisvWwdwBMcDGgyzEBz4DHBm7GVc+a6ui9nirQztIy7UjKSHqTWc8E+n8X5j3IsTcj7SU5Si5P11PJjnYWIsv6ID9HPbzPJFtBB0uRjdF+NuC6fGE1GTaw9SfQ0+jZdNYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601949; c=relaxed/simple;
	bh=prBRws9AKyD86wZTW+eWIKYLz5knWj5rzAD98i9R9I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7kRggt6e0Q7FXowV0VPreS6iUAcFgZclQC01CehYC4lD/gDnhic0Vj4whFUvkcgIu9VI+FzNGzYh0AIhBDhvWW+lPnZzCpF/UcJKr45UEGNu2j3/e69NIYWyKTgvAUhV6KKqTDIVgK4OZ5oN0Bt+GwEDRNajRRZe6/UKt0b13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oybqtl+0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b0418f6fc27so140319766b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757601945; x=1758206745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvfZ8Qsgh+4iuPHesI9UycLWEQBcekeYQGNlzH84XAw=;
        b=Oybqtl+0BLoXX87KQW2VVa9n/rBArMFhQjWMO7K3PQ/GFsWMZ+zCslfn2xHBIntzUH
         QZvSn8WQYdQDlvSVLVcYeOmSG7uEkK3KD1yBHzftnu5g+S573IJcXuw/EFkU0YswTcEO
         zXVUGPz/x7cBmGow3KVDfnzFRapJ4VSTypsevx35czN3tZnpqngs+yzUS4pynVAlIZ2G
         fCr+Mfi9tY0cEZGFo22138wvQskdycSMpTOFEoplUMqFN2bfE0uanaQHNulee+F46rkd
         5Z6qEuv5qqFH7HS3QAiysk1lPhwU6Q1QddqbhtZ3xbsZgj4ac441AtYpNpvcmNBbde56
         wPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601945; x=1758206745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvfZ8Qsgh+4iuPHesI9UycLWEQBcekeYQGNlzH84XAw=;
        b=Ag9uaMJQXqeGC5Is2160sVOg/HYUuL8Usd6/wPKbbKGtNW84tG7JlS2m3lVlyluptq
         c94vPWxkLDEksI5FgqeEb8nQCf+o+GhKcYK6gc9G/kqxLXcU0Qnq5qZrz5I/VqfQ8E3K
         ZOc7XLl+jXFb7bb5Hz7qKSAaCsTuyn9hLmYcitxK6MOf5nAdPQvGwT7VBlVtTLIahSJZ
         t+8vEDcFhF13qqbVw+ZygJmEyHpMjMvnVAk2YNOMbdFFH8SGn725R/LyRMY2uZRyTMsD
         ySOiD/5L4SI92z+nKdCnY5ux2ZNvU2HR8N4/g2P6pCxDhICj/Dvd8SN2yr4hm20bAnaK
         cOiw==
X-Forwarded-Encrypted: i=1; AJvYcCUnl4KOf8ALREFIYsMJ8YFV4mUWiLRetIXesZ0fnyDD0Ye3lcsPjHjW5/9lAOiSEqnzxpmyrYVcNSRyLEFR@vger.kernel.org
X-Gm-Message-State: AOJu0YyQy7sZrAUnFy6XbnheyVGYXCl1+209x9O3Mrs7cJpLLwWo8ypL
	c0+sAgBE0g02erVWlZD4rY23ZWifyCRe7nqaFpcQN6f1agv3AicWWuW7MD4iVKMzDNY=
X-Gm-Gg: ASbGncvLR/Rye5jEplvuPijZguA5GyLz2+MTyQRz11CtUWoNEhvRwGWTActc6bQXwpT
	pgntrgkCyq/I3FNHGBMoGTZ+qOK8ykRJwIxwLSD4FJZIw5Ni0oTvBasy8/se+VmEVIJnysHAdov
	5cZ+DRIujasSiDqj92LF5Nm3a5ObvbSukvd8oIeAaosd5BuYE8bdAJHwUcHtcGdLgVpIqb2TnU7
	+T5ebiqRgjpm7xS0nTXb4vbwvgm9h+GOfkxrzEsD7GhhjYItYKLbjgiVoe6PEabvMIaipx9BByC
	qttn/Doe65uWjOFMrln1upYZ++tE9DK8K9VEoSWZ1iCeuG/QGgM7Qy23NK+hA155ScTya1Z91Rh
	3xMJ2VyN68Qplrnfedy07i9s=
X-Google-Smtp-Source: AGHT+IHGnXEifVquqv/KZPf9m6Jh8pdEXvXherPbOAmrvLY1GZz5C+RIz5Z2dfGTZ2NzWEPIu90quA==
X-Received: by 2002:a17:907:72d2:b0:b04:24b1:83ed with SMTP id a640c23a62f3a-b04b14e274amr2268211266b.27.1757601945489;
        Thu, 11 Sep 2025 07:45:45 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31282e7sm147196266b.23.2025.09.11.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:45:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 17:45:23 +0300
Subject: [PATCH v3 2/4] phy: qcom: edp: Fix the DP_PHY_AUX_CFG registers
 count
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-phy-qcom-edp-add-glymur-support-v3-2-1c8514313a16@linaro.org>
References: <20250911-phy-qcom-edp-add-glymur-support-v3-0-1c8514313a16@linaro.org>
In-Reply-To: <20250911-phy-qcom-edp-add-glymur-support-v3-0-1c8514313a16@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=prBRws9AKyD86wZTW+eWIKYLz5knWj5rzAD98i9R9I0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowuCQPM+Rd9X5/h99qNDUNk50u0Miuhv61KVFv
 qAuYfAscYKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLgkAAKCRAbX0TJAJUV
 VsYLD/wJga5xVmz5zQrZUWdEoATC/hv+sJzmIYC/96casS6hAXEDgHBUZ9WLkH0d6YWBGz7JGWW
 XfcFOuOvQl2qQkIsR4/p0VdBut4EQJGaPvtIIJdZfjOgytjdTmOsFFACZ4SZQJQhqtG1/qjBe2g
 wYp9VgjSeAaJVrAXsCf9qzkLnLQdDxZcKFWUk40nSZ+/GbMpld7tyEhYRK4015eTCZiC0mZhRAG
 /Aw3sWUg4g6fZpH5pT4dSqNKyiUPtEJiZ/9Sjz20WpMPr8b9DejLyXM7rnpVQaItSfjkgEGDAlC
 jMdlgd7pi+cxtpUcxAXBkYVGu3njNGJpc3ujtZlGIJ8yx/4OE4XScyT0E1YFeFFATIYB0r1K0al
 J/SjVtP5slJlIVw1V0n+G8gpzU2424qemAsOpX6s6O6yn6AxrbCw9KFfDJN9UEAGvEogmTgkNWT
 9uxUR0YLa/2SDRYjKDPQNxzUMnZSYGfbBx/fNxIMbTywLyZVQ/KU1LNy2QTKRIypezjNa43rTPA
 4QaZwZ8kDolfJZuoEEdyFOXPxDxQa8pjHj3D2CAMV5qOwBxEkSbCRhfnTvUbkyhLjHiBA+VDs2Y
 6G2zx+MY+Uzn/8GJBKC0L40TUcyj2bYSB2ygZp1GBuGgL2HiIjoFQOGY+oXv0f6ehOK6GZ3lnd9
 rQ9MWOt4zShBoLg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

On all platforms supported by this driver, there are 13 DP_PHY_AUX_CFGx
registers. This hasn't been an issue so far on currently supported
platforms, because the init sequence never spanned beyond DP_PHY_AUX_CFG9.

However, on the new upcoming Glymur platform, these are updated along
with the rest of the init sequence.

So update the size of the array holding the config to 13.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index ca9bb9d70e29e1a132bd499fb9f74b5837acf45b..7b642742412e63149442e4befeb095307ec38173 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -32,7 +32,7 @@
 #define DP_PHY_PD_CTL                           0x001c
 #define DP_PHY_MODE                             0x0020
 
-#define DP_AUX_CFG_SIZE                         10
+#define DP_AUX_CFG_SIZE                         13
 #define DP_PHY_AUX_CFG(n)                       (0x24 + (0x04 * (n)))
 
 #define DP_PHY_AUX_INTERRUPT_MASK		0x0058

-- 
2.45.2


