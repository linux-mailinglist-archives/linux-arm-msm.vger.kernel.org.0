Return-Path: <linux-arm-msm+bounces-106524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKmSOen5/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:45:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01A4EEE14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 368B0315B97A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0534963B2;
	Thu,  7 May 2026 20:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qU1hBbzq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0473C4963A6;
	Thu,  7 May 2026 20:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186101; cv=none; b=DaAmnyQL4L/sa5NFlEsmL7+PnpKxEtKpZRIMrovauKHWT1QrfI/m25kxrVXRmhosXUsuOilyuza9pMTGVNY0KlTr1TWSDC9Qnuj9J2Do8R+7I/jDKoZM7oYwekGbWi/slEpDPQAbXrb+4mOwu7yhq2ZrY7LNqE8L8raDJ+8k9CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186101; c=relaxed/simple;
	bh=NKbKxfn80P1typlFvXWHegJuR3Oi8+ijNXGV3Q3v1qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tomt+7ODhPKklbFI4MLD55JW/ecM07tQ9UL4gM0+S6f2U9TABg13VuLcCLrVjZoy6FZB04ZKD2zCsOAbura7ahO/XiDhqlzXXQLxjijs5ZnFu94C3/JnLNi5nvOaaHE5S0yWAjJ9zQa4htpxR+zaA7J1kycZ+plw+aKtIwa4Sqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qU1hBbzq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87159C2BCC9;
	Thu,  7 May 2026 20:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186100;
	bh=NKbKxfn80P1typlFvXWHegJuR3Oi8+ijNXGV3Q3v1qY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qU1hBbzqqM7pQtzzzBKRgksZS+aMOF8WylWkjgMQEjvOw/ExAdSw4mnUhi57NNQ6E
	 tb8a2dkI+OK+Q1QhV7Yc37gMhNDuxp5RpnfKaezMdiVq8xjY+uPtkwdC4zjPuAeFOm
	 oeQgdN0JWrluawmr8RNegDVcXBrTA+otto2ivf8iPFGlFJtFJi5NuDNflvuXgnYuMI
	 T/w2V3xjjbib4Oihe+a66idbbuc22j7YfXdvGADgxTN/pSJhvI+2IgJjOPLZbe87xW
	 5WDgdTMtmX0kxp+zgP+NZG4h1IjuscFwhyqRUM3B4MZXoAEuxEQBlziB7Jj1ZE+HPf
	 uYC/7erZFqbNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: Few dtc W=1 warning fixes
Date: Thu,  7 May 2026 15:34:22 -0500
Message-ID: <177818606027.73000.3638900496312664503.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
References: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6B01A4EEE14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106524-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Sun, 05 Apr 2026 15:39:27 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Fix patch #3 subject prefix
> - Tags
> - Link to v1: https://patch.msgid.link/20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com
> 
> Not marking stable as these do not have actual impact on user, but still
> warnings are not desired.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: glymur: Fix USB simple_bus_reg warning
      commit: cd66b6d256f94e40922941e14d7f9390d35d072b
[2/5] arm64: dts: qcom: glymur: Fix cache and SRAM simple_bus_reg warnings
      commit: 46eccc1034c3740b07b58c125190bbb99247c9de
[3/5] arm64: dts: qcom: ipq5424: Fix USB simple_bus_reg warnings
      commit: 864fde494aa1dd26c68254661f2ce973e9f03832
[4/5] arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
      commit: f319a5fc998e29699d325af0e461721b3768eeec
[5/5] arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning
      commit: f20a82aacd7f381084391a8d1f0f58defa91974c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

