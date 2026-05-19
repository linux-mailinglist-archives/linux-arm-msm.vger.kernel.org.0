Return-Path: <linux-arm-msm+bounces-108542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIrlFgOCDGpPigUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:30:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A5E581782
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D26D330C9A45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A0D409608;
	Tue, 19 May 2026 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BL9EjWYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A58D40960C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203602; cv=none; b=XTPrF3LdZdlbVu7QGUL6jrAK9PK4yoA1T1mQoXIcof5ZohSgXrBZgeR06/NOltOYzUcWEmMuNr0Gi3Cf5r4dp3eqvR6w1RCvktfSFEWXIXyUGW6/XXN4+N2svdhlyrIvz/Su3xOOB8nqriOCjC7GmqaRG2vgxUnkAV8R1AiRckE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203602; c=relaxed/simple;
	bh=K+kJKbvXPW88Oa7p0gODZiBRpGr+iOkCDH6/id8w14s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OtpVdP0wwyib4kJHDhky9qzC9AjGz/Tuu2mPp7mneBtwlJr7DmditnVOSic3M4t7EWQX0p25uoIAXW8dwN2T2zC4027rTtQXIK3M96iKThsBJyTlAci5U8b3+BfnZBnytbNzE7F3DuLILBKhX1sza7k7qHm5im4vySWP+pQGZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BL9EjWYR; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo7928273a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203599; x=1779808399; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpC2oUS51Lj9ty9gOUkVj4nIoOC8+fY+yRPYKX23s6Y=;
        b=BL9EjWYRNsy4oJMpaQBktI8FUC4mSpAP0N82ypauCsARV3vLIfvAfC46dS9PD4vWM0
         JPSHgB6IkCDJJgLglHFjwplQl5jdfuQr4agJ101PfBEOOghIN1vMqxfICVei7ETDjVDS
         D/cmiDedGPugoRMm/7f0GhIBxFijPE0qLYpbQIlfol1N5SUo/JsbQDHJv+DRWidx4h23
         lG31hiYds0mWIpWQWjSTnKnffTiQuJxDlhw/fML+lbzDeDxWyeERXlpn7UxtTOmjL2pY
         73HQV6rivX10NNB3eYM3iFjw/8BabajaXQ1ZumUpD6D9lmosTt6oDbhlCL+DZBCREp46
         Lqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203599; x=1779808399;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpC2oUS51Lj9ty9gOUkVj4nIoOC8+fY+yRPYKX23s6Y=;
        b=Fa5RPFGxR9b4AtPefO2kHK71oNJXcPPU+aITXgqhAoVnxEhFVd+wdX2DiWt6LAMg/o
         JrVrcGu3MzDjDTXC456RtYcJWj0AKeYqj8Wgs/WJWVqYi0sRwe2//+awGOOTwpaYrSJJ
         5vOV/jooe0igyE26qoy0XL7UaF3qVrUnPqb4X+V1fh0I1cA73EKkTWf9srAHSv8QDA0O
         +EjsFJks28akCv2WNUjs+Ubn/3GUrjhjLFx7yIe8M9+WQlJz/kEWdV4I1BQ9IWvxXfz/
         GuIqy9qWN8pu8LDNWPRT0UTn3qszvlpbG11MNz4VUzcbLXSXu2W2SrVFj2s9D7eBIa6c
         7s/w==
X-Forwarded-Encrypted: i=1; AFNElJ+BmqtKQ9wqbVrELX4jOZI27EKevLjHCxCOept/QprH6771Djjp7dU0WkKm82CfrFV58jOVQvpWDVuMzG8Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzDpiDhudYfl1YzPW7ZrqIYtM1VjwL38ch7gu7eDaQLSNhKhZ3r
	d2XyUlxEvCwrwcKjVidvdS4a/DdSxoTMhqM6oFvK9AXJmVYnuB8LsA6R
X-Gm-Gg: Acq92OHz/6ew2T9zzWL4tkuvlAE2VqktK502L8RYUzgfY2N6F6Q+gZJ/7IQosPkRrXW
	35cApivWe0srefYbMZuAwZLxI8HncGCF/novqOarq6gx0ts1jGFYLJqf0FDiYupSsIzRmhilsSN
	Cl+gx4uApNlRSnHDXNgjClJqDbzCEmE126i7jx22Y8etS1J0q1dfR/zcfmWPkhczPXqfgJVEOeg
	OWRKqJAjpnTQvb8dU5EuzV80RD8oCLVxwnk6fSt60q3buOq1ArBGEFUtCg5nG89PtHuem7pzhyt
	qRBzyLtZLr5g27mOL3+fWu1MJb3xL5UR1z5eFuVqDz5wP3OZ/ZBKd+j/uCJLbSbGlRLXYT58vUb
	1HkKKvZlvJ/BPJG0Rxs0KZ1B2MSIoMeLYKgPO2qTBOaSw0mGP/ufDsIm5S2FKOALr1TrVcBR6ZZ
	R0/2p2ue+fPQBG7Rk8i45qFz3wbA==
X-Received: by 2002:a05:6402:e04:b0:67c:5745:ba00 with SMTP id 4fb4d7f45d1cf-683baa39509mr10623913a12.0.1779203598493;
        Tue, 19 May 2026 08:13:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:17 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v8 0/9] media: qcom: venus: add MSM8939 support
Date: Tue, 19 May 2026 18:10:45 +0300
Message-Id: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PwU7DMAwG4FeZciYoceKk4cR7IA6N52xBtEXNV
 oGmvjvpOFCViuMv/f5s30ThMXMRT4ebGHnKJQ99Dc3DQdC57U8s87FmAQqcstrJrnRNMEFO3F+
 LHBNJUoBkydvUsqhzHyOn/Hk3X15/crnGN6bLAi2Ncy6XYfy6L5300vvPn7RUslUhUQICc0zPp
 67N7480dGLxJ1gJgHsCVCG5wAjROFB+K5i14PcEUwVoGh0wRh/0H8H+Cqh2v7BVCMEm5AjQUtw
 KuBZ2b8AqHH1EboEYg94KbiVotSe4KrAL1qHxGJTaCn4t2D3BV8EYcuRSDNDgWpjn+RsxifvIU
 AIAAA==
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108542-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,linaro.org,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B4A5E581782
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v8:
- Only enable vcodec clks if power domains attatched to them are
  present.
- Reworded GDSC clock commit. Frankly, I'm not sure why exactly it
  happens, I only know that if I don't set this flag and pass control to
  hardware, the cores won't power up.
- Extracted conversion of MSM8916 to a new blacklisting mechanism into a
  commit of its own.
- Fixed GDSC power domain not being powered off after failing to pass
  control to hardware.
- Reordered commits to include schema first, then driver changes, then
  device tree source.
- Link to v7: https://patch.msgid.link/20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com

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
      media: qcom: venus: Add msm8939 resource struct
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Erikas Bitovtas (5):
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: add codec blacklist mechanism
      media: qcom: venus: migrate MSM8916 to new blacklist mechanism
      arm64: dts: qcom: msm8939-asus-z00t: add Venus

 .../bindings/media/qcom,msm8939-venus.yaml         |  79 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  23 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  42 +++++++
 drivers/media/platform/qcom/venus/core.h           |   5 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |  10 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 124 ++++++++++++++++++++-
 9 files changed, 293 insertions(+), 10 deletions(-)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


