Return-Path: <linux-arm-msm+bounces-48202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107A2A381C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABF89163C0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A2A218E81;
	Mon, 17 Feb 2025 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="D0JKTd0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B005194C8B;
	Mon, 17 Feb 2025 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739791995; cv=none; b=FND0MWTDPgJBMVj0y4yTOtEeOpaa0AciNQB2x9Qet+mmW1dy7N1pa4O3JSiwwQb60A411haMgMvZd8SqosZbcnBKOFA5yKoMvCkOEdp9IiJR7UGfUNwLaea2CyHEgCStxOwH8fykWXNZhUCzpamoo1fS3bwzdMv6EJ8OP9p0yL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739791995; c=relaxed/simple;
	bh=Dl7utaiEnQlj/hKxhHW+FMXmb9HcfGdO+crpYltGeLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPNw30pcRFKkuy80A6V38hF+hrzofCJrwVAhdr9MxeES7gxWHynOsKsRs9OaJoQq4oP1u4wJWYZaw1zECbZnXXLzqs90kn78T0QcZB3FQKS+9EXnZmLDqrIjRYUywI3XbOazcKIYLHEWKhYr/nKPXPZmaQdj2bTipYenZnpb0XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=D0JKTd0v; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.64.32] (ipbcc3a93c.dynamic.kabel-deutschland.de [188.195.169.60])
	by mail.mainlining.org (Postfix) with ESMTPSA id BE643BB839;
	Mon, 17 Feb 2025 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739791986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPiKB53HMN0y5S2cyyt+prAfI9wInGI1FgoyZ2Gls0M=;
	b=D0JKTd0vL/GgWFpuyFBiW9Q6qyLpnol7Iua/zHhzbj+QlJTsUXbuT9FlyLk8LEG0DD5Rgv
	EGZEBXYfdiu1mkSYLbGM4vDc+BOUTwGPb2hgWw74Eibw391AWR3CGzMiyiMm29eRAdIWVQ
	mJqvwDu+IZHqScFXJVspgMSBRoyxYfrhobsN0whEh7HvIugB0LM5HGBVlzx9CDiyoLTwgd
	7GS4qlNcLANobdnG7rGJj5YOKec7E6RWEpKn+tTEglnT2WOiZIUzsxIOKwC1ZZcHBm2Vfn
	xHS6JD/RZZpvuTWtNFznE7disX9ppRqW/QUCxsxQ7n4rCaLwTfMVFdtVvsxn2Q==
From: David Wronek <david@mainlining.org>
Date: Mon, 17 Feb 2025 12:32:54 +0100
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Lenovo Xiaoxin Pad Pro
 2021
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-lenovo-j716f-v1-1-b749cf4f6cd7@mainlining.org>
References: <20250217-lenovo-j716f-v1-0-b749cf4f6cd7@mainlining.org>
In-Reply-To: <20250217-lenovo-j716f-v1-0-b749cf4f6cd7@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 David Wronek <david@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739791984; l=805;
 i=david@mainlining.org; s=20250217; h=from:subject:message-id;
 bh=Dl7utaiEnQlj/hKxhHW+FMXmb9HcfGdO+crpYltGeLY=;
 b=H8YslMZexwth7jyXo0Ab8z5etBt7naM9eVtmOMFUQqhy5EAB3jwVNYLcL9i1wi1GHnEMjlqlA
 sSWUKNVGsS3BMnEa8UGjTlyQh8ebZxmEKvEvRfOsv7UbjhjE+W6Ocoy
X-Developer-Key: i=david@mainlining.org; a=ed25519;
 pk=W+lFosPYSaRRoKxJR6X8SrF90iGKs6McC6NWUyNo9Jo=

Document the Lenovo Xiaoxin Pad Pro 2021 Android tablet based on the
Qualcomm Snapdragon 870 (SM8250-AC) SoC.

Signed-off-by: David Wronek <david@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1dc32b40a2201bc219a4f12e9f3e8..7b48857decc2aac2694f922754cbc434d48d4796 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1060,6 +1060,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,j716f
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp

-- 
2.48.1


