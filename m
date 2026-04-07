Return-Path: <linux-arm-msm+bounces-102184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PHFLLse1Wnr0wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:11:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B436B3B0B50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B4743014929
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401B2361679;
	Tue,  7 Apr 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qFL8tQjA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B2035F5FD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574688; cv=none; b=HVLOwXaKhG+NY8t5UzDah8Dorm4L1+d/KDDDVCy75c5/hqJkRY/3q0TfgL7YC2tDNUu94kyTMxsbyXXlH6pObrxDJ78L2y7u5KFnDmlSwVUD/cRIBKnRZlbUDOmIzmKafXUDDUsj8eIclYM7shrZoqiFrC6BdFw9Fg484EFhhug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574688; c=relaxed/simple;
	bh=dnRmxr57u949ztN+0PPrL3MrbjbDkkYTKjLXyIKICE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxCF+VPFfbZ7uEnvSs7ajD4Y9xRKPVc1v3q4tPo1ThQ/aq0jOBa5nhbZbLIi1sWXndVYZM8M92Ku0gFINDtCuiL3Bo/Qin987OzbTWgJKuVc3i3GwAB9GIX2X7jyPlUDPK9xTxKvY0PWRcpDUn0M+YC0UFEymg4R6BeONn9tv30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qFL8tQjA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66f7e34bbd9so267323a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 08:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775574684; x=1776179484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEaHzs3NqdSvzTjZlDwUeGkd7KV4X9H8nS68JNmSi4E=;
        b=qFL8tQjA6D19LR10STywWC1LW62pC8LTzRm//7M+yGzqNjvfTKgTo5UmSkBPk1QQzc
         Dg4VKkC7klcYeXNSL2BNgOS3/mQ00WXiuOFiAGwQm7aGMXLrgMbzHPytwmuq6OWawIpk
         kkpaT05U/pUqCGHVXfgyIlmUdM2SSBEFiNT9AtHwZ20khP9vgV9EQfCmwXLR3Q1tLr42
         83QwgCTscwU7tWUTFVTyIsGRSxNgZKvOn4LqThGnR8xI8yaUuwvkmEt1v/K+hFjDNc4D
         B3HKXSUdzOpWbiMgPsK5RmQ462mfCrsjMt0+iqBLaSl8OZaJHX8JkEKXrL8fe2aoOEZn
         v+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574684; x=1776179484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEaHzs3NqdSvzTjZlDwUeGkd7KV4X9H8nS68JNmSi4E=;
        b=aiBkATG34bJRDoIlMvyOhdEe63UWiTm+7geVYtWQ467RfXxzFWgDu3rsrojcipR9XQ
         EztaJke25rqyaeG7i1v8ln7f3MTRSJbB1DnceoJHLqwvNhXcjoGz1aEl7QkXbBihWhUy
         hRYzxPCgRXiXHcKSB6W3UMZ+4SwdFaxrAOu7xCgqUn338gymOzlWO7hWX1CfCHBZseMh
         1apeb0OePxADSdpi2tkELGhg8T4tdTqmEseBVpDaZRMauKabKMPoqjy7T2/DcbUzQ4SU
         J2UCmPA0DgVge4Xe1DiodIp5fe7VEb0bVb1vAh85yd6hZReCE0RNfLMToR0EzuWer3JX
         sVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn0QNZdFo7sfaoruJGrFPMD6Ki0aIjc5siVltZ9Q33gazbRPBph8EoEGlsZkSF/qmxqp/O4qy5xZ7cdwCw@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYEg0xryP7SNZIiaWi10nyE63ALQUoJ+72oi2abK4K4r7dBNY
	2sfV3Ajp5p8inE4aYe022r8Z+x6Y1hiCdCSwDAFhuDt2zFng4OEUmaBaNq/AZmoCnWw=
X-Gm-Gg: AeBDietdpyuHnA0pzlj333f8VUy2sI4dDQ2C0Mq7DBaXBS2zOyr9JDmX/AgiVjGYCRK
	j9tB5nFnkJoPKtjq8QVFqO5NeocV5qSuVOjPxMm2N+hFo/5kTuQTiYoaoc0qXNjSkkx7JxVNMsH
	Tllc3H2Ah8vQfwL7pNRLB//nVL5IDO8YTB+fkFsAhVQVYAGUais78y2T8eInJlm8BnMZl1bK3el
	5uTNhkDKDSUrTuVcZ890TJ3Aar4HnJCZS3ayEjzvVxrxGHGn1YRYWu9w8UGWkiENb8zdH+GciAj
	p3Vm6iX0xU847tmCf52sLOFonPCYaWOxo0XcY89LYU7FTRIacmmtBv5cBqTR2FSwwxvMjomaq7Y
	9eYcZeTUG1ALJDZuo3xTifVAi0M88+klFB6YN4bXZ/jN7U7iThAgtp7pi6Hm1FiBBLX1D2SKkKl
	IZCWZT81JrrglVDtMsaCSefU+412FO76bAzLOvpdKj1B+k7AghBDEJLiZ99BpT79ZubJrYK9zIp
	65hGO8jS1VO05j4
X-Received: by 2002:a05:6402:5107:b0:66a:526b:96a7 with SMTP id 4fb4d7f45d1cf-66e3f707a81mr7719262a12.19.1775574684279;
        Tue, 07 Apr 2026 08:11:24 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e6f10834asm2753326a12.15.2026.04.07.08.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:11:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 07 Apr 2026 17:11:10 +0200
Subject: [PATCH v2 1/2] dt-bindings: sram: Document qcom,milos-imem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-milos-imem-v2-1-5084a490340c@fairphone.com>
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
In-Reply-To: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775574682; l=701;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dnRmxr57u949ztN+0PPrL3MrbjbDkkYTKjLXyIKICE8=;
 b=Y3K9a2xbCo8EFcWDCmEQ/ThkGUuBRSGYIsk0SYRlMA/MIV1Yc7LP2irCiLMTv00nU9PdyP4Mq
 MspJ0nOG2wHBDC2ehU0f8YHc2F5c96UIfrPbkGOH8pqbxZDeqDigEh8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102184-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B436B3B0B50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Milos SoC IMEM.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..cb2e11c73d98 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -35,6 +35,7 @@ properties:
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
         - qcom,kaanapali-imem
+        - qcom,milos-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram
 

-- 
2.53.0


