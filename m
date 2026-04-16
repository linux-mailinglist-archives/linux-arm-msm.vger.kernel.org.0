Return-Path: <linux-arm-msm+bounces-103420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG0hHdnn4GlInQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:44:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A19A40F109
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD7A43008D1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CB33CD8D3;
	Thu, 16 Apr 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJH9CrUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011633CB2DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347050; cv=none; b=PjH2bIy3QyMj00M5GC6EHUwYFX+mu9EXeXWvpgp/oscRFaZg11J5N1MVdsQTd8zfGejhlWcTlOunTcUJhrozJmzMEFQa83OZP3OuBZ08aaiB8H2dztIjQ/AgwwO530idzCSsKbCzP16VxTjvYYc4+E5R6x77FK0yGlVseL1zJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347050; c=relaxed/simple;
	bh=Vb2BjE43Rj7+B5nWp9dgRNQNG7l6Oph7RvS6ZEaJ7QQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kjH/9iHlB78V64n7Q8EyDR9tTkcTJLH61QHyJzvUZr3rdIqxe3ws5mpMg+fPh3OuCrF7y+MANCLBX+u0svScfPdiZuexqzrYpsJqqr0O+YtH33Pe0M3RIKMfwFDZ3LdVhNV4IK0dAeYzLJYjY5R1pHyOZYNmd7xh6mARVM+ss7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJH9CrUL; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79ab3e26cceso78580907b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347043; x=1776951843; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1Cj4R8nBBYaIsGoCFVXiPj3J3o46qtr7Y2+nHFPGus=;
        b=PJH9CrULMHMRp2wDjf2bfsZIb7I3ZL+ZhTVErbdCWEkNI3hWAdiKIj9lFDyik/z8uT
         ioDtXzEfn6s9jUYWiRg5N+15+DUHfKNrCvIjqCR3sIJL37QfK80JFoN97EBMtr5+mmJF
         6EaNZX3k14Zzx5NtJKhBHdND2Lkb0f5rcTCKLXrNmnYHz8D5Dt731HjYaqa+fNAXhQVp
         cyimAp57JnSZZprh3LrpITbBTDqijma2O0yAnG27VqPQRwVt2+PHrvkEg+H0x/ckTpVk
         JXGxsiEnLmRVVG6KqvIn14jIx/+cPucPIguij5c7N1rSugFwVP0hKAd1HmfSTjlpOKlg
         P90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347043; x=1776951843;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1Cj4R8nBBYaIsGoCFVXiPj3J3o46qtr7Y2+nHFPGus=;
        b=hfXmTu8PPhlIRAog2J3P5rmvvxwRXjJ3dLFPq4MN1n87GPpvmlkqBYyBlUbXsvRr9r
         lEJGS6glE/PhbRvmk2iBM5I9e6kk3pOHvFbqfr7XGEuGYlNPO9BrpCiTEp7LZ6nSbb81
         z/ZRfrpKOHWDb9F3+zwDe1Ukrfe4ZBTnIsTQrA8x2BhGUseW8unPyi2ltanGK7faYZC1
         rT6KMOyYQaHYRTnbyY9FF1ARHBHb3R98mROxZpQ1BVqNT/DRSn4V/hkQpmo2WZWudJM1
         UI0Foup+zH+4709J6Yi6edepfd7I03G2zKbjP0OWnYq2/N3RYi23dG0VkDJFCJUjxhzA
         k4Mg==
X-Forwarded-Encrypted: i=1; AFNElJ/1Q+/WdUT2MRl7kdf2yhnYu60VzmgR+xjtwvZ3cbEVb4XUkR5e9rOQnSKrnEv3UsRu1cwY+KtyB8tGD3tn@vger.kernel.org
X-Gm-Message-State: AOJu0YxGMFvCrtrK4gNQ5xZmcBbBdWuAD8JCYXZvI2H91nj1s/KqLfxn
	sorh2QBxQkZw7MFDB+DoYT6tr3TVS/E1tTHdMrK9f5AjAuBRuSAImYg+
