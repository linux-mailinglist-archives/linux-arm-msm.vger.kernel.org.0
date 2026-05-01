Return-Path: <linux-arm-msm+bounces-105475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKDQMEGw9GmTDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:53:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CEC4ACE2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18D65301E6FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 13:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283503BED18;
	Fri,  1 May 2026 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="waBAF8S/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2D53A75AF
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643576; cv=none; b=bfeHRHXFthvsv7SpXbayjTXExoCuafF9d8uyfHelKQoKWRr6U81AgqzKqYEEz33POhzG9MLs7LfSqaE9DYlhx/BU0UD+D7aqZcRtdQcFy/4UnUcdKKxNE4b5A10BJ6IqLzRZVJrLuut3OKeYstWE/Y8al+qdpbLUkWB9l2xadL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643576; c=relaxed/simple;
	bh=5wJwm3SRvPPjAsEZfsMPDSlwXnO9rGALWap21GZU/AA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XZyrB0LV8FAydKI+qvlskOoK2dgr7GrGxhmQJ+A1ZYoLxsUNMvthsaxFpphEZhKdItoTo8xJDxT0MAlPgu4PTGOa3hvYFEZYN+VzDKajyUuM6Qr8SAoyJnhDPpelWVPWxxI57E/poJUyx96tlNodhpQzBJ+lEM4T1/NHAuqS5HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=waBAF8S/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so18757875e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643572; x=1778248372; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMVLpLTQG5lZWLeJYW9UDuD2JHkqbhObk5hZ9L9zJnY=;
        b=waBAF8S/JIck+jCKNp4gbL0Fhx+vFKQcmFfzsMQEF0tTmPB4J3Rkz+NHSoSR+R50B+
         2VfnDYKwitQyeETIoH7Lo5DoBjAGqgR4JAEwQLNqlxCC/5/uAuB/ice+xG3CGnSn+XC0
         T7BaVKWkK+m0UcEOvaA6KQoZhk2htUrlaC70HlxdgTa0Ade2dk/zNaCpy0F91jxGUruo
         MKaU7xt5BGzFgmIArceXdyxjb/Z0EqyFU9AnHBia8pUv/dMRGhxkQgR/73bbBGnuz4Sz
         sQa9Xx2AFEPWI4b4Gs2ahWum23/2f/GYe9fTlRgIhdl6HccF3q92+y67oWUieMc9a5Vh
         6vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643572; x=1778248372;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMVLpLTQG5lZWLeJYW9UDuD2JHkqbhObk5hZ9L9zJnY=;
        b=Z1n5QQMVSSlNXTaLfsb9AmG+maKbTT3ijsSRjS++fTCoX/pWi2bre8M0K3R4dPj9Ul
         JRnWlEo/DyrpxUalrW6UAE1/mye3fmF+toDWTZB5bb0hXCfO0DJw8ZjGaBPILYgy3s2U
         b+wMg5RC/bpslQr9In2JgTcVynT6IVAQ51OJxP2FpCJ3h/Hd/j7pzKT+PKMZVzO2V1gs
         3hfErwijrjJoO68kuDCizdVkyHMBB/PY3LjvWvUhwRLMnk4n9ZdKsh7aiPGd/fEtx9Tu
         4dU9TGcdoS/qUB0RadAx9IJ1qT7xe4/QGJ+y3syBsYA2O/FvKty2gGHEzQriWOT8XNGk
         AzIA==
X-Forwarded-Encrypted: i=1; AFNElJ8WF082G4/WJExJG8Kjzvlf9tcxn6HXA7jCeMH/f27KOfYse4cmIT7tZ4BcdvR/EBDgoVTRIg/rpcoIRnVK@vger.kernel.org
X-Gm-Message-State: AOJu0YyWxL9bw9OPrZSqXh9OjpQed7pddCNzFriF+PivX9WmLdTabA5a
	W3GblRrXF3QMmjkZVCaCd3vDtUCMrj1DX9LzLSU4enxNDqWEiiQTM4J5Wj1D4q4RwYg=
X-Gm-Gg: AeBDievpx7/yscA3CHtxD4ltsIRnfoQhvAF/z3WYcvYr2rZ9aVPquxHWlhhJ3jFpPM1
	vmYTtPOe0rdu+YcZS98U2SDQzJs1UTem6inKkIbetzviHXLDO6hnATttOp7SeMBPO661+uqtick
	hjXeFWmZ3hQ8WcOnP0fG/C9g/nebLdt36B7mrExliN1JeKrcHUtZ2nHE1DoBrkjoru0mZLK2xHi
	vXNcPEM/focJvfaJZYN5VtRQjtWXh70m9re1V3GbZHdlA64emFEbZUPU0hS8Ok6a/ysXZb6Pdvw
	HejNDTN3YV8s32XYCMDzdWe1A1q7p72/RpMMBfADZxwvbrds2bxM+7CPv0z43+a0+0/jKXFKLjL
	P5pUkwtG1Clc5alRnMP72M3BzVR0MASDhfQ+gm3InXZyPoro5YD4JdbHz5XuRtWgK1nEBVMe9zm
	7OrYlvgQcgiUCXLowrnPGG/GhABeJMYmSDrkW7AiqfV/zXV9nCoOC3sGoj/5BvmkLM1nuvH9RC8
	FFo3jeLXuXPqgotoxQ=
