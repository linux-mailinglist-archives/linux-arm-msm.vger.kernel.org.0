Return-Path: <linux-arm-msm+bounces-101687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLORIsHvz2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:50:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5013969A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD7DE308FCF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE023CEB84;
	Fri,  3 Apr 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="m0+JMTtf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6F2877F7
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234645; cv=none; b=kVBrRhq+fkPNVX/H+sfNf7UZeXWIlkCPAiItZmxkREXtAEJGbGdTc5mTkTP5X1+uVYDBKamN4dWEoqn0+v439TdztRICwQsGVXaNk884g1JsNg63DPxoHf/8fJ37IxKwrO4nLAk+DUvJOG5czeINk9XgYUYqG2yZzUAvJqc+JEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234645; c=relaxed/simple;
	bh=3eR8Sp2MWr+9xlx1aPEOYPr177oMG8uZ9J0Usq4CAZ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ol6vrtyGZquGUwDVHSvcnXw0X4ntWU6Mgy+P+uRHSWzp8KOt1+Uqo9YnlqoAbBADp5/4wUeKRp5G1kzuagArI0Xl7S2T2SnqAzakEbOvlolo4luHs3rXsM47gkbYqADMlR9p296z8oIXMScPlDLDM9KTtpFF+LLsZhHPl3cBpmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=m0+JMTtf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97f9587e6eso281211866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234641; x=1775839441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGQd5BP9OR0vvVCUe7ltA9eB3hNUu4hhpU7DvybI+7A=;
        b=m0+JMTtfTp1IR8gb3fSTR0WYvKj3D3dmiAsg97Asz0LmXbA5FZIW5ho4D0q4WPDksy
         2gEdjKaNs5B2ldyt2I1vkLS2RoiKtHLqOysF7PiPBFyza9VypLAtw6dudn2oREmmRvde
         PUutvYjISYMgJrtSQlEnbvKQJ3RIl6VNGDU/oooQx0TGZnIL8YUxhh7G+0NiU+0XpWYR
         p0itfQcUMUkoz+i5jyCkxnj0wvdxPzoyaovj8SjcaQ4ibMEjXBaB9tiS0SReFU11Qf/x
         +D/U3cljIsN8weHCOZrdZcPW77u2aB06ZykxN/qDJhrUUcLIL5Yf7RKtqa/6R0Y017FJ
         FQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234641; x=1775839441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGQd5BP9OR0vvVCUe7ltA9eB3hNUu4hhpU7DvybI+7A=;
        b=DO1YNX5VWTOk9AotxJZiEm3hMSEQ4E8iqXtCqwrq2LXufBaus0+3jQig2xHPXFgEQ9
         H5ZBymeSXKZhj/9QGDzVZyf20NptZOLiSkIN4kNw165QYGIvuJ8TrkoBFpi5xr770+n3
         sBuGNZs2mf0nOBv3nvS9AFurPSaWJhGDp3zjBYip4VNemMK7yXbLeed047D9UOLlahX7
         Ahwt4DuLtW/Mux0eLohlCAUG8eohiAjNchcSg/otVnYPkhPFmXh24gB9qjnPBqEDBUHL
         QzO7npWz//BFcus2D6NC6RLyhGew3HdOn8OZ8BJi9kwT9VhQODAYxqg+3N8bxxARsR1n
         Bb2w==
X-Forwarded-Encrypted: i=1; AJvYcCUpBsuklIfxv8ie4k/dMOxEQ2ExQ8/k13cjjQ1lytPwNgJhbil4HNfaUFUyoeVg15QiUZW9PqTcXNtWVStU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywup/m4yHJlqxVF3aVuAoZ3jLt2XsXnLocdVFIRvtzNvYWhg2gh
	bpVpSfRYAbpMpU2y11AONfA5mqsvBKgkm6G0cKRw4MMDJIZRsa/sU0S7De5p1Nu5WnQ=
