Return-Path: <linux-arm-msm+bounces-77870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AABECDEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 12:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66628585CB9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 10:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CED2FD7A5;
	Sat, 18 Oct 2025 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ty3x/OQf";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6gnXh+Or"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A552FB973;
	Sat, 18 Oct 2025 10:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760785064; cv=none; b=kyk277920G9U8GPYt7qy5FHmJ1V0S6X3PEVO/aIpIrw4V6YLSd2CsMFheGRiXbk6xSawjKBOcFbmi4jsVp+sppGaL59Q7RREVQNPNK/Vvvnn5q+Sq8kkfJC+6uPrCNHkqdAfwF1+Qgeqvft9sqpFOw5IBviwWZ2UUUojmQYxn24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760785064; c=relaxed/simple;
	bh=fDyg/KkB0zb8PdJ8NL8ySCQTKaLa46KOSW3JNHaeRkQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i8QQMB1HTmHPBEzeQEmDvlm9DGJwYvSFJ1v7iMeCJM7sxgZ4zqEgQE5kDtcWv87zwJhnBC8BkGhysaVF2rSZLtMUciXrDOc3ixvi7mdvZ6wbpdRSjElg8T3t38RxCTHi+iASUYX2/n/jskDm3sM86G5aTir6WC1m2sKDL+Kxyxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ty3x/OQf; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6gnXh+Or; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1760785050; bh=1MQIWBdEAkWMsNAJ3IYhQND
	wGFpSfJYJXx6kNBrIIuM=; b=Ty3x/OQfpkDOkKQ5BYjiUJ7lwFOsvoL7xwGGWJGxur5LAlh4Wn
	T+OMvNN/2epfYL1r1vTTItFbdg5ksvOEIN0mD8GxYYci5dRXEKzyChKr3nRVtXKvgep6+qevmNy
	HymzBp8Fod3All9JKyFJ14Mv0b5JfZdPO5SqHuo+jr9O57PG12w0c7RUkMhWoli9TLXlkrslEaK
	5Y6P3GV5VoXJAcJnEfMYblJYll+5mQxAZ2utxnP/CDyUhSKpsJwhOUt2aT5oSBJ1mN16B0TeJan
	/OYqkTFR1PF+oAxEaPBYz8oK5FfWqUMwNy6ybP/+ZahzcpUdTnp/EMJrbeiSiYBqi3A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1760785050; bh=1MQIWBdEAkWMsNAJ3IYhQND
	wGFpSfJYJXx6kNBrIIuM=; b=6gnXh+Or/3tSk0y9Y2RMQN0+JkPCcSLy4MublKBNdBMCcwATKy
	D2q3Vx2U3P/RHY89mf8WPx3+0vhBnRrkrfCw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH 0/2] Add SDM660 cDSP support
Date: Sat, 18 Oct 2025 13:57:27 +0300
Message-Id: <20251018-qcom-sdm660-cdsp-v1-0-042e283db29b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJdy82gC/x3MQQqAIBBA0avErBvQQLOuEi1Ep5qFVg5EEN09a
 fkW/z8gVJgExuaBQhcL77lCtw2EzeeVkGM1dKozWmmHZ9gTSkzWKgxRDjSDj8Y623vtoGZHoYX
 vfznN7/sBHouYhWIAAAA=
X-Change-ID: 20251018-qcom-sdm660-cdsp-59ad56867a18
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760785049; l=655;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=fDyg/KkB0zb8PdJ8NL8ySCQTKaLa46KOSW3JNHaeRkQ=;
 b=im+iPPlrSkcf70FHlbLaaMWJ2QiSY5VM84lU/xUz7TLYWRQe6dW5EmZGn02ItjYRtrU4izgXg
 vJBFOSaMYInADv52qxAHG6J54NmNcZrN74aEFhvs4ycppdfRtrnfnSV
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series adds an ability to load and boot the cDSP remoteproc
found in the SDM660 SoC

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Nickolay Goppen (2):
      dt-bindings: remoteproc: qcom: adsp: Add SDM660 CDSP compatible
      remoteproc: qcom: pas: Add support for SDM660 CDSP

 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 2 ++
 drivers/remoteproc/qcom_q6v5_pas.c                          | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 93f3bab4310d4ff73027cc4f87174284d4977acf
change-id: 20251018-qcom-sdm660-cdsp-59ad56867a18

Best regards,
-- 
Nickolay Goppen <setotau@mainlining.org>


