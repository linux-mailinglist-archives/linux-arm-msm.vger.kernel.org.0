Return-Path: <linux-arm-msm+bounces-68584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C633B2191F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A00D621894
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EB41F12E0;
	Mon, 11 Aug 2025 23:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+HwHJ5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04BB199FAC;
	Mon, 11 Aug 2025 23:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954836; cv=none; b=bggwMv59Yz+1Pt8Bujh8oOgGMm/m1otHrPHh0hEm1BJclBORzfs0ZnEE7iezUOew6D0/ZD55Hgkaf6LKerLLdM8R83Z4yQfMWUW4alsudgi7r90YmVinpDTw6gcIoBF16efEu0JO9kvgr+3//ZR2WSwdl9kMUZFXZ7OwWiCFmhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954836; c=relaxed/simple;
	bh=RJtcD5Ti68xAnNSzio4G1Bb7ZDo981QAocOAX23eJb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uu7wNPXj7Wf2bbKxQTCmpJXUv1w0BkWg0/GDbf1HayBwhQqScQ0qLUN7EQ3QEf9RbQWSeUpAoBSdVe6N5pTQCSkw9JlEhoC1ai2gLz0IgnnadKe6pBWJy/AmIv3fnOWGSKqt0Nm3Wtx/bqy8PhglJXCRaEznzVXW2X5jtRsQNto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+HwHJ5I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A1AC4CEED;
	Mon, 11 Aug 2025 23:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954836;
	bh=RJtcD5Ti68xAnNSzio4G1Bb7ZDo981QAocOAX23eJb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+HwHJ5IAJkxdkIAbSeHh7NHYZBd2jL4z7CAmRYj+kcA+KnOlaTY78RsEjQwZNX2y
	 qqWRNJQk8tgnAqgKXyi5DIxHgcfQozBV00kNWiJUbC7oTgbzOnsssDJUMVZvarW2jY
	 /YXReD4OqYC57NlkcqBntk02QGUJD6a6znfHGF0NIyNr2M/9/FL494jHGMAHJa2jhW
	 EF5RERMVehuARbLHz+qDVEOtgotEk9h9pgKHU1gDKrPe71oNi4/VvtV9btphwJV6+5
	 +wUCG7J/gCC3Woit43B3cG5fJPew/wQIdRvR3ct2h67IzUg4goR6e7JRe/bPpTBbWB
	 LS3EEAh4nR5Xg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: add PRNG node
Date: Mon, 11 Aug 2025 18:26:52 -0500
Message-ID: <175495482435.157244.9166061651621835817.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721-ipq5018-prng-v1-1-474310e0575d@outlook.com>
References: <20250721-ipq5018-prng-v1-1-474310e0575d@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Jul 2025 10:30:46 +0400, George Moussalem wrote:
> PRNG inside of IPQ5018 is already supported, so let's add the node for it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5018: add PRNG node
      commit: bf258fdaa2bcbafa04bf1ad646e8ed42e13033cb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

