Return-Path: <linux-arm-msm+bounces-102595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF3jEAio2GkhgggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:34:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0E03D3617
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E6BB3018D57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BE73A3806;
	Fri, 10 Apr 2026 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dfSM6Jxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F43346A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806298; cv=none; b=Wyt3E06jC+AElXn/JWPMvjrPYatSHCP9K3gSY5JyzxzsQcKqRug5mdpJElEq2vNGNm2yakqUfJD456/mPC5RK229QlO0CBwXts8Etv+7pXViWV0RBy+6bcoJ2fYNCvV7zH8GOGUvAknsBiyQ0TdF3jdrR1yFMvh8n1DKWSkpv4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806298; c=relaxed/simple;
	bh=3P0tOVUn+JiOZLFR0VZX401X3jxq4V/mMKfAXPPWGw8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lQdKbAL++eo8dPXmXkzjaOju8NsV31rB1mBvZKEMygYLCtB+MfL4UVhOzkgI8qyzaMMU5+e7jwKJS/BLOn/SiMvL2ENy2zvLOSdaWTkm1hMhC0O2EQ5W724L9WnrlZaNAkzQkWfVl2N4+eB+SqU95kjfXRve81UShRlfeqjJk6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dfSM6Jxs; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8d7f22d405so263605766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806294; x=1776411094; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC6nuTCtenEXxubvMtX2npbfK783JARm8sUf137RZP0=;
        b=dfSM6Jxs9G/Jh22bIT+bzzK9o7QEKnCQoE1XAU7JN8G6WEvTeRQcun3eXwJCyyIXui
         ihxkHtZ+zg6Fe1bJDaa3ADbj7zhKxAF8A5nMM78SrE/5OFlOpkXh830ViXc8oAwujHFU
         Cxff/S2THUPPMPL67R3yHttmxhtJKrkAhRpsf778LnMPKhNbRWWl9I+o+cj7B/3wPqLW
         I3tJ7ghY2xh+OaFCQbBjtZ26Cq9WHrkeVhf5yMInivOnkPanfGNVbeIBQhhewmtpBvX4
         50/zKqIMgAE0qz6afcg4WMjQXPf/5UM8BhiP4TENgIu9i9GvIZXuruJL6avEw3i5gimB
         BrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806294; x=1776411094;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC6nuTCtenEXxubvMtX2npbfK783JARm8sUf137RZP0=;
        b=J7p6mBxIrfriWezA6KHDugBfQnAgg6aialF13G9ozoMUQgL9lbKLO0rsPsHh7F+b8+
         Im31J+kpHxjmzTNg/YzoAaTYegY2LQ0+ECBKlNjuiZFDeIE+UocledB6dbpdVAuQcg+T
         5Ht3P1hBBQi9zoK/fKG9o6RaVVUx53jME7URKabmMXawa04XGcUz9INcGve7h0kEyISJ
         a7ULsCLk4dByZzI6xpSiiFeNpB4JYnV5n41CqIcDhapIbvj+IKIuqTf3TagxhcApmFQv
         2/7oJNrRXrKdDgllFZ/acCrB1bfn9hVTcvgytK7w03QegFJ/AfTN+QzBweuvOvXJElMC
         wH9A==
X-Forwarded-Encrypted: i=1; AJvYcCW7+tQe2Wwc9YKrwUqdo9B2MZ3uOf5Aom/HV28GrP8XW9IxJp84rUODeh6eVX9eDsf2JstoSgulSXrswkRB@vger.kernel.org
X-Gm-Message-State: AOJu0YxSla3/e4SYTBVMNHRsus2Lqb6hA2EsYaQjQtJapq5TacOIpg+w
	ygJ0wW1yW5jJg9yuBG9lygGXSZhysZEKyDou0jeeSMukLhOSoj0kPptFc5FlgfDcPe8=
