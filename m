Return-Path: <linux-arm-msm+bounces-110142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABp2ONtjGGpEjggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:48:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EAC5F49DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6E6132C38FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31723F9F30;
	Thu, 28 May 2026 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jD8yYUPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E93C3F8899
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981619; cv=none; b=ECfiOPoeB0Ruu7TS00j+aijZj206XOcZP4ELASuXvJeHQ4V1dgsAuJz549+KYRdVaHF2I2zYPGowZ5zfVmq/zZd+Nvq+aRyPnFrm8tzXZht2pzEl+GwtwAfKfAN7GvrXsXbCOx1CFO20RSlclb6xnuyccfyegeVnYg8lwAvzuHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981619; c=relaxed/simple;
	bh=FXboCykBhLUIndsG+vtr5MSXMPsvpSXgEuMQWktwGzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiLdeIlLPWomzeM0ZFobfenzBNcoYEvJcZ3PHQMHA/WyLqsfnSbrLq8PoQQq8vCOpAn0L5yVS8R5zc5qbcr+jeAL+K0v7m2Z8jeCi+TsezNy2X3ZGDCmD7GwzLyqBIlXseNOjWIeEzi/PkjU2554SHTfsdPfgP2PZmB0HC61jqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jD8yYUPW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd11a3729e8so2010473566b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779981618; x=1780586418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNCsYy3NStJov2wLEidrFREbUcyjTnV5T0teBfOEPaE=;
        b=jD8yYUPWp+NC4xagkWy5COQqNoiLXc2qfrncPxz4+MUYuiBCQXSwFDXwHg3jOxiRHt
         vE6t8zFhLXiNiXy6YmNQBnzV6YFQ+8re/3j/qq5Ee3TIpVeBQV8xLy0UQMR4CITpxTFZ
         J2CTLlogrQEs4ZoDPA33iTp2yeCuv9kuaW1ZoJp/SKpMpdk8odQD9GjKRG4zg1PU2cph
         C1/G6Y0q2C8+sDkPuE8DJ5VJqVSwTKbZnqZ1Oh1LMEMfNhQFyZ1epWNsNrLUBsRXelVI
         5/ZwMN25TOU4Vam4FIh/5CoIU8w4kMXlAdZ9p3+lAyrzAJU4fyu5JLDUbBXoTCuddnk6
         FAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981618; x=1780586418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNCsYy3NStJov2wLEidrFREbUcyjTnV5T0teBfOEPaE=;
        b=XwZ4CMNML66xeuL7LBEOYGgbA2ofRl0hc1rPcriDCotrygGxXEVkhihruc2QayPatH
         gFfyp17EZP6DEdpU/NF4i8MmRMLO570Qh3CJAKir256EWo51za/7VcZLZ2bjhNa6QjUL
         r+WPz/+itTPMusEJPaIvK964iPqRAdtbmDIIXaMVeS4V42aw14iVus/tYEMEY8GbmKKc
         kCK0W8b2TEOnVA88+pWWBPfjWNgUgbeAgFEX4GCIWxsmsV/WvCqd9HK0UgpGvmrmD2ft
         2n79UABGAzYP3TyC8E0bNwvv7aWf9WXXOCW/Mz0LdD9lZSMGtRk48ieFfdAtJbSf86Y0
         P0/w==
X-Gm-Message-State: AOJu0YwiD/7GPodl0UCF9f8t4gyiDbG9LZ7v/74RBO5MFSOWIX9E++ZH
	gfXYl6EJ0gWyEzbQWLsUDsyAm8i77wnpkS61TsfkAVcWDadfX0l8zqy9
X-Gm-Gg: Acq92OFtIKC3w4tLDy69Ozg3hKBdfeBovmPBFZ3LW0sHfCTEKCrqLj+H8kV/yK2PYQC
	CrGeMXefjzp2qkw8aNP3W6zVIBb8mzR5bgnQxO124m/xubzUpeuCcDix/424Gg4Pxk5IFIx2cKj
	ML9RaAOWEsaOOufy1EJXLnS7hmNImsiPl4aPzCcZKaVB4Jh7VdYiOhfxXiGzwjauQl+wp7v40k7
	6XDrzO5fVtvCXGpKdu8JOsqKjhwBLv5t3oaxYPtf5o5ZHdC2/CJqqzljs//eYxkWLtU0Kc038bD
	+zqnfs9sAcYUPQ5X76OEqnEGFxlw9KLuDhllQwmpLfaaLzATlBdZBhm+aXWd6l2k7UBgVMIPNJT
	1+LnalinVa7vbW/xmwfZjYBb0QWxesU5dTdhlxWDBAYQuew1zLFFi0sY6dsBVi8U5vwK4PefQWo
	9dODiIWJRN5I5MGow1f1L6Qd8Zp3DQo7z14XT6hjAe/4ACH9668KFP0a238sZolPYG6MYqbko=
X-Received: by 2002:a17:907:60cb:b0:bda:e47:70c6 with SMTP id a640c23a62f3a-bdd22944feamr1778119366b.1.1779981617293;
        Thu, 28 May 2026 08:20:17 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fb31611sm1984404a12.22.2026.05.28.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:20:16 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v7 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Thu, 28 May 2026 17:20:10 +0200
Message-ID: <20260528152011.376711-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528152011.376711-1-zstaseg@gmail.com>
References: <20260528152011.376711-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110142-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 72EAC5F49DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..575ca67c940a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1041,6 +1041,7 @@ properties:
       - items:
           - enum:
               - nothing,spacewar
+              - xiaomi,taoyao
           - const: qcom,sm7325
 
       - items:
-- 
2.51.0


