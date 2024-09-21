Return-Path: <linux-arm-msm+bounces-32141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3D297DDE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 18:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E940D1C20DB5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 16:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD2217BB0A;
	Sat, 21 Sep 2024 16:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WX99/kFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950A517A5A4;
	Sat, 21 Sep 2024 16:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726936542; cv=none; b=Ka1OVbxLUUxsnJ/LHSf0hc2a1zoHaSZkdAnbf2rfzVye4p0kuzjfTMeo+MvxVWlo9321nrq/Qn+OQBt5kcjHra2A2D7sqMvj6LPhfyraAEVqRrEx62hjQoLC1s0pcAuCLEA1xQRiFGlB1QhJmYNgh1NB4W4eRtAS8RkSJyR39Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726936542; c=relaxed/simple;
	bh=BmHn+OvamB7Mj2kFYwJ5xhxDzJEpAZ1FzyfbPVkYb1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQ9euCLI/rcWizE1QHRGy7Fzb/TgCmBYCmIw0EbLGasLDns5F45fQUduGK66kVvZJUyMw59oA+i00z2hNTqRSItqiX34SsdwlimGLXbK99jOuNW1K5yA6sikAcKmYt8kh4qtJzbyMpn7ZbaLmc02tjPXYIdCyg5uqJw6LaTDE8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WX99/kFj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7198a7a1c01so2705513b3a.1;
        Sat, 21 Sep 2024 09:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726936541; x=1727541341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vietm9nNoVSmcAsQSf9DMjqPLu/E4aKDjOSwnStXtTo=;
        b=WX99/kFjoJN1ydTAbKaT9YD2gr9uNtiBJlwGBIizWIOQmbALfY0NSA5jzFfLklw7gT
         GpEAeHXC4CRP+tD4edCCEYUVKyLukCTNrgQ5TCUDK9zbh0OJaicFqzwHq7HY2jmwkklN
         Ba1Y+dXtkqOH4YxVtvHXkQgE460mqT+41FG+XEBXwYdhfnipL6eDU5SLo1rllje3ABFg
         4ZcDr1/5D0SWUhIoUsVWLfoBDesnT84bST2tpjc0QFblWrKFnd+2YugAr1f9aR44irXm
         0zEz9GFNB+fEH+gpNn4fi6IhsNjGCOZ7TLCH1UsnhwM38D6TSo/+yvuxD9zW8TOzs6IH
         wqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726936541; x=1727541341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vietm9nNoVSmcAsQSf9DMjqPLu/E4aKDjOSwnStXtTo=;
        b=ZCMOl9D/LH35UaS/ZfaFYXuw0a2Ze8iQ+uRtq1oyzcyMrKEJ9cWRMyrzxNJocoyxwF
         vfIc5MHjpRrivS+QXdyfeFuZnp9t8o1yUZFoNpcVwyJjGAZ85rDaEwnxy+n6MNo9Vkel
         tOud+j8DxkclUD3ojufhAYIaEpjpT5H9X2EZD/AHtb7YRTQPwx9QOfmBak8g0HaKZYBR
         U6Zo7JfPIev5WgLLOvsCmqZ4EEqXWaik4tc5ZdXJlHdV1NFU7/HopIethK14k96JV1HX
         GwMk4wU5PHXV0Vh9xVjGNgD3YSVndI1QEquKIp6GUqln3ROGyY7sksqyftdoQ6M5ncYr
         QCGg==
X-Forwarded-Encrypted: i=1; AJvYcCU+zdH2P8mTsR1usnNVXKq8A56sBUomZSFD4xx+6/mlFaudHAK4u0S6Dbqe3+Ir0ysgTnC4khuVBq0Vxn8l@vger.kernel.org, AJvYcCUJcS5ihlihsVKwgSnJAEBpHxIOFWkNzl3OWUfM4j/zSgOUEzUEtwEnPxq833j23MkpSnsZnKdUMznxE4iiBA==@vger.kernel.org, AJvYcCVofZ6DA+mIdEsmtMzJb7/RgwBzn7pWQ8fqKMYdPofCog4Y4zch+3ZW2aCBP+NF5JHreXV3R5LVSjnK@vger.kernel.org
X-Gm-Message-State: AOJu0YwGPylwb5b3WxSkl4zcM4M+SHpOyJ6bmDEHeWIw16KZ2FOp9PbM
	sEfRq0GHVCjQhTi1FTb6kh03Jc+sQOZhkAstI6ekDDoxgT30EkR6fJ5d7yQJVw==
X-Google-Smtp-Source: AGHT+IG/hDYn+SWiaEcP279nfmnFgSBg0Z9e42eUPPF4++wtnohtNoBc2LGIG1lUdKEsvwHRImRxYw==
X-Received: by 2002:aa7:88c8:0:b0:717:8f4b:afd6 with SMTP id d2e1a72fcca58-7199c9df7famr8508711b3a.20.1726936540695;
        Sat, 21 Sep 2024 09:35:40 -0700 (PDT)
Received: from localhost.localdomain ([183.80.189.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab4e5fsm11406430b3a.49.2024.09.21.09.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 09:35:40 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Peter de Kraker <peterdekraker@umito.nl>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Dell XPS 13 9345
Date: Sat, 21 Sep 2024 18:33:31 +0200
Message-ID: <20240921163455.12577-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240921163455.12577-1-alex.vinarskis@gmail.com>
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E80100-based Dell XPS 9345 laptop, platform
codenamed 'Tributo'/'Tributo R'.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..a1ae01a9d581 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1058,6 +1058,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - dell,tributo-13
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15
-- 
2.43.0


