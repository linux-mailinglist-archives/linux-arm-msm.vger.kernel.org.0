Return-Path: <linux-arm-msm+bounces-93795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GNPBbexnGmxJwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:59:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5F17CA00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E584312E0D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0B5376496;
	Mon, 23 Feb 2026 19:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOLYODgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CF7376491;
	Mon, 23 Feb 2026 19:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876586; cv=none; b=Gj7zfCHPloH1GhbqHfwtkm5Q0+5ss68AEKD0RQQv/4V/ol29T5n8po26My1B2SJ+vuqjEY6+TP6qu8Lbj9UI/4ceRfTC8HmSFhpBoaf5LKk4PLrvwLg+fPOvJsnUwJ+pI6fUoiB/rbH8/aVsLkJXVyGSVW3VgpC/0Q3L3qMmaow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876586; c=relaxed/simple;
	bh=+pxyUjxUyMpLGMRJkYhSjkuBXLlQWOn/o26ALmGD6t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YkEL5BK7rTlDUg6zfNJdLG6y2DfwrF67uDBrUzCIelnhZn1XlCt2GQujI1GBivoxRaNWpMC779905gZHK9cPuMcHzbc2kvI2mJxBahwsCRUbfgfY6xDasK44/urUPUu+8liRedUBuOvJipnrQYmld7WucwoP35gmj91l4eHQryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOLYODgB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D449C19421;
	Mon, 23 Feb 2026 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876585;
	bh=+pxyUjxUyMpLGMRJkYhSjkuBXLlQWOn/o26ALmGD6t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OOLYODgBK/XiLrm6yrQeyi++S3VaYW762bFk37XI6p5KJ8k8FIaDak+qi1wTpfD3e
	 qsFMmRqNLeW8DvgbBJzcEqCj2K69fi+RgUDdJ7/La3kaGjcnoxVAgsYQaxO7vTyxpP
	 k4tGqNkUeTli0pQ4wKvgIXENs3P44KHoIwy6NWFsgfAEIa+zGPHqS56OQqbTZ/p2m9
	 dpXHE8LWfzMLrEaxxOBGeGNR9Zpc/nE5x/YAOmM8gMXeBVFLH7509eNlYk6HyT15ib
	 tSOXvqZTtW18b529JA/Gz9BYxmNcdksEPtvY7LU8b1NkR1ReTdk9BOP82YyHdUp0fo
	 8yAZgNXAp/odg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa/x1: fix idle exit latency
Date: Mon, 23 Feb 2026 13:56:07 -0600
Message-ID: <177187657308.166046.2197993275190598521.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220124626.8611-1-daniel@quora.org>
References: <20260220124626.8611-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93795-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 96F5F17CA00
X-Rspamd-Action: no action


On Fri, 20 Feb 2026 20:44:58 +0800, Daniel J Blueman wrote:
> Designs based on the Qualcomm X1 Hamoa reference platform report:
> driver: Idle state 1 target residency too low
> 
> This is because the declared X1 idle entry plus exit latency of 680us
> exceeds the declared minimum 600us residency time:
>   entry-latency-us = <180>;
>   exit-latency-us = <500>;
>   min-residency-us = <600>;
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa/x1: fix idle exit latency
      commit: 3ecea84d2b90bbf934d5ca75514fa902fd71e03f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

