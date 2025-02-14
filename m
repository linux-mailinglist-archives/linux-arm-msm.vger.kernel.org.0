Return-Path: <linux-arm-msm+bounces-48080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAABA36870
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4E447A1C0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FE120D514;
	Fri, 14 Feb 2025 22:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJ3s9U5/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A75220D4E9;
	Fri, 14 Feb 2025 22:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572719; cv=none; b=Hj2Ho5T1GbcYiZHtvMrXkXngXmsloXYqOmQqF7BpxsCkOPoPf696xBij7vySj8FDeD60COLdwalG7e6t7GU39aaGA+7hPSbqZsW4sc+LiJovTaFTH94HaX7GwFmp24nT2/lnGsPoSH+TvaEh3m7VheZFK+4+jYJxDJx1BiP8Lcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572719; c=relaxed/simple;
	bh=xDRjkoq49fN5QWGt0b9QSpCT3PtKMrVhMm1SOfpdKPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uIVcKRzXB45WqUmQzs/7w6l+hsYOIS5qXhlLYlxLPgBMt33ceaQW30P6P8i8axfHsXR82oyTzhmkNljHNCc6OotrbkKiht7zYly/wHtXscAiZV3/Kg97JWDf0YK/aBGCwpvisVE50uHXXx1SvJbnX/kB61hF6a+iqarkg+A24yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJ3s9U5/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17E7C4CED1;
	Fri, 14 Feb 2025 22:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572718;
	bh=xDRjkoq49fN5QWGt0b9QSpCT3PtKMrVhMm1SOfpdKPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJ3s9U5/xVLvrhJtrVAICAfzHIe2IbNIe5GMogNRdg3ZcY0o7aNzJEHbiGYoI3StU
	 +k9+8TXx/T3qxUF04L/KDb7ZavvUvulC6Zlvq/Qs8fnZIdqSDD5eGAKYf9hci+qYlQ
	 p7PVC3PcXssZFPxOXyDGoaFJNT7TG1WJ0AGznIdskGiPCt5eULKnlG557WgD16OBfT
	 CDneEeC8mLQl1kGMdZeE2uj+N1KP8xaUEes8PCluqetcWqRGzDXT5ec7d8xwE1489H
	 QPIHfOO86bjAad4YI1ePesUYA2D6MtvFFSV2QGLsERNFBAtxr6jO8c+oK5jt8x5tZh
	 1lqreX/89+kKg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-branch: Fix invert halt status bit check for votable clocks
Date: Fri, 14 Feb 2025 16:38:21 -0600
Message-ID: <173957268925.110887.10413617559768642492.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250128-push_fix-v1-1-fafec6747881@quicinc.com>
References: <20250128-push_fix-v1-1-fafec6747881@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Jan 2025 17:08:35 +0530, Ajit Pandey wrote:
> BRANCH_HALT_ENABLE and BRANCH_HALT_ENABLE_VOTED flags are used to check
> halt status of branch clocks, which have an inverted logic for the halt
> bit in CBCR register. However, the current logic in the _check_halt()
> method only compares the BRANCH_HALT_ENABLE flags, ignoring the votable
> branch clocks.
> 
> Update the logic to correctly handle the invert logic for votable clocks
> using the BRANCH_HALT_ENABLE_VOTED flags.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: clk-branch: Fix invert halt status bit check for votable clocks
      commit: 5eac348182d2b5ed1066459abedb7bc6b5466f81

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

