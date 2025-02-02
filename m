Return-Path: <linux-arm-msm+bounces-46667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C805A24DD8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 13:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7B7C163EEA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 12:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D28E1D88D3;
	Sun,  2 Feb 2025 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JL4GkBxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F00E1D63EC
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Feb 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498571; cv=none; b=TRbxVgNkpej2Mgjv9ZVvfluVhNB9E/LwarOnvnq9QZTHCY1YNSzu78K9EpZ8dgzsDXQ0xqfGrKNcMvbIQBoqny2igJ5YL0gaNaSLoJDD/iqk3yE05zj69JLwJ+T1YhYewRXmNMhvwGWk1bxouKzC0JkN/cE4SiTdf7vvhu+MD/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498571; c=relaxed/simple;
	bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5Z/X5Pwn9pmHj1EvA8JuK8eppyQneWADFm0fNWoVOLkJeLG/499lH5KsD3dUhI8uBPiHday9TTV28nBXEVpxwwoXQ0mCucwjJvYEQ2LymrmnHY5sRnJzT5kl4VwwqxAJtNpFhkqNu/oD68ycGsz7+uZmfpzMe55xRK7NtMSm7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JL4GkBxB; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-540215984f0so3732807e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Feb 2025 04:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498566; x=1739103366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=JL4GkBxBbSlI0/wHjLKBhSuaSJ7t9Q5DiBXxkc2u7JVhuPzfIJmz+/8PyI8M9iPwmw
         mONIP0VSf14x83Fa0R+DdYEtJjFgaXA79df7H4YznQbYSNhFy6QUBzVNQ/GWuIdMBJjy
         Lbly12zucWNvw46adQ8K1j8i/GgK+It/NmHP53rNrno1VwHFbynshx5hmUq8ejmzTj9v
         F1qVnuLWZCEcU2LyXAJWgIb3DEHNPwNNHt/nWF3NCNyEyeWwKV1whoMLY8Do+16UBgIA
         GYrj/9yRNeX52FeeXe3/Pu9f6c4BLj2cJvmoD/VD1wXTHToADggvtH4uMBOMkDlrqeUf
         EukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498566; x=1739103366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=JgAbK4Qdt9OraLsD5eysTt5cDHadpQGc59QH3VdNjnOvDRArhMKJAxOhUzK9CESJwD
         jw1iV7PhfWB5WlbVP2lucF/o9wqp2W2UoCHVC/aCZC5RrRexzdYqKIDc6ZZDEUS80GRm
         l/SuZK+CURfYEp7AIVg/WvkGmWcPjM1VF+adBz+umIUNTChzZ09W+exx5Z4g67amrkBU
         m9eLMvdOBD7bmdZ9mYfWw0e3KP8k5nXDb1MSDjjjdhC3zYhg8PnFVXp6KwRBJssRWZnd
         riKP7d9TLIrMA55BDtUfB13NpKbg1RMDKB+XDGpArSJlY3htD+HBbFUzFYxTcVGlrjqw
         NYow==
X-Forwarded-Encrypted: i=1; AJvYcCWx6ydcBzPNiXwUw7Th9UwxSKZiwoub3eyRbQQlEX0CjaC7HjfjeJyg0HQTR+RzJChfhWT0Em/NiKOqtEGy@vger.kernel.org
X-Gm-Message-State: AOJu0YxpTAVI8yHDFSjTB3sCw7808a3fso5KerA57nhdzrngJhDa3NQH
	qVZ3e0hFjxXQZrkxgQb7+CEo9dQc1WccyDw+mlwY+5bZikHYsuVsmYPdzZMIXwE=
X-Gm-Gg: ASbGncv/C1cQpvZM5fR2pwzhF5ExgdQFgtfr1pQbvx6GyVAH+Bzc4cyHiWVf2j8KVHn
	VjlVRllh6sY7AG0cTUcwM4JzwvMwwcxYjN4Jxd64GtBgDldUujMWfX0R80vrb/PHFA20sc+M26g
	zdcUpejD0Sh1fQq0/maDWvUi1i3eVixs94pHBr0aMtjkLAgI+e8EuOi+lDWwtNbwZDDQbWFa1Mr
	RgcLLkX94HsS/Nb4ej9QOMaVaBgVjCR5LOU+0MwlbPTVIfks07Zu4tOTzkV0f0/gfxJzHNvESh6
	q1y4l4RWBNRnGhWGilTqC4w=
X-Google-Smtp-Source: AGHT+IGP98WumGAvva+L5oENy7ZtjMAo+pqO/eBrk6bMfEKIlWE1R/0IRGd/QpefZzWafsWgZy/y2w==
X-Received: by 2002:a05:6512:32c3:b0:541:1c49:26a with SMTP id 2adb3069b0e04-543e4c41038mr6109076e87.43.1738498566072;
        Sun, 02 Feb 2025 04:16:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0a4esm950663e87.114.2025.02.02.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:16:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:15:57 +0200
Subject: [PATCH v3 1/6] dt-bindings: net: bluetooth: qualcomm: document
 WCN3950
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rb1-bt-v3-1-6797a4467ced@linaro.org>
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
In-Reply-To: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn2IBFNJQoyc6Q4TD+Kypa+h8oMgJ1mr88BTN7
 iUCRw7nItiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59iAQAKCRCLPIo+Aiko
 1dQvCACSiRQJBXKmOxljdACfeKHT2m75Y5VpbZRWKMkcI4H0buAMvopgfIgG9wPFTf/dek+VG6p
 lqKqBfxIV+KU99Dcb7wxL0JW5UBsMx23ADuVZLjUmdCSJq+tSakpNlbdkmaeXyV/PNUD/ULwhyZ
 MGX56kw39F9vBS3TgKHbv7ncPOqS1mNm006aKml/MWzxKqFLXt6mlofqI7V/K82io+gfHeSK9am
 Rnln3hHL6poko2ReUQcMCvpYBAcF7RmwaYk9th1OWVNRCsz9QpGgjdzztVW0T5JFUbjNWxd5VvI
 hen+Oa3myvAKVNmTcGGAZt6U1MMoI4lAB/6hVDsISJPP0Mgz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

WCN3950 is another member of the WiFi/BT WCN39xx family of the chips. It
requires different firmware, so document it as a new compat string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index a72152f7e29b490003114dae1e36df85cba384df..6353a336f382e4dd689d1f50a624079aa83b2ffa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,qca2066-bt
       - qcom,qca6174-bt
       - qcom,qca9377-bt
+      - qcom,wcn3950-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
@@ -138,6 +139,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,wcn3950-bt
               - qcom,wcn3988-bt
               - qcom,wcn3990-bt
               - qcom,wcn3991-bt

-- 
2.39.5


