Return-Path: <linux-arm-msm+bounces-1494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDDB7F4460
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB16E2815AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6E0250E7;
	Wed, 22 Nov 2023 10:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHdi1awW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2F5D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:56:01 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a0064353af8so142236866b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700650560; x=1701255360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR9DGP+JQhiURa6YNx5zsQUGn7vxejxt9rphdfb6FU8=;
        b=xHdi1awWctPd9J0XAGQ6KuMMedv6C0UWq6qoecgYz7fB9cKKpw4XW6Ey2+RqTMkJ0k
         2dhfP+xO8i8As3co81XhE67qAL5URoRdnESn1Y7qU4dvbw/mHppERdxfoL4Ekic+q00y
         FUiWHLOjqmbvq+wJoQnAiC60m/3+YvUnPbkTtXaFUTAFGIPyTamIQOp2KfvpaVwubXCc
         CyyESKSynT0sMByBl8OPZkK+lzNBef34EYIO2zoQLG4f8b89P1SyhsB4QMLemXe/ohiz
         fA4q0rKiegJiw3CL0jIBkJXHHwSHbIMZWvMymlHz1AjF1N4gYGWiyHi9vsrTN+8ZbmjW
         2Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700650560; x=1701255360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR9DGP+JQhiURa6YNx5zsQUGn7vxejxt9rphdfb6FU8=;
        b=fL/Y/uiQb6e0jMNlXru0gQR0KhFuj9gp3z0ZIKNOoGLQ+AW1nLrAZYgFtK2/+sUgqY
         7563ojdlMKPf4UO4w0XXTnWZRywaXZ7oaC7bNDQw4aVRD4JdrDbMEWrVZ1l1DXuCYier
         6vDHXQ8X8wZ2lvclrTFpS8lSCTLzGZGzRM2JU4Wu/wBTEV7hJaBT4OAtlCJqCeEqU1CC
         b/6BKawxGKw87y7iqb4rnKEr1nTgMkif09Qk1Lz6jnUxuk8wmAW5G7DBXT3EBB8XBYGA
         wFTIvdy7NaI/0h4Lwkbxjt5WreYLQ2yhyDFBHaQDCDNf72LFI/eWl+yu4fkZsVEVRyt5
         RIgQ==
X-Gm-Message-State: AOJu0YxATs1KQyZz8ECHqkem3IEuSlfdA4j9YYl6tCwHFEhc1DqyIyqS
	nLAvOSr4eXp+bHT8Cys+8IiYvQ==
X-Google-Smtp-Source: AGHT+IGpQSUEpRgFT+zeuN4EN0klhOh19aiZ62ImloREVKOoIKKapIpDoBnxp/k4d9cWnYmHR0/Fcg==
X-Received: by 2002:a17:906:da01:b0:9a9:f042:deb9 with SMTP id fi1-20020a170906da0100b009a9f042deb9mr1620474ejb.19.1700650560453;
        Wed, 22 Nov 2023 02:56:00 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id mf3-20020a170906cb8300b009f28db2b702sm6423557ejb.209.2023.11.22.02.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:56:00 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 22 Nov 2023 12:55:48 +0200
Subject: [PATCH 1/2] dt-bindings: phy: qcom-edp: Add X1E80100 PHY
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-edp-x1e80100-v1-1-a9938990edb3@linaro.org>
References: <20231122-phy-qualcomm-edp-x1e80100-v1-0-a9938990edb3@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-edp-x1e80100-v1-0-a9938990edb3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=766; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=47x4DceRm3tCQ84A+H24YQKTKXLsUy4vs1DvIZFUxYo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXd47jtfoUWWWq1bSqU5Il/tnuIoOdQpW46XIB
 ejEpLcuctSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3eOwAKCRAbX0TJAJUV
 VjfFEACOweqBEkv+85EBXxiL/6SI2rTG89ykNUyuIxr/hAg7E8yEfgJQNU+DFBDZrbP4NsbgRQr
 GDwgrFa3N2TkZSq/XJxsZ535oofKqv30jeGqLGEDd4lEctQKR58ey0OUBreHNxm4imBIgOo1O4P
 PIAzNgkhwTvbIKTcWzxKaolAwctveJRGAW9ivxIP2I6aOv7AqPnKDzqa+7X+69t2A9dLn5xHKGs
 LEKTHQJi593z5YY/aPOirGjuoUH+Cb+/ScS/iDfdIPz7756NWP+4RvZFK5D7veybgrf3x9WurMx
 jbKQLGPL4Jm2Iu8/lGQfc/8eapOXzt5t0FEJdFhr6r9Ct4wuGxv5SC07F6hXgXlSb0Q984DgEA4
 sbQzAPWVycUoG/bpnSmwE1m/aJ5WpiAhLjoNvvE9zO+Hzcr5dXCe+WpuXiS0cZaaebwBN7xYKAq
 Er7BFU+IsuEe1BVm32KNZ2IEgf0SwcB8Qy7CqP7UwNZ86bDZTr5LKkaR1OJyDuR2ntNhX4sezlu
 7iQy3zr6NKkvhH+BGZlDsOD2PJnAM4yeDSSJobyeBY+/T9C34/oyNrHz5O26fL61bfKQ7DA5aSm
 Hvnyc74+Yl+E2eCrL5Ai6uXx5GZrdTGcavIRaznNSNXZgbrYvknQxoz6sw+5LbXV6KgZMuCdcss
 Yfc2gvdMo9RqZ9g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Qualcomm X1E80100 platform has both eDP and DP PHYs, add compatibles
for these.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 6566353f1a02..190f61c1d0f9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -21,6 +21,8 @@ properties:
       - qcom,sc8180x-edp-phy
       - qcom,sc8280xp-dp-phy
       - qcom,sc8280xp-edp-phy
+      - qcom,x1e80100-dp-phy
+      - qcom,x1e80100-edp-phy
 
   reg:
     items:

-- 
2.34.1


