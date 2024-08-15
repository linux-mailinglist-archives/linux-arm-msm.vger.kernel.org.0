Return-Path: <linux-arm-msm+bounces-28672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0CF953B8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 152A81C20D2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB5B14A639;
	Thu, 15 Aug 2024 20:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEUIJU6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7037914A60E;
	Thu, 15 Aug 2024 20:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754458; cv=none; b=r4cQ3fmFd66/kLtqjqfRCoaKEqZQNJNTs5L0HpLIUZgKSFPCehVr3EDjzuE0xmPX5mTLzT212Vnl/7gNNSydlGKQRh3e6xb6Yq1Ws1BL43yHaT5mYfs1b81s+ovEBU//WMF3oj8jFpirYh+gy0FD7sam071xwW7MoGj62ivGOsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754458; c=relaxed/simple;
	bh=kDqArCdqDSEf/1Sbcq9yNaZLrEHALH3grwP5IWizFeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OatP550rPlftO6ZRLDYyhTxW65bTwz9SQkMdLphd2IDO7s47unjaCvgoDAwFBBXZh+WcBQkH6SR6yS7UTkb/dPsQgpPG0vJxHK/7iVbqNZkKOlt2WTqNeuF6bQKrujTJ26RxBVaADee1FjgW4ru+M1HKNvNE6HzvQNOSrlbJPk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEUIJU6o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721C2C4AF0E;
	Thu, 15 Aug 2024 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754458;
	bh=kDqArCdqDSEf/1Sbcq9yNaZLrEHALH3grwP5IWizFeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VEUIJU6oqqwwkyPu4FelTkAolMYmsfq4nxXJ+nOLe6/PhE5wcfuUnGpGImw3r6Z6L
	 6eYSP+z5J1qOqIEswwOUGIFWxQiyOnHIvaxrtvYCtm2WuBguM1vQq/LELg+6dAxmZv
	 nnfQlDafDCU7EczxA1pD9rsbWdVIFM3Yn7t8ESElNzIo9YaqNZFJSY6B9rRe4pjLx6
	 CqV7ssSDgJWLj3b9QOirvbwiFX3K2/F0poT6E9nKDhsx4uTsbB4EskUI/fxx+f692B
	 yUiS+tW+PRGG9KxJJX7Lv8gUjfPaoTUI5syxZmBLBo9IDG4etXz95p0CEUPbtCa4dF
	 DfTOlhEsFrtsg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8976: Add restart node
Date: Thu, 15 Aug 2024 15:40:18 -0500
Message-ID: <172375444831.1011236.17365529439872662763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807-pshold-v1-1-0fa7927e99ce@mainlining.org>
References: <20240807-pshold-v1-1-0fa7927e99ce@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 07 Aug 2024 22:33:56 +0200, Barnabás Czémán wrote:
> Add a pshold restart node what can be found in downstream for
> enable to perform restart operations.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8976: Add restart node
      commit: a13676eac29c87518d3894e032aa5943844eb116

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

