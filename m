Return-Path: <linux-arm-msm+bounces-65354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8EB083E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E00884A870A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B6E218ACC;
	Thu, 17 Jul 2025 04:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRydheKE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C17218AA3;
	Thu, 17 Jul 2025 04:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726686; cv=none; b=WILZfBBU1NJzvQyYqdFS4MWfOgcnjuMfNMAfYVh8b2EvY44Y+VQvdNXh0PFCb1q174AoSY+uHv2axpNXrktB3Y1CwS6mqbJfMcI/u1aOmUJ4wTRXSISJrjPzDDQaQe/SGxj9XAYf2gsHGvi/bwJjtLztqK2GsApljYIKOJkAkxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726686; c=relaxed/simple;
	bh=SkOTc//OI/WNv+UtD+0KKgcrVEKUCW/Ehb+vldTMIzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2sdkbhD/K0PwYWIiyr8YCFiS7DdfLQ3iaxMDIiRjXBvpDsgr5tVK0mDRQifwzXkXGeYiScYo5STwOSoTG39DO3HfmJ8t7mAw68Ndhsio4wehFomyU/XB8DLOPXM2/DrUd+iMFgTQEPQbJ8wM7gblK7/XuHCOVzLUvHNpdyCCsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRydheKE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B4AC4CEED;
	Thu, 17 Jul 2025 04:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726686;
	bh=SkOTc//OI/WNv+UtD+0KKgcrVEKUCW/Ehb+vldTMIzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fRydheKE7Emfid2Sm9EBBHo/lUfjYIQrBFxsrt7KHKh5H+AnnSIeaTIM8iUHFU9oH
	 RZT9kzc9KcYs32Uh07iTqQTwQ944YcKcBtmi0NCy+GWdtoIYd4Bl9FgK0zi1VOZea8
	 Z2KZ8IsNpF1JmPEeAjVox9oMumUa/fQP43zJy8BQnL5/5Vp6fRxUvQT/Eh9kVQAY5j
	 pSZmhvk1+WdJnejld5PxOajUklredTp0xig9S+26qD5sPqJt+KDywcPvm4b5aHmu0/
	 qbYEf8lfFhgHrVnnzDGkAA+jfLc7LSXzJbv7yTQRILJRlOGnI7zsjYLe/5If9PiWlh
	 WO1+EDIrf5uvA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] arm64/qcom: Drop bogus venus-en/decoder nodes
Date: Wed, 16 Jul 2025 23:31:00 -0500
Message-ID: <175272667108.130869.4112597189406658118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614-topic-encdec-v1-0-f974c3e9cb43@oss.qualcomm.com>
References: <20250614-topic-encdec-v1-0-f974c3e9cb43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 14 Jun 2025 21:05:18 +0200, Konrad Dybcio wrote:
> I left the ones with clock in tact, as I *really* wasn't sure what
> the various layers of spaghetti do with them..
> 
> 

Applied, thanks!

[1/4] arm64: dts: qcom: msm8916: Drop venus-enc/decoder node
      commit: 5eede3dc2a6ea548302f54ebd89d5892532449dc
[2/4] arm64: dts: qcom: sc7180: Drop venus-enc/decoder node
      commit: 5c034d0e9abe3c950399932ace5b5e8e21b724bd
[3/4] arm64: dts: qcom: sdm845: Drop venus-enc/decoder node
      commit: 896f49ab5f525d519c3ff9533659a9f73be89f56
[4/4] arm64: dts: qcom: sm8250: Drop venus-enc/decoder node
      commit: 23221c35d0c9da4da8cafccbd8e714f0f0b5d970

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

