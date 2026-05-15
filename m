Return-Path: <linux-arm-msm+bounces-107712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGYJM4iyBmqKnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:43:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C4878549AA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6EDCC3024134
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D4B364E9C;
	Fri, 15 May 2026 05:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyccnjCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8FA36403D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778823760; cv=none; b=Db27yCoYdvsE4UxkitsnBSPbLifUn34tya5zZOj0mL+RD1dTzSf2A04wgCoeknjhtQZwozezgug05GB3KK68GN9bYEM7fWaOdZyxXNM/EyD3whZr6oNpQDlJQhqICoIpN8P7z8Xt0ICcTsPz/oFYbkj2wtBGAlPwdbB1lxUMSMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778823760; c=relaxed/simple;
	bh=Uj71YxMd7CP0/+rQajvUXPXNAzpKdvAdtZ6sztvIkfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxFPGwEP1x3PJupjBFBIDzQssgbBMPB9trE18Ata6B1o30jm4xFfjC46XIbkT52OiNQyv7uiA/3OxGrHa/vdvSw3lyo1HI/oPv29kgRm0BaigxzTAHQRL2UxCWT6v9H3ThO+S/37sc2xdfp1cQDxn7rMUBO3wRAQXt4LOGvB4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyccnjCo; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c796163fac5so6514757a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 22:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778823758; x=1779428558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0S90v3cSnC5Da6GOQpoJCPTnbSf2YszUbZPGAtd7qaM=;
        b=TyccnjCo4ObKyoBHeWWN0uDjXxbjeo7qEUhVMUXhuS7N342JBrsNaAwA6mG4BKLzrh
         UA0AhBDlvKPTZjGeXFIDUICBZAZDDruCD2uwsXsu1DORDIc+JFtsbJQjBHa8dexqap5T
         VRR/a+jCOwc+UdR3L3UoZG0S6XUllwzUzZMf4JNQMI9sdXgC3czHojU2H88VS1q8xDTu
         2Cc4XuQ//QpXgsitNSPiIWbiejqkjMtwywab7QK5HFHGQyZRfAT5MOLAD+pXaMfGL1jM
         LF1COegvVw6wAZ79+jkDrg1T89TgLx5V8aaHuk9WTJHLUNAlDQM4NzGJzoWapa6MN13M
         T/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823758; x=1779428558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0S90v3cSnC5Da6GOQpoJCPTnbSf2YszUbZPGAtd7qaM=;
        b=D4a7QsUx7xHq2u4bRIT+f4wSlAgLvoRPjXg+W/5JF1qk5GAcEb36hnk3uc80hl5wX/
         R/ElPwBCkpthxsJiNHIFrqT3vBI5W1DmnoXRB4hIG2nGYthACoMKPzrCmyvD54iIbctF
         NU9oRx5A7PBNaDpCdj6LiIPRbvIpnGQ77KjmntW3/ZGOz9qPaCaleXfNVJKo7RgFsOQv
         7Oo7FRQKvqaQRdolMjHjlhZeeqPt9cXrOVUn7lcqgSUZ6xCZlmaoHcKaU8SWQADmGeXn
         IbEMrgyD0rlyHvCnGAd1FrCTOZ44Iux0ha0bzCImZOZgDq6ddZbE0O73ucV5PIYcApAv
         J1lg==
X-Forwarded-Encrypted: i=1; AFNElJ9hp74gGg0Bu+Zgg+6vcPDO5eevxIeWfFCf7B7sAHwUNL6XrKRGdJyPe0GzZVh9Whs6ivYpg3laYV0EI+13@vger.kernel.org
X-Gm-Message-State: AOJu0YxZnCVPjSJ+l+9FhPpgx2qKIcP2ws0lifEm+63o5tklHDrTZmPd
	s3my1GMvrxI5v38cn0k7E7sP3j4YnkzAMC2Fv1n/mBPuCxH2/aj2NFaznZwJofzr/IotKA==
X-Gm-Gg: Acq92OHJvIRkOKqyLxCEwPv/jnVNHt3Sf2VImUiSqa62s4cvfhhGdZyxLSHyJ97jRTK
	l6z+Gf5ObByQOaSl+RjXL7vb4e18sZhb0/hUkZLqVSmENEjM4SVUDffmQqRuGzuj598d3m2amhy
	wByv+JqO6smpEM8AeJhcxj8mOib3ufXlgZtLlWZ50c99ijHpMuVEW6wgAVqYpdogE/Hxcol7vrE
	2WIiyKHt73Ik7PDKidO6LdNsfvGbke+7yolvbtB4QfG8ngJVuWNylJTygrUa60sILBQOEx2oQHr
	IbzYl73DRyMt1BvH+5GNUn6qPprM3u4BNcjS65OGtY6yR5MRUY4xxuezfJu6Iu7HVTJRETrwh93
	VkWH+qxnaTP2hGCNpNStvQmWie6f65oBkDLCqx13eopJ6Lj2op8fG3FUflD1TcEsnsK95WoLYk9
	MjM2dIerUdaKJgWRAGAsS/svGLruIul2TkQT4T2lK83QwsdYPtByLJw9UgSks0X/w/yLB9fGh3x
	mZQXx7VwB70NoIYUdmdlxlm9o0=
X-Received: by 2002:a05:6a00:400a:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83f33d96b70mr2736897b3a.30.1778823758064;
        Thu, 14 May 2026 22:42:38 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.wework.com ([203.117.161.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3106116b3a.33.2026.05.14.22.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:37 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	davem@davemloft.net,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	luzmaximilian@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: crypto: Add x1e80100 inline crypto
Date: Fri, 15 May 2026 15:41:47 +1000
Message-ID: <14cd42e3d3af4b2591c9dd8dffde11ef18666751.1778822464.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C4878549AA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107712-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,gmail.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add compatibility string for the x1e80100/x1p42100
inline crypto engine.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..a338c4a33e98 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
           - qcom,sm8750-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:
-- 
2.53.0


