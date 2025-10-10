Return-Path: <linux-arm-msm+bounces-76785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8DFBCCCDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 13:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34988426CF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 11:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F097283CB8;
	Fri, 10 Oct 2025 11:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlxP2ush"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B496D270EBB
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760096875; cv=none; b=HwCS8daL4fTmSQOtUixc8PBJ0XbUTOUp18JyG0XaQWWK2OdbYNdvV9/2fQE2AIVMKQleKXD9fS8ur9Q62TM3Ag8JAJ2yjbzj16NN4neoDQt4vwe8wSVzMN+9TFAZcNDrTWiwkPcI56mPsTinNyoT9P1n2HoeC/2bZ0sGaKz4EI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760096875; c=relaxed/simple;
	bh=j8Hd4Iay6zYNggN2mZzljQRaAldF0uuSlvshS+04klw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V7PI1y6TYuk+BxRDRjCWKfY9XrKGkmEx/m+belRQTEH8Iu/X0lNZMnamrAY5rT8Qy9Ay12KxtWxiNVY+Mguct2pj6qXQ8T8BrHzJdMKMK1vXHIKMwt/5TxOmARL84yCZ3dzxKskhSsMQPBS5WfTQuycIWYVXF1sIyrcmJ6ld/iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlxP2ush; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eceb38eb1so21540005ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760096873; x=1760701673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6G7I4yZCC3xCLDmgNXcqXWYF504/swrtgR3bZf+tR8=;
        b=VlxP2ushFPA/dhlY6hp1IuLoaC+4Ave2aVoW4rvssr3XZoS8/XqiNYadxWKo6KdywX
         O85lvh33daoO7gFlCTXPTchUYZ7SCnYox+bpmXpXZgaPE92IwehLJ7cWOwmupouToONw
         icPV20PQvwaW78IqPfas/rgxAwiBcwcHN9Hrk4TwaV2ZkhlfSTjZwOUx7rVE0Dl0jw9Q
         g1J7ZuSUWFL+1GoPTwa1lOO0I7/RIMXaml5e5MxOLT6DeM0upR3FGoQpd/9O3V89d/rI
         rQbZW117IjRQxlD933uHM+DlRoR8QgmwJRx1syger0cFcIksy4YcmHnZazR42sjlDkP0
         HQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760096873; x=1760701673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6G7I4yZCC3xCLDmgNXcqXWYF504/swrtgR3bZf+tR8=;
        b=OYFn6K5M8xpLHtBYe+Zvsghb3FkyVoXvQ17Xtx3cOXIUlP+ifjIfd7+Fg7xaHzl7qt
         YMI/u1uym7/qoKOdCp5IYETCCd7ohUANWe/HRHQ8xndiMIN3PeCJA5F+FZmpMYgtybLZ
         UAvWY7EGOy3pqv4De8nPVXVHRw1rcZf1Qqv4dpLHQ2RhJkK6Bzb/ub+QmFHTTKI5T1Ia
         BZbh6v1Z/uIlj521oU9Sq0T78xfsLZX+xgiZqkIoeVjZEgAZVvzqA7A4/w3sQIKuQTvA
         FEv97WYRtyc5j60IYecTZEHv/TKY2AYjs5NdezA/W2f5M5uVBvpFo97uDnde99/e3Dm6
         IAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5UG1q0az3OZXPPcQhh+JOEDJaHD1f9E3pVEFc3t3Sy8gHpVB9ahaXoA3aepjFUBYmfYvlqQNAYipUrkm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh0R55BawmfenxvCbZoRbMzQipswyQHBMyT9KBGpsKRdOA9Tfl
	5FJIptazXXmb2n7LGZjGWJKLNX8RYr0Cumry+K+3qj/EOr4evt+kug+g
X-Gm-Gg: ASbGncsl/XiNNenHHQhDfNVR6KrqaTl8AHsA+CHqQI/f3UqpKMAg8J76+bB6q6BShKa
	HB0KnTtnCo/1s5x/mt/1apSfNSPiCIuD91HB2XL/PVjr8A3bz98Z5Htm5kjBEBGoup4hGVQsheY
	5Pfb6Nw/biXl12WXKL9u5CenkZlHNbPNjPk8pgG1V5bYXAMsB4LJWF1tcndetRSkHYsSI8bTosY
	kOHWV5IjuY8R1U87g68HcMEkQm90iXWiWl2wnguUfJFcuIZkDP2lXv+/6+XtXOXWOdkGtmooCmI
	aHJMRn7jMpStVVgaZvHHtdzbe9wKQ+8h+eDFBUG2AUa50GNwbFvnY9YdLjU2K3Z8Q2IE+dVI9T9
	Sh4zpH7Z3BnGBQBAHtf3PgaTqOzC20vNrh4ttHlxVkiVzyEfhx11cDA4SLl5QT/OhOxI=
X-Google-Smtp-Source: AGHT+IG0cfNJnLLfwDicVViuXeEoizTyF3mRCh0vPGnpWvLjbE/ACva2N0i9tIjdj0MQ2LPSn8nOeg==
X-Received: by 2002:a17:903:b4e:b0:28e:acf2:a782 with SMTP id d9443c01a7336-290273edf3amr116504145ad.37.1760096872925;
        Fri, 10 Oct 2025 04:47:52 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f0726asm54956535ad.72.2025.10.10.04.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:47:52 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tessolveupstream@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add QCS615 Talos EVK SMARC platform
Date: Fri, 10 Oct 2025 17:17:44 +0530
Message-Id: <20251010114745.1897293-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr>
References: <qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the QCS615-based Talos EVK SMARC platform.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f368..a323be3d2ba2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -862,6 +862,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1


