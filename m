Return-Path: <linux-arm-msm+bounces-106800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OhbDExUAGp5GQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:47:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC927503637
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 11:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AB573002B0F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 09:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C286B372B25;
	Sun, 10 May 2026 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3hfyrmH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05C2257854
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406472; cv=none; b=BpSwBKhu1Qu+NvEPtszOkq57oCzhYnc0pT5HxpbM8uDokBauk4PMfL72FYCZds7AaDkYZbEn1hZn0GWl7cJjej/tdfGBoxexa4FoYywftugnK41/4pi7P8byX7dOeiRXPGJ8GufgAg+i/GDyZjWv8JNs680YIkTPBnEj7Vdn2xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406472; c=relaxed/simple;
	bh=D62mlNiWPfzKSRriXG2cWLUSvblI+VAYnydIZWkmXAQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KEln9tUs8MkNDDEKBuyI+lhSKyk+1k+VCFDTIGg0rr39ocPYgakfJrvpFckXC0dgAkT7GG3HU8tum2nAj5lttDxNAZ5I8ylkTQ+MZTLzTOKQ5Ts251UjqEoDXealpwlxekyBGZyOWpp1+omwtVXMTJrxyRToBb77XZANYW4p37o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3hfyrmH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso29853015e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406468; x=1779011268; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WsUU3X1LaJjztgUuBWgXdCZ84qVTBBh6rswqrtRvpIY=;
        b=Z3hfyrmH/4Gbaqydo3VQA0jmwo9kNhq7j5/URF1mNOJv44J+bxXr19VoQpJknh5iiL
         6fiACLGTxs8Mp/NO72DFu4TSgFqMb8S2iD7pUL3jJxeSmx4ok+gk4vAeZCHuHeyHo84T
         n/KyadK6wsndgCtY03eVw8cIfp0rkoh+nMzvpLxxBaou4AW49v3QKCgtDDx4BG4Qd6nD
         hWtqZeo3CPZI1knRR11qVlgjXrsQdeiGqEicRn2oRDUtUdygyp9Kksk3dYbY/YSLfrHi
         /FkufxX5OaPAAKURmIOnFpEdsSONbIvzANhBRMpfCbvUVu1S4YVoOF+xz3viilHPCjrN
         BgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406468; x=1779011268;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsUU3X1LaJjztgUuBWgXdCZ84qVTBBh6rswqrtRvpIY=;
        b=i4kou1fWc9Igh7DGKCC5CEoYAylVDP9JCMEAe0rB5c7yQ08o8exJDuiHyoN960/aE5
         v62XtWKV4nnAuu3tEnM7oEsD9n6BbOpm1JwmgeqGPvLJSt1T01cMRXzAnTiUA5lOdtsz
         U4gz3JTt1DXlUxLOoRaAiXj5qvs/sXFDTo+CBaSvZlCgIce6LuG7gzawZ6y/v1bOGY7i
         6CIJ5PS9O1E+VsfQTlLeBVdBZrXOXcKrLYCZj/d1WEpQjeroOL/v9mXq+KoGvxLN7pRW
         QRKv6iAZxIMYcD97vKX9b211Rydz44pm114n/P+6LEW2BOJMXW284D+aPrBdFSP0oRMN
         5cug==
X-Forwarded-Encrypted: i=1; AFNElJ+vMcSN6tYwA88elZdW6Cv8mhWN0eGdUj50qja48Jul7ahDXXXjjZbqNgmJUGxbA5KSbA7I7ZsehizxazgU@vger.kernel.org
X-Gm-Message-State: AOJu0YzOp6F7AlIRDull/jJ38gJiYPRULmidqjKLXawqJj18ya8ppXLa
	1y5BRz/GEA1ZayF1Y6RQuppNpan+9M6Em53eeYls/8gkoJaaqCNJ7wIOjzvM5Q==
X-Gm-Gg: Acq92OEimzRehXVVc6ccMX475rqNW1B4d51Yohf2diT0IDEsey5Ry3f8uHU3Xob4Bhx
	EoMnoFb7SdZ0TASqeg79Isb8iDc3pn7FLkA6knD+crCYAgwKTDtpsEUe+a68BcLWLnBN3OgQPrh
	OZbl6IiqvLI3hKZ+pLHivKma7R8Pmfm2omx5xZDs0cuN4UfnGrgnCjVw2Jlh1mRqmJHkRPAt2Pl
	F09FHivjcJKDHelqMaus90AYdSa/jciiNoeR4jfyprKgAk7N/lidrzq/lurGBBqd7CJtvczmVD8
	H9P6axqey9C2rgSn5w0m7ARBmdzatw9QSnJv/0L/hAA364UV38xtLJeQvH8WVpFKqp38YQF9XWo
	8+9PptQggFteBrvjrc1oLF06CoKx9gCVWuT90hgYtPvj7mfwIvLa5M2qpKIjb1JYoi4DYsZMj8I
	fVf2NVohE9HUaWUmS0TuqeClovtv7S
