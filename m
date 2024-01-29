Return-Path: <linux-arm-msm+bounces-8859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB68406F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 14:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD9D8B264F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 13:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B432164CE2;
	Mon, 29 Jan 2024 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z43q0eeh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D766B5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706534920; cv=none; b=AORdY9jc+SzHhMg/PQAVyL5mvuIFOUGfai3IDZgMTYHXTTP/qWicG38nRu4ty68GKHG0miLmney7cyg10pELQXmMUfsRUrrCGhfHKAVhGTnTzwwkS5R78BSNjxMlYwE6Dh2XYhsMWGytVT/arIJh6DtOAluVB+7mo+z99cVJ2Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706534920; c=relaxed/simple;
	bh=PBWGy7JgUOyIqyVfy4hvk3xG1JmqdvcdtR2/+W3ChLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fV6ZOZanKxEre1fC2sQ9+NuhuORRWBobs0VUNNQ1lR10bzOSD57cm1vo7GoO0v/Ga7lHuEkQrcq6Ty7hip1Ty+XZRTPptyalINYtKE4prGPNWWvrDanaDL8c2sX7KgRo/0NYyOC4zIid/yga9KcrBmqMFtd2IAMya+P7dacvO80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z43q0eeh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55eedf5a284so1428255a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 05:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706534916; x=1707139716; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7e47YEkH0oIOOb0rhPBNbCNPWUZe1BkXE+YWYxCYw/0=;
        b=Z43q0eehd7I2WJSKQRSsTv1UF34M7yJ9yYdsZtA/qYu41UpYgaS5iwED87RemtAVI7
         c82iVe/ka7BDtwVs5sAPY9zg0hmYnNceOES0SBo3eEQAHvsbwbpkEVED5xkKYGjGQnCs
         RFKKIU9d33tckQTmbZ2anTd8TWfwaqKKPbWz/ab9CHLc/FvRfyxCKALN/im7nCbtCIL3
         yFKT74n71kgXF2mGQVU22+PnZyzKGoipcber8lGnR7VeF2MdUXGy0znBu8u+N+xsr69X
         A6s52tEsJ5w0aDmnothkCeqxF0oNsSs8XPSiSNrh2I31fSpv0XRjJdFXZnu18IeYUYbC
         afDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706534916; x=1707139716;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7e47YEkH0oIOOb0rhPBNbCNPWUZe1BkXE+YWYxCYw/0=;
        b=eABIgV+c1YWSSxmeb0MR1L6/yxmZMGv0mDpJi6S8EANYAtFFnUOFF181y+RSYaJkJh
         5SBJExNG5KOcR3YZXNq2zWr8bcxHoFBBfoz+adPb83JLDVySKQIOc3qurN61XR5iLARX
         Akx91uBnW59fAqteZW1fERP3LhO0qDfU5Xn4MFluSovIM+Ba3sVMM8gzsfPn3X5t4iSK
         X/RRWSaiqKpatuzdr1xE/hqxmiY1czNCoW1ZIutWW1AEKTFweCshtNX4f9OFd434pVOF
         ueD5p+TO5PqfDQq7+MR6xJS4w74yZYZVbJuNMfkF9KgLXZ6bGyJWAW00tOe4bUiNcd6p
         zcaA==
X-Gm-Message-State: AOJu0Yyq/GJWm/58OUWf9ywcHnzb8d5uU1OiEMmK7eiZlvvitwhyqOlO
	d/7iwZbVrqmQtaBXsP5l/hUHePw89zsLfZK3G6C7GoWk4N1PK6HfGpmhx3VwXTo=
X-Google-Smtp-Source: AGHT+IE2HC5It0m6m5IqGu01EO6KI2xlcQe+WqiBdJyiH1M1fG7VW+W+d99VPVwTvHlH3moEEQx/PQ==
X-Received: by 2002:a17:906:298d:b0:a28:32ff:8709 with SMTP id x13-20020a170906298d00b00a2832ff8709mr4274660eje.15.1706534915741;
        Mon, 29 Jan 2024 05:28:35 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tx26-20020a1709078e9a00b00a354adb287bsm2667596ejc.74.2024.01.29.05.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:28:35 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 15:28:29 +0200
Subject: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: document X1E80100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-pmic-glink-v1-1-e45cf194b964@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPynt2UC/x2NywrCQAwAf6XkbCBZEYq/Ih72kbbBNZZdLIXSf
 zd4nIFhDujSVDrchwOabNr1Yw58GSAv0WZBLc4QKFw5EOPOMhIT4frWjHNVe2FIhemWylimDF6
 m2AVTi5YXb+1bq8u1yaT7f/V4nucPebL09noAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=PBWGy7JgUOyIqyVfy4hvk3xG1JmqdvcdtR2/+W3ChLs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6f9tyClNvn7/HCnHSIX4D9nJhk96Dn9JMQ0x
 zd9QDxRXfKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZben/QAKCRAbX0TJAJUV
 VvrPD/9qNWrXYMh8AsUwB+XjCMyGueiont0WzqNFDjRwd7x/TsKkOa7dVLbKY0Ovk4JtqOfoBF1
 sbFyR7axtGRtc8TsQzSykEB9KvPffGs95j577oaVaau5c6ZLthdAPv/eyNlphySxNWJ3kVYzZeh
 JN2yMEAvTaeu2V5t4Jz2Vol5lmnXR4eRz/z3XkNA0RfLLgWopazhVx5tN1yz81GIi9xb9o4dKBe
 bLVNZ5rW0wE40jA4EOOq6xvIuuzGuWPRaC+BuSl+WQsu4X8oKL1xfwYIvbFYYXXWX6PeoEJ1Cq8
 VbbWABIayxvZvC0jOPjkABAJneOmc/vw2eeqGzfTMtCxfyizS/5uqL68YBsnIwegFTvII4VwiLJ
 6NoUZQ14zA7jmPuajOn2IuBDnqcni57MBm1Ac39qqc97WSOYbmrjXpPfB00ct1rziLIc4GnD7aY
 J7RtoPL9Gi3b5f6H/wE09S/zKNOqTCajJ7KGhLCSpaPMgU2guD9+R+ZLHlcqoehOO1l+r0hupR7
 75BnFW/SNea7jP0DKcy/Jq42a9U0BcdZK5IvjNlx/pDyC+BQa7Cop49NqzMcemd+K24QrmLv8tS
 4Ba2E3G0TaCy03HShyZZ6nPimx7iwDV4z2bhNkalACWjlVN/hwOyCcH8hXR61vikkdNv7EqFVw4
 E47luiI1rPCvpoQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the X1E80100 compatible used to describe the pmic glink
on this platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 61df97ffe1e4..d3f3259ef77d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - qcom,sm8650-pmic-glink
+              - qcom,x1e80100-pmic-glink
           - const: qcom,sm8550-pmic-glink
           - const: qcom,pmic-glink
 
@@ -65,6 +66,7 @@ allOf:
               enum:
                 - qcom,sm8450-pmic-glink
                 - qcom,sm8550-pmic-glink
+                - qcom,x1e80100-pmic-glink
     then:
       properties:
         orientation-gpios: false

---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20231201-x1e80100-pmic-glink-2bd105bd8dfc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


