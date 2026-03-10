Return-Path: <linux-arm-msm+bounces-96612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAOmIaT/r2mmdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:25:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F8724AA63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A41A7304EEEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1E73876D7;
	Tue, 10 Mar 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPDrxpkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BB5387343
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141836; cv=none; b=EpnWVTxGpBWkMjShoFtQVegAKLE+WqhGfAiDH3ElJadprhtFsksRNlmrHsZbPmrRZ13+J39SuwQX06kUl+Fy3tYtlxoV9e+sxxc4xQecooW/q/mDk/VOe17uDaLavNTcv2rJaBeIQHZutrwvnpe/zZ21snxYzKSe1sX3ZoAgLnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141836; c=relaxed/simple;
	bh=W/1FEAlYojWL1bU8tkO80Dm54K6ucsxIJSx7uRiiapU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mveDN55W5zjDEtIkLYWO3e/OB1AwE+onswCVpOE0AApmOqpwqGYchP+COvhBBEI+F4Mpd4UtzK5Q2Lq2/BLDsGpW3ebaxjJetBk42dU1G45HyXROrJtxRWzsS4uPBIZpWkzfC5dAWjNTFH68EUnDiK1RenZSrb3Aw4DKJc9VGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPDrxpkH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so6027230f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773141832; x=1773746632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9v149es6iuld0S7eGKDXVf+jDyagFR1V8/Oqt8h7Ak=;
        b=lPDrxpkHjKYzxP2SZVW80t/lvry7NcXPQiQ6v6iMxyvP4P48ipWQHWjVybIGzysc5S
         iv68ILbtw6Zrpn1BkWcKWYF2r3E55vYFiz9ElbmuVXgU3HQrmOj1XckBDyM0fKnsB0Xf
         bNAXjySEOsNk4uYvQp/HBuyo0kg2yc3JByKGI7NQNbsCHl+FdxOjCwaQgfPACbYQ3SHD
         8iUsfCAB4gNZZrjfo0xtFrMnt1JuRFn1dwDb1DoUXtSrZ4ybqyeFhgVJxA81zAMVQMt4
         sWW25LzRuasup+HTf/MaQVupiBgS1HT6e/vrfQ677ez2qPiAPGjDvsmQ5K2xZZ0lw66S
         cq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141832; x=1773746632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9v149es6iuld0S7eGKDXVf+jDyagFR1V8/Oqt8h7Ak=;
        b=KkOFlOyLBdTBcsK6S4e3ck2BZWLFNHHXaGOa1SBwYXDOE+Th86EtsU8Tpfae1mCxiM
         Tv46TEk6aU44VBOEH0Hvpzi672N1TfmD2MYnVwWUz32MDRkbsTCwhU4afzNueeh6lGWc
         3gJhvoGWc33uvu3ZaFGtugnsgMl17jf9fNpRVEFi9+aSqkdqYe6nI7fLAry7sGPBzZlU
         ZF6f1GXdpaCJAsRd5M9xi7R4UK8sLSFh0pB5kLFwVBZEzEVPgo8XB7lCfUiC7JQIiR/P
         efr3I/+BJg0jAYBbt7rMMpYmIUS0vwpX3YOHtvCSO77v2/k+Ra/P/A/hPOft8BNDcHF0
         CR7A==
X-Gm-Message-State: AOJu0Yz9ZU/djKfRERZftjtDJ4ThXn8bPN+Ap1Kpez1zHxTq+FvZGrIv
	a7VVTb0AhDMcWqwmwre4T0dAR8RkCJT+meGsufx4k+BvVhrPB4AIRsRo
X-Gm-Gg: ATEYQzwAbMnktVcA3JBjV+dDP8t+3qt3PQsasJvqhQcHBIncP+qmWQ9Jr+3dX8msg3y
	prAEy5ooKiseoPcJydBdvPwBQ74cUX6E8yYEhVElmUSQd3Hdrm0J+ktcwioQ5d/Ey8ofjiTrOpC
	/PgZMT79Vmtw+F0qsMA7ycdrSbYgPNuIUXkIhjFL8TjpESjejT5rkVrmbvTxBMovr5el9tfmOrn
	ry88aRaKAdgkDPoyjZ7VINU/7Rm25WqvgX0YMDHUt2zG+KgLIeyMs7jBxXqv9lG5mE+YmCfy18L
	vgqPmQn81HQp0EDz60R/K4WTrMZOevHyBFnLxxzUTJAuTwgp1839aRseOWLQGEC+wSMdmdGObJ0
	xd0qpTmF/EEuT1+HkeltIRpEA9LJ+88UaFcg2kevjiS+rprSuL5yrmTywdJ4anGg81uJ7BQpZuw
	qlo9AD091bXQOfaOJU8BAnPgY=
X-Received: by 2002:a05:6000:144e:b0:439:bce5:6508 with SMTP id ffacd0b85a97d-439da351a52mr25257592f8f.14.1773141831963;
        Tue, 10 Mar 2026 04:23:51 -0700 (PDT)
Received: from T15.. ([46.175.113.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm32238560f8f.10.2026.03.10.04.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:23:51 -0700 (PDT)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: [PATCH v2 0/2] IPA support on qcm2290
Date: Tue, 10 Mar 2026 12:22:29 +0100
Message-ID: <20260310112309.79261-1-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 58F8724AA63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-96612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wojciechslenska@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

This series adds IPA support for the QCM2290 SoC.

The configuration is based on SC7180, as both SoCs
implement IPA v4.2.

---
Changes in v2:
- Order fallback list by priority
- Add leading zeros to register addresses
- Use RPM_ACTIVE_TAG instead of RPM_ALWAYS_TAG in the last path
- Link to v1: https://lore.kernel.org/all/20241220073540.37631-1-wojciech.slenska@gmail.com

---
Wojciech Slenska (2):
  dt-bindings: net: qcom,ipa: document qcm2290 compatible
  arm64: dts: qcom: agatti: Add IPA nodes

 .../devicetree/bindings/net/qcom,ipa.yaml     |  4 ++
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 53 +++++++++++++++++++
 2 files changed, 57 insertions(+)

-- 
2.43.0


