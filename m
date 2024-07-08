Return-Path: <linux-arm-msm+bounces-25511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDF92A80C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 19:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A976B1F21C33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 17:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940271487EB;
	Mon,  8 Jul 2024 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fK55UZXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6540C1487DA;
	Mon,  8 Jul 2024 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458591; cv=none; b=PsImXMBv4Yx8ShlGzEwelbJxyUiK177xARyNE7FuCV/Kr/IrFX6hH/KxQmeK7Tscfc+zvgbhgTUR8mclVJ/sG/frCoKHjxdo0ooHOYil/0V3FJa5BwpxyYUSrYCZm3adSL2wv/R/dRRdoYf9miTaW+NArZ5vrzO8ddeTCAavxyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458591; c=relaxed/simple;
	bh=2V9iEScfmfajRO6pwWq6LXwfA4z1jKGwXgGZ1+MBgUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGreeRjDhhivHl7iwp+PuWcXCdKAdAuoaIrTyhYzLLicjqF4XZgo2OqSi1tJLJI1dK8Ql1HtPbi4SMT3V0GV0uxWkgUUbquEVlcSpGPZpezD2ktYm+gwWgu1VdZJIq7633ByuX73SohLegwDKQT1N3Xq3Fp5E1AXi1KiJ9npULk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fK55UZXZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C932FC32786;
	Mon,  8 Jul 2024 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720458590;
	bh=2V9iEScfmfajRO6pwWq6LXwfA4z1jKGwXgGZ1+MBgUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fK55UZXZJkkbjZtilAH5bZPODoYLNJ0Zg6tjNcylA/Ty1IvUGMspUJHTofMnIsnbg
	 B7nzfhVUrEWtIHrZxfv06Eyh9j9GGI+uGp7qxAlS4XQSEiKAUDx5GQyJQcRCMy6sMV
	 0imC6KnvGoTru8CJnSER7Z8jdtlxIAkYc+UTDAY4ZfTiR0sD7u48jzgH41BBczTSSj
	 N/sEpLYRiMvQe3Fi7izO2Npk8VSxWZfmNDYFHa6hLVX+EOOOR8yUWbwNZjoA6IZPL4
	 3pIpTaPT0BHcYpTnq7+xjNWM8Ac8s08gkDQFZ0HwNl5Z5H2yagh2ENh6lOlxr4kmWX
	 xNC3tjeozOZ/g==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mailmap: Update Luca Weiss's email address
Date: Mon,  8 Jul 2024 12:09:44 -0500
Message-ID: <172045858232.89289.1192957111192055014.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628-mailmap-v1-1-a0d12ffd1cd9@lucaweiss.eu>
References: <20240628-mailmap-v1-1-a0d12ffd1cd9@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Jun 2024 19:40:55 +0200, Luca Weiss wrote:
> I'm slowly migrating my mail to a new domain, add an entry to map the
> mail address. Just for clarity, my work-related @fairphone.com email
> stays unchanged.
> 
> 

Applied, thanks!

[1/1] mailmap: Update Luca Weiss's email address
      commit: 2881fcfc8f32c536a4bf708066d6fea9ba762e86

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

