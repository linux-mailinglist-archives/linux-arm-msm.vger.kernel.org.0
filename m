Return-Path: <linux-arm-msm+bounces-90865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDdMDgQNeWnyugEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:07:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BF599A12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60A1430683B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 19:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775D932ABCC;
	Tue, 27 Jan 2026 19:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1BYROVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFC329C70
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540546; cv=none; b=UntmX+Os7EdK/pK5R0ajPSuUMXaf/ck2JbKDmmOps1sBVd0FPEk0VvXxy5nXf0Bl1dsZO8SdIIHmgQU5kIYLzDPzYGu83kqDmsHeaftgXikxE9eP6O+SHv/WdHGW4WkWF6wu4cgbGobdVwttYWoUmFagOOoRo3lok2T1ZQCIYnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540546; c=relaxed/simple;
	bh=4od2Zsrw8MKqAx0Tj0P4A1rKNjPVcZnSN0Q3Dj9DUDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TN4s8DK0ch9wwx93m92xh5Cj4xj8ZXg66I4CeGEBYtE7yQHXzZK1K/vNEhN4jfSB1Q5IaT4JuvhtMbnC6KvugKp+K8sjchx+CVyESCon6/pEiDGya20pu5aoua6RfAfbhcmOvMwPYChwnvij9YrZC2CKLF871Xoan0hog6ji5Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1BYROVz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a2ea96930cso37922315ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540544; x=1770145344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEzmMy+VR9Xc34VYDgQek5eZk7wdXPLbQFrTaMwdat0=;
        b=K1BYROVzNG0hX/fb55qhnYIgw2tkd0Ty77b/cBtWSAGZ3zGpO4RThKWaKi+qnWwnHJ
         10ckYL2VsFYI/JQEhEcHuJLh7ujepF39sGHL6dR2c2mV1WxCmv9Mx837d+qKm6EBySt0
         AL5GsXXwRiN8WXtTM7/EtUTm1JoZsvzYJFbjatrwlycKBOppR0Qa7DrRtJ23vytQYnEj
         ewM4+jD99LMEwNKkv91ByktKZHuALZrMzF2wZAYoKEYaoW2/Ias356IrbQYwMkMTm2Y9
         bZYnY6k+d00C+P6BOB8IlqcG5NZZI/r9SOQGLrEM1k+h8RCJkYDadpFkvU5QqAoBWTzm
         wK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540544; x=1770145344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lEzmMy+VR9Xc34VYDgQek5eZk7wdXPLbQFrTaMwdat0=;
        b=SnPaHLS0wLGmK59MAHNG4MOUxJ27FC0vlmiuTAP7HrGkGFZItRGdx2s2a/ZU6O6F9L
         Quk3985pcltm9cl9souKZBr9qojTWFw8DrsdegkV4xQXuOILAUCu+zAxC/HqayPneKev
         7fWAm9KQCF+c0GLF6FgmDJPrIrk6zbl5LBIvPOVE7DFGblV+v0LtjBgnZuW02cWmfeo/
         IAtLr7aa2nM59JeBTDnwC9aItX4hVVYy2MJPLPC84LgKLa23+MiCLnXQ4Xl+8HDE44v4
         3AQYTAiNSIGDfPflG0e8sUYX229Jn4nSo19C1hZNu+QSbw4yCbTpxMQUt/u08zTdbqD9
         jigg==
X-Forwarded-Encrypted: i=1; AJvYcCU4wY6fvX0doTKzU6yVk/t37CD7/GNdVnBJtMmghltaIG1+ugrdI39btUVrs6kZenL14vjh1wdT6xJz94Ue@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSDDdssMcuCDZN9iPxnIxMMo5uM5S2JlU0YQJSnELaFWd3J7g
	NatPCGYNZG+h8hvO6w1dLwFPD82nHkDFDf+/ZnX3ViAPx69HKHUz+lHH
X-Gm-Gg: AZuq6aLqFdaQod+Ij9ZXjYIvdjrenyPHjGWsVtU9TRCxwZeB1ZDr5zwBCf0k6e70gm5
	sxHe+3CMXenzLx5vycU1DOkfL7IadqXUPjAHTNbb2t/PdVma5SsRaAMgkKE3eXn82zUwg0TeieU
	eXId7M4rXjVO/0O4ok3T5hJWmBeK79MhFS3RnwvcPmFDIRKc1hBgmTrLyWWeJ2Q5FsDgOy04my4
	jnS26PwnS90ZX24Tn7R+Zx09SUpWiF8d6YD+N3PpKQ4V5liWpz0cmPwykuPSlY7BLVjjmRqAn8u
	GgG/Z/96UlZwdHrZoNSqI5Edr91ZBtW5wa5juBjSG5bsIakgpdGbKfPOYLIZ7WWG4xMEsZKSKmI
	1SMw/Pqi4V1p5c6ETbCOImz2TLbCizzsKd28gcWUZWprw6aEZSnhxjHMEHGCs61Tj8zX7QdKS61
	KQS3jKs9KCi3QTRHBHOS3ifknDpJWREQaK5AODPfEdy+MhaGs=
X-Received: by 2002:a17:902:d2d1:b0:29d:9755:9bd8 with SMTP id d9443c01a7336-2a870d7b6ddmr23896415ad.22.1769540544233;
        Tue, 27 Jan 2026 11:02:24 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:6ecf:d9ab:b640:78c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d4csm938105ad.56.2026.01.27.11.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:02:23 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: andersson@kernel.org,
	konrad.dybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
Date: Wed, 28 Jan 2026 00:32:10 +0530
Message-ID: <20260127190211.14312-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127190211.14312-1-bjsaikiran@gmail.com>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90865-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E9BF599A12
X-Rspamd-Action: no action

Add the standard 'regulator-off-on-delay-us' property to the list of
allowed properties for RPMh regulators.

This property is required for platforms where specific rails (like camera
LDOs) rely on passive discharge and need a mandatory off-time constraint
enforced by the regulator core.

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 58bb0ad5dda4..b02311263191 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -131,6 +131,8 @@ properties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: BOB regulator node.
+    properties:
+      regulator-off-on-delay-us: true
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 
@@ -140,6 +142,8 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: smps/ldo regulator nodes(s).
+    properties:
+      regulator-off-on-delay-us: true
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 
-- 
2.51.0


