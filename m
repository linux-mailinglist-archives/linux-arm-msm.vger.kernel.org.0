Return-Path: <linux-arm-msm+bounces-88381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61FD0E69E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 09:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0396C300EE52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 08:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5E9318EC9;
	Sun, 11 Jan 2026 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="fQe6j+jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06F4318BA1
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768121949; cv=none; b=E7D13OzxiI+rZdWxt/Q6jAGkcMG0Q7lKrTxatVSfKYDsG5sFCzM78nazwaLDxWj5LjX1Y41x84wSENHaKkVKuGrN+0D6YPZwnDpXa4c3nNzI9u8wTkgOgkuAsFO40pWkUcl7sB2kA/3egeOldDetlg3ju7wksAVW49UOGk4UixQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768121949; c=relaxed/simple;
	bh=OMnxSCOo+XhGkr9+hOhYsa5CIL79m9J5nln9wpamLdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpohoKrCoO/FFmKWD6NvkYML4bbflQyAD7zKDkU/xbfcEJp+A4fvD7TOBw8IN22Ay6YJkh2GGMlwjNcY/xJFPqf1x2uW2SBdLCqzY6Ln4lgg29o8DbwKPI+kXPEKK8RMKmMS3V8M6Eza6hnAxoXi6DCeG3hRUm0JL/nbId/xGJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=fQe6j+jp; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768121941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KlM8GW6dNWlsV+KPsCx9fvHYgo0b9tuMTX8d9qhaIoo=;
	b=fQe6j+jpoJdLqYMfLR29f6RRAgMBHmZdzshJf8jcolTJPiORe9dnB54ERSP5IzQ9IA7gUo
	klD9wPOAVzGwxK6+No81TAg/3kAythqgpPCftdapmpL1uH1Hl+M4GbC0ZEA6bp24acCtK9
	l9ALdEt9WzJKmYBMX/FQiKjZiP/A8BNxke3YFCRoMysIIKKSF6fB5MBMApsxB8K3IvqgB1
	+KrhUBUnEufOqjaydwePld/HqUG/0mYx2w0boKnnpEQ4P5NCq91Fn9kKJH4sEaX4wK/1xM
	V4ErpFqI1NRGJniRf2TO1r8QOW771XnCOCYi23FHzrPgTD+byJkcckzC4s25WA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Add ECS LIVA QC710
Date: Sun, 11 Jan 2026 05:35:09 -0300
Message-ID: <20260111085726.634091-3-val@packett.cool>
In-Reply-To: <20260111085726.634091-2-val@packett.cool>
References: <20260111085726.634091-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Document the SC7180 (Snapdragon 7c) based ECS LIVA QC710 mini PC/devkit.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..54750b11895f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -385,6 +385,7 @@ properties:
       - items:
           - enum:
               - acer,aspire1
+              - ecs,liva-qc710
               - qcom,sc7180-idp
           - const: qcom,sc7180
 
-- 
2.51.2


