Return-Path: <linux-arm-msm+bounces-26351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C89329A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 16:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4A91286884
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B90E19CD1B;
	Tue, 16 Jul 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efPuzL5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858EA19ADBB
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721141330; cv=none; b=BBkdugIPOSUEflqg66UtrOOn9uZJZwVdGFSE1I95++kq2GCzTGlIFPUL9ck+t7T3TLSRsm6Jk+6wluzY+lKk+TzaObnjROiDmxG6ZsqvKZn+g6u18kvCmImotvsflJn1yPyfWbRJBtT4H4d9Rj1QhpU5DvOEyKPZ1uGBRZ3V6Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721141330; c=relaxed/simple;
	bh=bWuhf1ICw3I2jwagK6LuZPJ5kgY086Z9ZS82Q9meJUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=toW+yOUjsQF8xb1O7++QlAj8pwaMjd8PlodKSTao7D3vPPOIo/H8SK0/YE14rhidHP2S2bN3IeVghcNjrtGlrIDLEtmeifA8YWJpvDYI4TxH6fUouQUHnJgR/wXSPf30FoC7tXSCsW48zV3RThdB90zyCOHFrFnxQvhi+DUSdrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=efPuzL5W; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4267345e746so38682145e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721141327; x=1721746127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8i31+WVNl/nD6EKdwlewPxCt2fUhKOj0/YKykgGnpWo=;
        b=efPuzL5WHy+Hxe6k+fUFNWh/4Wgi7wHojEOFTVsLLGfZmRkX1reodISk5M3z6AqKgE
         6zTfrXirEoYK1NvJ+v9QmlVNUGkvn9m0lpNKAikKRguIEZZ4Zq0YLPC23tNZniUlUU40
         sC1bgszmQXmrUzb4osTXbfOhYPDI2ruA2RQfRvZ6OkIK4G9+qGfhvVUUrSnk1seIBzpu
         pPItp+VjXt5GoUjXWbtzlrJFRSd1XcVCWbsgwaBi1bWchxuNuKFzICTVSNFTv3ym+h78
         5iBLYpRdqVjHThTwIOzNKf1mhSS4OKkgeuhmjBNWD2auGw8EWaFaIj8y9oXxswbgCVLf
         JkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721141327; x=1721746127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8i31+WVNl/nD6EKdwlewPxCt2fUhKOj0/YKykgGnpWo=;
        b=Sf5HJ5vnEQxhn/DzL6Qznlvg/iqNZ+FiK7xkO6e9+CIkNl+dgDo5jQhxs1zoNAGMzn
         qXhw6mDX0UXcoiyJQWyTDMmPNvaNr56LenxxS4nvu15pwuhka1vcp8BHcEeCZBY+xkky
         RX3cWh8x3hIsBUUKBnTd3QZ5swFplY/YuCuvsptZd1C6pPj/KAiVinrlTwMDakVRcY9w
         JUPUNQUGdMN79Owf8gdX60btj28glzsNtz4cPPSl/uSHt3FYLRpq2114QVmobn1yJrAq
         qGXsAH+LhqpRFEFpB+WZxqlWvU1cUIXJHEHYTLXZlqTwtBgKkR6rCKxme7gxEoHCh10R
         YZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUsrpyIZqqNrnqTWwbyWEZiVlzyOavVWgnNJV0DVo2Ej5LIBGxVY2/hk92uuvG9g0NXFsvm7oR6gAizOZFHwxs60QJ0cT+wTGnOeHiHAg==
X-Gm-Message-State: AOJu0YxqJ8ZszeDcTRFpSkFnfZYzgeYHUKWzt6nlhfo09pZqMfnvG1Ye
	xFvIqynSpI0d2HJ3b3GQ+eKZMSd+MRPvePB2eu4gneUqbqwOhT79boKwCWdjXJU=
X-Google-Smtp-Source: AGHT+IFSyftMP3yVlnEcZDbvmlEYg59teKQ9FJhUnZ0QnL7q3XwsBMSuMJCTplBqZIJLQQ2kqfK6+Q==
X-Received: by 2002:a05:600c:4e52:b0:426:597c:7d58 with SMTP id 5b1f17b1804b1-427ba72af91mr18038825e9.39.1721141326863;
        Tue, 16 Jul 2024 07:48:46 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef44b4sm131907145e9.42.2024.07.16.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 07:48:46 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Odelu Kukatla <quic_okukatla@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: interconnect: qcom,rpmh: correct sm8150 camnoc
Date: Tue, 16 Jul 2024 15:47:38 +0100
Message-ID: <20240716144738.109823-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm8150 camnoc interconnect was mistakenly documented as
"qcom,sm8150-camnoc-noc", for which there is no reference to in
drivers or device tree.

Correct this to "qcom,sm8150-camnoc-virt".

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index 9318b845ec35..0cb4f7154844 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -71,7 +71,7 @@ properties:
       - qcom,sdx65-system-noc
       - qcom,sm8150-aggre1-noc
       - qcom,sm8150-aggre2-noc
-      - qcom,sm8150-camnoc-noc
+      - qcom,sm8150-camnoc-virt
       - qcom,sm8150-compute-noc
       - qcom,sm8150-config-noc
       - qcom,sm8150-dc-noc
-- 
2.45.2


