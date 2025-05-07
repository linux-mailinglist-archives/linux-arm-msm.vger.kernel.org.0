Return-Path: <linux-arm-msm+bounces-57050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAC1AAD520
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 515E8172EBD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 05:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4451FDE33;
	Wed,  7 May 2025 05:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjmC+Tq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D41FBCB5;
	Wed,  7 May 2025 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595096; cv=none; b=FT9hgOs+EBKaGatRTCfTCTxes4ZTy5e6SEeng7sezlqju2faCyiq7sl3/NypWDoM+gQVB8AXE8vUthhUSLPkHJ60fAyGRctimf1zroKZCPErNTihqbBCFjCqMbGfGx2nEY9xreXMnjWrRfs6ivUqMi5fwUDCP2mIxRUpwdt93iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595096; c=relaxed/simple;
	bh=UquCdZvdPRvkoE0YDWtC9ZbYr71b/dQJaO25rDRHUVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qo7MQ8PUaFwBOtESKTyc8EzKYDLQwZQQqK74QfkusdblOE0BCGSL/fy4MXvnCZvmn9isWwaJf2NhSZWs7QozyaAtHpCw0eulcVnzkDtjB8Lw0AMPaKOsgTPsVBm9ZvDGpcqV2niGQ0UcPt9nSHsWlgnR8TqblmJpq6OEbgEZjlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjmC+Tq0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BA9C4CEF0;
	Wed,  7 May 2025 05:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746595095;
	bh=UquCdZvdPRvkoE0YDWtC9ZbYr71b/dQJaO25rDRHUVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YjmC+Tq0huOXaDpbFaofHPAuBr1f3Z8LcRc351hDUNW+MAWz28Ogka31tN+KrxvcM
	 rxwzKlvng8rlh4WSSS5sz6mgresGlKC1gYCz/qFb5BrMpzilR6VHVbUyAEEZQzTNKH
	 8dk0bQqNUCU6XPwsUdgArxBToZdqIu4BMZwsaeHTxhXaNXuJEJpCJCIZYvdxSs+juj
	 RLHIeOQ0063p4fMLd7SoyOrgYUeW3+4aSzktzZRWrFfFZ3O5gN9gIOyCqlDnQCtg76
	 okzE/fsdQAM90MeDBrk415T2UGNXiy5KLSdynS3nxFPyPiB8/lEN5NO0QEZl9PWpzb
	 TN4olLsfsKgYQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ipq6018: drop standalone 'smem' node
Date: Tue,  6 May 2025 22:18:07 -0700
Message-ID: <174659505803.5380.12093322197061572732.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506-ipq6018-drop-smem-v1-1-af99d177be2f@gmail.com>
References: <20250506-ipq6018-drop-smem-v1-1-af99d177be2f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 May 2025 15:37:47 +0200, Gabor Juhos wrote:
> Since commit b5af64fceb04 ("soc: qcom: smem: Support reserved-memory
> description") the SMEM device can be instantiated directly from a
> reserved-memory node.
> 
> The 'smem' node is defined in this way for each modern IPQ SoCs except for
> IPQ6018. In order to make it inline with the others, move the 'compatible'
> and the 'hwlock' properties into the respective reserved-memory node, and
> drop the standalone 'smem' node.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: ipq6018: drop standalone 'smem' node
      commit: d8b462c44a0399e220a44c81cf562b909448bada

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

