Return-Path: <linux-arm-msm+bounces-79169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8366C144DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCF6418956BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E550E302168;
	Tue, 28 Oct 2025 11:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FasfVChE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0051F2DA774
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649882; cv=none; b=N0+24QWjsblTRovra84EDdLt6QnD7C+aA9qVgo6+NR81a6AZ4BDze8h6FtbzXfbgCIX5AR3xw0xw8P7e+TcmU0WTFvYAqlg7/Y9w0FULw46nz/vv/qPP1UfdZdoBxv5bMsfu/WZA+ihRpZ/dSDpt16DaFM088TXD7A7kp7PtwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649882; c=relaxed/simple;
	bh=4qzCYQcrCmvs1fI1Y2jGeN1q9TLaOaKK5NL7b0UxVTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTjRItanv8Lseilm3NOVje8s+GiMMrOwPpO2H39Otdq/WCNVKgmbcctLBwGx7bt59Un8lJAaN6eu0BMMiqkzPlDvC6i/1b/RaE4Gv7bYZ/ZmV5cSImQFsznM83dobPZCNgZRl3PRjgAd6CbpstTLS4oe0mZVQPuR13T5XVjE8oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FasfVChE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47107a9928cso3420095e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761649879; x=1762254679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvBepMQaluNKHheiFuZLoEpaFoQ4R3PwHCfLsenXn0o=;
        b=FasfVChELow0zHK9NCh45bNPvfSrp0dgfoxwIPiRZjy3XQMxGw06xutf+9rwFL7vYz
         RhNHPbAtq9Y6dc0bws/vZhsnlGT3AwjxarnvJVe2fTsozTZ4bzraNM8jXfKhM8Fe1wXV
         FFRDALplmm+kMsZyxIrPF71Aoh+XtNkj31zAGBVXpFzW2IdoXBXH4/Qh29GWrJtXSqB0
         PJDNi2j7Pa6El818EAXatXihZ4+7EAa0klNyDKf5cA5OiZmFo2cxQoZBG4ol6pTW/lYw
         YXkgKoJrERa3/U6yhk/hfoEZAL5+cBQGz3vRBbos7EdynIsO22Xj+OJHbsJ1B4H8KnLY
         MFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761649879; x=1762254679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvBepMQaluNKHheiFuZLoEpaFoQ4R3PwHCfLsenXn0o=;
        b=MfxKof8vW+CnYtfZrVekDcfPbWQ7jwjRLr9tCAdKECz/7/M275zNMjfC4iK5VSUMNC
         FdJR2WodCgzDHE8SdgwB6vnyHG6Cu7ML8mvck8vYhL1ZP+E/n/x8pbGYYuAquv/Q4vBS
         Oc5MMyKFQRDoBZ3mfosyVW6Skgcy5nyFbT5ljlZB11+4q8Q56wlXDR87TGr6AptVPC6a
         6t03wcIVyZ6dsl7cqYeJNzoRKmZ8pv9/apCV8w0Hh3u2xyghkq9sqdmx+zR+kqjM4yCs
         rYanewt5IpX+wiPZHN6v7b6JkQ1hxWCp0n3q3tEY5n9aSY7pfyYlvz/5/orfCGrAlnOG
         0bzg==
X-Forwarded-Encrypted: i=1; AJvYcCXBZTnuYsK1kZKvLRRAwnsYdKIfeNRjaazdPCMaGIFLvWQR0r6Nfuql1BXwqn9Wi59y8AGXie6hnJ4ie4Q/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VAzwVtTUNyiUd1kox+HtIyC9b+MXj6aRT8DUDUbWRv54uAlk
	eyqUdSdbkfcvKZezsFt14A0QXgZfrCPJMIyWnxP0E3ys4kjA8G70wVGuLyod2WJmBkanJKqyzwZ
	2E0iN
X-Gm-Gg: ASbGncs0ULRGHBFui09j8iUekRLVHaB/nVhcPYxEvghxJw6SW3lxM9pQ1cdddk6IQhx
	r3qfzvtPZda4qv2y1/INGqDEDG4U6Em9rv0UDacmD4umGeSebkNWHMBeYclnCfq0Li7JwicXxO4
	feM+nIp4hg9dlqItoJEXD3btrbuvrFj211DaiQWvYc8K89a/FXh7G0LKW0piEEKCD7qzN43ctug
	CDftfUSlTwfVzbZaSxLcropvXF+gaK/5Wlnv+DpikQ8FDU9bj8Y24fbeGWnKZRpGzf9h+D1MzFc
	oobvX+Ed6YPPmpYwOh6ZPrq3JWgPlY9to1udQ79xcx+L6q/ESNBiTI4kezdybF60I4v5BDDy24E
	SG/RcglrP6MRnV+kyh8OnaQKmBJm1U/daDPLatj+wX7Q/CrKxVVIHxhnhas95/f7gHAIS48pRrA
	9e/GQ3HFkdoU3YdYRu1EDOyA==
X-Google-Smtp-Source: AGHT+IGp17y0AcHm5V/8RFGmqH7SfEi8yaRv3lm/N2wuwDnD5uW4xhUCEWW3XzRmWpPyCMaaL9vIMQ==
X-Received: by 2002:a05:600c:3507:b0:471:1387:377e with SMTP id 5b1f17b1804b1-47717e787b0mr13605665e9.6.1761649879245;
        Tue, 28 Oct 2025 04:11:19 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47718fe6382sm17268505e9.4.2025.10.28.04.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:11:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: qcom,x1e80100-camss: Fix typo in CSIPHY supply description
Date: Tue, 28 Oct 2025 12:11:16 +0100
Message-ID: <20251028111115.46261-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct description of the CSIPHY 1.2 V supply
("vdd-csiphy-1p2-supply"), because it supplies 1.2 V, confirmed with DTS
on the mailing lists.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index b075341caafc..b87a13479a4b 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -124,7 +124,7 @@ properties:
 
   vdd-csiphy-1p2-supply:
     description:
-      Phandle to 1.8V regulator supply to a PHY.
+      Phandle to 1.2V regulator supply to a PHY.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1


