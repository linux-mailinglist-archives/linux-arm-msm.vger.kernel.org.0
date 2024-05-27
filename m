Return-Path: <linux-arm-msm+bounces-20520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B82328CF7E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DAE61F209AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FC313D28C;
	Mon, 27 May 2024 03:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKad2anY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13A513D260;
	Mon, 27 May 2024 03:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778883; cv=none; b=a26GYLL1jMY3UdR1RqY5LP3fmpzHzd+GeQBiqMGOAC7wWpTyJgD2G8lJbPciYBVAuf4/Yags5bk7Vp8Gt3KhJ5OQjuTTcROk2CTIt1YZZHf9dives6b2rea6t+saU00AdoqkdB1x3Q0qs5tP9xs1WQ1k2lRFMdpr6fArIwgdLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778883; c=relaxed/simple;
	bh=5BfxkhujCg/EybUvYnTYa0ntOh9c5oP1K3sKp7Ab+mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NuNZP5UKTZQi/E6Z1g5V9cr2qD2jm8sat4IOhfbGA5Wfche8mdvqpYU82EIn2R2OT9rc6vvEL6A0U2oSiy87H6fjgpERYHWmb1Ayar/2WOgR1gwXpNaldqPoRbh2xU+q8sQ8nYmFq/VPmHZUgUGhbYYHn6nw9kzPp6Pd2dY92xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKad2anY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E38C4AF08;
	Mon, 27 May 2024 03:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778882;
	bh=5BfxkhujCg/EybUvYnTYa0ntOh9c5oP1K3sKp7Ab+mI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bKad2anYgmXXqQZFYKb0ievGAGIB8O4vBNUzeOJ97RilQKUGOLVmz3VTG5BMQ/L1e
	 CKp923pYTulqR1Cya5CwQbHUkEZJtTwCmuyW72vHDiyTi+Xn0v+I3xaaCxbSfT4Qys
	 gt0f56W5XQual6bvjcwWj17G3NCKc2yKQ8C7To6exOkDKlsonCZRFA70tmT7mIidM1
	 qQMGtMFkFRtip/gbvxIQFRadRHGgtv1soHTJVfhauOGvwUoKwAw5adnKMP2pnq8hEo
	 RIDCM8AfU/p6yiike0fgwWb7cmPhbq68SholQLVw1EFHrw3qLd4LTyx5W2DK1BvaTR
	 iYsGP+w/INJSw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add reset for display subsystem
Date: Sun, 26 May 2024 22:00:46 -0500
Message-ID: <171677884193.490947.12306600950596489908.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240525-mdss-reset-v1-1-c0489e8be0d0@gmail.com>
References: <20240525-mdss-reset-v1-1-c0489e8be0d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 25 May 2024 16:08:57 +0200, Barnabás Czémán wrote:
> Add reset for display subsystem, make sure it gets
> properly reset.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996: add reset for display subsystem
      commit: b3f8cdef8a5c0bc89ceb1095856f64ba7445c6b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

