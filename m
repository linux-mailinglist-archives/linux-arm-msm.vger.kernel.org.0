Return-Path: <linux-arm-msm+bounces-47384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81509A2E7CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFC4D1887495
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAD91C5D79;
	Mon, 10 Feb 2025 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vznp9r4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679F41C3C10
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179974; cv=none; b=m8INnCGpL5mnE4aAPZM3C6NxTbSC90xkrCbpVuRrDAPRawKYUCGaXP7ta2R4Ed2Y4cSmv0RKhzTCjAiqGnEJGDhEbd4nS78+q1skOpyqlUG5XXzeATwCXEN699aJHLo5jBwjaEul+5PMfxzhwR6m/EFhE/Nei0siB0yCR6ddn+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179974; c=relaxed/simple;
	bh=lfPxQaMFtbZZ21l+5BkGf/b9VmjDtPXz4pGJe8td0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjiD/NY+bQUi6DH63PiGT3Z9K8x9Eh0BPM3vpeB3IFBPNGbpj90c8IeM7Ja05Pn9nB7JGP6lK3SoYst+oigbw79QjDIAh9so63Ce2yoe/aotoBQp+8PDoqwGeLRVAapsvx4rubJbHtOdPdwUt6rQhVqiV4xCrtx0MQOS59PVxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vznp9r4k; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436345cc17bso27692565e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 01:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179970; x=1739784770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6IMyTwFG9nX5XomX1cPcbTQEA5dGNGjA4zy+aU6zlM=;
        b=vznp9r4kRG/5HpMbAThTa42v6X8kAbqrxSfdTW4/u6jTkxdGRyFZ5lsrYbp+2tadWE
         CDnm5uLebDXVJNqgrzj0KA3AnFZCp1hYZSywuQLCKlQGweuHYJRFOt17bC6MSIMi2Qz7
         5mdfMYugA3+0Ecq42MPRP65lfMw8pShP6GquW8Lzx8k7TOPbrbLdxzKMIY8R4JdfnjBO
         F330n43LfU/ooxUUNWPz7APiZiGDLlyWZpinBnJgbr+QhXGtyuiSbyO/6yul1KIprThE
         A3oCDTwbV737gESNN+s2RRrM55ByclAevmqWwoMrqtvbgJQcAUBTYxIC8llXJMzd03Dg
         no5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179970; x=1739784770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6IMyTwFG9nX5XomX1cPcbTQEA5dGNGjA4zy+aU6zlM=;
        b=WCVUWYuc2TDeciJwqawKFeHNlhEg9n9y3HvxPr5VPjvc+M/SPMdh3wwgrcV396yxUz
         1xFxrAf6fjSmE/Jp2o7EF8zW5RJhTUt6agcDymaj4MXZddBqVNGxz8YdusEWo5F2VCuE
         R/+0ssCSuXNxDzzv8KXRKKwoiLv+CD3ObuVZ9lPINN4KkCxLIyTomXnmwtXeGOdgLwe5
         aIKK9aQ9PDLnmS1Ho0Oy9a3JUJucey9I4ZqTjzssGR82CpE8Ktphj6IcWxPRX+oMR87Q
         QVDlnuF96ovEk+OczMerXLORl596lRCC382ML//VFcpA5vuG/3RrK38sJL0LJi8Zq/Cz
         zr3w==
X-Gm-Message-State: AOJu0YytPrS1hRumXXrCVuOzZDcDIGdJLValYlMVWDG3JO4QWEf82ErD
	0R5hGbxa/SVf23oGGFL9i2Wi7LpRZHsKl0odZDrMpPJNftaiPOsNDjTcFSyxWws=
X-Gm-Gg: ASbGncvd+RSX7fEHQqAaKTeGJmEPem2a9tRaNYSgKXLwC5gR0C/mOvdDM/HDOjDUxHW
	3eueanLUmBCbavJkQqN5TUSP69VkPqbLVJiA+vskIQ5Hxl0UGgVniv+eLqlO329xlX6ITHF+aVv
	TU8YiVJ6c4EXayCA0LJ0wRyUJcCi8h68Ycg3Y7s+UHF5du9XzcoDxnzgIl9e1KmM8GDhMTlbLVA
	i4SbN+dupaN83s7KvxOKlw0dM8VaOU8wFx3IHAq0k3A/kqidZQzzVItj49RTHmc9Kqz3xdSir9W
	EuFUHdmkKJQPt9UuCjuFVia3iIpCUcqFhzLx
X-Google-Smtp-Source: AGHT+IEwRlW2DrLkiktuMQW07Z2SL+sgeHovK/MRPd++QhDmgF5mqDzEvYPl7b2V7XAwAGPCMCGvAA==
X-Received: by 2002:a05:600c:1c28:b0:439:4825:727e with SMTP id 5b1f17b1804b1-4394825731amr10547935e9.23.1739179969602;
        Mon, 10 Feb 2025 01:32:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:32:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:40 +0100
Subject: [PATCH v3 2/4] dt-bindings: display: qcom,sm8650-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-2-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lfPxQaMFtbZZ21l+5BkGf/b9VmjDtPXz4pGJe8td0xs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce81eAz97fUjAcEQoJORzuzKOeABTMSToiwQoHR
 qUCUVImJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvAAKCRB33NvayMhJ0fplD/
 0cYY7doqunfG1masd3Y/dnrcjJOQZun5jdN203atsgPQP4RpjN7SJwpQRjldFB3ECitFP6Ts3jXjJB
 Mzo/orhdxvng7eUp4tgvlgCFj0oRSFiJEq+bK3baw546MjZjqNE4Zdb8tJr9ZSVBbfRLyv5Cb2n4kR
 Ir5o69mjEbbqIoeEidhvOSycaPtbofamK4vlVAyksAYUHn8LFyl8VjFGVeB7MG//MiREqtb7s5Lvof
 9lmLQPrq7f5wV/iiWgyvNKoIQL66ASxQwHDKVEKiQ2ZINVkrs11Xq4NlRa8U2mPQDnSpWjPnV+sdzK
 I9giyxUJT9WRRS+coOa/ArWtE4kAd9khekWm4PLKfLeCp21zhKsv8zieZ8icHVMw7rSREy3TJj32zM
 0fBeAcICpneYHFJ2XY1aIyneMgjMzpkoApLjjuplu49EJ+l4IXgonehRtIUvuqWnk73vy9vzaFTIpS
 j9+G5Dg+ZC0CZyHp8JicLzUSZTXsGhDmN7a3yK3b7fYsIP9VblL9ScHfvZ+pX0B/jR+QLu9pGxdd4V
 qx0cAFnlkqmX5bxRgwQfcRkh4tSjBwkKUJB0G/Kte9ME0EjH1QQUqOM6NMt5C94Y3ZfyTj74St+jm9
 6vcTY7/gQWyaCVC+mVK2kP9KW7q4uJvdEMDB4cEnQoWVwKlww2yh4auzz7+A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg
is required, so explicitly document the mdp0-mem/cpu-cfg interconnect
paths and complete the example with the missing interconnect paths.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 24cece1e888bd35f169dc3764966685de4b6da1d..a1c53e1910330af473a1e6c7827026e0770131ee 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -29,10 +29,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -75,12 +79,17 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
 
     display-subsystem@ae00000 {
         compatible = "qcom,sm8650-mdss";
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
         resets = <&dispcc_core_bcr>;
 
         power-domains = <&dispcc_gdsc>;

-- 
2.34.1