X-Gm-Gg: AeBDievi6lWn07GWs2X8kT9qXdeKVFZkGXScjYIAXiDI/iVx6nRyr7bTZSDfLylmf74
	7KqeM4JwJBmvUW1w2iiU1BHU4rQAUR83aHc3IXAJau39G5dXC1cu+wAarcpUymzlR11KEWYVpE5
	RWC8qE3vwo8Yi8IgEc2GoX45CgAkJ5Z3f04PIzssGsw1tuyaUHul2Wkoj52QarRHk4cF0DDcTyh
	8RQbFre05UJjChOUdHiAYBOsqVg/O/zFI6iYLWQDuOx+Xm2DVH1DBnsc6fx5fNAckUC2IkDPdj+
	QI/MwRwKqYTGxtJ28HFGN/pgJYwqTZZNWpE6dzHYCsEZGsLfkmcFWds7fmUmD5W0PQvTW/24WoR
	TVtEfnyh8CMv34hZtOAkqEn1/zoP0LMq4GrltrAvWr1xLeB+wBckJBUnLELiLfcjfp3UhB34qZE
	O1o1gcQTtUDzJrLSiO7l7Pe9mVeQ==
X-Received: by 2002:a05:690c:4990:b0:7b8:c19c:ee89 with SMTP id 00721157ae682-7b8c19cf5f3mr23684577b3.42.1776347042637;
        Thu, 16 Apr 2026 06:44:02 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:01 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
Date: Thu, 16 Apr 2026 16:43:47 +0300
Message-Id: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3dziXAtLY0vdstS80mLdorRk3WQDI9Nkk2Rzk7TEVCWgvoKi1LT
 MCrCZ0UpBbs5KsRDB4tKkrNTkEpBpSrW1APOsIyp6AAAA
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103420-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A19A40F109
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

This patch series is marked as an RFC. Before submitting a non-RFC
series, I would like to have some details clarified regarding how Venus
works in order to improve and eventually upstream support for MSM8939.

1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
   for vcodec0 cores have only decoding bits enabled, as depicted
   by qcom,bus-configs property of qcom,msm-bus-clients children
   in qcom,vidc node. Do I understand correctly that these cores
   are only needed for decoding, and not for encoding?
2. Currently in device tree there is a video-decoder subnode for Venus
   node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
   subnodes. Does this mean it should be dropped for MSM8939 as well?
3. MSM8939 supports HEVC decoding, however, as the patchset is written
   now, it does not work. It can be enabled, however, it will result in
   breakage of Venus for faulty MSM8916 firmwares, because the code
   disabling HEVC for HFI v1 needs to be removed, and as per commit
   c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
   this would break support for some MSM8916 devices. What could be the
   best way to work around this?
4. To attach vcodec0 power domain list to dev_{dec,enc}, I had to move
   vdec_get and venc_get later in the probe. Should this be avoided, and
   is there a better way to attach vcodec power domains?

There may be some other issues with this patchset - this is WIP code, so
feedback is very appreciated. Thank you!

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
André Apitzsch (4):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      media: venus: core: Add msm8939 resource struct
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Erikas Bitovtas (6):
      media: venus: add pmdomains to the struct based on the purpose of cores
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: venus: move getting vdec and venc for later
      media: qcom: venus: Move HFI v3 venc and vdec methods to HFI v1
      media: venus: add power domain enable logic for Venus cores

 .../bindings/media/qcom,msm8939-venus.yaml         | 104 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  24 +++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  39 +++++
 drivers/media/platform/qcom/venus/core.h           |   8 +
 drivers/media/platform/qcom/venus/pm_helpers.c     | 187 ++++++++++++++++++---
 drivers/media/platform/qcom/venus/vdec.c           |  12 +-
 drivers/media/platform/qcom/venus/venc.c           |  12 +-
 10 files changed, 374 insertions(+), 32 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


