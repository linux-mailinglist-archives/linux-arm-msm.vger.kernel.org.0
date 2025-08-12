Return-Path: <linux-arm-msm+bounces-68622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3CB21B51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82C30620729
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA0D2E425E;
	Tue, 12 Aug 2025 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfoApEwy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832332E4256;
	Tue, 12 Aug 2025 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967898; cv=none; b=K38ynHEMlFvnYWmR1vjZ/Sh4SVhUE/8tU1ft7N9dzJhc4n45lmjTK+h1gg61gdmDm9/UH3oZ++zSZFok4tIX4pVq9gAcwGIL03+aTmLzCbcib55TaHUW5VpuByxJS+JDc6fNrduYn1dGA57O6/e/A1EH6Dvr8QduNfcc+1x99HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967898; c=relaxed/simple;
	bh=1d29raijKfgWHD5hCxW0vbmlPpycZRFj22wMOw5cebc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDxY41B9qO0GuBAult4WggvYsMUV2qdMXB4qJliQ/Qgny5HBRFayVIu9MELxnoNbSjaqYc/0UILKg3axjGaay7WwBr1ioANEjYjY00pIWA+NEr6Ab4KtsYwPbG8KOcZi4p3DpO+RYfjh7ICB8VLgUG15G5I32dEXF9QifQJqBU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfoApEwy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ACCC4CEF6;
	Tue, 12 Aug 2025 03:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754967898;
	bh=1d29raijKfgWHD5hCxW0vbmlPpycZRFj22wMOw5cebc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nfoApEwy13s4DqPxHcP9FNk/+hF4on+mmb8pjXXhHn/ePdEwh8cGzBYPKATCfHdQG
	 zfqT42XzNgsV9snc8vhoHf45L9n/Lqry0m4DqUhef1xjTUel+iR9sbGx/GjnjVnu0Y
	 yk9HSntdeErRjG/fO9BiisAGOBe4a3VwQiRXEDCj7dX9173RR0u8YSeiXzekB5ntGc
	 sY6WgNzlOUnAAKNkFJM88ieeNsnu7CprecmcWBnUZSuHlNef08Wx7zAchgUAUpFaDT
	 63gvsrcB90IOWWoW0tT2qFKO2NI4iP1RocZN6UwOEdAJN81sVzQ1XgqmblqzsUTE6j
	 S62M1Xq7WrZrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Enable HS eMMC timing modes
Date: Mon, 11 Aug 2025 22:04:47 -0500
Message-ID: <175496788915.165980.5201241552223819071.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250728093426.1413379-1-loic.poulain@oss.qualcomm.com>
References: <20250728093426.1413379-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Jul 2025 11:34:26 +0200, Loic Poulain wrote:
> The host controller supports HS200/HS400 and HS400 enhanced strobe mode.
> On RB1, this improves Linux eMMC read speed, from ~170MB/s to 300MB/s.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm2290: Enable HS eMMC timing modes
      commit: 1d363a6cf8a2627f31bc3609a0fa9d85dfb0d9dc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

