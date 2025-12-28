Return-Path: <linux-arm-msm+bounces-86723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BD7CE5147
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 062D4302D2A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67A22D238F;
	Sun, 28 Dec 2025 14:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="b7mb6VWR";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="m2/X0En0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FDD2C0307;
	Sun, 28 Dec 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766931860; cv=none; b=rkGb410WJP1BlYBOBjoczJD6wruVtzhgCKpQpD1l6ZOhnD4aVaop7q1c0SbWudSB4mFVpMDMPBOkh+qe5kh0yFvbDD18antGICQPxIU5v2Je1msqhWUJgzr3HK9O1WVPmgutY2MIor18vL3qsV0GJlVxtnh0VVYNitlUdqZSGUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766931860; c=relaxed/simple;
	bh=MGt2HaXd/kn75/ZBfGJgPORbX/1RjrzmTNKix99PYMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CT6vQLE6iwm7tPD9zwxB9JwBnqWvXfJVYiqpquNoC6FmH6bGpVX55n323fbpFqKIq950Gnjichc26Rl2iv6jpowAsiNBNLe9bxXRGEYM1YUmREjXvOtPmIlvP4TvvGbQBH+fRT7H65LciLt+F/gC8q4uGlgTIHjt+GPhWgf6o3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=b7mb6VWR; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=m2/X0En0; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931722; bh=YjK7RYPmCtj0ir3kMbYeBuZ
	4AqTX3JUGsL6DV4uuT84=; b=b7mb6VWRwKQJsUXS1TJptnNH+q9DogOg1f1IJ1hMWli7cqhe81
	SPs/jO3BQyLY8jHzub085dmIm6Jh/oAmaX2GHLG/2lhtxxzpb0qTl08yzvaQO3URdmboKeLZRjl
	1AFmE0+8waUlpRGmKU8HX+W3TE/CbRVUkeS2V46aWMFGKoaCokr7ASzgGpQWwB2OEZk6044MaIT
	rFmEnYxmFUY3UaXSRJO5xPz7IsliRGhZcrPeZdxSqiqQ9S4qTW2pOlXFyW+48jg+ociYNRYplD0
	P0HJaOzzDzbEpI/531FZTDSYFBsqC1G8Fkq7iEAIfq9pyKmXCysk2vXguoUT0ObO22g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931722; bh=YjK7RYPmCtj0ir3kMbYeBuZ
	4AqTX3JUGsL6DV4uuT84=; b=m2/X0En0wzxDul3TkptDfYyf7xF6TwL4MbeHdk2v9bs3wu03Us
	0zpmYPqTPy4H4ZGERiEQEWWxsYY1ztJdiGDQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 28 Dec 2025 15:21:55 +0100
Subject: [PATCH 5/8] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251228-mss-v1-5-aeb36b1f7a3f@mainlining.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
In-Reply-To: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766931719; l=865;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=MGt2HaXd/kn75/ZBfGJgPORbX/1RjrzmTNKix99PYMM=;
 b=LWHjUjeC025wr1L4bI5tQPJhUgE4b7puFD87N7afynmprU9pKqYfSwnHeWVzypU6R5kJ8b72e
 FQAqKlLI1deBWuY07MvkIYGj76wGtNlLJ6jjvtY3R1I4ChiTOtUhpYQ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8937 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 7ba813774597..093231abf44b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,msm8916-mss-pil
           - qcom,msm8917-mss-pil
           - qcom,msm8926-mss-pil
+          - qcom,msm8937-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 

-- 
2.52.0


