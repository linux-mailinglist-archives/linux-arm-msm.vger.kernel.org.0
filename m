Return-Path: <linux-arm-msm+bounces-102390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFJqAP4J12nNKggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 04:07:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBCF3C56F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 04:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAD40300C01D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 02:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B355536654F;
	Thu,  9 Apr 2026 02:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqo3MNm2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BDE35F185;
	Thu,  9 Apr 2026 02:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775700475; cv=none; b=OJEBkomOvNYV2BXIFk++OsGfUxyX51U5k/yH+xqe125TwOd8EEAjqnPkWM3v+1pY+V9C+JY/NLs5yS5bHzUYWQvQUTkOiXctFQc6+6BVQDyb877q5sKQiKw45NcrQn+tHrrZ0Fcn1OaqqxN6U6gIFel0GSHtVbhA0fcdoqt0LAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775700475; c=relaxed/simple;
	bh=zd2KpZMNHzsQZ3YgQYIK9vkMtQ9X3cFDit+MgN8yrqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=baFTXMkIlAulgKm2mUImbY+6nNukHsTCpN9X1On5x2zaWaDkqYX/soKx7vu2SYp7Q7mMISucd0gfdolji359HbPZgYSStyGiNhmJDvrP5ZOq8JhfWKqf+UrStUM2bXKVsQlJ2rLbotYKTJ/pWunN0pR+qah+PZqVdidjAzimUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqo3MNm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CE0C19421;
	Thu,  9 Apr 2026 02:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775700475;
	bh=zd2KpZMNHzsQZ3YgQYIK9vkMtQ9X3cFDit+MgN8yrqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqo3MNm24et3XV/GAKwpe7CtnRlrSqqDmzEp7t/l/3qz7KQP7d3+XqK87IU1mDpv7
	 k+FgxGvtGp03Qapftxt3g3tn9U/dTV8zD8B/2iuSbGVVP/kcTKvCqDVjcD3QOJeTNi
	 rFicsrVp8jhcTNM/FJAK8ftSUcfaOiQjhjLjzHuSPDyCR4b9zqSDBsGyTMUtS3z6XJ
	 Q5Yr0L4y5w+aBQMa8se+ibJQcrp8ryJxslO+CmgAYZYeRC1Rsa4XyfzgTojTFe0aZK
	 b7AYqXE7FGoyIUi4/KiPvS/SSGxRGYeriX/X9S57ukory6KNPbCSHE1gdiaeYg+P/J
	 j7HlbRd7iap4g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Prasanna Tolety <quic_ptolety@quicinc.com>
Subject: Re: (subset) [PATCH 0/7] clk: qcom: add support for the clock controllers on Nord platforms
Date: Wed,  8 Apr 2026 21:07:47 -0500
Message-ID: <177570046483.3225085.16140306609517666687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102390-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,oss.qualcomm.com,quicinc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8BBCF3C56F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 03 Apr 2026 16:10:48 +0200, Bartosz Golaszewski wrote:
> This documents the gcc, tcsr and rpmhcc support in Nord platforms and
> adds corresponding drivers as well as enables them in arm64 defconfig.
> 
> 

Applied, thanks!

[1/7] dt-bindings: clock: qcom: Document the Nord SoC TCSR Clock Controller
      commit: 31fcf6995e74117fe235a7a07a6e13077070b4a2
[2/7] dt-bindings: clock: qcom-rpmhcc: Add support for Nord SoCs
      commit: 8a108047245780ca17667b05a7af600d118ec1d6
[3/7] dt-bindings: clock: qcom: Add Nord Global Clock Controller
      commit: 06498d59bb4e10032b1495762a999d640fe4a8dc
[4/7] clk: qcom: Add TCSR clock driver for Nord SoC
      commit: 9d13c7bbee5f789738a645df5868b69da5ae3879
[5/7] clk: qcom: rpmh: Add support for Nord rpmh clocks
      commit: cf6e6ac63c62cb9f60f981dbaebe591bdbee2f46
[6/7] clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC
      commit: a4f780cd5c7aa8c0d2d044ffd153f7a3a13ca81e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

