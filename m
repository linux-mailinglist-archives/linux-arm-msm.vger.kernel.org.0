Return-Path: <linux-arm-msm+bounces-83912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB0C957A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 02:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 297CF3A1ECF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 01:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B0B13E02A;
	Mon,  1 Dec 2025 01:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKRO9QXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFBF2AE68
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764551754; cv=none; b=TUJA2mMAsJeHIRegtpBtR0X+NI8IjR8HSJOmlHcP+7REg+xZaj07DU6AXWL+82Ph3iMo8bkuZ8r0W1+PPj4EcG6L/62CLeF/Fn6KaRrefMzqk6kPQt3Y+yxvwtPx2xm7iLRLreOvxHCAArXDohPxlvjO73dMaauumq50iG2jgM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764551754; c=relaxed/simple;
	bh=8fxORl1I8YAECASFsj9/Ws4g18jKmbkYYWVQiXzVhnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgnniFZf8dkqzqdPntXYZNFF71++xU+iw9M9fXPbMxKlysQb3nP0Y0+MYYXNGtDtH48ko8a0UGL+1lKN3gYDmNUJa6479EK389/DdC7J1TQj5xlW/EkuwzYtowPpVj6MZrCdaFwzeFlNDkkVuK5WCuJBSFAaP73axHoJSljZW/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKRO9QXr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775ae77516so37229105e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 17:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551751; x=1765156551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHyZ6FAtJU5qO1dJcRGwRE2nReT0pakALIINJQlT6dM=;
        b=DKRO9QXrpzp8z0JDS36Ax/pkIudX7mwe39x/bOlEZNerBn1nyOJi+pNNMIiJzPZt0I
         uTXDqvA/slPcpaNjl+3qOCwK2Y1aE+5lb4H1ZSSN0VIzfrHoqI4NDzrjrdF1qN54Mqy/
         s6eT+9RO6SvD57fjZCnxGFYl3Ua7SwiiOr3hCBDZhqhNrzKBXzO5cGAShbTgPhhfszdK
         nITLpL/CrC1r6BQHm8CeIfCh0mpea81enTOzyMNaC0TsItwmF0GOAV315HO2EXvG8i8J
         wFLe7H2OdRYoB9gOGrIFjBkvLcLRKVUNUYBSTr7zVDm1gV7DZ2GcCoA77glPi0xmZ1Rw
         Sm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551751; x=1765156551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XHyZ6FAtJU5qO1dJcRGwRE2nReT0pakALIINJQlT6dM=;
        b=Hz3wh2bmjr8a18dJqpDDBsML5UmJSQLBgqyjxKwRlDCcUa86wOrwe2RgljMLLscDOZ
         jKMaNdoRNNEpQbtOCDGb1DTFgCXrnu1ge6P5fXZADZJupYKWnPIgd9ObH1rortb7Uaaw
         +rCN6A3OwKjMldp7hIunEzYYZk8fAMpc/vN9QLP+HB/wPS8dXxFpSxs31HU7K+fvpmzS
         gBbdSve4TxaEcXk7zGXw84Y4MWLQv8rESJpKlQSg5NvlfPKS//pReQDbYr4TDaAW/rSz
         W08qJS4P0oXqzClM7Y2iWUMV96xEW3XoUPBERnRVL27H/3z2DWwlSg8GD0LEYXjiPauj
         Wz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVUop5F4UAfPui/GhURpJuJX5DNlfcUeLPQpulHgzXVtWjdXDKVKMl48AiXKZUmbYhzL6cVsN0885fOjHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGDgcEfjpkQkGE/Av1A9lUYL6epxJVc/IWBM5FdiUUH3AgF1w
	0LxzikXS99jXwOTG/VzqgnnX8lR7grsGEh+pLG8dmq9hqu3R6VqTVLvX
X-Gm-Gg: ASbGncv+ESIG/NMh6jzF5S1Htof0nxHv+mnH1PN45r6zkTjma7F5Q3jqk4vY4jKqpG/
	ul57WObfK2Iix8gelNaUARU50nvX8xw3mBUywT4d/L7xFHClIDzc1pK/MA8bykW7ZDaNKAYi5ri
	5Att68/lmdKdfHmi6YXRLaVevvoP4HsNHXEIKg20cPbd5OHeOimZBne2c2kDxEWuKCp1V4Cm4fD
	y1E7uIG8JdMEDmi3zWuSzf6PkdT6MnTiWXlo4vG1hJRp/KVNkA16uXSSVqnpu75C8cUxvudan3m
	t3hGnFpJm9mtJzgksaQtMZuJUXAWNLHtDO2okyXwi99ZEextd8TJ8JeKq7pA/Sw3ztMidbFL7M1
	CeQdoZJQFvuL4L785n/bhD/hxef5wno7VZ6jL8jhVxNt/lCrFYx+6BPNlj1sa7D/rFHUMiEYVSO
	/RNg3JH8X2iTZU7PqGCYVZ6wsupAbxMyI2BBv8mgbqw1+EUxbg/JhhrQ==
X-Google-Smtp-Source: AGHT+IEpYYe3gL2BsaA1HL6btRIHeyw309tXCm0NAEh0Lw3rFgKYmMUnXtp740D13O3MvOY049xzmQ==
X-Received: by 2002:a05:600c:3551:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-477c10e2bc2mr418877175e9.15.1764551750742;
        Sun, 30 Nov 2025 17:15:50 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:15:50 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: arm: qcom: Document Microsoft Surface Pro 11
Date: Mon,  1 Dec 2025 01:14:42 +0000
Message-ID: <20251201011457.17422-2-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Add the compatible for the Qualcomm X1-based Microsoft Surface Pro 11,
using its Denali codename.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..e35e7764dd8b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1069,6 +1069,7 @@ properties:
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
+              - microsoft,denali
               - microsoft,romulus13
               - microsoft,romulus15
               - qcom,x1e80100-crd
-- 
2.52.0


