Return-Path: <linux-arm-msm+bounces-21290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248B8D63C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A54DB27788
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDCD1822D5;
	Fri, 31 May 2024 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqREZSQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7317C17F511
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163588; cv=none; b=lQKuoORJHJ18JtuxuIbheMOidLovqgEzlqAFN8mkGfV3poT7l+aTDfidNTIxRB9/+Y743ijYAef4nBPG6vScwzK7BDAvx5Yrc38L8sOikl+tj8UET4UJbloPQpjtsTyafvMsE/GS+8tkcekbN80mWN+64anQXbiUvOsFPxEBZSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163588; c=relaxed/simple;
	bh=a3nkquIZAm40X7UDSijQ6XrUV8CJyLgnduP72STm2fE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XaQVLEiNvWqeiekhhdHZRBmfCp2D8MsbQfKYOwdzxr5s28HOMxG+kSn81RU2tVoEo/+ucQtBNyWEdYSUGhY7WaEQ2qQg3IW5kkSWm339VSLyth/QqoS5euzp4XCajVGq43Khuz1KkJveLK0S9sxylkh0YjbdfqwhmdaaC59YEZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqREZSQd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42101a2ac2cso10502595e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163584; x=1717768384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bj22JrOnCdnGkODtMpzRDOSnPS87N7HbJkievoZB3w=;
        b=TqREZSQdrPYlqWpfspqg3zNuffU5Pq7IZDlcObH1ApT1WNFNxAEyF82FK6Q7eMZAmQ
         0VoaNscfz2OtK4MnpB06xZBSSLGOz/Lqi7tqrgP1A24Ikul43CWytmkhho/P3TJEuhWp
         thulBk8V9S1gcuoNiiGP0d5Kjj+mFAkuIK2xeYi/GATRrFFoLDs/5eYX+hzXHhrUgATp
         Gom1GJ1/yy4MlSYrt+LB7S1UtHOoetBqrrD0P5uPeXI9MCPgL5HhJgamihtnfSCadW1Y
         XpzH2VSBC1r0ctGOECI/nGJ4kGWuMBNXdzrXBggy4jB2Ig2GGNswr0O/PGqFmjkxOTg7
         /Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163584; x=1717768384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bj22JrOnCdnGkODtMpzRDOSnPS87N7HbJkievoZB3w=;
        b=JgSsjuNoaBkEqMWoS8QXO0/smCsEqgju1z6Lmh+Y16Jo64tPJIFtv0rlEiBTqc/dMU
         pGTIkYhwfzTuTf/qWm5P3rlD/aiL11OHSfKtS79CueoBXPqr1lXy4FsBm17JP0LhtzQM
         OnG7S+M/YBiJ0AOlWdOePMSOkITFfxMbQjDbpugFaRCQ9ltiJclItafr3edTDWkq26kt
         zbEWroE5A+DvbVhfm25MgK7arExOIirUgLRLhpYoJT27WXSRlLUBYpyy4ypkwgpvK8PZ
         fMg0DTiz4ufJ/obJ9HFpquaDFCr2do6orwdB/ly/oKIC6AY1BGyJ5vBVwrFwRNSR/ddz
         DiAQ==
X-Gm-Message-State: AOJu0YyGOHk4NFAIr34+IFZqyPDaTCth4BWtp3J86HsNcd6tAmF3zoZS
	ifWwqIA81AobOD5/rnHPOPBUYVYQuhovZdid+aXYVvkko2Gr89kEFT4z+uiRZBQ=
X-Google-Smtp-Source: AGHT+IFkCT/EKJa/5F/9lJasokBUiOUQnSYtMv9keliTt8A5deI+h2o5cnpOEViqmf9aqVw4kU4CYw==
X-Received: by 2002:a05:600c:5254:b0:420:1db0:53c1 with SMTP id 5b1f17b1804b1-4212e0d3f13mr14180435e9.41.1717163584031;
        Fri, 31 May 2024 06:53:04 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:53:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:30 +0200
Subject: [PATCH 12/16] dt-bindings: clock: qcom,sdm845-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-12-b37d49fe1421@linaro.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=a3nkquIZAm40X7UDSijQ6XrUV8CJyLgnduP72STm2fE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYhWRVPziUKMDji4XXqawmnVnzfA/zp9B12F
 u4FF6jTK0OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWIQAKCRDBN2bmhouD
 19HYD/9WP+/1E/zQ1lat3JD1ORhlMFyQtKDlAauw4JHHGXuBnG9COSb82lH6HhnO0/RsfSx8FJO
 6ixFEOGtFCtMkSOfil/dOTqA58qJc3xEFfvWkz/X2QDHaZj/2kygRyCxcFsE7N1RkBwgit/VIKb
 AY6sEZRV158fCHaz3H18n/5RrMErUNcHPRzsoyV4fOihvvsGvnJ21NuTwE3SO5VCZtjEHm+Oki8
 ZQrbUNsu4MQYvlYilOLbNenIuwwyryR13BPU6bw6Xf2REecEk0I3AlZN8MsDYyCDWStVkS+T7N2
 fGHRJi+V2f9tN5WoJbCLWjoo8GMo/jNLFd8omXJVR27y+kydKO1r0HvRAWDl5eSm5uwzAvt3/cx
 /Aaa7zAVg8DmlLt3KDIWKZsC9iCna0/jeN92E7K+2G82Elm2jOib/T8r3bAJDbBfbQCsZ/bFQhc
 5lA2WZbW/MdVZoFSq9JFJrjO6xqrjyvVT7EBA0RfpAdpXmZj6kKFjK49pXO+dMSCD4S7EYDVO1e
 r8p2I7oW5YApE1AnejIoOsU/AvA7dadOXb+al6auaw/DwE8aL/zduZa8FTrmHqwbxmPawYqU/bS
 xS7A/+ctohRpZgxF5lymWC7S4eMYhR/gsVXdRXp3qXzVDi7fWLoK6H+ou///O/18a+nxq2qbF6P
 4Sz7+fIopGcBoSw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SDM845 Display clock controller
is also some variant of standard Qualcomm GCC, so reference common
qcom,gcc.yaml schema to simplify the binding and unify it with others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sdm845-dispcc.yaml           | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
index 719844d7ea11..220f4004f7fd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
@@ -46,28 +46,16 @@ properties:
       - const: dp_link_clk_divsel_ten
       - const: dp_vco_divided_clk_src_mux
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


