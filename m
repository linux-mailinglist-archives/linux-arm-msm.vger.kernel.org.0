Return-Path: <linux-arm-msm+bounces-23507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C49911B0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53EC5B23EB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD5516B3B9;
	Fri, 21 Jun 2024 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmFy5hZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA8516B3AA;
	Fri, 21 Jun 2024 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950299; cv=none; b=Re0M1etK88Ric3lcMSlYrGYOxWBB/m7Hi3zqNOO9nh66EqdUPgJJbiPH60Thk76/5sBTBjvUG8vX9gwC2b2haHFXQ6U059Ixfl1Vs84LvYdsROb0lvpiFqgLQtQLyyeIio1HrvFurIVpK0/OLR7DR0KEqIXlazqke8TMJBykjvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950299; c=relaxed/simple;
	bh=/PXa4wKm47IBCNzQncXGB4SQlNPgnCeArtsLDhDBDok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdRV/Kw8nQ4HikXEIMeUNYM1SFDxiQVSqEMO1PpdpJUGSWqwocUv5IpXOLpEfic5MZxmERAEj513JeWug2tlOVAvOAny4OFHuH6osZcHmUGLPgDVKn6gsdAxm4enj/L+4oJ5IcrmhjnfIdMzPhL5OBhqr00BlFvpExreyGQ9fb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmFy5hZs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28990C4AF11;
	Fri, 21 Jun 2024 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950298;
	bh=/PXa4wKm47IBCNzQncXGB4SQlNPgnCeArtsLDhDBDok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OmFy5hZsxf/Zci8chfb+1uStjcAhHjDIQy2noog5nuhI90nxu0BkSPdVS23lrUAVK
	 VjZU+gijxFtAUyMz/BnijNKglFNWBqD3PH0uWwGtVFZH6qiKJYasrYUDrNJ46TzCec
	 2i/Xw04Bsjxadfd9iiY9ORl54kbpIDJz9zHAnQ9VCmIA+mtXFuP64JokS6OGF06mpw
	 qm8n22UkWUFWNGGRrIGJhK7jdiQrbJcBxt0F2M+PO5P3Y46TceH1NizFLa62iWmtE0
	 rzLLeDHjne2OP7f8oxrAvY3ZJF0I9AXrVrnaGVEM5p/7pLwXl5MQH8MMYsZW6JZH8m
	 ciVtl0OVtHUAQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: qcom: select right config in CLK_QCM2290_GPUCC definition
Date: Fri, 21 Jun 2024 01:11:20 -0500
Message-ID: <171895028807.12506.17240836109447013831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620201431.93254-1-lukas.bulwahn@redhat.com>
References: <20240620201431.93254-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Jun 2024 22:14:31 +0200, Lukas Bulwahn wrote:
> Commit 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
> adds the config CLK_QCM2290_GPUCC, which intends to select the support for
> the QCM2290 Global Clock Controller. It however selects the non-existing
> config CLK_QCM2290_GCC, whereas the config for the QCM2290 Global Clock
> Controller is named QCM_GCC_2290.
> 
> Adjust the config to the intended one.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: select right config in CLK_QCM2290_GPUCC definition
      commit: f8d1dca6c44dff362102b1f535b6dab552edb760

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

