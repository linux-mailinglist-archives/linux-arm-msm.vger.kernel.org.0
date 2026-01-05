Return-Path: <linux-arm-msm+bounces-87463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08418CF40EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEDCE303641D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED815261B8C;
	Mon,  5 Jan 2026 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJHgwgvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC85E253958;
	Mon,  5 Jan 2026 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622074; cv=none; b=HbglbuRzCS4qo4GTWdLO9Zd4+5tNYn/X0GnXLdNDbFslC93MfBVLjwIjnTGO+G7IuKuVyKWXXql4os/FYD+SSMXBq5yydNIf5WIcKcLI1ZA7TuJszhKzJkFARwY+WCz4sZp7LtDsuDdANW6Std+zqhJ4SQbUONyGkSJy/L+0AT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622074; c=relaxed/simple;
	bh=GpKZPqhT5/+YBjYIM0sYLQQ0FLF5mv7OOif+SNAqvJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lVcQKyM8fuST2dSPcdJ4akCzfpifPG3YqswkhgoxOpZ1csW1x1OMkTK4pocboeqrXEbiRawLMFv3JmdMlFp5KNAMOW7bJpB9C4G6WzuL4GpV/tDoXo43UckdgKt+wEgTp1lijE9rMBGentjscJY2mR/MQbL3ZntsWqocTN304e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJHgwgvh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475D7C19421;
	Mon,  5 Jan 2026 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622074;
	bh=GpKZPqhT5/+YBjYIM0sYLQQ0FLF5mv7OOif+SNAqvJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJHgwgvhjPYcGpG3gw67iOtVLkF9pP91IUy9aQCaeWDBiIL+n6SxAWVtApqosBJdN
	 NV8JGXX7Fwu3HKlEsCu8oRvf2gXClOeO0zD6ErKFWaEXaOo0br5CYMjGxWGjx+BzT4
	 9g67kzc5esFrPGGGnI8MeG8DOlHkZPU9j4b7C/HF3qfxYASyuQxUt/+TlwDIoSkym1
	 s2I6D5p03u53tzKQTJdh/uGMMtHX6KixWWEpSu9HfX0OV/LrZb5888VdJa8xd8IvIm
	 dbbVO707hilNjOsc2HCS/Q4I1TBw9RRLD55lLcV5/C720P/g94LZzf3KxUdlVMqPnM
	 ObnkoRnNkp5OQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v2 0/3] SDM630/660: Add missing MDSS reset
Date: Mon,  5 Jan 2026 08:07:10 -0600
Message-ID: <176762206410.2923194.11336536929752993764.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
References: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 16 Nov 2025 04:12:32 +0300, Alexey Minnekhanov wrote:
> Since kernel 6.17 display stack needs to reset the hardware properly to
> ensure that we don't run into issues with the hardware configured by the
> bootloader. MDSS reset is necessary to have working display when the
> bootloader has already initialized it for the boot splash screen.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: sdm630: Add missing MDSS reset
      commit: 0c1d1591f898d54eaa4c8f2a1535ab21bf4e42e4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

