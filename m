Return-Path: <linux-arm-msm+bounces-114859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id frP3DJ4ZQmq40AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:07:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF26D6B9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:07:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d5reHM9a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114859-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114859-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A2D1304C598
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804333B14C5;
	Mon, 29 Jun 2026 07:00:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7543AA182
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:00:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716448; cv=none; b=rZlPQ1u5CwJ3HGu2PaDQfBbHssvvQo/nNIKqH66hsqQxxw5N8a8KC41K2m6XaiHynBf/Rc02LQBwuH3icvOQF9p1bTnDyyQVL6lf2MXw1+fB2nTQyG38+wH1unltnlugMLlttSMyDfl07UXYbkLTlBrotBfcQHK5UIGIOX2AyYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716448; c=relaxed/simple;
	bh=lp7LAimrZs1QHVxx24pfSjBh3OWT1HxcKdnhmz8J8yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uhzLPkJMeVa1MKSLdNC6ZyChUP08U062eaZiULpRxp8NaeYzgckoRq5g5ufWSy+tDcy5RAtjQqku4LmOTIfGs9APJr3iNk2PQgyrdebpAmWED7IQtajIdirthMZTSUSaiAF6gBLhH0uJUG2etZWhHNIrv905pAuSqKhIKh2yEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5reHM9a; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37fee7e4de0so330598a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782716446; x=1783321246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrV/R25cT3pDEPiIHQ/ia5vCE1mVaRFviplQpQbaE6s=;
        b=d5reHM9arn8uNVNPjuPYi5EyHDY+dYRQ6y/hsAky7g64R2uQz0a/Q/BOXBieMkz84P
         /jg4rrV5BefESRVSmEXKaI2xt2eBWHWbDgiDLsrEKVNi87nQnJBNwz+m2LopRKEbGhwb
         zEA0lgmJ+kpbomx91vPxULdCkfHNVb0MDsuiqQIpA1LBhGevWNVmqsVJAEarkKno1EYq
         GdBRh3dKPt3okBz+mWEo74maCkJ7n/QH41XAI30Y2M14AKixik1aFqS0oU578YCOy3Hw
         i/gqb1bzT8ht31oogR6d2Qxn6c4gmT2FtMwWfY6MFZQoJGZDdtZ9kaDLbHzFkoKKRN/U
         gK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716446; x=1783321246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrV/R25cT3pDEPiIHQ/ia5vCE1mVaRFviplQpQbaE6s=;
        b=lH4mGqougqXHMn0WVRp6ydj03/pg4tXgDinzzhgIrJGEeo5ivOnMbqStfl1ThG8hTa
         RKUYX3tGd3yacuxWjUNMVX2PO81wn57MDk3hNvzoM2V/2Fmaenr5INMRgvdQJHdZnRs2
         88FAbm16PZ/5AC+90JXOhIEai60sgdO3wKs3TY94z2fKESsDN1JpLh5BgIkpvF7PQYwx
         MIArsbMhNPT/Z4Rpt23m+CsHE6nVh7WQBb4x4PP0FSyqWGqDhbfUyFWMvC64G/dO4j34
         UwWF2ux4L7wG91jlkX6t/B8n7HGNuBcVzKXODwV7sqW/uBjDm26KUEzzEFNSkmf61mdA
         0eeg==
X-Gm-Message-State: AOJu0Ywyo/Y0nDWWBnyFOA3Ln8e9IYly5ziEDA2rdz7+WK3JszFN0exB
	mtHSlJVvTFw9Nl10OG1hb5tqoukJsoXZkTdYTyzlfssIBTWq2gdgqUpvEGsTo5udNtgFZw==
X-Gm-Gg: AfdE7cmwRwg5byyukEBpWuNxMmUj2ziblGu+lji1PmpZ6LwATiQpE/jUaStbyX+JMpy
	5sMhNYPGwSl51w00iXHsxbyRbAcOQGYfVIa4RFjSGP8y/vIFCGSPSkZS1E6vGbXUPeyN+kV0waT
	uNzkP4hHv7DVwLk/mOtzyCrx4oxd8KrhTMZ0IEdSlp/5trrllu1wkv7c8nlNdTpkAVx6mRKk5Je
	Feq3B4fIFKV2OUkUhodYbXh9GgK+ggQCTntIfPSKECu/WV+5J4l1/KG+EjGedZ3i8+5hZmrsADA
	ipprvc3T/b8/lElto1UiKK1mHM87Nk3nc/Yf+9V6Di/0fcLugKrZthskfPV0EDdYvNitvds4Tbc
	H0qrn+la9USowqDSgNT3uF83thZX3IB70KyWmMZckWz6YAyFxGNwqxo44YqkHIf9erFQEpo3X0M
	5laFwU+RgWs1g=
X-Received: by 2002:a05:6a21:4cc6:b0:3b4:6af4:bdce with SMTP id adf61e73a8af0-3bd4ac5d9a3mr12152783637.20.1782716446385;
        Mon, 29 Jun 2026 00:00:46 -0700 (PDT)
Received: from nuvole ([2408:844c:b00:2b2f:398a:8bef:b88c:653a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc90af5sm7061725a12.28.2026.06.29.00.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:00:45 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: sc8280xp: fix and improve pinctrl
Date: Mon, 29 Jun 2026 14:59:02 +0800
Message-ID: <20260629065905.15651-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114859-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDFF26D6B9E

Add camera mclk pinctrl definitions to sc8280xp.dtsi and drop local
and duplicated definitions, as this is common for sc8280xp based
devices. Since the correct drive-strength is 6, fix it too.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- Collect tag
- Add Fixes tag (Konrad)
- Rearrange the patches to ensure the fix is properly backported (Vladimir)
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260607160435.36546-1-mitltlatltl@gmail.com

Pengyu Luo (3):
  arm64: dts: qcom: sc8280xp-x13s: Fix the drive-strength of mclk pin
  arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
  arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK pinctrl

 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 10 +---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 56 +++++++++++++++++++
 2 files changed, 58 insertions(+), 8 deletions(-)

-- 
2.54.0


