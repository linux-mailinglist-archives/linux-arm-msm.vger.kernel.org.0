Return-Path: <linux-arm-msm+bounces-51553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45097A63C2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BFCB1889018
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC2F155316;
	Mon, 17 Mar 2025 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oO2WlGh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60106433A0;
	Mon, 17 Mar 2025 02:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180165; cv=none; b=m6RcB2oRdrpZxYEVUaJtYff7HKq0l+3F63S3wA3n2FCgUgZ4k7FMV3B0O56qvY1MMtZE50YVJ+BLPK6MtetDzV+EHa7xY2V3ufZyHozzQhZ2NRQttqP26fT6XEIEjYqU7Ks9bn1eU1XfpdJI7Mpuh4rUvzF3ihkoAHfe6T49Zig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180165; c=relaxed/simple;
	bh=v7djMlU4UR00JbjnJzB3bQ0/Wjh7rqItX7IuQSXFbUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qAwT/x2BYgVjKIBUQ69BbN9+gT/XjqHJf5VZ+YydBHmqFJIHgmr0+Y6pM0rL2ipqHCqv5KqHHwnI3bQEd+UVcVZds2szcTYnFheybS4Jmp/x4wt9sTt7h0PBZxp20Wovuoo1bmj9FzzT63GUM3V2jA8CJrM/h9ascFeCozPtMJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oO2WlGh4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EE6C4CEDD;
	Mon, 17 Mar 2025 02:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180164;
	bh=v7djMlU4UR00JbjnJzB3bQ0/Wjh7rqItX7IuQSXFbUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oO2WlGh4FGtcNAVUqsrc8i2rHn4vh3fkbr6Leh1J9z62rEY9GGBAJAg/Budhv4X6q
	 ztj53yvPXvK0eFqHf7nvFE42uDXy6rfvbpxeB9EYUZkuKC3op1dE7SAyqDGqA2/H6y
	 bwsZOlIq5HPG2A597L9i9aM9+2KV9uDd0HDO+p1oZM5z87cI+h7i1MQi5/8oHV3xX/
	 WGvC5DQwVV2NiuSoaQHa1vbgMecN/b16TtrVVJ07zvxoSNudsR5FnN4ZzuSSshy9x8
	 BIzEXA3915ag8bHguzZwRLiNfyak3mfOAXnifjzeW6eOZJUYVy9ret75M4/ZS/sTwE
	 oS4brmEn85J8g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Adam Skladowski <a_skl39@protonmail.com>,
	Sireesh Kodali <sireeshkodali@protonmail.com>,
	Vladimir Lypak <junak.pub@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH 0/2] SDM660/MSM8953 Fix video core clock status stuck
Date: Sun, 16 Mar 2025 21:55:45 -0500
Message-ID: <174218015905.1913428.16606364311478799852.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315-clock-fix-v1-0-2efdc4920dda@mainlining.org>
References: <20250315-clock-fix-v1-0-2efdc4920dda@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 15 Mar 2025 16:26:16 +0100, Barnabás Czémán wrote:
> On SDM660 and MSM8953 video_subcore0 and venus0_core0 clocks are stuck
> at off. This patch series fixes them.
> 
> 

Applied, thanks!

[1/2] clk: qcom: mmcc-sdm660: fix stuck video_subcore0 clock
      commit: 000cbe3896c56bf5c625e286ff096533a6b27657
[2/2] clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock
      commit: cdc59600bccf2cb4c483645438a97d4ec55f326b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

