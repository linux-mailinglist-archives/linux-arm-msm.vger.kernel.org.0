Return-Path: <linux-arm-msm+bounces-20945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0C08D39A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A71BB1C2356E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A64D16C451;
	Wed, 29 May 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BkGnpRsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983B415AAC6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994027; cv=none; b=rb9kS/NnpkPxj1n5RdYmOsG3tg0lTKyHsyT1Va9CLHCNn/X57dqIy+ynFVyyPZbRWh54UnhDmOA2IJLbt5W7NDJt0Ie5lWkQD4kVWH/e1v4N522df8I+smc8DzYkblHgFwQKbdejwn1ceB/8lSf5+8MZLHI06Z+Q6HRN95jlo9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994027; c=relaxed/simple;
	bh=XJAR3RhvR6FBsC5FKjrD7WCfWMohl/ns3r5JO/+tsoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwWX5lPqNN6+nx9G4gRTdb084usySo5VRaoJ2hCjGih3wnbbsYzxS6m9gc4p8a/xQkuiWjOSwvV39pqmUleTtHSrC4OQI6R4ncYEA6LMXGBhNB9LUov1FyIoMZZYdbsEs0onUJSMyaE2q+3srJd3/m0LyBnvmIhXu7Yg//q3Q8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BkGnpRsz; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e8a8ff4083so148751fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994024; x=1717598824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49pWMHhYwMB+iC4CjWOPr/9ggjWLiI5cpTwzEc3Odls=;
        b=BkGnpRsz9WTtlnrPn1r8ce1Rj5YLx57JM+oyFad3mSa0mCkFz1JBvpssU1XiX2mQXj
         uI/To0mhmtKOaXHM4isj4wMneCeS2KI05BSqkLyNKroV/cdWzXuSkAKr28dJGtCXW+zL
         CbmAPrxF3TWd+sPeUNfkhk/V325qixFbYEcjgXrmO4cuVKUdfKOplZ2XgZd3PetqX7QP
         hSCtFgr8wGV+8FEdx6wf4LJt47ia3vGUmkwgy8ghtpAffN6p4opS0EdWVj6z3HrQ2RQb
         r+sI7Lr8iK1ZJR0hw+Iat4eQsvLfNvayImx+FasigqNNr5qZWdmo3hBtvTMGcJ2S3bwk
         bOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994024; x=1717598824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49pWMHhYwMB+iC4CjWOPr/9ggjWLiI5cpTwzEc3Odls=;
        b=BFF8S2567NIn2JbbFa07kUKa4fk+zDyzJ5VD6wh2UfvzDGla4grwPwLCNQVq3sPgUl
         +qloXHx/YdBFKKqLoMbgAFC8VfYkvfkZTJc7kNKlUlW9FMcgz9A60vRpkqbkD5eDo5iy
         YmAxI3kaT80zynW+5ULVMp2DMdmr1nxYObyNGKRNhsocyObiowy48d8yay2lj34UsV+V
         bNoi8ykW7DzLZkyiPgRVA5k7dCQ+WXXfaFfRdw2nuWw7WU0XLmckj6Ya61XIrPYCc44f
         B9OUoU9K+qu+329tWQoamFEB4yNe4ru9cbqmIKJm+VttIwgjkMboQARV4/IORQCq1akt
         DA/g==
X-Gm-Message-State: AOJu0YylaVlwj1E+Ipo0ngAxtpPkI7hebL7oOGQnj0Zl7UjiF/RnfZNW
	aA2Yx6J9hN3WvtKxunIa4vs8YzDmiPBJNoU157dsj3WVXmEORCEEQuDCCcFGQ/0=
X-Google-Smtp-Source: AGHT+IF5SnXtXtXt1O5TqHCktvP8TguUoxRFp3Ni6lxYEl+ZuzpUW0el3VzT6go9yPQFrs2YHD+DSQ==
X-Received: by 2002:a2e:8854:0:b0:2e9:5342:628f with SMTP id 38308e7fff4ca-2ea4c87396emr7659471fa.16.1716994023965;
        Wed, 29 May 2024 07:47:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:46:59 +0300
Subject: [PATCH v2 01/14] dt-bindings: clock: qcom,gcc-other: rename to
 qcom,mdm-mdm9607
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-1-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XJAR3RhvR6FBsC5FKjrD7WCfWMohl/ns3r5JO/+tsoQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/kn/rVhKP/nSfnxh7HbhW6UrixRpuSxntJE
 vrqc8YRV/OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5AAKCRCLPIo+Aiko
 1cl2B/9JiJiHKmCt/kp2lc1Bs2Aj198PlJeFrJFQRKGYVfiuJGiXG3SRFp5GScaGofluy5AYMuh
 TL2t/QwGkPjENIJ3VgpMmQuxKe94gTcrMS8JmBDdyfadRp1WzfMgjJPyf94SzDqjhYryv7FvvGi
 OK4huUdszexdL/AX+AjsWpz4PRLKoXz8DwdQt/1gj6MNBYTd8BRqFLWsfLENFTERDfGIZc/ugTh
 LaLwcKoGaCzrh/5kwCfkcGdEfLY+WnPamlodKiidwhBLNg9rfZsFvaAc3PIC8aYyR7CDs8kZ894
 ppjyoyPVeqQ6dVQ+ooG6EqMbtUCVty6X9Fwx0G8urberEgb3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The only platform remaining in qcom,gcc-other.yaml is MDM9607. Drop the
stale mentioning of gcc-msm8953.h include and rename the schema file
accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/{qcom,gcc-other.yaml => qcom,gcc-mdm9607.yaml}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
similarity index 87%
rename from Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
rename to Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index 7d05f0f63cef..1264f3d55761 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/qcom,gcc-other.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,gcc-mdm9607.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Global Clock & Reset Controller
@@ -15,7 +15,6 @@ description: |
   domains.
 
   See also::
-    include/dt-bindings/clock/qcom,gcc-msm8953.h
     include/dt-bindings/clock/qcom,gcc-mdm9607.h
 
 allOf:

-- 
2.39.2


