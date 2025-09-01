Return-Path: <linux-arm-msm+bounces-71429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB14B3ED0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBF5617A9F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7217932A830;
	Mon,  1 Sep 2025 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="og6gHGt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C60F32A82F;
	Mon,  1 Sep 2025 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746495; cv=none; b=stBCJMSFarqZQIv41OqXIia+HSIS5sAjxp1wgsOBH2zUw0jkkgOuYcLw3OcLRWWXgUx3pe1PvDuH8KZEVaxKN743TCMxsXkdLipSuOC9Af68tFd7ota9WGG0V4ALNCcRj6zheonOmmneC2m7IRu/3P5RBQKYjwbUENQlK3tOK9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746495; c=relaxed/simple;
	bh=MiVG4h/2NVBHx9BEN5kPBdeZYBqJXTdPTqvwP13klQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lgGbSR+dUbn5jI8aKP58itUzVlCrepTkASMT+YznWbyBdjq5+HyvF0y0Bk+zM1GQuh0ZfQEOEakUEN0pS3CXnPzbXOTbenIAwigwv537k1vJmvpU6Ns6r+hyQdtEMMlMRsSFNB1bHjzPkcb7MDwSavHgq+a2hbb4cxXfsDXP2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=og6gHGt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5311AC4CEF1;
	Mon,  1 Sep 2025 17:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756746495;
	bh=MiVG4h/2NVBHx9BEN5kPBdeZYBqJXTdPTqvwP13klQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=og6gHGt/xEbqzBNs1VQk1T42/jrGlpFRKMToGNkBgJp0YOxEsfs3nKjF8kCJ2npzT
	 eie7izspfEMD3oQreiqFUfuyfpAoehlZF00kh+oH2gcM7UooMTuzPWF5VTLd2Bo7i8
	 Oqm8+ChP576ayRF7I1t7uoLOvEQ7MVzAvi1JuT/xzYetD3nTafKSIDZuN0BCG38rJL
	 kT4YVzsro5jkY0S6kjL1CsB0FGnDptlll6gkBAVnub+DUh+vxVbw+6BFYTWPKULd3F
	 EEfZcYDaM0CQGWSJxQe3jRl1f9bjzNkg+jYiKRp+RLvVBo3m1W+V2KizILZ7CdSS8w
	 5xMCFN7oKxBWQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250826105254.3758803-1-prashanth.k@oss.qualcomm.com>
References: <20250826105254.3758803-1-prashanth.k@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: Fix the error log while enabling
 clock
Message-Id: <175674649286.186496.15257522918572986509.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 22:38:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 26 Aug 2025 16:22:54 +0530, Prashanth K wrote:
> While enabling clock, we incorrectly log 'ref clk' as 'cfg ahb clk'
> Fix this since the devicetree bindings mentions it as ref clock.
> 
> 

Applied, thanks!

[1/1] phy: qcom: m31-eusb2: Fix the error log while enabling clock
      commit: 616fe247bdce4e3a23e3ded4b3be951001ed8039

Best regards,
-- 
~Vinod



