Return-Path: <linux-arm-msm+bounces-20678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB18D12A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FF291F22288
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3A03FB87;
	Tue, 28 May 2024 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmZBDBrN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5CA3D0A9;
	Tue, 28 May 2024 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867165; cv=none; b=mZKSS4KRFBBQWEppGuC39rT0tqhjVdJ1Yxf+eWk5koCMuFkXCJjNQF1iCHRzBXH84L1OhwZHSsJC5pcTdq6Y1vJphJgQ/bU80w6EReNsOod15jyu42dr5VAqMmhgzUEU3WYAuGT5303F4fvQCWTGK3t7gjXf0GnVD0bvrn+Ekr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867165; c=relaxed/simple;
	bh=xqR/ykcZzXNkdbRAVwaOEVJjZcLA5foqzYOMf+83rms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCnsOdGOfHgIx29UwajsmSn90t0qAIhDkjsDvcH4fKym4EHhfS/2FAGkjbq29NJaOxtz7QNF4CFZb/Ao/IJZ5NgGHcfXyrwtzVUxNmVSwphhn9bPj5m1rlP+AfuRm4Vn3eLE+qezS8t5EmppBvQ+X7ADlURYl5JVqj1pZbLDkjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmZBDBrN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238D5C4AF0B;
	Tue, 28 May 2024 03:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867164;
	bh=xqR/ykcZzXNkdbRAVwaOEVJjZcLA5foqzYOMf+83rms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mmZBDBrNKQm3zt7Pe8UoX9j5lLUXnwfztoqCOR9CvpvDs4v6KbUMLiMIPJBkCeJBX
	 g9vdtlag7iUoce6LLJvw6vRsjDZ+wxMRPxKRox/uUXe5xi6YUojT0xVXboqaJwum73
	 bmN8OCYXGzL2M+AZ7Z5dhBk+xPf0lf/zc059mWHA5MtDVj1lWMSb5PetssvNMzpnmM
	 pOWLOexhunyqsGom51iATAM/CQPEzBpNqj8cPPScD1646hkaf2V1+xPLr1E/48zT7Z
	 XrGvJR9Y8BGEPeMCBFhJz68iAqoMwILCfYCKws3NDbaXe51wz2YPKbO0UawOtkJWV1
	 vtpdeR/vLhQuA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Constify struct pll_vco
Date: Mon, 27 May 2024 22:32:11 -0500
Message-ID: <171686715155.523693.8017271555149377998.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <c3c9a75ed77a5ef2e9b72081e88225d84bba91cd.1715359776.git.christophe.jaillet@wanadoo.fr>
References: <c3c9a75ed77a5ef2e9b72081e88225d84bba91cd.1715359776.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 May 2024 18:50:00 +0200, Christophe JAILLET wrote:
> pll_vco structure are never modified. They are used as .vco_table in
> "struct clk_alpha_pll".
> 
> And in this structure, we have:
> 	const struct pll_vco *vco_table;
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Constify struct pll_vco
      commit: fcd9354ceb7ae52b11a93e8ac990ad4a8c3a0da7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

