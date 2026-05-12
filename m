Return-Path: <linux-arm-msm+bounces-107201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE76FyOPA2rC7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:35:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 505CF529524
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D267C30A5586
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2213C3D6CAD;
	Tue, 12 May 2026 20:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQW3gnij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F323D6CA0;
	Tue, 12 May 2026 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617436; cv=none; b=tEL3jwNWDLEzs+roQejkXUGlsbfrE50cBB3qilgQGguoqYeWpEjn/dk3VxK4opREEcGK6dL1PhapmQOP69QzAxr1BEwupKU0WzSQubKWFG9fm1Zr2YdOQhd/L0ZBHh5umIcE3a+TQjzL28zXgN46wi94ALbfzAyac2ilezs2+no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617436; c=relaxed/simple;
	bh=OPq3euSIEFuG88zksn3mQ6pfjH64/HNZkxHCwelqszo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mmwVwhMefF2BI9+OloKE36ImjKSxmJctL+o2DJbg52HEGyzQn8aL87+fcEC4oYgOZvM5k3B8i53MdkOTxYrH2RFYYLK3oNkTWXbb1imI6vTqcBY7B06hgnXvWtU5fsfuq9YwsbGLTyK56Ji3nrDft3y966pJDeLPasxP1/gg7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQW3gnij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D916CC2BCF5;
	Tue, 12 May 2026 20:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617435;
	bh=OPq3euSIEFuG88zksn3mQ6pfjH64/HNZkxHCwelqszo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bQW3gnij/yOPHGe/okNFMOwwNJ80AUFaP/FKoYxiuX8o05EKOdtfDUdq5AXZ2QmZ5
	 ZzaeK3zOqX7H1ysYbenjQcEx7qgKmqxJtNrWviiI4Rrk58jlIMaqfXFKJtH6J5dAps
	 xTMZl7yvttEqsNCE6elzKXU9yZ3Qa3NpYyK9y26K/fDoaxwjFT5QfFaFa2OZ8Ucq5z
	 v0BbwFEjEWngOCHs1zE79uDua1yD4o0qrizBZIuZRZ9ORWWygi4qoax4g0xO836lnE
	 7QUZY+bdDb6q5e1VxRvMZW2RfB5Gb6y4dJncse+dnHAHt4BKt9+AxkkmwvvswaBrNm
	 QMazk2iFgcNfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nickolay Goppen <setotau@mainlining.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 0/5] arm64: dts: qcom: sdm630/660 FastRPC fixes
Date: Tue, 12 May 2026 15:23:08 -0500
Message-ID: <177861739356.1242344.18365991963647078185.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
References: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 505CF529524
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107201-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Wed, 29 Apr 2026 12:30:07 +0300, Nickolay Goppen wrote:
> This series introduces fixes that make FastRPC on SDM660 work properly.
> Currently only the calculator_example test passes on both ADSP and
> CDSP [1].
> Also assign adsp_mem region to the ADSP's FastRPC node.
> 
> [1]: https://github.com/qualcomm/fastrpc/issues/269#issuecomment-4232125297
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: firmware: qcom: scm: add CP_ADSP_SHARED VMID
      commit: db6ae6650cfdf085e21a477c25386125075b2351
[2/5] arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly
      commit: 708ab9d3bc5b74eeee767c678366624d3c02a4ec
[3/5] arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly
      commit: e8e1fb5c703fc6962103ffdc60830df99351c139
[4/5] arm64: dts: qcom: sdm630: describe adsp_mem region properly
      commit: ce414263e9ebe5080381a50cbdf9065c29816202
[5/5] arm64: dts: qcom: sdm630: assign adsp_mem region to ADSP FastRPC node
      commit: dc11a2824f059de67f499d2b9be82b602433b848

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

