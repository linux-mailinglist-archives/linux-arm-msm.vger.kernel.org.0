Return-Path: <linux-arm-msm+bounces-57996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E68AB77A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73B8217F7C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF4429616D;
	Wed, 14 May 2025 21:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PF255Sqn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1300E1E521E;
	Wed, 14 May 2025 21:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256676; cv=none; b=o/B7J2Lrbli2JcquKo9vBoWiD099wyinkBRf2+l8Pu6vI7nrd+YsRXD8p0L+TOR92e1omBaYXMb9sa0pFIZzroDWGjrSelr+l4ZIda5Ndu6HgBVOfRY8akmtcAUsa3FZtznv8wIRK1B2FDhxUZ/rbvOrcClxx2tJs6kPuEvO9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256676; c=relaxed/simple;
	bh=i+0pCIZslCjadXi7FcFyah5mhdC4qji0JOgJHls0thQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CUqn176ep3jk10qqnLhAZzodG0t2r7fvnk3iszR81GLGnNx6bRMlb64qxbiiqdO8sRQgrQXT9DInE8hPw5ZUgZ72oWZCkHh9hG97IOEM3ZQSZ4FH+ZVUt62uZaax8s4CXNlY6MN7WuqLFKiT29c37owhnIVSUpjamYHdYdt8/Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PF255Sqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA017C4CEE3;
	Wed, 14 May 2025 21:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256674;
	bh=i+0pCIZslCjadXi7FcFyah5mhdC4qji0JOgJHls0thQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PF255SqndfExN/KvHCAy7abdWDvPArmuwqpgaUGbAvLX5P9Q3veSmq/owKJvjxys7
	 nBSDxtDpDJrYgx3pt04pxabyRP0pLlbLgLFJKCTkqxNKU00VzU8NE0+LW0SggQnD00
	 oWfiw7Ryov29gIbgomPXBkyjaKJrrrt8mifw854iVZvidHbQml2H7zqn9yf1mJqn7L
	 VN8Beg5rFZ6lYLv3yD0sp2z7ZQtvjWdTs/TMT0pPqgU2XhcxCpbMrcXMJcQeSXQYna
	 PuQA5BxeZbOlQ9NfjHe/1S5JeW645jQrCvzu9jKjG4iHfGXq3W83dD+iLLVnam1inR
	 LmIkkOmWf82Eg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-romulus: Enable DP over Type-C
Date: Wed, 14 May 2025 22:03:50 +0100
Message-ID: <174725663040.90041.15311752720809065493.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514-topic-romu_dp-v1-1-6242d6acb5e5@oss.qualcomm.com>
References: <20250514-topic-romu_dp-v1-1-6242d6acb5e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 14 May 2025 19:47:16 +0200, Konrad Dybcio wrote:
> Both ports seem to work, just like on other X1E laptops.
> 
> Tested with a Type-C-to-HDMI2.0 dock (translating into up to 2 DP lanes
> worth of bandwidth).
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-romulus: Enable DP over Type-C
      commit: 781621de1551233f6767976b44e93745ffcfa865

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

