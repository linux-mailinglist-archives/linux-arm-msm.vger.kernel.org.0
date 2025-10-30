Return-Path: <linux-arm-msm+bounces-79756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8CFC21D03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 014BC1A62F65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADAC36CE05;
	Thu, 30 Oct 2025 18:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxBvN+Uo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F8B36CE01;
	Thu, 30 Oct 2025 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761849820; cv=none; b=BoOSJGjiBHNtmEtYvOA8BYX+W7P/TmNdg4nVe6aOCZSwS9CkFNgFy52t1NcO5WnuKnQDjqg6uhlj6gh6ukOXk+bwwSQS2VwsIehBiuTmR7Lt45iX/mufH+8Gqv/sInvT+/aVnlgEyf3NhJFqybHQ8jqVdsVYVRXki3J50Bklgf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761849820; c=relaxed/simple;
	bh=qG1iWQilCe3pH+ADxoWs4kyzuTQFC5m2usxdWc+gcOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XXERuTQ5Yib8ivlTOknYPRZvgebZ+9OQvF/H5ziJVsJKzoU0TgP4NjoSXh4JsD8B6GSYTUhC/qD0Xp2LZbLNEvoMaO6fjZevdw2qs/k7Bw1po/Gi0tx3VneSZlTLrhxfRO9gPheULMcXrYwlZY4z14GiplIv/dmvUNDziY7D0WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxBvN+Uo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D45DC4CEFF;
	Thu, 30 Oct 2025 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761849819;
	bh=qG1iWQilCe3pH+ADxoWs4kyzuTQFC5m2usxdWc+gcOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dxBvN+UoCIsEv6pjqDJbQgnM7Sb0aSvFWn1G8esNXyGVr5vEduOykTo96STcJJdq1
	 zDcdru5/8jPgMZ2BMKTHobnX/cTtkaUz570onJlX3iS58wHNWImjufwZBtIkWsM1bi
	 DcLvkjn0qwZGx1Y9WLVfoGg+M9JV3M7p0JeduCuCLX+S0pH+b6+8gw4U5N5J7TnrZ0
	 5zeClEL/0UqDdO3hLygNxY1BWgu/ZlkcBr46atJFlMS8P5HErTqfmdWKb2zAIF+qFa
	 YxmEzAIYVQhPkvKqrsI4RIVwD2dC9cIjn91vBV2I8/Lvt+/BqVKila5lxx/HNqgbLD
	 PgyFPmUV6HfYQ==
From: Bjorn Andersson <andersson@kernel.org>
To: bjorn.andersson@oss.qualcomm.com,
	arnd@arndb.de,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable SCSI UFS Crypto and Block Inline encryption drivers
Date: Thu, 30 Oct 2025 13:46:47 -0500
Message-ID: <176185000291.492730.2834174368528484319.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030095509.5877-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20251030095509.5877-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Oct 2025 15:25:09 +0530, Manivannan Sadhasivam wrote:
> These drivers will allow using the crypto functionalities of the UFS
> device, like Inline Crypto Encryption. Both of these drivers are of type
> 'bool', so they cannot be built as modules.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable SCSI UFS Crypto and Block Inline encryption drivers
      commit: 5f37788adedd2da5475d6b1786295c07faf3d718

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

