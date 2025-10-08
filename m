Return-Path: <linux-arm-msm+bounces-76409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3CBC5178
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 15:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DFE7A4F9B24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D251DE894;
	Wed,  8 Oct 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="JLnoQBzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B51E412A;
	Wed,  8 Oct 2025 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928475; cv=pass; b=HxA0nYUAN5n11KcZjyd9oU6mOMX/w8vre90WIm4QlTqa63+Isg57B5wXBVXnBSO0MPUNK3Zu7lioPN8BSD1OfeHK6ff17v13KWvVGij6/+Z0Abew5MLBG9LwJx7LFQfwz3BprOQRyI9XjfkgogAcoKpQFSdmWRig0fRzqyVcsWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928475; c=relaxed/simple;
	bh=dgfnn9/QLmFK+D6OYwNccW6H+1JK7n5ioinioN6VcrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VT9XnFlLUG2A27QOnO1gj3yujeWddvc+B2XHHcJxL8UpGEJa0yfQeENGOpDZ4qx5tiHXG3uO6BVmVxnWGM4adypOgf6FqnSitI4l7wrPew+brA2RZweciwCNl6R3sk0jSVSh1g26YZu+tufKH97k1tYKGUpiv4oe3BHp9GdRNhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=JLnoQBzd; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759928466; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZZWepw3aHuwTgiGl++4jo9Ti+FzU8ho37+6dJq+8ddVt6U6zUwo1El6Je4jpQ0/JXcTTqWqzH83ncDMdMMmdMv36p2J/vEWjCSYMfFQdINysV3Y7EVu8f/5VESFnKfEVDIp8/JPVuWfcvUhvUCShRhDcxVz+YRn3M7W98bsE9xY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759928466; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+q4u6H0/xA5V23XKGBAID+Xs02Cto/gKBQMu08TxQ6A=; 
	b=SfqOS+GaYKl/OafPACVq4f9oukD7tBQiRL7/uEuAZvGDnR2UYc2GcWUOZf0pGL+6hbcqdczxp9Ybb6Fddkf/zrIYB5o96fte/Um3Y5gYBehPJ3AxmUTdefuR+n745TYo6zR5DfZ4/CgwWkJFvEWiOlnUNmL6kYF5nUpBOgWEiQk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759928466;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=+q4u6H0/xA5V23XKGBAID+Xs02Cto/gKBQMu08TxQ6A=;
	b=JLnoQBzdDYFVt0ooOt0ZOFTO0ekPyBknaZ3fvINSHrdr4ycU4D9aS/smq3pUSY2E
	hepak4c62FAeptQbqzH5jmCZr2YGcCaI5bpLChjk3cQwghjuQUra8EZj9SKQlB4IfSA
	neFyID1DHf6+jtE37W2OytOg8j2sLTH1VQ79g4dc=
Received: by mx.zohomail.com with SMTPS id 1759928462491930.7907968106273;
	Wed, 8 Oct 2025 06:01:02 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: arm: qcom: Document Huawei MateBook E 2019
Date: Wed,  8 Oct 2025 21:00:51 +0800
Message-ID: <20251008130052.11427-2-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008130052.11427-1-newwheatzjz@zohomail.com>
References: <20251008130052.11427-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112272624ce0db0c64cb34183dadd000095c6ca7906987a55bc148ca277bf0a00f2b616e69c34e03e21:zu08011227cafbd7f1df4eeec7768a0d370000119f04abb210ea39f2df55ae199708ceb793a3d3471fb07cbf:rf0801122645f2201ae7d3f5a5124c6a1a0000f2035082686ff2c855426484ce1b08f709f7d577bd078316:ZohoMail
X-ZohoMailClient: External

Add compatible for the sdm850-based tablet Huawei MateBook E 2019 using
its codename "planck".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..2c1ceb8d4f25 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -893,6 +893,7 @@ properties:
 
       - items:
           - enum:
+              - huawei,planck
               - lenovo,yoga-c630
               - lg,judyln
               - lg,judyp
-- 
2.47.3


