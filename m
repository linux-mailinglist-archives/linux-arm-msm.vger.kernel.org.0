Return-Path: <linux-arm-msm+bounces-93973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHiTK/WPnWlKQgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:48:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 319611868E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FB73311F3B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67AE3803CD;
	Tue, 24 Feb 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkD8j7hX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C0637F8C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933472; cv=none; b=nJcR7xcazWvq9wJ0rqW3+Lkzz1gHJPPU9FMSbVeH8Ot4hoRps5u/yWeFNtx3gDl3D9P1Pv912CCwC5rmBE4GqYnayxMPY34MFBYeErCkQBlWCqbkOyAgFESDlSG36FWzdb3GKl15rlGEBYM8kmr/mC2wPmvGO/bu7xWSoe7r2Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933472; c=relaxed/simple;
	bh=ZCy68bKzBFZTZSfOpy3mDznqvrsWBJ+1U7/kAOyrhT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LANOp31eZhD3uoNAa6q++v+W+1RObvqJoZ80eXmhXSzXi00ocvky+4fxFKDXfn2zwGrsi3nxVu4clYcQCvYDTH218zc8uGn2vtDH8Ot5xgeTl9qTqCX9Px0QbiUFDbcwMbJwJrtBJWjzQQPK/h5OMi637tmOUwr1xkeSUmGzpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkD8j7hX; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8fd976e90cso730436466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771933470; x=1772538270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=IkD8j7hXjQlAa/DeuvnG2J1pVlPfTwOoMyBJWl2zCNRUGfRhX4GnK/rlvL+en+vdkY
         MNmOU4sy9IUdpCEcT7+e75rmCvyZEMRGxImlKij6dZf+2i2tZySZIyfwLtQjVuvtrj5D
         +g/3J9+MHgFAxNnLAGc31VtqTod4mmKM0M1ERnT78EtsBijDn7YYmpV0UaARFoZ8XNLS
         sFGKawZp8XnwZFOqq9P/SJ1hInRFEga544V0gTIfoRRt9frYPJ69UEeOY/2cM4PIfGCc
         ZPbQw5f2nGlYIZp3Vm9sZ9on921i3QKsgCwgbtxObPwemRVZY00v0tHEKaNsx2NJQ/1Y
         H9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933470; x=1772538270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=Qcq/UyxK9MJCvQBMr46dt71QtNU7nUPvzaMe2y3hGd0KY+gDIXBARGCMcPi0NVWl/E
         H9yE6itsB+Vrx4VGbuKolH4fMV9d3TltPDM7XfIVR1z8j2T0m/x30jmObcVB5HLa8rhi
         rZCgQxFAqMC9x6huHHO3Yyg3J2O3eKWgGsR3BDnuZDZB1Z0dj/gtNl6o0INz66Xf5IzH
         iLsDizhk+ZoQA+MeMwcdoaQKj2wkWn7d9t0ikizQYnrPssX2yFNifZ5DEp82TP0hqNYe
         FdITg7exAPa9OqurlpQZ6CPXKZpKEPI0i5IyG9xYkMXh0/3LVerJGs3LMxnHdHCBGVw4
         KL8A==
X-Gm-Message-State: AOJu0YxW6ydJZXpyLW8V6Ze8N5scAwv0ADAHscF4uzaoUE+CnDOV8rzC
	1AjEsBSLeStWCGNK9ABkJu2fHBBytj6uThwXgB4Mn3Qk1siwxj7/8LqbCD8kXg==
X-Gm-Gg: ATEYQzy0PDPyBuF4wT1MPfb1ObxA/MR6ByWtR8+W7feggsGHaCXS3jAPV3JPMAJOWir
	D9IgdVJLXRihD8iQfGul98wVBA2WD5C/13XN62SRfjzOyoRFsYaqYz1XFXjQLJppEoAOpSh7FUh
	/17O1OqRjBO71w5D+ZukbwMYYzwor1UW7UMUBjZFZ9JqTyGtigYgow4BL/YqWuGT2kWtRq/xGwO
	mrG+OQovn8lY/s4BREhjbYOlW8q2lryAsiOk5HeCXcMAI5o0Qdp1Xg6gFjs6wbce+8WDcqS36yh
	W7K0OTeckqcY1HcoWXphc+S2imEbZjH8JurlRGIg+OERjkwnTWkrYzH10VufedGhV1oE7WVAGCH
	JDZwH5CCTiC6TIaLFVO18kdmsP0ySqyJyt2dMqyFSyEeZVqFwGjfwZe5U0LZlrsj1sulYXuoLzh
	e7V5lyvoiako0MCia6aB39Vcw76I9fgC8FRTFHukg=
X-Received: by 2002:a17:906:208f:b0:b90:35c8:d01b with SMTP id a640c23a62f3a-b9081b41b47mr490205066b.36.1771933469612;
        Tue, 24 Feb 2026 03:44:29 -0800 (PST)
Received: from workstation.home ([178.231.112.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e8cb3fsm417992566b.48.2026.02.24.03.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:29 -0800 (PST)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Tue, 24 Feb 2026 12:44:23 +0100
Message-ID: <20260224114424.1966947-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260224114424.1966947-1-zstaseg@gmail.com>
References: <20260224114424.1966947-1-zstaseg@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-93973-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 319611868E8
X-Rspamd-Action: no action

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..711cf3bba6e8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -982,6 +982,7 @@ properties:
       - items:
           - enum:
               - nothing,spacewar
+              - xiaomi,taoyao
           - const: qcom,sm7325
 
       - items:
-- 
2.51.0


