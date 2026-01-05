Return-Path: <linux-arm-msm+bounces-87481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 594BFCF413D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B07F302BB96
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D94337BB3;
	Mon,  5 Jan 2026 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+Q6qas0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD3337BAB;
	Mon,  5 Jan 2026 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622099; cv=none; b=rwGJm9wsbiLWwpaqrhHqpSH11Vbr5Jh77GTqnlHRAPyqBhY/R15O8wUCNAlgvy9nXI318pSOSr4t5xGM3aEePmpyY11dnox6MY6xmlMBYXI6WN0fm7ev5ZBptTQEP9PvDo56mANkjvodZxVsZIe22enBVfUoglzVjDcvwSV8V1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622099; c=relaxed/simple;
	bh=+gsM4tZBW+duEJ1CNrXpEyjGX+4OF30WvH6kUiXoNiQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tHZYVIsoc4XYoSbUz3n6yGqKpg2t9jNT2kdUvj3nmqib1CfV5FyrVMc3hkIgLY6wyGHRkPXZybFNNDl/Y8bexIJVnNjplJiKx1GYcXriLBbstfnSEXXimVcE1JZeZTyP30n57aC+QGAzg/rkHGfpaCAPp5TfPJJO3l1Hjuf2Qjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+Q6qas0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AB9C116D0;
	Mon,  5 Jan 2026 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622099;
	bh=+gsM4tZBW+duEJ1CNrXpEyjGX+4OF30WvH6kUiXoNiQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y+Q6qas0IL8QgC9RbomZYmuRiq6UIW47LjHZVyLHB0d0+a9Vfn/cg3oJgPW3Vo2Pw
	 u8HsgexYrmB4jtCc+AMPvVEq4nQwuOiSQknAucmBQG0B8CQt+/iqLwmQr8d41hQdg0
	 sQvmKyH8lr6y6sq3f7vvLWmQxGYi8pgl1MOrXAZSU41NPvDXF6wRK0r82GicVEHSti
	 NC5adXMEC0arr28Mbw5ufSrgT6/dasNsMQnGEcW++6AmF9gXAOMrwt34lagEKkZBgh
	 d9Q1tUCpTMqL50SXdnEJEvmceWU/i/5B1sW9ZwrT3+QwWTr71GOi+RVatovUlcJrzW
	 cdOkc0gp53W+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: videocc-sm8750: Constify qcom_cc_desc
Date: Mon,  5 Jan 2026 08:07:28 -0600
Message-ID: <176762206392.2923194.13091505187833672085.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Dec 2025 03:06:22 +0100, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> 

Applied, thanks!

[1/1] clk: qcom: videocc-sm8750: Constify qcom_cc_desc
      commit: 77d0ea71b30bcb9f06d36a804542851081d4da3c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

