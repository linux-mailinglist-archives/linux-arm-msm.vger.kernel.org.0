Return-Path: <linux-arm-msm+bounces-61337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D84ADA3F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 22:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B88C216B1E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 20:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE82280A20;
	Sun, 15 Jun 2025 20:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/5VqyKy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFF81E4BE;
	Sun, 15 Jun 2025 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750020978; cv=none; b=s7huU08S1L0/PEedFzg5juH+uzHVPtKFCIxVCqRI/SY4QavYvnxxa+w88joTc3oadveFCFyTSeUa6vdZZy5Xc/hXpNeIhFtiYqXAANAbpwDqV/t1KdR1rKnzvE/b43qxEDnT5+y/frL6t9hu1UEZZY+waAp5zFhhujPOFcaoyrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750020978; c=relaxed/simple;
	bh=eoSJD/+JH9zgkQ+53Ek20pOLMhFZMWC2rXVc+DakslI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6M3n98g7VtoMEXdGYb0WEjgY5fkGc/GhbroeTVvn9k8NGCbf1UnLj6SrwL9RhbkgHjLX7im9ZOttPGeG1mJsWXMRw4vh75W1no5m1wCAcviEHU7tlbfEHcN8cq6BLoWN0yoRPzraPHJmz0Vubtm/7g0hFt/2y8NLz322U5bqR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/5VqyKy; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso3400566b3a.2;
        Sun, 15 Jun 2025 13:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750020976; x=1750625776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2fhhJVVgeUpYGGyXUdswtRj/pHcaZBOiBq4XbRTjSwM=;
        b=b/5VqyKyg8gqQrR+G9q08wZbeYGnvbD/7kn3aKZO90aL/KZVFlqQfocDwjQo8QZ3GP
         ZhKwn+ERkH3iWhrTgu3IB66haoxQJ+wa6/CoLX6PZuoblUZirRdXmI7iFmb17FVZcKB7
         HZ9JfKy7ENm04XVKuoTbI3xYwYPy7feMGTGzThoveCQb8xVxfjLsGgowv4kr97XjPsLT
         KaxyEDa0X8/5ZgxP+drtq7spY54XD1c/w0/xYZiZ85ugNqno3ZHAKpRMA7JltbNXJHrZ
         lA9ytQhw/HdRL28D2jQttzxtKqT2fTedK8iub/A7XNRIZN+tyT3uoyiLoKuNZVDddeZx
         RBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750020976; x=1750625776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fhhJVVgeUpYGGyXUdswtRj/pHcaZBOiBq4XbRTjSwM=;
        b=ZYHJuX573qeO5vaQ0swat4qHThokayuRDXCNXx9F6s413SNXjWi7TVeT2PSpXH/0F0
         QfEVM0CWvByfqvwlfDo5JKSjGSVQylxLG/tpvhlALwsPWp6gCOU4ELBU/UITFvgUUxmB
         7fAl+RLONv6rEeYAak80IX66JuBO0diXKR5uUeln7WEmmT048uVP7nO2IOjvT+9zUoeV
         oZsOPZ/3lvcPjpTN4t55YtnOBmngKNBFxc15haKpKuDCjx5vpCC7ALVmfY3LtGzWKJ/m
         wDAPm8KYuN4mnpJnP4yQ2uHcit3GGfuJeKnxK7H5mPljTwDZYZwNAP5Td76e59b0gofD
         kMTw==
X-Gm-Message-State: AOJu0YylRy9kFQDY54ZrR+SF2I4tYk7gpEq1JoNrRwS0RU01lQt+fAhZ
	dLyRzJN52hiP2vfUd2ANZBiX0l6g7O0gFt0b5UelR9KFp+QNKgEBXZvT7cGJ5UX0FpI=
X-Gm-Gg: ASbGncs+aOTJqgbgkbYVgv51gkeY5Hkzx5mYPj/m9o8164U4usXPjwsfxMGcfir3c3Z
	JOgQFrO/ixNlTXGqcRj6AWuH5UpwFsmairUQaiT3fq/nNTO55TK1LBBuQE5XKzF6BgmnuQpNpbL
	m23qmaUJ/BBLQRJoQ1Ar+bp1XLiTcIeBzM/hKPAVr6IoIMo3USKWK1Fdxd9SnjtnUqfKbHrPl9K
	h4+b9ZY8ru2XfonKdlx9BxkVGHgtu3nmIrbOrdh2h7tRXMVy8aQ3Ug9Ka3vmV5rxQmV3iYX9bRi
	NcweNmUVLzD5GJlyNuwpbHpLuPG7lKidSMhv/pengAiubqm575FyxmU2KZAMGTdcjOltL6hDvzl
	a
X-Google-Smtp-Source: AGHT+IFevwYoqy42Z83+gxaQc2aZ5Isv6+Jz03MGnN/2A8WiamOr8OTS5aWBqTQCYx4B+s+FZNBwUw==
X-Received: by 2002:a05:6a21:6481:b0:216:1476:f5c with SMTP id adf61e73a8af0-21fbd67e9a0mr9940698637.25.1750020976314;
        Sun, 15 Jun 2025 13:56:16 -0700 (PDT)
Received: from localhost.localdomain ([191.193.166.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168c771sm5455007a12.63.2025.06.15.13.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 13:56:15 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v2] dt-bindings: arm: qcom: document r0q board binding
Date: Sun, 15 Jun 2025 20:56:07 +0000
Message-ID: <20250615205608.1133129-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds compatible for the Samsung Galaxy S22 (SM-S901E) (r0q), based on the Snapdragon 8 Gen 1 SoC.
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b14206d11f8b..7ed1da6e42ed 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1092,6 +1092,7 @@ properties:
               - qcom,sm8450-qrd
               - sony,pdx223
               - sony,pdx224
+              - samsung,r0q
           - const: qcom,sm8450
 
       - items:
-- 
2.49.0


