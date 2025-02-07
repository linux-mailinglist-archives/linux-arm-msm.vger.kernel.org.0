Return-Path: <linux-arm-msm+bounces-47179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D902A2CE3D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 21:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 197C03AACF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 20:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691C81AF0D6;
	Fri,  7 Feb 2025 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WzDKg+oS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D97F1AA1D9
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 20:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960887; cv=none; b=b9L++TvdCxd0uC5p5nTCvrMQr/Sq1PVD34dK7tYaRWQZ8sQBKVmAkJilEe7FGQTZZr07gDj0dAg4T4Y9eEMfHMrhwvc3jTOMHkes65SOXKTa14b6EBWI4czA5fosyYvVwyluSWoNT38hKtjb3aYM4W4prn66clxKPgaPweqVqAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960887; c=relaxed/simple;
	bh=s14YKYID9PJaE3calGZbF8LnlKIvHymDbj6L+7VVrMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpNkAAjM374qNRPBW9lyV03TfIcuPp+66apKkZJ1onNtb5vwKHV4qQwiuUKGPOyD6Z+7JNS4PEUS4JyrFyA42vd8dfTKVOl0azOnn4FzMXR6MZSzBjAzxz0Sk1xQ/9bomjYjDlLkopGkar54vA5YOrITDeK92n8oxaklZXSsSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WzDKg+oS; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30738a717ffso22877361fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 12:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738960884; x=1739565684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSlGgKqz38+k78ygp0mcUEOzYQKAs3hlnKXdF+3RtWk=;
        b=WzDKg+oSTLe1MMSevZxVsh0JQRZ/ZbAhdwMQliFqLf+J6DNgbJ4iwZTGULujH/R2tm
         yZrcgz/mnLQGm1n+2vVGPMC1eMTPcNogO/AQvjL2ZMlQXM1r65JaiylApApsajiu0GZT
         QTZAJM0AwfH/kdI1DYZXl4oDd6uet9eTibIpOIzqnOOYcsdfFrqYAUaVYY2DvOO+9gyi
         Nnb/V6pzzA4XdO4PvIx4vl3dKZPFWbdIZcMGjWG2Iay/jqr1oeVygFP+2yho6Tupjou8
         NTDUWkpPPzfe3BZPwjV/UisuKrAROl+F5LDXIxTm4ANqfXgKnJBtgHMWWAhClXhznLBX
         M/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738960884; x=1739565684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSlGgKqz38+k78ygp0mcUEOzYQKAs3hlnKXdF+3RtWk=;
        b=S0aKd5RAn8Cokzb8bEZFa+yWjMpSYK8INOa7hp++NvIsniF2cg8+V9EFpCG7GLoLqF
         arG7QjDqEGmC/lsePmKRUEdXIBBr+w39F5oFS6mx7AZKvPgMe246Qu6QX4C5jE2Du1re
         9p4v3Qy72IO1vOwgCwqy1nK5vD9P3ZRI6vTO0fI4045ejyvCLOXPV+75mcNxMMSDxFW0
         yhkTJOjWpZl4ocQ0a14wKmHRsOHK71PkI5FlMgYxb3sYu/8s9wgfOjqFQ6pi63ngvheH
         2pMki14IGfSGpWQwgxsmu8Yzq0TLZvyuiEXbAzsha5YT0/KeJBuW7X4hZ6byPneKmdqc
         SOLg==
X-Forwarded-Encrypted: i=1; AJvYcCV9eIqBCMVstRZQwvXSk9Xyi9bgsGEHY5uEzUBj0pxiCMzMfj0yi7ebmfFsNBmxCCabxZH6OgqFiPmefkZt@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJ/KBNsp9ef4O+TOi0rtBc49dLzMDonXOGtZ6EfeL2rhmxSQy
	O1qTjEv60WeTD+YhcX2J1KslbzyGNeuoW0hPrJHbQ8mdRoi+1HDxwV3NGqQXQ/E=
X-Gm-Gg: ASbGnct2Z4EgAaymmWYRLsOmp4X43YvWUIQU7YqKYKIQw2DZ/SQwdyiULHYOyD0jVIG
	fixPjrLSqW3jpqNxWyvNl1nXP+97ZKUnn3MRSmN2TwHZn7oZBVrU07m6B34GA+Fn0V7/hytohX/
	g36gA8gieogC78qc0O5h825Bp0RB29k9sZCA9NAHOTBR2JJkSk0Q/djdCL8gWZYVMuecRdZE8h9
	V1bsp1RztbHTgObmnDSCEzWMI8WjsmvLlytEs4UkD+LSsVtstq5GrC+SAwHEewGaz8z2CJVNPng
	co3vcO0o+BW8L4Razn3CD3E=
X-Google-Smtp-Source: AGHT+IHngABXa0RfWQvCOT+hZ5/tEP4wpFl7H3wFVT0JpPMz/eOAilEh8xFb5Y4ccK82JrxnO8CDlg==
X-Received: by 2002:a2e:bccb:0:b0:306:1524:20e with SMTP id 38308e7fff4ca-307e581946dmr20024521fa.18.1738960883630;
        Fri, 07 Feb 2025 12:41:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178628sm5343811fa.10.2025.02.07.12.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:41:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Feb 2025 22:41:15 +0200
Subject: [PATCH v4 1/6] dt-bindings: net: bluetooth: qualcomm: document
 WCN3950
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-rb1-bt-v4-1-d810fc8c94a9@linaro.org>
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
In-Reply-To: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=s14YKYID9PJaE3calGZbF8LnlKIvHymDbj6L+7VVrMI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpm/ti0opbMT8jZ+Ob3h/ZXQZ/AbPR399emf52
 uE20q302/yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6Zv7QAKCRCLPIo+Aiko
 1eGLB/9AaRKZTGVR5ln9tpeVIDGYjwzGp30+jHbKD8kNkknwOhjF/cwIoBbV3MIdBLKkPE8aAD4
 1P2AKiseT9gDvt/7CTosS4h9ZOx8VvvuBDZRXJfKv7FxtXXiLQr1BPvCg9jbeguSGVhqvtRlPKJ
 2y/fS6uc8pg8dxpCCp/eMMx8CDIBov7IdNWkF3GLs10tWH7yVmB1xs4VQTqD7108U6L7Vbt1ys1
 GWQR8bSkdzA/VLv3xJueUDqCGSX6Z6bX2/dqdUIFbebtT55N+qnGUViIymzy3eEzXXHnAlrAtBX
 8R8Puv20Zs2+zIvMcQn0lH3tH6qe2BnZTBZ1tAQrRA+PQoEV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

WCN3950 is another member of the WiFi/BT WCN39xx family of the chips. It
requires different firmware, so document it as a new compat string.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


