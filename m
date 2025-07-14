Return-Path: <linux-arm-msm+bounces-64855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43086B046A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4C491A62F5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC82D2673A9;
	Mon, 14 Jul 2025 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbV+buNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626925F97D;
	Mon, 14 Jul 2025 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514589; cv=none; b=WAivO5e+dfjINA6vK5Ybwv6eAoZHTo3FOpbhZceQ1jfYv0dFcPiPPXPpRAV9EFyIsep6cLpkb8cJ0LiXsgnD07/cBiFxjtbfgE54STwMZ9Y1f21T91Ix61LqNPC4ZhMftaVZfZDVqp3kfSzDYk+IvtTKNucnmFXRwXIcY6zTso0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514589; c=relaxed/simple;
	bh=WfsKXVJyKGBvrBPYu2BcjrGMJIbk4VCvgUzrDGZK53E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jZ1duc18b3sxrzF1N+EJr8fkO2sJMS+A+s9y0OhcPpejjFbPQNDRCewZcx08t+PabJVy1ZU7dmyh7xxU5MPQ3rtt7P3U+Mf1chBeA+kEWK6SXQVRAk+Bs3tW8UJ0G9PJbQC11cljEABesUFPzUOFQXN8OD2PK8kK3OxAmbYImxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbV+buNG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2772283f8f.1;
        Mon, 14 Jul 2025 10:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514586; x=1753119386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp/9FJf0itBzRi4wdHtyABmcjqnv5WaOUuSEUpWjg7g=;
        b=LbV+buNG7WWMKQ5ofOX57vEm86OBDNhHnh3t/gUP1SoqXc0FaspCYLZEpaNDwAcSpe
         fiofjx7cLHFypVUWw/iQj7I2QxQbAZHQ9dhoi9cpxXWNVvnKNzLaH6b5xOK0BsV1ysNW
         wT0omS3FE8s7aXNM4ZY4l6SGXdE1AHOhz3d3DbGZBo4/OiqFvPmILuJ37DgFSmnCCKqt
         bELAUOl+3OVrAdt37NrVE5f2Vi/Oo2yTx9PQ8IuUrqR9j2OXj+7QzUBetYoKPnHCbF7m
         qZQRIfOue7RitcZWYYu4SKfh9QUn46bxf51mpJ8KXteXM3c+4rSecs5z1CzVWJpYNCiw
         hpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514586; x=1753119386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wp/9FJf0itBzRi4wdHtyABmcjqnv5WaOUuSEUpWjg7g=;
        b=PrXfY/IpETDuY/DIGMIcvJWtJw7QhOvhSC17m5LxbLk2/c6Y6Xn67AYJztRZVsIjfm
         YETBMgWHwc9LMZbbGWpybH0a7P3Bwhl8pHyOTH30//nrBzULFTw4M88QMqqZ2zZkqZkT
         9hLI1lGLDRy+xsxcUAxAtjJ+nM/ty9ZjeSMF0C1RK+xq8m0dgVajAt1NguDydoiGfc+v
         LuHoGXWX9gwcSh6+VEfuB0WJz576SrzEZk717hx9Ymun4VMwO10IplMf/sXtMa4lfm7p
         GgiacNW46+wMi6WPeqH7v6soCwZr2JEuKkFY25eu7guj7vN/O1UeaiEJVnGjXX+jnlHo
         HUlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzkrvV3ueEui3DfBwghI/L27IRNj6uA0Jo9YaRTpPDRxWb8Xt+QfEnVMLxSqk03/kaufZZDzvMTM+7bg6h@vger.kernel.org, AJvYcCXUfmxVmGOIxlEhfCmhe+m9+HkUycNlZ7rDgw/EdhOmqvx1V5vXpoSQQ4Fn3oCQy21DUfaBDLh/u8k0@vger.kernel.org, AJvYcCXXfUa0qB2Oy7qow+KymbQKdzB193oRqVaLvd4NltRtQZcUBLTfgTv7DPIFuabkUsR8uFjfrrcNw9OkdcrRYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBSY5jBVmAEvW1QpZdya8/jd3M1+fPCAt3EvtGpZn4ZSbt8Cgv
	TUQwXiJAyBgpR+2sxgzOd665f7Yd7/RcwYlTEGgmXFeiDVqsGPDJR4HL
X-Gm-Gg: ASbGncvVQtAbwJoryMDJBt12+Eg2Ly8JL2Mj0TkCssUbZ1LkQC1f/UWA2YtRb18umAv
	mv4/IYenSqRC8rfGtKNcVrv1MKhE5iNG8cezNIQvpWqGDPy3JGHJ8c/fVVWkVupqskpXukrPR7s
	J8lVp8Z3mBVznY/wVJpsUhJRhjjAwaq1FV8Oxv7eQwEbRw9rJip3CLR3vBQCJMtpXCdJgGHQUgf
	XfgQ6UesvneqAsvZWzq7AcP77wkQmrzH7KyChkteAYf6+kJ0ApI9Wn6Imd6YQNXzvuFBShJiyQz
	LfxW7RB0PUOf3Czdt93QUwh9CB2P+UxAkHrruKvO/pZynAc8wVNUMMxjHloR8YKIcSLAH95YDUJ
	7G+wLnBWY2cCYuyH6QpLubwumTjBNjb2YI7I=
X-Google-Smtp-Source: AGHT+IFWbQgqrB3G2gTde3RY/C4Kg+J//8ZmNXMoD/ZO1cqQ1rI6IBsnRuGz97pwsS7RiZMx8g3jnA==
X-Received: by 2002:a05:6000:240e:b0:3a4:e5ea:1ac0 with SMTP id ffacd0b85a97d-3b5f187a4a8mr13297156f8f.5.1752514586015;
        Mon, 14 Jul 2025 10:36:26 -0700 (PDT)
Received: from alarm (92.40.201.95.threembb.co.uk. [92.40.201.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm13152531f8f.60.2025.07.14.10.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:36:25 -0700 (PDT)
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
Subject: [PATCH 1/9] dt-bindings: arm: qcom: Document Microsoft Surface Pro 11
Date: Mon, 14 Jul 2025 18:35:37 +0100
Message-ID: <20250714173554.14223-2-daleyo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714173554.14223-1-daleyo@gmail.com>
References: <20250714173554.14223-1-daleyo@gmail.com>
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
index 6260839fe972..2b02619e665f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1135,6 +1135,7 @@ properties:
               - dell,xps13-9345
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
+              - microsoft,denali
               - microsoft,romulus13
               - microsoft,romulus15
               - qcom,x1e80100-crd
-- 
2.50.1


