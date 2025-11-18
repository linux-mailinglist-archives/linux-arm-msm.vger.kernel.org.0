Return-Path: <linux-arm-msm+bounces-82308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE63C698D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD715351DBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899B23148A7;
	Tue, 18 Nov 2025 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqniE1fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880E311583
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471318; cv=none; b=oLDLg7CINV4WU4NSQWEpvGj5PuYa0GFjayNRWW1eTevgVaLEesrwIfU2SQWMjOVsqfxOsR2KOUe1DrirGEDUDX9kWZCmz/NgcE8TF5mRJx8ZDdhH+yM3UjHS+YZFlzmm02Ttv/0ZoDqZ9xwnZho0XYGOxJfglYeWFtmcUw5CY8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471318; c=relaxed/simple;
	bh=zfksRdzqKJhRlSNkDPTjQcTPNmX+bLOPlYzuDXVDI+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8Y+eeCKy9lKlzhnar22dLv0XRpqX5HVitT62T8aaDTuPNSIIUEgBY96Y8ym0CGoVAe8JwztMISGanRAZV3TtmmYv8XwkCGgujFxflXpLcbs7r/1jajNtys8+KvIGBtut3X6jb8lQ59Cim98/A74TjnV4YFdEub3AIwt1ARbH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqniE1fr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2984dfae0acso74386225ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763471316; x=1764076116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=QqniE1fr6XcdNPEunWFclN9tDHOLVP6gYQmhrVt1tjNrZUlorkSqmt+WZLCSa0i7Jt
         ic4HYiQUUK6/H+oFpF/ppNJFNm+71pTflDwZrs3Tj6QF048YhsrW5Wl9sxsEyM+F/PV3
         7Ovurj58qUKPuDvaiVA4wQBrhXAPqubQ9giee2kU803vDG+zAVeA/1bSysxmp4oHUw3Z
         Mc3aVXyim3cLZRRCs9r7XTZ90zlXjGycskhtMKuWKgnKpzcrDgev6rne1gPp9R3JYTIh
         91LIC95lzT7IFtruJ1G8GOXDPfhJ2YVEbHfbwXdpxr5vqGT3v4g8AD8OFM+/XbsTDGD9
         8jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763471316; x=1764076116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=ZJT+j7kyuEBwDB3P8k+La2e18hFlkhSURCmC/D/H3FZp5mqFDvpBjiRv0ZGcLX84JF
         3DgUeoZbGwVyzgmt98hbpv0xRTUMgzHHPj8okFKZy7zrU7VdDkfEvoI09utWhQqWykVQ
         /TLuMjLAvUVLwmpa1y1wQMcIe1RL7iKH4b6mGbWI4H3nXFRwAf2r72GQs0FLLOX55CJg
         x7VqwyEXODVxeL2mexCNYuZz/JUjDAM2z08eokiGqTC8GQAbI4bEvTn4VodrdbRkGS+c
         oVXaHsWYYxq3voWL8S4amYsYFsN6QKAZGYUME1BgeAQwBpvApL43SswePt6d3iO3PlJl
         DD8A==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ge49y7hG5YhbpCNcw1qFzb3Usyozfk9hT7FOKPF62Bjgwdpk9o85jOQ6omZPSAUQzgKJVUw8Qk50T1m2@vger.kernel.org
X-Gm-Message-State: AOJu0YxzmrKeCPB7XCqolEES3G94Qc53PF6uNVRB7p9LeLDMyurU9sp7
	GsBE0YLlLQRE5GPwJP9l/6kIW9VSDxnUr2u589Ipehx6mfSHCku3psTE
X-Gm-Gg: ASbGnctR8zkYxu/1qxSw8ZLoIjvQDDNNJUMBpRO6qCVRvbmSm5rpXeR7BrS9/mMX/tf
	HzuBNjMJ0ZmvqsMUK3SMPNtQmOj311elmPsankXHAaFPhpbbY2x7RknbJK98j77P6UPvuSxN7ZA
	ObjMKh6+B7x4k3qrui5JsTJhANgy/vGS/c/u8QcKHw86XBYvkfYUwZ/6owJ+5gQfFZq1wSzcx0X
	ytP6TwlJk0lTPS1B+P7xDSVxRlgEjdBkYlT4RvvenlvxDOGo2YJ+B4Ci7/PFfx0fYtzx02BnLfd
	rw77Nsl88UQSGYOl2sbQTv2qzcTABjEJAJ51fvShIGJ2HCu8/VxmlJ85eZDdfHxB6tYMw6klDTW
	W+ZG2vDJcJR5AIGOmdTXj3LyC6A21gJAuzmxIKeq18qA6/ClZL7jf/DFFmjZexZLgAQv2WVxWGu
	/Ggsg3sBGlWToQMP8L4g+m6ifzfT3wlTN6xCpF/cNueWAzQPM=
X-Google-Smtp-Source: AGHT+IFGkfAfVvalHmLbPBzwtmAj+++qYZfU/Dlg1BI0t4hg/00hZqTAt1eAquJ4V9nxjYQHPMYbQg==
X-Received: by 2002:a17:903:1b04:b0:269:b6c8:4a4b with SMTP id d9443c01a7336-2986a6b89ebmr182016505ad.6.1763471316097;
        Tue, 18 Nov 2025 05:08:36 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b1088sm175143235ad.57.2025.11.18.05.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:08:35 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Tue, 18 Nov 2025 18:38:13 +0530
Message-Id: <20251118130814.3554333-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118130814.3554333-1-tessolveupstream@gmail.com>
References: <20251118130814.3554333-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


