Return-Path: <linux-arm-msm+bounces-97661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Gzo0E+fJtGnRswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F9F28B67B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 03:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 471B3301F304
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77FB287259;
	Sat, 14 Mar 2026 02:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VUhGxtdy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F271282F0C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 02:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773455844; cv=none; b=sx6b6wSit6I6uCwSnvo1YSEOdSBDBTMx1oXUP6ciP12DHZAJ0/WU1GoV+zkAJcP19YMxyBDaXi76Kfh5XLwHFtUCA7bRT3/kBB0NbcWhswAzcZCu5+R2US9eq4qeB8v8XOBIBzbGurBT9Shdt4Qajl8SG7lDOIZWZ6MvcsMLs10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773455844; c=relaxed/simple;
	bh=o54kgX/FfKG/NTJ3r0AQP3BUXLOxKSho0aL+4GiIKgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ime/BB5jXaDWVQHi9DpitsgS6XcSSeHeqtgnC9g2olKd76w/e9Zd1GRgnwA9sTO3jhfx5sjf/BEOSCzT84unI88adkiLe3sMZqQxmo66ClFUAPzTzoivaRB8eXV25W2PZFFflehkRfGu7p/ie5CzNxEX4immBH59MjOD67JBQNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VUhGxtdy; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a132096c08so294102e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773455841; x=1774060641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7jkMjAsh5AS687nQGwoNgRIEGVMFG8INWXbw9vpLXjI=;
        b=VUhGxtdypVhyORErYnStlhmb0xhfbcpNP3tf+N49F86ODiVLlWKfcPAxZbu/CrLc5Q
         RTmhiiJCohRPW+5AOdpvJ7dUornL4KcuphoPZFQfpeasUt7n2fizsccnCNb9mbNtD/JY
         /Vs/ZZGzndLw2fotMFu6jwqrpji/acHJEyixL4wZYex5ENQtNjyboSZWKHVN5/QrYAy2
         C2oXrI+6CBPUI3CSDsoUV/v88u2mmZx1Jja8eyWTZRoYldkmDohSFUhlUFhEB3+5h/pB
         mHnmGpYQFG+FmKcbbdW6e2HBJ5rTmwwydzNc/pOjnthM8cv40aBI9Jvz+DDpbtlxFwk1
         abxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773455841; x=1774060641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jkMjAsh5AS687nQGwoNgRIEGVMFG8INWXbw9vpLXjI=;
        b=Sc224aCdHtnkUezBi1NkeAfVdPTZaOvSnjD2vPt9iVeXttvV8rkGHeyvSE8jheiKPY
         pB7+Wk5A//vFBhQygSoH1Wg/anqbC4PcPr90SVl+ishoztKiF3+DRsRHj9PlJjl1Wet2
         y8pa8STDGpC6gxwInzBpLzdEDEtjj0VeWqzyr8rKb3UY8AdNylv9qfZTPZkL48VwUq5v
         JEgj5kfm6esfC2o4DSqQEDNFhoHeKmzqrG3cmauqDGduEKa8D5dg6Mnvw/1fyrA5W03M
         NBj6zhhtDX9i9MczD6qIeiHyr75n7+K9+rRDWrntzBmuj0dIxYMUSiSj7PO6AeOt1tkJ
         jOEA==
X-Forwarded-Encrypted: i=1; AJvYcCVg6XIWvFwO5JzQNroNicxHh0uurSyFW4V7wyD/vUn2GDWNZyWsieYSxj/SmYfCM/CLxeYaM/f2zfW/HB5g@vger.kernel.org
X-Gm-Message-State: AOJu0YyzqABo3mUQZjyKTmBwJOaEJfqiOsp3b5Jkg5o06NLwaKufzae0
	6WXG1z71iynNeLzVaSiq/o1AdtJxcz2RRZSlxOfPXqKyZYcmiQ6kMi01/dpSh1EjbFE=
X-Gm-Gg: ATEYQzxad9J7tMWZfZGgCdpTJ0j+RVjd3ya7FAiK/zeUrQSvgPmBsol087rjzXuEe1u
	biBlGrUqqvCEslbopHWIb8Ts175Uz+U13tkNGtuuoFmBlimXY6nv8CY+pd8lWP83YdYHpgo7P0a
	rzES1Lj1BYGmrBZPypWj8qjlU/WcOJTBye67E8Ht6dXY45c9j2I1bPaCJl328UsYjl/Pj5bNWDi
	gfGHC85GQZFRtj9AoG8S/7JKjz30AMfgooEE78jtnhv4ZJ8lD8cTgcDpJDA/MYj+Q6ZQBurC1Jb
	C2NUEq15qNiYdU4/cz+vcPyIJM+xU1emzdbwb0Xf1jmgFlGNtaqc345VrfWklKT+sBYiQ3nV0UB
	LhWcdRKD0+LLN2hQCy5l0/anooVSdz4kCm31FV1uFCXrAoZv1B21zxw/K+RKPe0lFXu7Aqz2RkL
	Sxo8c7ha1Ly+Rkco/FY3CVzuH+1Tu8Z4fs6z79gcwfltNkeWC9wBUSYXAsBRak6AGl4g==
X-Received: by 2002:ac2:521a:0:b0:5a1:3e50:423a with SMTP id 2adb3069b0e04-5a162b0f132mr630706e87.4.1773455841073;
        Fri, 13 Mar 2026 19:37:21 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e692sm1884296e87.30.2026.03.13.19.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:37:19 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] arm64: dts: qcom: sm8x50: Enable UHS-I SDR50 and SDR104 SD card modes
Date: Sat, 14 Mar 2026 04:37:09 +0200
Message-ID: <20260314023715.357512-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97661-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: A7F9F28B67B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The reported problem of some non-working UHS-I speed modes on SM8450
originates in commit 0a631a36f724 ("arm64: dts: qcom: Add device tree
for Sony Xperia 1 IV"), and then it was spread to all SM8450 powered
platforms by commit 9d561dc4e5cc ("arm64: dts: qcom: sm8450: disable
SDHCI SDR104/SDR50 on all boards").

The tests show that the rootcause of the problem was related to an
overclocking of SD cards, and it's fixed later on by commit a27ac3806b0a
("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs").

Due to a missed setting of an appropriate SDCC clock operations in
platform GCC driver the workaround of dropping SD card speeds from UHS-I
to high speed was spread to SM8550 and SM8650 platforms, the fixes in
the clock controller drivers were applied to v7.0. In addition v2 of
the changeset corrects the "xo" clock frequency on the platforms,
and now it should be safe to remove the speed mode configuration
restrictions from SM8450, SM8550 and SM8650 platforms.

Changes from v1 to v2:
* added "xo" clock fixes, which provide the expected 19.2MHz clock rate,
* added Reviewed-by tags given by Neil and Konrad,
* added Fixes tags, since the changes are functional and performance fixes,
* rebased the changes.

Link to v1 of the changeset:
* https://lore.kernel.org/linux-arm-msm/20251126012043.3764567-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (6):
  arm64: dts: qcom: sm8550: Fix xo clock supply of platform SD host controller
  arm64: dts: qcom: sm8650: Fix xo clock supply of SD host controller
  arm64: dts: qcom: hamoa: Fix xo clock supply of platform SD host controller
  arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and SDR104 SD card modes
  arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and SDR104 SD card modes
  arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and SDR104 SD card modes

 arch/arm64/boot/dts/qcom/hamoa.dtsi  | 4 ++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +----
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
 4 files changed, 4 insertions(+), 13 deletions(-)

-- 
2.49.0


