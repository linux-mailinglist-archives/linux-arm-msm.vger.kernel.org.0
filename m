Return-Path: <linux-arm-msm+bounces-92561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGGBG+AEjGkeewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 05:26:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C30BD1212F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 05:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDF9A306B2FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 04:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1D43542C5;
	Wed, 11 Feb 2026 04:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvdKua0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429B352C29
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 04:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770783950; cv=none; b=L9UGQajIch/1my+GkfmySp8xCzqKkTavqKZ+McsQNrzBVRr7o4JgMnknnW8LGC+KNU+TEPozYR+MW/RXsnhBE+x313jm0/7+DinM5B9xuuxKzq3w5DZWarEb7CSj6Kyk4+dEBbLtw+UtHU8DiFMm+U8HEvg2ZmZ1GbDH/zKWOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770783950; c=relaxed/simple;
	bh=hUYScQaRX0QfzkUatVOP/WusQlNS1mD4mV/UULK5pUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XtBi9UJ2HvjWI0Wl9Nc2vO3h5bSbtxYsyvaea65Nn/o6tv6lnaq541XDBdEfypHgzBtAatHnp96YDaEelKa8nbNhuCQIAgJe4ay7sRzD65eI2/UARVtq6ET168A1b5ZSl95MtBE0J/GdgYgMr5uAtCPxjJMdaR2RNkJyjOPMsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvdKua0U; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a8a7269547so57345765ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 20:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770783949; x=1771388749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G6pf8+5EFoESwai3MJ4dA07jKvv0MdZ3B0YqUEleVY=;
        b=JvdKua0UidBGpipuazUYvB/pCtmf8vKUJmM9Nx5D/L6D28kQHvoRJFdSAyR2oCBAI7
         zxqQGecfOX+ddnwISSd1PkuGpgOZ/KF/gAtVYNUvoT5IeIMzjEKXFVrU7VRW8FKtYJbD
         rgpCs2UsXoegZrco0LgM/x0SDjcEJe1MVWx7DRALuvIf2ZYOEAsig3Sv4FjappR2WrtM
         iC1O82w7vYqDIGDpxA7ZR42/BmGJf8cM2NVpzVhdfljTPLhLVBLrW6ZGncYZ2qZPp6Nx
         RKY8n9ecdV0BnQmTN5GWPmMAfW/ElxZNXBzoUVY3pNzYjKFL03+hY2I/8GRWIKi7Lndp
         J+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770783949; x=1771388749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+G6pf8+5EFoESwai3MJ4dA07jKvv0MdZ3B0YqUEleVY=;
        b=E9H+KSC+K4VeO5Inr3YuPLsURETkp20SSrtA3i9xVqIfSnFaaFydGKeZq2Y16fh6/0
         zZa+8un2av+5HMmjP/PkxJ34VdfkHNckEt2d52rvBLdenMQ/T/HHcxhyDVArn589gme9
         55jg9cmt0b7bc9v5/5P5tQttSM8nvzaCNqEY62UZri8FXOC/djtH7Pe0ZkmH5iu0mJBk
         JHzW4Y5tWBQtxmzguW7np4g9HCDnoo20PNB3ENKM6ijGI0+ejvG4bvmJRtQIFtutGUH1
         FPd40+5Qacas7P0dgMOAXLkayj3j42mYTGXI8X/OWb5tUkc/8EKg4WcCim0EnLv//kSn
         Pxng==
X-Forwarded-Encrypted: i=1; AJvYcCW6KYeoIYhIDNUEN0tjUAOCHO0yLezu4kMjJir22w/N6gt5iUxKZmKmPMuDJSCacEv08pWMoGEry55RB6pX@vger.kernel.org
X-Gm-Message-State: AOJu0YyIDGqwPGhjUbN71LqPk46GVv6uTgC1zHoHwx2XxhLnnmgJWOIM
	GyI31Y4sZpylnd8SUL7sC0jiFQl2tifvPTgAg/K9cHujD54TDW5G8tdE
X-Gm-Gg: AZuq6aJcFS5RoCuMoHvhXYlk6g7MHfXZW4UpCXJGoU2nF9XEb9JHM45cP3Bx1g3TnTC
	PVFW6ku9gFksNA4KM5B8rmixaWiUL53WBOUSMmxChmDN9r6x3aio11tcD8z/si7CrEokGqMlRZc
	PKj5lcG6pSHTtHIItIsN2XsZ4oa24oBlVuvJ4uxPLt8QYWYysNI1MwLM+R0H2aCF0MRC2qE8FJh
	slJwKPVLHC1iGKvUs8aOTMGEBClqLQcokt8Y1N/YfYqDNlVTsSyS/mrS2xOGyL+dSKZ7733Dfj8
	qKJn9iCygzrtTjyJxPmRNmI2ZM5mQ0w04OEEbsRYJHKvKxZIveUEW0+L3l703ToSY3MNuA0QZ/5
	P9iMVP1Mct5xOMLYSuP3E4a2fRQqIKNK/lRI2tHXcVqaGVtysOMGwwdbObaWK0lREEZFQFgkOdu
	SjHjf82QFhwnExpgrsKGruJgU5X5RhafS0oKCJIt0Qci3kjLGP
X-Received: by 2002:a17:902:f541:b0:2a9:327f:aa31 with SMTP id d9443c01a7336-2ab2abf9fa0mr8528515ad.21.1770783948590;
        Tue, 10 Feb 2026 20:25:48 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2996617dsm8413545ad.47.2026.02.10.20.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 20:25:48 -0800 (PST)
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
Subject: [PATCH v13 1/3] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Wed, 11 Feb 2026 09:55:32 +0530
Message-Id: <20260211042534.162007-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211042534.162007-1-tessolveupstream@gmail.com>
References: <20260211042534.162007-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92561-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C30BD1212F7
X-Rspamd-Action: no action

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 4eb0a7a9ee4a..c081746636d1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -876,6 +876,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1


