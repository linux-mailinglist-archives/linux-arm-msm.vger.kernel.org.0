Return-Path: <linux-arm-msm+bounces-92379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMQKOVKVimmuMAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:17:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4A71163A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46B6D302D5D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 02:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CB8296BBD;
	Tue, 10 Feb 2026 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzU6hPtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6A2882A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689867; cv=none; b=t/X+WddGnfaoxAM6jkhTvlGXArgdbnWkETW+lJ9wqP8uzlLvTMw6TePSbJLOjzjBnCW7UiTyta0gVibjg76Hsl+vZuOpNJtVnM3M6+7e6fo4qTE0mwLMYECQY8t6sSuyNGYzLMPaMNq2m+xNCJTk6ACBi+7uBZTzGVcC5lbos9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689867; c=relaxed/simple;
	bh=x+sOSY//QCezMpRPW8PIgut8blGLbeIdZGRJjQRRcO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Go6aVan9L+7rKt8WmYc1h0vrXwepD10ttMcYsEtjj1yJkIFnY/AoN3ACK6N3Vbki/J3jjiT4dr3+nGfELseiKff/mmTwhwm+0/nC+iN/ovluUIPnyNmom63IM33EC0aeXZFcpYbWW6xMEWMG33ncrKa7+WbUl95vxXLxqLE16+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzU6hPtd; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c6b16bd040so506130685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 18:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689864; x=1771294664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxfGF1HkgcEk0da630jDyVz/s1o0G4UkiTYTbi4Udyo=;
        b=NzU6hPtdDzaL/NJ41ZQbuTUqa5ZKhfbi6SIykhUhO2+BNjNL2HCFN+kVuEcEbPtHgp
         iSuT8YI1Zr+m5BMqBtWVHNhYELU071Lg40Kt2UpkXR2Wrd7lrEJFYuMeljVo4n2sTJzG
         a9r7rc4s8wKbj0Gum7e/heGnfH5jb6QIGL9falGHpI8uo7fpYpWPOah39JSAIR9I565x
         cdcfDfj8G8WBFPSpvH2A2yrXH0MdfT8jFKVLqa5k2OHP4Wq+aXjM6XvoEjCADxN35ebL
         v1l9H1FVgu09/tnphFf/2CigiZQNP4xKSBY1JYY7YPnJ5/DFxg23cVo3wxPbxXRGa2SA
         d4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689864; x=1771294664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxfGF1HkgcEk0da630jDyVz/s1o0G4UkiTYTbi4Udyo=;
        b=JPsYesmM4Z9K5Sl4RdPt2dGNhKVKeiXRtOnVl7SikjZLaYI44M4FFjGctoBB5dx0Lf
         CchukLziWIezlOqN2RWPM9Qgrr4hLoUTAu1qsfiEJMcEIp1AKewpHHhHGvgtLUPBZpRt
         ZuDqttFp1i3tX8x6XaPR/BkpPxFrALpN98sN/ZlGqm+B/SYRUTg+76v8RdTFZH80z0yi
         7yhmJcjIMAWx4cfH3aCdc0Z78NvjW0HgMKrboMevgaDAfJHNAfvfdjjfN2QROtSQVrLG
         lsj7h4UJqVakm7h2wMqZa32VUPCYsnU529X0LxSCDWDZF2Aymu72rZ+AzougwWNee8bQ
         r98Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpBmu5POUw2fDanX8zIKZ+cYWNew3A8cGHPj0ELURbIbhz/5wn66B0XCs12eernNpxotpqoPLFNLrMyot9@vger.kernel.org
X-Gm-Message-State: AOJu0YwkHdSh0RUR/U4asMfhC9d607bXUm1XKAH/3yQkHNY+thKFIE/X
	2VcO0TzSh2b2881h/HiTNNcbupn90xXNbdHMAlIPkjrWJyeMMgxIAO8kX+2NHQ==
X-Gm-Gg: AZuq6aJI0RnfxHuLVGN+W0iz8MCgCbvYAKiyVdB0N9xFlvoPjK+lCjlFNGK19pyW8IM
	0szDjt6tBYMJxMVwAgbbH3CpwEqFfgbWBYS1VOEXw6DOvNyFBf4vfZ9jnBlzYYujw/agEyOB4xU
	67dWEVFjkwnX0QCUQamAVTuY4Q/PwVtZmnuLOpj2kCboUxefkEILO9hir+84ltd025YJetk1yv3
	4qF7ni2DYuxKImg8ZLAXDLhmPSxLB8Tb13TVqjq6ceWI5JiqllZVJQDDNyRGnzF3tB1T2Gtq/7U
	7Tsfh2WxQ5pt3ljoO4h6jka19XcS3Jxxz9bcCVySIRqDJ6RT6lJ1b2B6F975yC1c/kJx9eRJPZj
	9cgGt4ddIAQoBgQzYnZ8PCK5VYNxQ/mbaBnZ1UrA9N+szSOn0HgCGBqURK8MHV4DhAx9bx6xcBL
	NhVX4g/GusxPNmenIHS8iz5D76VTxvTlQNyd0udKWUrjAG5DI8dRJQV9ESiAFaBVugFyp2q1jCW
	H4=
X-Received: by 2002:a05:620a:191d:b0:8b2:e986:2707 with SMTP id af79cd13be357-8cb1f6ec458mr74691285a.45.1770689863783;
        Mon, 09 Feb 2026 18:17:43 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf77f320esm937925685a.5.2026.02.09.18.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:17:43 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/3] Thermal monitor on PM660
Date: Mon,  9 Feb 2026 21:18:16 -0500
Message-ID: <20260210021819.12673-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92379-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B4A71163A3
X-Rspamd-Action: no action

This series adds the ADC thermal monitor on PM660. It also fixes the
scaling between voltage and temperature for the HC variant.

Richard Acayan (3):
  dt-bindings: mfd: qcom,spmi-pmic: Allow PMIC4 thermal monitor on pm660
  thermal: qcom-spmi-adc-tm5: Correct the voltage-code scaling for HC
  arm64: dts: qcom: pm660: add thermal monitor

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        |  1 +
 arch/arm64/boot/dts/qcom/pm660.dtsi                    | 10 ++++++++++
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c               |  2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.53.0