X-Received: by 2002:a05:600c:37c6:b0:48e:7f22:d90 with SMTP id 5b1f17b1804b1-48e7f7de432mr20458845e9.4.1778406467953;
        Sun, 10 May 2026 02:47:47 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:47:47 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v6 0/8] media: qcom: venus: add MSM8939 support
Date: Sun, 10 May 2026 12:47:38 +0300
Message-Id: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PTU7DMBAF4KtUXmNkj38Ss+IeiIU9GbdGJEF2a
 4Gq3B2nLIhKxPJJb76ZubJCOVFhT4cry1RTSfPUgn04MDz56Ug8DS0zEGCFlpaPZeydcrzSdCk
 8R+QowKDGTkdPrM19ZIrp82a+vP7kcglvhOcVWhunVM5z/rotrXLt/edXyQX3wkWMgKCG+Hwcf
 Xp/xHlkq19hI4DZE6AJ0ToyEJQF0d0Lait0e4JqAvS9dCaEzsk/gv4VjNj9QjfBOR0NBQCP4V4
 wW2H3BtOEoQuGPCAZJ7fCsizfX5vQS8wBAAA=
X-Change-ID: 20260416-msm8939-venus-rfc-c025c4c74fae
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: BC927503637
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

As per Dmitry's request, I am attaching Fluster results and
v4l2-compliance output. Fluster results were very inconsistent and
caused power collapse fails.
H.264: https://pastebin.com/C15qeq5W
H.265 (HEVC): https://pastebin.com/WDsnxvuk
VP8: https://pastebin.com/egAgEm15
v4l2-compliance: https://pastebin.com/VpBhEFc1
Power collapse fail log: https://pastebin.com/rTivMcpK

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v6:
- Added a more generic mechanism on blacklisting codecs.
- Reworded a commit for setting Venus core GDSCs to hardware controlled.
- Reworded a commit for adding HEVC decoding to MSM8939.
- Link to v5: https://patch.msgid.link/20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com

Changes in v5:
- Undid the merge of vcodec_clks, they are split back to
  vcodec{0,1}_clks now.
- Extracted a dev_pm_domain_attach_list() call into a function of its
  own to reduce nesting.
- Added missing "power-domain-names" required property to device tree
  binding.
- Renamed vcodec clocks and power domains to match other Venus bindings.
- Reordered commits and grouped them by subsystems. Now first come DTB
  patches, then clock, then media.
- Removed "status = "disabled"" in the device tree example.
- Link to v4: https://patch.msgid.link/20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com

Changes in v4:
- Removed vcodec{0,1}_pmdomains and merged vcodec{0,1}_clks into
  vcodec_clks instead for MSM8939.
- Inlined video decoder and encoder device tree nodes in the driver and
  removed them from the binding.
- Kept vdec and venc methods for HFI v3 separate from HFI v1.
- {vdec,venc}_get() are now called as early as before, since it is no
  longer needed for us to attach power domains to dev_dec and dev_enc.
- Link to v3: https://patch.msgid.link/20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com

Changes in v3:
- Added missing vcodec1_clks to resource struct.
- Removed enc_nodename from resource struct since we include
  video-decoder now.
- Link to v2: https://patch.msgid.link/20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com

Changes in v2:
- Enabled GDSCs during encoding as well.
- Merged vcodec{0,1}_pmdomains_num into vcodec_pmdomains_num.
- Reworded commit for marking GDSCs as hardware controlled. Same
  situation as in cdc59600bccf ("clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock")
- Clarified the reason for missing firmware-name property in device
  tree.
- Clarified the reason for moving vdec_get and venc_get for later.
- Link to v1: https://patch.msgid.link/20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com

To: Bryan O'Donoghue <bod@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: André Apitzsch <git@apitzsch.eu>
To: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

---
André Apitzsch (4):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node
      media: qcom: venus: Add msm8939 resource struct

Erikas Bitovtas (4):
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: add codec blacklist mechanism

 .../bindings/media/qcom,msm8939-venus.yaml         |  79 +++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  23 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  47 +++++++
 drivers/media/platform/qcom/venus/core.h           |   2 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |  10 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 149 ++++++++++++++++++++-
 9 files changed, 321 insertions(+), 9 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


