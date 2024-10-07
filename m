Return-Path: <linux-arm-msm+bounces-33393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE5992F36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BBA3285A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FF91DA100;
	Mon,  7 Oct 2024 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRuaXuYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4903C1DA0E1;
	Mon,  7 Oct 2024 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311185; cv=none; b=uy9B44V8wm+39uzPfHfsC+prliP6gc3L/QL6VLbrclAViCq5aqqo6ukW5sjn9DNum0V327muiM/ymTMEntb2MxUGbq3OxvZ+bAtdONbGrIrmjth+gJYBJr2khlDX96XZPfk2y2dmNbtA+gi3VASD8N/HpocZSVqTfnXHYX5aG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311185; c=relaxed/simple;
	bh=tqug78zWaXgGAPBmUk1qR09Gx4eh42mL3Y3IUdcQR2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uhfCWkuYrwMPxMS1GTrj8kJjpdS3BTJtoVZbp3MBlY4hwp46yO7BQhpY7fC4WK/+TVSfZD58gHi9JTcmWelrWkfyRKK7eTHZEfeCb/ZIfk9BUTRkVn54ReGLiIMEnfzbfFHi9jcTesyZs3gAZU4TqgqcA5UxYL8NyxwQq1V0afg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRuaXuYa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427F4C4CECC;
	Mon,  7 Oct 2024 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311185;
	bh=tqug78zWaXgGAPBmUk1qR09Gx4eh42mL3Y3IUdcQR2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aRuaXuYac4vkuind0U3v3T32RWfYijik3rsVkQ2xjX6I/NtsdKxd82298ynIGIZXy
	 Tma1JhRvKelLbym6My2nKFpmc6SJyw8f90iDi3Cz2cwQUNHZUxywZ+3+cx904lprCb
	 MU6R15c5B7LsLlc9+QNAflYYLjGt/7C/fOMMzWhAntuSw0X5Mw2JkQChZHpl+yRP2/
	 1bcquZhrq/dFQ2itUpALS2cmEMV85fPglNb6envemiXTBjuYJHPgNw3AAHinNjmtWz
	 ZAnD0I9EBR07Kj1yhUSRZt3Zg2ilaZjQwrXPlNKtpqRuGfkbEvFBSMnNnsR64W20mK
	 ebHEIQjtaYbbQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64/ARM: dts: qcom: minor cleanups
Date: Mon,  7 Oct 2024 09:25:57 -0500
Message-ID: <172831116174.468342.1356342875981284880.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
References: <20240905-dts-cleanup-v1-0-f4c5f7b2c8c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Sep 2024 17:46:52 +0200, Krzysztof Kozlowski wrote:
> No functional change expected, verified with fdtdump
> and/or dtx_diff.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[3/4] arm64: dts: qcom: drop underscore in node names
      commit: 504689317667a96f52ef85d6be7cec7dfad3c3a2
[4/4] arm64: dts: qcom: minor whitespace cleanup
      commit: 8a77bb1e1480ad969e6b1d9b23be000991eecebc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

