Return-Path: <linux-arm-msm+bounces-99530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK9FGMv/wWk7YwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:06:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C43C33017BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85DF63033232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C245138A73E;
	Tue, 24 Mar 2026 03:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJaEI82k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C237382F1D;
	Tue, 24 Mar 2026 03:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321567; cv=none; b=mKGwxg0fyLUSW/Zi2SLF0ONciqF+njx4RoUc79l+R6URLKppC2e9LtR6mvc2I9/hS60cX44ChpBKORsO9M/YGp2DrpcC0LwiLFoTbs1P+M2TF1RNgyUFC+7TuUmJZA4pV0roGwR36+K/OXdPJXGFbQ/4k/pyWbPWRK4l8vDtJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321567; c=relaxed/simple;
	bh=EWD802BwjCd5EWpVdvDh5Jw/wP0e3EMZG4EdTdLMBhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HwauPDMHgyOU6g8RZpW+2e1Gh328KkQuw7IznZ8CmpQI8+kYJEKtvQgtNFM7MWbqATAnPSxf1Gq1e/4hJbY3+eJWAiic6q/k6+Kya/XIJN6rX2DkS3697HwdkNuVF6gOBDZBVMnOHtJ6z2ZJwtuj4A1l44Vxhih9n3rGYuweL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJaEI82k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C02C2BCB4;
	Tue, 24 Mar 2026 03:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321566;
	bh=EWD802BwjCd5EWpVdvDh5Jw/wP0e3EMZG4EdTdLMBhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hJaEI82k6rJWCLaKOmJcF801mMddJ0jp9PV3Ehm7w+s1+TqNwNgq0d2tTFBghpW+q
	 INsR68Cd5uEW1cDPP7rSIhK6rwr2NjyB8iRd4XfBk8QG5cU3oopHqIy23FJ3cZYrHQ
	 9RHV0ffTrhkOgs9qINMhfAW8ES7tOUpWbbvfsh/vmlhahRmqDrXAT+Yg0N7Apqa7pZ
	 WwaujFDPM+kVHaMa4+DK0zgjXH/Ma89jO0JW7ddAz4a1tkHZ9LfIyuIiPFSdAuMY7r
	 eL8H8aFMQG/LzmgPdC9TLajNhqFxWHSf/fLFhFtTkW9gDizlM9XP5kwkmhJTrDxIFe
	 46hDQf5Eh+pMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Brian Masney <masneyb@onstation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] soc: qcom: ocmem: let the driver work again
Date: Mon, 23 Mar 2026 22:05:51 -0500
Message-ID: <177432155629.28714.10194846764418138373.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99530-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C43C33017BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 23 Mar 2026 03:20:56 +0200, Dmitry Baryshkov wrote:
> Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
> clocks") moved control over several RPM resources from the clk-smd-rpm
> driver to the icc-rpm.c interconnect helpers. However it was unnoticed
> that the OCMEM device also uses that clock. The clock is not required as
> all OCMEM users (currently only the GPU) will vote on the OCMEM NOC,
> bringing up the clock. Make it optional (and also apply several other
> small fixes).
> 
> [...]

Applied, thanks!

[1/3] soc: qcom: ocmem: make the core clock optional
      commit: e8a61c51417c679d1a599fb36695e9d3b8d95514
[2/3] soc: qcom: ocmem: register reasons for probe deferrals
      commit: 9dfd69cd89cd6afa4723be9098979abeef3bb8c6
[3/3] soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is not available
      commit: 91b59009c7d48b58dbc50fecb27f2ad20749a05a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

