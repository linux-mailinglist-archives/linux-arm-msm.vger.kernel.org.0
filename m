Return-Path: <linux-arm-msm+bounces-26097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A71930AFC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jul 2024 19:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30893281459
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jul 2024 17:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882C413B7AA;
	Sun, 14 Jul 2024 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ansari.sh header.i=@ansari.sh header.b="GD2bDRgp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142AE13A894
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jul 2024 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720978531; cv=none; b=GETLvteuQqexSLbLgZGEXVRnqh5hac/XGtik9GeKIiS3fIxFaLteFylAfiUK4fGZPChw23UxH0KYwAoYWF+8nUVIguTzOUp242QTei6++CqYgizqmizhuxSeVZAIJRkQgZxy2q04Ga28do/yPzTIiLSaFzxgCOjuiMI+35f0tUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720978531; c=relaxed/simple;
	bh=UDM/0uo3eDJ3Sv4vtyj8gegmR04jnXRop06JrNPIjW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbLIRzoeZpymAyXGO/pvu6F+mUP/nHmxThCYOgSaPte0p9xRMxXIbpENMZUVW6iGjSwdpMbzgNs1xqL6iwi6P5+0fSynPHScNvgm4/auDpP3mk6/q7wx8eTM+LQduCv0ju0z77WHyTGvG3m8W9QWJmGj8azsPlb1K5o9pH8gbnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ansari.sh; spf=pass smtp.mailfrom=ansari.sh; dkim=pass (1024-bit key) header.d=ansari.sh header.i=@ansari.sh header.b=GD2bDRgp; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ansari.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ansari.sh
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
	t=1720978528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbXiZhy0EEDKOfQm0HJWx9D67UmQViKUht9yESI4aFg=;
	b=GD2bDRgpcs7P1MVj3WCBnHP7/xCJOXZDpKnL8IElVpO/jFKeHxAKR0yj42SFosrFuPEe/j
	MAAhvd41j6TUdmz32/AhwxJp2pM0FFhcWeJknD4XTZVp43bPCTEL9dRKKocP4KLzY4s/hH
	pNdcrB9tGkOOfWN2pYExV/j86SA1bmk=
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-iio@vger.kernel.org
X-Envelope-To: rayyan@ansari.sh
X-Envelope-To: andy.shevchenko@gmail.com
X-Envelope-To: andersson@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: hdegoede@redhat.com
X-Envelope-To: jic23@kernel.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: lars@metafoo.de
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: rafael@kernel.org
X-Envelope-To: decatf@gmail.com
X-Envelope-To: robh@kernel.org
X-Envelope-To: sean@starlabs.systems
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Rayyan Ansari <rayyan@ansari.sh>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org
Cc: Rayyan Ansari <rayyan@ansari.sh>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Yang <decatf@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Sean Rhodes <sean@starlabs.systems>
Subject: [PATCH 1/3] dt-bindings: iio: kionix,kxcjk1013: Document KX022-1020
Date: Sun, 14 Jul 2024 18:33:03 +0100
Message-ID: <20240714173431.54332-2-rayyan@ansari.sh>
In-Reply-To: <20240714173431.54332-1-rayyan@ansari.sh>
References: <20240714173431.54332-1-rayyan@ansari.sh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Document the KX022-1020 accelerometer, which has the same register
layout as the KX023-1025 and so can use the same driver.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 .../devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml b/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml
index 6ddb03f61bd9..951a3a2ba8fc 100644
--- a/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml
@@ -16,6 +16,7 @@ properties:
       - kionix,kxcj91008
       - kionix,kxtj21009
       - kionix,kxtf9
+      - kionix,kx022-1020
       - kionix,kx023-1025
 
   reg:
-- 
2.45.2


