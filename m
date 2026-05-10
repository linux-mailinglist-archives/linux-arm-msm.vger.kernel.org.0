Return-Path: <linux-arm-msm+bounces-106817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBMDB2B7AGqaJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:34:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97387503F4E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 765E4303B16A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075ED383C60;
	Sun, 10 May 2026 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AsTYwwDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586B382F35;
	Sun, 10 May 2026 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416312; cv=none; b=AQuKjMhI+WGLEyyvc5kKD+fRnm8pMYx0kb5tpJWtikYlb0BNaKZZB2+WO0g7yEB/FNcDOioUzKkxrJKk+U7ZLkPwpla7MFa+8jVvY/quGcFSyH6Erx/aaKMyMsWfyvOZWw8MBXcRDXw6/r7YbHWGvUNJDRomfDFuTtOJFww75r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416312; c=relaxed/simple;
	bh=GpPVrg/PfFzPxLSfdWD2EavHi4G1RCtQ6isvE3x/6aY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XK2GvDQ1SqEbuaKyltKZWa+Krqkb6TK2k4TCESK1WHZOw0rHUDMdTePHQ+QjICtkkKNfV0yI7ALEleyCDKCu/4+JHvrAYYu675NLya0BVkwbWhmZlbKVSx6xz5/XEqHdJHGhXsTGD5mVf+jjV/pZm005RK7Jc6EKGDQndH8sc10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AsTYwwDA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01429C2BCB8;
	Sun, 10 May 2026 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416312;
	bh=GpPVrg/PfFzPxLSfdWD2EavHi4G1RCtQ6isvE3x/6aY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AsTYwwDAvD2+fevFM4EW+ggzoLazMD9YFsGj8KekN1e2BmGmfPzEOsNrNc3fEukT1
	 N3gTVCto04JK10DV66IxSYRCUz9PybRRYPA46HGkJfG3Up4CzTENl8YQLpcvLYtCg8
	 N8A/B1aeb0rp+ruK6Luth2EcvqKH9DYLsT57pBSSWKQyAPFH6OVVCDH4Df2P+rHxey
	 Kka2SfENZ331XhzhCntFo4egw+cvTgUR23EyRg6SEzdJaYXVl1O706tYizdT5E30Ob
	 0FmdpiUyUGsY14TFrStZDh1aPYPUiPohkRuAimaB2oxuj6RhcnpJFrewgNzbnXaB9j
	 S5eaJmlqJV2ZA==
From: Vinod Koul <vkoul@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abelvesa@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] phy: qcom-qmp: Clean up QSERDES COM and TXRX
 register headers
Message-Id: <177841630857.434434.12057829864554711219.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 97387503F4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106817-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Sat, 14 Mar 2026 13:13:19 +0800, Shawn Guo wrote:
> There are some duplications around QSERDES COM and TXRX v2/v3 register
> definitions.  The series tries to clean them up, and also rename
> v2 registers/headers to make the version explicit, just like all other
> versions of the QSERDES registers.
> 
> No functional changes is expected.
> 
> [...]

Applied, thanks!

[1/6] phy: qcom-qmp: Add missing QSERDES COM v2 registers
      commit: 52595824b0027d075470f7f08afe805844c1b079
[2/6] phy: qcom-qmp: Use explicit QSERDES COM v2 register definitions
      commit: 764f409b840ab400253215e765a72b903feb6afd
[3/6] phy: qcom-qmp-usbc: Use register definitions in qserdes-txrx-v3
      commit: 9dfdd6e7bebd63eeef0ba57493adee91c34ae338
[4/6] phy: qcom-qmp-usbc: Rename QCS615 DP PHY variables and functions
      commit: c834f0a69051e5db52172262dadf8f7b5ff58bd0
[5/6] phy: qcom-qmp: Drop unused register headers
      commit: 9b1270d2b85bb7ce6bbc71232375b21d8be0b799
[6/6] phy: qcom-qmp: Make QSERDES TXRX v2 registers explicit
      commit: c7cd4798fafa84581502094d0be282072851c9b7

Best regards,
-- 
~Vinod



