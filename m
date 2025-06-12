Return-Path: <linux-arm-msm+bounces-61040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E329AD6658
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B15103AD323
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375C72B2CF;
	Thu, 12 Jun 2025 04:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvx+gSGj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD892F4321;
	Thu, 12 Jun 2025 04:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700855; cv=none; b=FecjSR8lQOBWamtMSOal9RFrnm4QTTKddT8wSP3XzJUM4raVF3U7842rrclYIE0Vv5iFvKYwpL9Q7TTGp2hB4A6t7IwvDZ4/W8iU/dFp2eN0P1XnRfonikY+snbj1totH/kCnoelVAjq5rys9Q8YhHfsiei5F48kvuCGCe4/SiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700855; c=relaxed/simple;
	bh=mz2ucRVIwB/L/SqWdSybuRAOphTiphXBWZwiEvEMGII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CI5x0iaCQ8ehZgsApLgiw8VLOE0YsHVu5NxAaU0saeKr5ZULJc+OuXljXhRpchqB+7fWNXL5e62h4mVtQqUa9jG1UAZ82uFbW98IrjIgnNEOcnMTcxNcZR7u9d8ZF//qVo/N8DHhOLL5m4xzL5pnhrjpjYP2wuOjqfD+E6NFIFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvx+gSGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C361C4CEEB;
	Thu, 12 Jun 2025 04:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700854;
	bh=mz2ucRVIwB/L/SqWdSybuRAOphTiphXBWZwiEvEMGII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kvx+gSGjRIoWdvm8i5SbrmJAGs8P+t1fqoq5G6z952YQahbrdaUCKD4XCaFk3qQEL
	 mzMMrXgvUimUpcKl6cmkVvZu8w+6NiRGVWjJ/qky8z+DqLC0KWZUum+PFPF+3sAuJ0
	 xPr7ZstiL+rW8iOADVH/2JqQ6cXB1cxTwoUnPPbLidKTL8IEDsUYWQPxFrGbU4OJPQ
	 oZXr+bh26djhv8ZX/JlGoXWL1exM+GRboaeFYoaBs2l01Bc0hWd9AEdK693jg8V3bL
	 Dp3Dbjx4wcuhdRboFOBQoZM6sbYplbFAFxPfdAatfxNrbJ9T3U4YdTd2/9KGFjSZIO
	 MFPj8OLy1ltTw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm CPUCP mailbox driver
Date: Wed, 11 Jun 2025 23:00:34 -0500
Message-ID: <174970084177.547582.1881380220654294150.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
References: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Jun 2025 19:06:06 -0500, Bjorn Andersson wrote:
> The Qualcomm CPUCP mailbox driver needs to be enabled for CPU frequency
> scaling to work on the X Elite platform, so enable this driver.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Qualcomm CPUCP mailbox driver
      commit: 3871b51a684275e3a47fbebf93c0a0e7a05d7f9f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

