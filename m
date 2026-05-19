Return-Path: <linux-arm-msm+bounces-108503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPKkF7teDGoVggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:59:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F257F2FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C78AF302A560
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48934DD6F6;
	Tue, 19 May 2026 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asj50PiD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0434A33F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195439; cv=none; b=WUrnjY6Ba+vzkY9EtOHX33tsJo0r0GEy012iO0phu3ZT6wJVYJNy2r5A5X1vpiIB7/0hD39jp3gBaB5cCxhPQ0vfS3KK+YvBXLLvCa5uvdzkhzkABbVPz07/H4zMpW3mWE9LahF2JfYUYj+IFVobRtiChrqHsFIs18wDfM2yUuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195439; c=relaxed/simple;
	bh=mvbYsq6s7d7W1oouiNX7rgDJWbcpYrxcLw9VH/gGvVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBJDYUQGLNiVPFTSehyYaAR/8UDUVniYsCnZgiKXJpCbzGxcESUvYN+KlLepiD8RhMm1lQ/R+tgzBbuzZonRXSDe599m3WdpD/4cxtGcK5Uw7jEY3UySnhMeYBdOWWk1onruDcYRvH6hrPIu15+ORKKLRrHRBN2zovfi2bxWkYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asj50PiD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso36450585ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195438; x=1779800238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=asj50PiDc+ubVpiM9b0J3rTS2FjsbdJsIVPLd4hGblIkjZeM7NruhLr3IYQEjYWrYF
         LOGZgvlRpVJS/2LQa5fm1qnf5oAg4MtFuudZNvUmEy1a08wxLV8MDcw2N9TamvFN2JPW
         IaRqwhcOAUSNTCiffCesX96U0H2+vCjbhoAOHLnK6C6xOIV7m+y5KNjbyqg2hxQmX5XU
         7iswVgvK2qqo3b0grdCzkd7L4CPCOAQC+FwRdkG2SH6v3RnaaImUr/rBiwQYFimFWm+B
         e5c4Xtx7bn+yg4k+XUG0WlZcrAYtQMckG5wmTPXrZrxIbLZpDLi5HCDxP1qwu71e8nd8
         ZGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195438; x=1779800238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=tOMyBCAGGfsfP+BcR5GELB10vrJwkJBypRwMVgQJKYQCrJNzvYCXyB2DpCXo1t2ngn
         pf0tuDsSX5xrlyx9OAeUu4ae+EZdnugz2yHlVl56fA26XCcmVTK2UzA31fwPFAbTG39F
         zujsrKgMRZfpNooaXjOKShex5JZ6pWTiZ6DjF4rSgem6MHu+Pi8xrO4GXbSNWOxIi3fE
         QAcbJNokTc/pVMumBCOZKOaenzP63FD+tIQDwb20wReOitYrFO5W3L5Dpww33TEh4opk
         DKXoJ0T60a4q4MP0OQX42MrQEqHJY+5wQzFtYyL6U9LjAvkCHEKeB35JFAlRH3mUP6kp
         qgzw==
X-Forwarded-Encrypted: i=1; AFNElJ/1P0/x6Oc5+kHuffm+rjPq438DMiMQOm4FG1oQ0WHcvF4I8vD+et4dDd4I8yz+JYgp7nSCg+afkjEmS9F5@vger.kernel.org
X-Gm-Message-State: AOJu0YysMCt4iAnnHVouLlIKrFk/KKOxsxxZNU/nxMFcQdU9u26m/kAK
	szX4X6mUUAXOPSwdjJ+AYhDm11hpb6xziZSQrFzgpmokOwh3dUKs8lhW
X-Gm-Gg: Acq92OH8k7LrUwDXetmQ4NUTpmAvzSOmroPkfR2p7sbaWB6C5a/L5UUaejpEoDuE3k4
	grywRxUKbC8uKF9U6hmpJlsf2fCgsjPTt32BSdPun1nWaJbXsUSlh+apH5Kre6RaOWyKScaxFar
	Et8skTB3TV7KqPVUnKqhMrTcNsKR0P0Sm6gjnG3gSZqSZKc+yFQOtyHW+zLcuTstRuxSIm6cOXR
	eeFK+L9C2iJrs5SClVyaRENZ+RX6KqoTFloTkluENywaUXvi5nQ6psGSwGB7+DT0pCxUO3ZO/zy
	QQM9HvDwbguQr4wA9gnCIOeGGHkdFRxXQdBaYlKNCc349S3SS0tG7kjdivGnhCThReo2WYPFOd/
	UieW9Uzq5gO4uJAiBW2d0sX8XQbvBVLDSf8z8yOAKaA3u8Frl3zJu9AVwUvgpx6sYpliwkObuTi
	zbyPZGSZYUO/1AMSPPQMqG6SEA8PIGRmTYMgyjtmtqQ/06kMbyuGeoIV3d8g==
X-Received: by 2002:a17:902:c412:b0:2bd:c2ec:eec9 with SMTP id d9443c01a7336-2bdc2ecef7dmr117382595ad.18.1779195438116;
        Tue, 19 May 2026 05:57:18 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:6421:6644:4454:28e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm194025965ad.82.2026.05.19.05.57.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 May 2026 05:57:17 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Tue, 19 May 2026 18:26:54 +0530
Message-ID: <20260519125655.23796-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260519125655.23796-1-blfizzyy@gmail.com>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-108503-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7D5F257F2FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Vicharak Axon Mini is a single-board computer based on the
Qualcomm QCM6490 platform.

Add the top-level compatible string for this board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..6924bfe7b949 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -361,6 +361,7 @@ properties:
               - radxa,dragon-q6a
               - shift,otter
               - thundercomm,rubikpi3
+              - vicharak,axon-mini
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
-- 
2.50.1 (Apple Git-155)