X-Received: by 2002:a05:600c:8710:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48a844448f9mr125569545e9.10.1777643572137;
        Fri, 01 May 2026 06:52:52 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add Novatek NT37705 panel driver for Fairphone (Gen.
 6)
Date: Fri, 01 May 2026 15:52:44 +0200
Message-Id: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02OQQ6DIBREr2L+uj9BES1cpXGh8G1pKlpAY2K8e
 6l20eWbvMzMBoG8pQAq28DTYoMdXYL8koF+tO5OaE1iKFhRMcFy7KcKp9bRC7nhQkspzVWWkPz
 JU2/Xo+vWnBzm7kk6fgt+hqf3nEbiqUHXBkI9DoONKnO0RjyGSs7g/4HKUizyIpc42NcYcDAhY
 N+yuuKV5HUt1MKh2fcPHwAhw9AAAAA=
X-Change-ID: 20260501-fp6-panel-3d35c999d894
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=2402;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5wJwm3SRvPPjAsEZfsMPDSlwXnO9rGALWap21GZU/AA=;
 b=oO9i1utf63UeB88XuI8j/Bc6pIM1KoMtHA460w5jA6oDGjhMDkGrKiY23k3DZIIF/WdIg//D4
 ewpe+gE/8MmB0auPCGXZK5kiReXAvIiaEnBFxQ952KhQqiy+1G0RoTE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 49CEC4ACE2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105475-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add bindings and a panel driver for the NT37705, and then enable display
on the Fairphone (Gen. 6).

Note: Patch 1-3 do not depend on the Milos MDSS bringup series, they can
be applied independently.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: display: panel: Add Novatek NT37705
      drm/panel: Add driver for Novatek NT37705 panel
      arm64: defconfig: Enable Novatek NT37705 panel
      arm64: dts: qcom: milos-fairphone-fp6: Enable display

 .../bindings/display/panel/novatek,nt37705.yaml    |  72 ++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  64 ++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37705.c      | 413 +++++++++++++++++++++
 6 files changed, 562 insertions(+)
---
base-commit: c9bd03db3e792a99e9789fde20e91898e3a29e8a
change-id: 20260501-fp6-panel-3d35c999d894
prerequisite-change-id: 20251219-milos-mdss-fa0763693775:v3
prerequisite-patch-id: eb0d468b35da2b234b281b1223ce3299e49c3146
prerequisite-patch-id: d8de96cf1d5868289b93dd890e1a67868b66ebce
prerequisite-patch-id: 23f8e2e01ae265fe8962a43c788868bc1967640a
prerequisite-patch-id: 34b01b7beea2893cc4dbc3d917b478f334dcef74
prerequisite-patch-id: a1876564bdf2964d4674235559087a2a2a78be30
prerequisite-patch-id: 7e866ca016d2197cc568a9e4a59d2d268d7c67e1
prerequisite-patch-id: 9ec10047940f6136c5728a823446f48ffa4dcf1a
prerequisite-patch-id: 51cb44ac4224d487d435e79e6f7f194b3e631ece
prerequisite-patch-id: cd2b2599074549ef6290b344e4e45b1bf585f815
prerequisite-patch-id: 9bfe20dedf9aca64108de67061f1c92c4010219c
prerequisite-patch-id: e7c15f6889fc82f0f98cfa729cf12ea818c5d733
prerequisite-patch-id: a386fbb74b890e46769d55e8a7ebd85c5f58b165
prerequisite-patch-id: 6e80149f6e03ccfca3050e7dd4c34413921b1218
prerequisite-patch-id: 86a95fa80e3d50962f62c3aed59e4be8d109eb5e
prerequisite-patch-id: 17dbc2de61f51cb511c25bdf5662fd7757c954d4
prerequisite-patch-id: f3b59bd165455ca2f49f7d21711186b47ffb0539
prerequisite-patch-id: 4322a9b6586785464b5b70fe21b23e62f06ca364
prerequisite-patch-id: 37dd052963130e7e2b535aecbe7bdcbd69e54012
prerequisite-patch-id: 1f4c7495a492902dff20d285e2a67c1dabb9d96b

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


