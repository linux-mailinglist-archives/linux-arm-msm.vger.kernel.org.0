Return-Path: <linux-arm-msm+bounces-107461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEg1L+jMBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:11:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D05539A9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C895C30449B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4246B3B19B1;
	Wed, 13 May 2026 19:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDx8LXVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9E73AEF53;
	Wed, 13 May 2026 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699380; cv=none; b=PqDUPrT1OePB9NOP4lmzlrUQJvgaeD3XEt3JnwoSOYQwBSOL7BEeKnclV0P6bTflag9rV7E18/yOIphstng9AE0VBptzMzSGdab4lyjDbyilXOkbLtpX6+B9jifmgjaWdo2N2h9odDEPkndNkfQxmsxd8G/Ij/fOtxwIrOvFrfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699380; c=relaxed/simple;
	bh=GjXTErhWfgaViTlNzBXlqACYyaRYirJ3JqvibeBV9eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LsfpLfREHvoZPfFRLSYbtcU3smkhzGIZiGuuX2b9PQ6Zl9o25TID4OxgRpee+Xp6JrEMv9DI9rhKNdQN8pEw78pIdfaRpk8Mo3rKZoVrOyJb6NJk/azz58+V91lM8BER2Z6keSCfEKgcR4djzA+/SON+NnBEoNQy8rChBDf6FY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDx8LXVd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5ECFC19425;
	Wed, 13 May 2026 19:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699379;
	bh=GjXTErhWfgaViTlNzBXlqACYyaRYirJ3JqvibeBV9eU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RDx8LXVdyCWSk60gIZ8HyyGN9yWDKYQgTJG8nYiO/eDtE/ijvo+vO4hiucPUE03jx
	 +h2G1sDuxi0Y3sTkIlR0JB/xbZF7rRX5AIZBbDlh+yC3XYsbwiffBbYeS0j5Fz18vF
	 J+AXDuf2FzgMDwmpWcqoau0IN6JtXCiKVFTBJ6sLDXsQvAxUKNApz4Ucb+S04vwQqF
	 WrYSFO0xbAlnyp5u6+HEvl734RYD3XoTMNPD51As/uKRXGoUw5wLvIFTrxlOBfvqfS
	 hgzNuf9dli5Mi5LvUsY7i5dayjKHfB1/HJyEjBwoN61y001LSnasOc+RFnaGo1IAYh
	 FpP6zATEVOumw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luo Jie <jie.luo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com,
	quic_pavir@quicinc.com,
	quic_suruchia@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] Add CMN PLL clock controller support for IPQ5332
Date: Wed, 13 May 2026 14:09:20 -0500
Message-ID: <177869936432.1496622.9030891427127725229.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A2D05539A9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107461-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 06 Jan 2026 21:35:09 -0800, Luo Jie wrote:
> This patch series adds support for the CMN PLL block on the IPQ5332 SoC.
> The CMN PLL implementation in IPQ5332 is largely similar to that of
> IPQ9574, which is already supported by the driver. The primary difference
> is that the fixed output clocks to PPE from the CMN PLL operate at 200 MHz.
> 
> Additionally, IPQ5332 provides a single 50 MHz clock to both UNIPHY (PCS)
> instances, which in turn supply either 25 MHz or 50 MHz to the connected
> Ethernet PHY or switch.
> 
> [...]

Applied, thanks!

[1/5] clk: qcom: cmnpll: Account for reference clock divider
      commit: 88c543fff756450bcd04ec4560c4440be36c9e75
[3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
      commit: 1dcbf4195a262d57f4da812248cdbbcdc81bf8d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

