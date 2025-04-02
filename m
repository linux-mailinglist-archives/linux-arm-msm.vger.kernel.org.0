Return-Path: <linux-arm-msm+bounces-53010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D297A78A50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90BAE7A203E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022732356A8;
	Wed,  2 Apr 2025 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IliDyPib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5343E1F9F7A;
	Wed,  2 Apr 2025 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583612; cv=none; b=LXMK06hCQS3QFHJovHg5XssKHmN/UeIyItKWQcSgJ5WhHsTOY1U/rkgxY+QEO8lH8L+P8YQRauvfxfv6gELW/WFSozHpjgiL1jcbNpU+6A/ZsOF39/3FbkyNshkZ692mP4xb2rtH+CPyu0pAg4d+OMFxdaaOleQLAOnXXcTi+qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583612; c=relaxed/simple;
	bh=LKTrU+sgU2OIjybj0utaZFM0waoa3ItskjDGTcF6xOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANk5LBlR6uNC5kCUYk4cJRENnvzdKCixOn+BAyB0olA5eGJbmWAw5Go89xxns676Jzh5/Eh4FvQ/U74tkF5D5vypL0pbOLGWUJ7PDbNtHylhd6jZDYILeEv5RSgf4VJtV445N6Llp+Kmk15TSWEjX2mP0hlmzNxxC/oDBRftaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IliDyPib; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so12216234a12.1;
        Wed, 02 Apr 2025 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743583609; x=1744188409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjHXYMC7zHygZVzVtYT+NoerxDkgqGuxQiQmQIb1pA4=;
        b=IliDyPibvg1GwlwnVb4UqrZlmonIgvJcJUYoS5LHV5jclFYkdGDIMsLMYQBiZTmM/2
         LUzsrNTgHHppfIgOFRBT9sUHH5TbSwwBYJyhUDgV8hIEvnXIhBfpZB/oNHBgsuLPKCDD
         pway9fIKO6l7PiAhBYqQfmvuAGOY8QJ6Fy4n/4t4G3iOaPFTlsFRPaoZ21XnF7ksD8Zh
         rWaKCnthhj5Icjz6mJS0LddJRwHO8L7n4Xs8fc3ACqrVi1kMcjKYBNfJRM1VYurJ1sM2
         v5n9+GjT0VdRrIBEvSPNr2QtcZGuS69faF1WomGMEiwzVL+d6fUSwbmBuaLSJ0JGxIwy
         aNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583609; x=1744188409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjHXYMC7zHygZVzVtYT+NoerxDkgqGuxQiQmQIb1pA4=;
        b=fpr+qavMilsvXVFbXH6h/EMSqi9MMRcos3WctkwfmB0hfPiffx2x/4OWvOK7A5beGL
         MlLiGXqzwNFyZLT4zLT1fE/RDWvE4aIQroAMrD3yLGkdToffq/UBWqJwEvlo6t8oEvkJ
         xfOysUnHADYuKjqVIoKbgTPtPjP4raUdkBOZ+12uq3aEeSwV50a5hW1Xu20n4gyHREZv
         jp0InCwV0XoKTEtg4q60aJOj7lxTc4qIRqmb+AAGpvx4MoVcfiiYUOayMHxGdufAfpTj
         5hoYepmLa7jCTDFfzbxmWFucITwNsQ1qakv5aQjX9HFJBgSEDOBp/CdLkU9NnPWLUuoI
         nOFg==
X-Forwarded-Encrypted: i=1; AJvYcCUeCzyGy3LsD9W2yb0UDNjVPFXs97bk6W78goRLdCCwDE3NfMm3LTS0SF/NFqujnb1KVqlugjuHEvKY/OhP@vger.kernel.org, AJvYcCVX4sA6Ol24RhY4DDqBgqLqSHaX0JgTzGCb0pGWqPFKCSRDKm/26dMRBTahi7ReaxGcLuhHMhIniIgRy4OdDA==@vger.kernel.org, AJvYcCWIG1HmHN82lWkL+pkAhCXusJAENOIwqdCadQt/Locr0C6m2Mqrlr/WutDVOFkRjhZueWaDnQzyQgir@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9dP/eehkq5ZZJK8n0rU0ufWxKHfW7LgOAeiiaq0BTJU5aVxk
	/FzQ1FsyEWtDCNTdCR0K/xiEql1iOm1MsZD8CFW2dwfDhJpORgI=
X-Gm-Gg: ASbGnctR3CiNzMvG3c2BKZmvYjD19Ec1iwxsTruoncN4KTlT3lw1YSsSUArBu+PmZYq
	ZOxaU4b91XpipfsJtEjPi3TPvmEPnc7NkEQIRmhWsjkTkKAUnHs4HO4FSZ9f4qixdF4VyBltZKh
	0UgW7Fw96nOD5zkCN6ntxcXbUsZpN301SVyG3f2tMls6fSkEjfh2bRtjS7RMTJqdnVM/pZ5v0O3
	bdTecjEC12oDTq4Lly1wGB4loJqllQ6BCrD6ROHr3seA5bAamyB4iOzKUFXQzoVhjkCtKGZ9jiI
	PjXlIHbhG92GCsllBc0ro9nzFY3pKZQCQ+LCOdEsVTO5R5k4mQ==
X-Google-Smtp-Source: AGHT+IFWjyFgzbzeSafB6Y2xwdXIBKz5hV5nBM0tdF/ZkuXPBUXbJ2xMKqx9XHUQ1wIRuebML/cDPQ==
X-Received: by 2002:a05:6402:3511:b0:5e5:827d:bb1c with SMTP id 4fb4d7f45d1cf-5f04ebceedfmr1287083a12.25.1743583609329;
        Wed, 02 Apr 2025 01:46:49 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aae40sm8162760a12.7.2025.04.02.01.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:46:49 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Asus Zenbook A14
Date: Wed,  2 Apr 2025 10:44:02 +0200
Message-ID: <20250402084646.10098-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402084646.10098-1-alex.vinarskis@gmail.com>
References: <20250402084646.10098-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E-78-100 and X1P-42-100/X1-26-100 variants.

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


