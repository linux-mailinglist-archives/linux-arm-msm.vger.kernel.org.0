Return-Path: <linux-arm-msm+bounces-55816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3487AA9DAE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 15:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 873F246548F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 13:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B18145355;
	Sat, 26 Apr 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfUeFjuL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B0428373;
	Sat, 26 Apr 2025 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672532; cv=none; b=ueMmnP7VV17pCFzdunaFfAQdFH7V+UlejqaLbRYYPanqWLX4NBYuptU1BmxObFbwk5ICFkuR8ekyejHw8XXk/kX+VGAtKFIMQVrULu0ytK65mowfFOKfFHK9MoHZy7asjbrG/n8/N+uNPITB1vzMa4DoG4vy6Fe3Dnkb/lPmPBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672532; c=relaxed/simple;
	bh=cm3KA0w+enLOu+1xBqmZ7JMJIkWZwFVLulobto9vMRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDz98thwSOTrfrSAgWNLoUAfyOgmVc2eMe0b9zZqP/DrKiNM8XbDZqWdHWixgrohEhwzS56xB6/d+pG8rFhKjVIloGVaUpbVClraPAuXVY1ibHdMcnOhUUDvEAxUChk+UTKtlje8h6/l/Ky0UhuH3yVIm9jnMBVqdVwHtxKVd2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfUeFjuL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so5860960a12.0;
        Sat, 26 Apr 2025 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745672529; x=1746277329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHVhqQa/H88o+gGrdKdB6fL5kxRGwKcGuaQauZA75oQ=;
        b=kfUeFjuLRtiLrWT9eXsIVFdLtgoswF4+20lE6GknRtpuZvWQ7pVWKzWpxCO7NEfb5a
         D1EJIkR3Ejczo6u6cGI3vuXVBTJTVLpAi0mVwyNkqOLde1yhZPbwz6Y5wIKBGLwnwO7m
         COxAEEFB76zL/QKMUuFob65l+TjIYxipachX3CalFoVrhc1nFLtXUeXruCm60x1XzF+k
         jRyGz6JYMf55ahMIoT35cmf00iysXkQna1NDqqc1XY3cYhLtQ5vMUwoLwRJBGpWzJnVA
         CtQz7goV4kAcc/c9QcVbibExLj5/6uaPIfmWmFfXTLXtd5nq4LA3u2Fyzdpgxug1Q2pq
         4c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745672529; x=1746277329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHVhqQa/H88o+gGrdKdB6fL5kxRGwKcGuaQauZA75oQ=;
        b=iOVJnICEr0U0QicNH/GxulVt2DsGkEQa0bvroe94F9YIIzgerhnRBvSwAZsyKh7lff
         BKTc920Hkd8o37ldWiMua5+MYo1ZrMNJ8JksUCzKdJYdPy+0oYUrA1kpub9aVeY6MRgr
         lplV/A8HSbaXoWECSPCDVatLWyrl7VKTG8DwGEhYoKDNoZgA4o4YtLv7x3JVmVEH5uIn
         90xYX0YlcagVgri2qsXOc57rVuw6VEoZ5dNmP/RgIeo//C+dBLZFReX/CabVlF86ah/X
         Yuk2bA5z6Wskw0IYSrHs+Q8O6gn0mIdDo9XU7nJzppBHBSsN+RFiQsl3MBUMas/ECIAE
         rPhg==
X-Forwarded-Encrypted: i=1; AJvYcCU5LhCMX2jrGGBblqf6MGsTAeSOxN+LK3VVoaTSEHXGbhudncDbr0g/d4weSJilp76Hmwteg4n91kb6@vger.kernel.org, AJvYcCU5Wh1AJNb2q8671/5wtQRoUoaPSogaL1ZvUV0PXHoaPRhGTFSVOlW6Pz18N4b2CQTs9VteWbSUTsmH@vger.kernel.org, AJvYcCWUAcxNJrXvcS8HnIcjEQ+VEzorBXSiLoeCoO7rZRJZSHVsUb8NVNKuwZNT1wfDZK9LmjvRyp6AAk6Y1qFF0w==@vger.kernel.org, AJvYcCXbujmg4B+UoAwmA6yR4bF0zet+GSV3MdUKd7FE4bqv+7oeZMIIfAwvsy68q5fyD1+ApJ5GC5DQlhF+cymq@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQW4Z69unHBKYWoPxYbadPg14/5A/rYl0cT+1SYTUKUoXzOdd
	rLve3XtEtw7R0d/oEdLbtwPaOkLsNRREd4kQi67rbyaW/PSLOaA=
X-Gm-Gg: ASbGncvn7t4g4wDuSwpsa1DWyq12jz08ondXfBxpTia8IY/j4f67YuXsXVeHtNoSIUR
	82UTnQ3TXUmMVcdl4cmqHiI6ZU1UnSiWwEK1HHcA6/gY3V9CE9jnLaxM13xO3jql0W1sMNOd8b7
	dwDjt9SwXEgoYEGfo2haF/1cYcR2ewx/g18Qb+Ohly+HzfsBzTuaYy+NBofH7iUIedbflbOdjMO
	7V2NJCfax2PMxfq5hYn14nxw4SjHqu/9jboNROnHr3cTv5OxSsQ9gvaaA8VgSjzuqJR3+LZ23eP
	EqO7x7Rcn8U9/SjDP3iS/mVbYmwgszcELnv9kdxX6lfEdQ==
X-Google-Smtp-Source: AGHT+IEJ6hZ/3Dsvft1r3UmvVagGdIdXoKUoz2ZCm9++V90853+If0+AySqJxLF3bnSYvn53ToWexQ==
X-Received: by 2002:a17:907:9449:b0:ace:6fa7:5ed3 with SMTP id a640c23a62f3a-ace848c0470mr200836666b.4.1745672528592;
        Sat, 26 Apr 2025 06:02:08 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7affsm286452566b.170.2025.04.26.06.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 06:02:08 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom: Add Asus Zenbook A14
Date: Sat, 26 Apr 2025 14:57:58 +0200
Message-ID: <20250426130203.37659-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250426130203.37659-1-alex.vinarskis@gmail.com>
References: <20250426130203.37659-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E-78-100 and X1P-42-100/X1-26-100 variants.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 08c329b1e919..bb589021a97a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1133,6 +1133,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - asus,zenbook-a14-ux3407ra
               - dell,xps13-9345
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
@@ -1144,6 +1145,7 @@ properties:
 
       - items:
           - enum:
+              - asus,zenbook-a14-ux3407qa
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 
-- 
2.45.2


