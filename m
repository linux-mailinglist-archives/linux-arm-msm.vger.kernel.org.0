Return-Path: <linux-arm-msm+bounces-107485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKI+Jl3sBGr7QQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:25:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA853AF74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3C633018AD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573FE3B4EA7;
	Wed, 13 May 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKpCdzwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34443B388D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707547; cv=none; b=No0IB0TAgYEjxXup+CTSs9i8rHWxzOPrlNcthBRVfYn7MoqU4P+nb4rG9NqzqIKlExebtZU3aZlHfMB153fe2WMn30sV/uJGJIsP9uxb2xMAd4Irl41qggZLnes7VaTk2C5wIIO5JAmQ2F6NfKfhpLujKFrZIWzptq9+LwpR/GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707547; c=relaxed/simple;
	bh=ggPJ6xBcvbLPlJkbuqxT7AJ1YGvGVDSdErQcXHxrbj4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R69/vCPx38n62c4vmeZ8WLFMCUi3C5ahEiLBIpIHsv0I5WCYIn7/0ma7N7qDqm8PkhbwTdGG6PWxwuhWUTM/bHUafBsMLXapx5WJyo428kHCQ0xqiSkk8gMfJWKLVO7bKRRB/7QTa+aHjpiF4tQR+mjhIsQcAr1aXaZfS5rN0pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKpCdzwQ; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-651bf695701so8468412d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707545; x=1779312345; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tcJwo6FoHF4Y79Ww8GurwotlGhcGwSpvyvthYWwyOVY=;
        b=DKpCdzwQ0io7kAvPtH3oJadWXJtvPsrrEqx9kchAt/e/TLNwujftfaqQUpv2/YQkyl
         xSVBC+CscYOtel5Kuqm0VMW6/7IfZhDDFG8nZ+SyzNP3j2EQatcjk2e4VlEXAhEzAONM
         Alx8pLLZW+yaxi8jwzsOrTBhhf1AoMdysHHNjaIuPmrFkg1YrYOOEPlPTX6nb+Di5+jm
         +xKIgFneMoMo3TuagwKiq1r22lgjIFgwA9MiRnv1M9FNpHnriM8XoiDDFnz8cYVa5Ere
         KTIYQ5iS7wZ+eH6rPMPEkgyg3libdsIIRMK/UXuzWVUHa7dQGAZ+puIDa/OKvvv+mr2A
         aI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707545; x=1779312345;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcJwo6FoHF4Y79Ww8GurwotlGhcGwSpvyvthYWwyOVY=;
        b=BjHwfsoFF9VAvwpkomS+km9hc0aS0b+uCVKx/01XosnlhzxRJZPLCHcBIXOJakCg+e
         6LfuEzjghCQrR9pA0d1k2ZzjwpCt2JCXGMuS6y1G1dSDHLlyGbaPzz/WYZTHSMnTI+zM
         z5Aq26J4aW5pt5fSjt8jLia5WNoRdSNjXf0FvXPOke5ErNYa7aQ3kBIOblDCDvKQUrfk
         YnR44dxmfhFHMhzcKlIgfPFd4o0kuKtbiDibA7Vjw7xpgQ82vHCEJ0ze3Dej1as1fGyT
         N85UB9fEe4fcC5DmzHG3mWNAb/fJc1ZmTG0UHWTcZEpRd1CkgWG19R2f5zuYC0iC/buK
         5+ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8o/y+vea4m+MstEZWt4+VeM+iFUUfS0Pv1q9EX8Nn2ccj9+FNA8XAxgAneh8ybmubgnN0qM/dHZMqJj7tT@vger.kernel.org
X-Gm-Message-State: AOJu0YyzQFIhE2ZvmVhSzZfZQ1ERXstz2E9ZsG3hLsMh5B/gKu2kPYiW
	fU9lTEYXzLZVwd8VDprWAWnnrKB6J3InZesfD33BbEakzgOcYYh8++52
X-Gm-Gg: Acq92OHKPDP5FoSz10atLgDxX9zLoP/Pjsz97H/K1wiSZH4aUyRZsKhFL0UWWt3kF2p
	5EMmprURF5O3BA5/XLK0gh1R4DWtSO/liSAY5gaYrHDUm56UckacBDbhT/hh1OVsRuYLXP7WItm
	N7/pLhuX7rgSCGwszzMUCwdS1LRU/w/LpFmkWt+DpNQvKc6EECF+85yU59SUELIM9Zya+3K9BQ0
	1eT46BlkJgzyRh9M+TmmS6741p9QBbZWCzTmq8zXhzPWgEpD91EKdiBzzrwx1oFWX9b/Vd68lNx
	iLzzctun0Zb1KTtxMy8nsLyJJs4Sb65+ca1ecqj7g/Sk1QDYEPJXK6tXvSPwUdLGTlAW3+3bpZ/
	qIriOnzYmv0rG5rlW3KQ8wxAFpeVcr/fu2V6bQsNXV1Qwekg7apifGkKG63TVrCZx1lWSiAdpxC
	Hqgodq+/tv60mPgQPD1JykCXQHLNE/LTFyRV86
X-Received: by 2002:a05:690c:6611:b0:7a4:80ce:8275 with SMTP id 00721157ae682-7c6abec71e0mr51791797b3.35.1778707544528;
        Wed, 13 May 2026 14:25:44 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:25:44 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v7 0/8] media: qcom: venus: add MSM8939 support
Date: Thu, 14 May 2026 00:24:29 +0300
Message-Id: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PwW7DIAwG4FepOI8JDIaw095j6gGIaZmWZApt1
 KnKu490h0VZtOMv/f5s31mhMVNhL4c7G2nKJQ99DfbpwOLZ9yfiua2ZgQAjtDS8K13jlOMT9df
 CxxR5FIBRR6uTJ1bnPkdK+fYw344/uVzDO8XLAi2Ncy6XYfx6LJ3k0vvPnyQX3AuXYoIIqk2vp
 87nj+c4dGzxJ1gJgHsCVCEZRwhBGRB2K6i1YPcEVQVoGukwBOvkH0H/Cih2v9BVcE4npADgY9g
 KuBZ2b8AqtDYgeYiETm4FsxKk2BNMFcg4bVBZdEKshXmevwFOETrsDgIAAA==
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
X-Rspamd-Queue-Id: 07DA853AF74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107485-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
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
Changes in v7:
- Moved codec blacklist mechanism to be applied before MSM8939 struct is
  added.
- Vcodec power domains are attached with a managed method now.
- Removed duplicate clock rates in msm8939_freq_tbl.
- Redid the merge of vcodec_clks done in v5.
- Removed the {vdec,venc}_{get,power}() methods and moved them to their
  respective core_* parts. Vcodec cores are now powered up along with
  the core.
- Switched HW_CTRL to HW_CTRL_TRIGGER in Venus core GDSCs. They are now
  powered up first, then their control is passed to hardware.
- For now, document just the change of halt check in the commit message
  of setting GDSCs to hardware controlled. I'm not sure what happens
  exactly, but if they are set to BRANCH_HALT, probing the driver fails:
  https://pastebin.com/EYQekR1p
- Given the power management behavior has changed substantially in the
  power domain enable logic patch, I removed Bryan's "Reviewed-by: "
  tag.
- Link to v6: https://patch.msgid.link/20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com

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

 .../bindings/media/qcom,msm8939-venus.yaml         |  79 ++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  23 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  44 ++++++++
 drivers/media/platform/qcom/venus/core.h           |   5 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |  10 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 118 ++++++++++++++++++++-
 9 files changed, 289 insertions(+), 10 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


