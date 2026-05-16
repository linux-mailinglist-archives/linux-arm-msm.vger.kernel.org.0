Return-Path: <linux-arm-msm+bounces-107985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD8TA1I0CGpAeAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:09:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D5255AD65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C7D2300FC57
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 09:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13544380FCD;
	Sat, 16 May 2026 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2ttFYYo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEAA37AA82
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778922544; cv=none; b=iWOmhE3yjUq2HtZIMrOOK2/aq9TF9bmSfPjpP2oGK4RM7q7hGKA4+mhBPmIc57aG1WU69w7jwy8jtk3Lon37EcPKkUPIyIcxGt+dYcApN7vVmHPNQKIOFt5fWYBUrAkmQewYySdxp9qNQfiDT0iLwpizvZ1biVIaS90DRlhJKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778922544; c=relaxed/simple;
	bh=FXboCykBhLUIndsG+vtr5MSXMPsvpSXgEuMQWktwGzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIzTt/JggRooOnIP+UBt6+RNFkwGN+xf6nNb5zrboE0fYSFIa3yHN1/tPc6VAucCnjor4Gg4n9ObnsI9oihiVb8QITUUaaWcN3Uxiqs1woVnIAhUFv0IphsoUKnKvH3XV4Ok+Q4uK7Ww2Qg4sBIZzMQWbUNxrqLq2qxo2JxfEpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2ttFYYo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso1788131a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778922540; x=1779527340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNCsYy3NStJov2wLEidrFREbUcyjTnV5T0teBfOEPaE=;
        b=n2ttFYYorYlZFvfWHUXGtglGnQs9nPQIkN320VGIgkiym5EOLhp51aGlMK+WEfvF36
         wZYmUBY87tGu5N+NQiVMhXbirhd2WSfLJBZ0aLnD0UThfwDyvR79yAToY6XM301lRfRk
         9hrGziuIprMp0G4Be2Y4G4mM96iNfJt/v1P0L3fa8djAPy+bgOFegWTmvNQwQXxc18dp
         86sU4JuXnxMxaFdzNLtBh3qaK0sClhmXi4UfXRV/GlsGIrhG2+e6KJSijb7Evyc8ehxb
         QOM7siVrMBJb6au73h4pMT4+aLaAZdrGYAVRV4IEb/TKTrpVO/L0OI0OXRAMQ2T6PW8v
         0DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778922540; x=1779527340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNCsYy3NStJov2wLEidrFREbUcyjTnV5T0teBfOEPaE=;
        b=e84N3WQNzAor21bMHdv2Yw0TWyUbfkWdcGkmJ32a9gmHM+1oNH3ceMQ+QrzPOwDxow
         DDU7wsgMcy6PcPggYRJDiI/QiQbTshKQH5DSUtXs/F/cCweJIqvolcvjmyadz988hows
         pVK2TC3rjEoFNhlQJcUw76hmi5WNb091Hx2ICV4yF4JmMQBha/Z6x17s+mp1ZYXc8dD4
         ZbzuslhHjMCmwdL4/0X/NsjGH2AW8OjVsMGhRDsvDj6E4MmKyOM4eMKRx0135XJNNNYg
         N7qB56NR89RFHJL9THqdBYEs5nE5RaKEwSfBxvwwGVGKYGH1Qkq2IovbX9/hGQITOj79
         ViVg==
X-Gm-Message-State: AOJu0Yw2b6bDu0najSYb+1WuBQxIqP6za40uAnCIu6zuBcN35+OF65nM
	iRQWlLc5Ksw0xk4uLJ6/JUNRH3kAnbBJlEQPW7YeYwSlwNye6jUuILsW
X-Gm-Gg: Acq92OEzFk74o1RFnuKGdD246qjDfXe9qMyD0l9HwtFinWGkBST72lAeFQ1wPPq+UHD
	SLHzhoGh9ZIedPISqzbGB6SoqVUTir5ZH0oB5p+N3Lw6EGRyGiar9Ml1X1kp3TC26UhKBxRWa7E
	8dPStqJE7CNcXG+B55quQSHdwvQwqBttaIE/cXZXYKPykR18Dv19CrKcUEpKEYVxDLdC00tnMo1
	Q7T06AVLMmBvjd7q8PjQb8B5w+fkuMeA9mZQJuHjMGpG67q3cSTArEYrZPft5YswxzbzJWdmA56
	j9iI65iWb9s7KjWRo3TNWZJsJL0UC+6ZUW6et9QNx4DvFbaiNNAwk8ND8ndx1bPiHiyPISKPfFe
	Dm2rCV2p6GHeJqz+q72v/eKIut7XCTlwqbRGKdUoxtzQbKyRzG0tn9GUMrjMIbXmUn/NXaYfFXP
	9lcMd1h7YTX/Kyk3ZJPlcrODfmiL1qK41IhSGfQrao3Yic3zNiMKzQDCImUDm+
X-Received: by 2002:a05:6402:43cb:b0:681:2472:76c2 with SMTP id 4fb4d7f45d1cf-683bc1b047amr3375494a12.4.1778922540001;
        Sat, 16 May 2026 02:09:00 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-684744d13aesm525848a12.18.2026.05.16.02.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:08:58 -0700 (PDT)
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
Subject: [PATCH v6 1/3] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Sat, 16 May 2026 11:08:51 +0200
Message-ID: <20260516090853.2873223-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260516090853.2873223-1-zstaseg@gmail.com>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 61D5255AD65
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107985-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