X-Gm-Gg: AeBDievzWi4M8tNdL8OeHRRb/lmKJnDGgdnq/I1rEDSjNKYvryrf88PAzpyjU+gj9sm
	iCAioJo2drX+dr0KIjYHl2jGnevv7UZxdUdG7DdErDcvyW7tXP3xzXEuKhsd88NF+IOw8t2fjH4
	AZhTGNBAHc5qHibaZnaz+IIzGIyIs35225TE2eVL6GC8288x6qRGPCik7b13aGD5o1BBvhoPCqG
	vH1TvVWrYORoncVqvEwgFt53KGs2A2NOK43dmpuXklwDxhMTBkGKDYYsn4D2JhwUHwxaMrNcujI
	qpz5o7fU/cnT8wDrdjVbHT4IP85yp9l7VTqlhPPWa+L7SVhU468IGrC1nC0OAZaOUFRic048T/X
	3s8tHsLytdgqXwjLBPXRKL7O7GYz6/dagtDEOeTB102CH9UXq20FUUDhUL2nTfhQMAxkNu4j4uu
	14H0LvYpF+wBdT2qCl0dvly8HeJeg6ny/GyEnmRCPD/ghaBHG9sIPpi2FhJybv+DQTu/d58tbbJ
	AEnZQ==
X-Received: by 2002:a17:907:1c9c:b0:b98:6926:13a5 with SMTP id a640c23a62f3a-b9d72ad9e26mr128087166b.46.1775806293696;
        Fri, 10 Apr 2026 00:31:33 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706252f3sm365513a12.18.2026.04.10.00.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:31:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Describe IMEM on Milos
Date: Fri, 10 Apr 2026 09:31:05 +0200
Message-Id: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22QzW7DIBCEX8XiXCoM65/4lPeoqgjjdbxVAReIl
 Sryu5c4PqRVj7Pab2Z2byxiIIysK24s4EKRvMtCvRTMTNqdkdOQNZNC1gKE4pY+feRk0XKlhQI
 p4QC1ZhmYA4503cze3h86XvoPNOnusG8E/LrklPRYY72OyI23llJXOLwmvicd2HOFrtjHLU9+J
 sNj0PY0pJ7cQO4cT5ai4RW2rYKxVkNVdotk9xITxeTD93bgUm6Z/92ylFxwkADY99CIsjmOmsI
 8eYevud5mlR2f8OYXLjNeiRY0HPJThPmLr+v6A2c5bP9sAQAA
X-Change-ID: 20260403-milos-imem-3a034224946a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806292; l=1077;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3P0tOVUn+JiOZLFR0VZX401X3jxq4V/mMKfAXPPWGw8=;
 b=fzWAEBRrgzqqypMJayiqOzYZx/RVQud3fWjTLeg6NEXOhn/H9Z3hdI0cYqt2V3lqMIeXXIvu0
 xXD+Giubpb3BmOKL3dphR8CjUpFBwBpwAfbtZCAeiOY8641sCP5zIHZ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102595-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C0E03D3617
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a compatible and describe the IMEM for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Adjust node names to include hyphens (Konrad)
- Use hex for ranges (Krzysztof)
- Pick up tags
- Link to v2: https://patch.msgid.link/20260407-milos-imem-v2-0-5084a490340c@fairphone.com

Changes in v2:
- Use mmio-sram for describing IMEM
- Link to v1: https://patch.msgid.link/20260403-milos-imem-v1-0-4244ebb47017@fairphone.com

---
Luca Weiss (2):
      dt-bindings: sram: Document qcom,milos-imem
      arm64: dts: qcom: milos: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi              | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
---
base-commit: 0190c2c6dae368aeb9bf59a449ebe23f24bfa059
change-id: 20260403-milos-imem-3a034224946a
prerequisite-change-id: 20260408-topic-sram_dtbindings_misc-5e8834f63d51:v2
prerequisite-patch-id: 1052a7a8c6ef7e9ffccd547c934b318f27ce4c26

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