X-Gm-Gg: AeBDieudmKFPCEDdt6tykh5P3XJ3ykrEo+eIFXbx1fYRBUIO2+t1WxBcLGu3sGsYjfU
	4GOELouj8nvRDqHCV8C/IhD2fRtJOc960oPBaMbbf+V2WrX/jhEBiJ2QLMdTVmfp56KAt9IES/N
	yBqgs+1zq1QPKUBqPtYefQZBB5Bs8LUxv8XQDZw65izeBbM79PrVTtghdTp/vRtwXyK1igjAPey
	CtpZGvHXeJslCWc48zshMkG/Uap1HIxpmiPYPlsr1HIdj8md7XzvIsHwc0+uaxvSDg5VRoT4xE7
	IPcBottQa/kczKKfRghLKOKiGb84TiFwLiUls2sEJ+vZZYWTlMP2/pmaWwcu7aWqrII9zTKAe6q
	WKehz9FvSrnJ6RLcmeyesl+Ny1AmkFfUDQeS66qkMbWFMcRRbgLs16dpzVYYRiLG32Kw9cNCe/y
	RVMWjKI/wLNqGtOyt07KWyRMWGLIvTIo9il8dusfsQlqevl03JFVVR0C/TcWEv78uhIrckMdFyz
	shM0EX3D77lcRt/7YEa8r8H5mQaVo5HWGZ9xQ==
X-Received: by 2002:a17:907:d40f:b0:b97:b379:b3fa with SMTP id a640c23a62f3a-b9c679f62d8mr218234966b.39.1775234640833;
        Fri, 03 Apr 2026 09:44:00 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/6] IPA v5.2 support for Milos and Fairphone (Gen. 6)
Date: Fri, 03 Apr 2026 18:43:46 +0200
Message-Id: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12OQQ6CMBBFr9LM2klKKaC9imFRcNQxFrAthIRwd
 6uwMC5f8vLfXyCQZwpgxAKeJg7cdwmyg4D2brsbIV8Sg5KqlFrm6PjZB+TBIhWVLKw9VkoXkPz
 B05Xn79a53jiMzYPa+BnYDU+vMUXipkFjA2HbO8fRiI7miHtIwe8DI/77jhzmVuZaKX3SpTVTB
 vW6vgGTj2vy0AAAAA==
X-Change-ID: 20260403-milos-ipa-e5705aa87245
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=1858;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3eR8Sp2MWr+9xlx1aPEOYPr177oMG8uZ9J0Usq4CAZ8=;
 b=v1ffqSLzzxM9XxRNgAQX/geWtyuc0La8etp5U2HBuFJW9gM8BPq17ZzLQXAA7A1TPz6gSAEX6
 Q4DoP1jLyFTARZfCzBKlCSxsRzRHYXV5P5tMzfvTNfSoDsTxA25XAWv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101687-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: DA5013969A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

First, two fixes that unbreak IPA v5.0+, which can be applied
independently.

Then add support for IPA v5.2 which can be found in the Milos SoC. And
finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
starts working.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Alexander Koskovich (2):
      net: ipa: fix GENERIC_CMD register field masks for IPA v5.0+
      net: ipa: fix event ring index not programmed for IPA v5.0+

Luca Weiss (4):
      dt-bindings: net: qcom,ipa: add Milos compatible
      net: ipa: add IPA v5.2 configuration data
      arm64: dts: qcom: milos: Add IPA node
      arm64: dts: qcom: milos-fairphone-fp6: Enable IPA

 .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   9 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |  44 ++
 drivers/net/ipa/Makefile                           |   2 +-
 drivers/net/ipa/data/ipa_data-v5.2.c               | 452 +++++++++++++++++++++
 drivers/net/ipa/gsi_reg.c                          |   1 +
 drivers/net/ipa/ipa_data.h                         |   1 +
 drivers/net/ipa/ipa_main.c                         |   4 +
 drivers/net/ipa/ipa_reg.c                          |   1 +
 drivers/net/ipa/ipa_sysfs.c                        |   2 +
 drivers/net/ipa/ipa_version.h                      |   2 +
 drivers/net/ipa/reg/gsi_reg-v5.0.c                 |   9 +-
 12 files changed, 523 insertions(+), 5 deletions(-)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260403-milos-ipa-e5705aa87245
prerequisite-change-id: 20260403-milos-imem-3a034224946a:v1
prerequisite-patch-id: 07ad87fc40adfb8dd146b9c0678d099bfe97f679
prerequisite-patch-id: 0f4436a42df3bccb92f753cecfbf24c81f4677c8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


