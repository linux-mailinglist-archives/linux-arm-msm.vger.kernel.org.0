Return-Path: <linux-arm-msm+bounces-101634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJnkGiutz2m5zAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:06:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5B8393E7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE24C304D701
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 12:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEAC36F431;
	Fri,  3 Apr 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uYWO3uu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8C5322A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217856; cv=none; b=DLVymbT/HAM3BPW0zZJrXwICtw1zJ77op+R0qXVMTvxAQxHKctiw76kkzoRrUj6nCFz5akazcXfPT+OhK2z4iduMpLMZJpYTEs7b4RJPGDDKNElaJHx/5QcvXPHHMnWXR9Wi20bKcM/BeiH4ithyWvzGKf5jGjCaztVbPf+7Ldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217856; c=relaxed/simple;
	bh=y0Ba2DL0Mm1AYioDzm+l6IeVu5Qc3RCVFN+Tk1snlKg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hKBNwqpKdeuBDnt4EU19k0dTQ/h07IfOgM/+LyeS3ViCfu6Z+7ry4icoXfohtzLKSv9gNoOY4aPwaUjhPDgDfGP1gBw5w8nQBfILRjIazJpd5iXNT5CuqM1yHKi8jY7iKY/l0Aa1CAgAkTgenYC8Gr5vwLa7cVHlyfT2nqxZlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uYWO3uu9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so16777185e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217852; x=1775822652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll+iZV9FtI82+3K2qodQMK9DQkidaSv7WLnG7gA2vsw=;
        b=uYWO3uu99fVf/MquaAni0L3966Fsu9UK2im6FODXPuNaNy1VDapOA2PKud+4wQAn+9
         HhKxPmyD1r7soVnD988dUHHytQqB39Z+fy+qgtgxir1wmwH2diXjxzQ5pn4TVS12GflO
         jiekTfdp5xLMfeO9B6aM899hQXTymRkE0RIjzQh+L4mHE74IxGmB2PnQPG98hkY+pVY/
         xDbKfedF5OpxKpwrZ2hkULORFl+rTwtZnKh7dc8aFU+NnlY3olmPKBqhLeVhlmwkT8L+
         V4C8LXpuGHQ3DYT/5SfPOsqmpC4XYQX/DvBCngSw71BQ7ANec7zdL/7eKKknHpKFjY56
         DT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217852; x=1775822652;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll+iZV9FtI82+3K2qodQMK9DQkidaSv7WLnG7gA2vsw=;
        b=LldkFSjEZkd/TWrS2JWs+uiyXuYm7wPsKPoDLsX212uNt8DRtPkPFVC/izx5huv3uK
         phTt3kJJSpt5DA2VGUgr/lIkXLLish1K0wCvOMztDMRg4K6vonc45+92A/n2G2xgdXoJ
         dOOS5ktUHFSTpAG2bcXvjBjOFR9NxIsQY+RFsCNVeUn3x6auqXKK/FnXi/SezNh5IDXV
         n2nG7BDXhjPXEDW1B8zfQCJnq+frQFwJ4xOOyZTtudBt+03fFxGxdrGum7DzFpFqfM4z
         0kcAQU9cQFpQ/s5Vh0iPR11jYpIIj80gBHW42/uE9E2wZSFEsh08N2pj0zWpjGtiuE7t
         YeOw==
X-Forwarded-Encrypted: i=1; AJvYcCWQMD9pRQQO9j7v4Nj8ffk+Q+FcZ1uXubpxZRgD1RmC39xELQpja2QSWYsQsYu/uJZ7RwDkyjEdTGy+T/KZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKWXOBaWuN/AfB5LacD3gXuyQbA/2eUDBTuSNQTEbVc3TB9wE
	LFRrW4o6xYkM4c4RwbqArpu3dKllieUXPHW78IgxaNf+rkg+ekT3LVfghJkQ1jfGg3M=
X-Gm-Gg: ATEYQzxnIzpq39nyrv0TPI+ezaRZ4up4zIepxSF83+gxS9uQjzFWD7kBbsqf5viuIoB
	S5ej6ms1k1vSmLpPk9RGgT8zLVsETOv5kkEad7wlY01CEnQKVH7npVvZPGiv0fR2s5dW9glrmY3
	zJ+Tgp/MhOxm7YdFaUujjMArTnLi1U9NK2uryWYJSE+9Z9shLH28AeEmGwrXhP2j+K9GtSVwzVP
	Sr1VpiX8u8azzo2efELw/yMTynV6Z36aYiUWYo5qulQKTU/3j7Vgu0Cg5PQoB49vSFEYRItsPyg
	fT5F0nyNs+NDpajLJ9qIktSEW49DSyVBoQ5FybZBxvo9sE+YmHWO8zr3392DW8pB/8cQx8KRyVO
	mHr22FP5SL7rVzNJsOUGkgZEu82egjwrgtN35poCvBzLWQmU9qQTIy1i9gFPLOY4fLMS3zGRDXv
	N79ByNd1LstQzmJKAiRS4FwbepF+kBvq7yNQ==
X-Received: by 2002:a05:600c:4356:b0:488:9ed3:148f with SMTP id 5b1f17b1804b1-4889ed32786mr12200445e9.21.1775217852087;
        Fri, 03 Apr 2026 05:04:12 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Add support for GXCLK for Milos
Date: Fri, 03 Apr 2026 14:03:45 +0200
Message-Id: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0Jmbc1QFJCV9zAsCgwwEVpsK8EQ7
 m6Ftcs3yXt/VnBkmRwU0QqWZnZsdAB5iqDule5IcBMYJMoUE0zFyINxolvq4Vn7QeQqTzLZpCo
 mhCBNllpe9uCjPNjS6x26/jhCpRyJ2owj+yLStHixty8o4Sf07Lyxn/2hOd6Nf9tzLFAgVngji
 q83ld1bxXbqjaZzGIBy27YvwgCf4OEAAAA=
X-Change-ID: 20260306-milos-gxclkctl-8a8372d6a1e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=1101;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y0Ba2DL0Mm1AYioDzm+l6IeVu5Qc3RCVFN+Tk1snlKg=;
 b=kLWENhEQXSsTrvRcJkXn8V9hEnXhS0ktYUIqgUKUN81tHFzclgf1ExciJnbmk08N1g06dNZT6
 DUdTWbDeOIxACcU2zbtkdSv3gUyn88rIHQgbzO9tjkFv/XIr/B8bCzL
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101634-lists,linux-arm-msm=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: BB5B8393E7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Similar to other new SoCs, Milos also contains the GXCLKCTL block that
we need to control for GPU. Add support for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Update casing of binding title, reg goes as second property (Krzysztof)
- Rebase on linux-next
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com

---
Luca Weiss (3):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      arm64: dts: qcom: milos: Add GX clock controller

 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 10 ++++
 drivers/clk/qcom/Makefile                          |  2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |  1 +
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260306-milos-gxclkctl-8a8372d6a1e0

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


