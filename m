Return-Path: <linux-arm-msm+bounces-24534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B8491B188
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 23:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87D791F28024
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 21:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351521A0723;
	Thu, 27 Jun 2024 21:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbsXWHpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B9E1A01D3;
	Thu, 27 Jun 2024 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719523560; cv=none; b=U/KaHNv9QbvH+D6m9ll0afDC4awITmEN6FI65BokUvElMKRBXvrD1jzMFZ0Szr1cDVRwcnlp2RJznXxLNKivIkXgcuS0srDLl7dpYtEUOaujGrE6xr/k+7pGEUALwMmwPyASvcyQeJN0u8bzINQfwtHLsn6Rv86Co/s3MreOsD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719523560; c=relaxed/simple;
	bh=vp2tMpaY6MwQH/JDogWQvrQFcS9lG/tItXgnI88cH6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U4WY1ZyNM6ihflr+lZtfZDKZjBtuZWya2kIofQ1lWS6rlKIN0yKarqeisquTbrF+NzmGHzDHZLZoFN5RBAnCx8thByo81Lkhrw6IeFioVAj9hjWva7yM0KHdxGSZechsMTuc6zzSasDql5nFGRXrCBS63hgMs7Q0rjCjbbmwVbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbsXWHpV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94F5C32789;
	Thu, 27 Jun 2024 21:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719523559;
	bh=vp2tMpaY6MwQH/JDogWQvrQFcS9lG/tItXgnI88cH6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YbsXWHpVhXNnEVp7HKH+T9WKYqE1/m+Oo/drWVHjfUErRddE0xG1VpjmK/Uy1tLge
	 DoAnwgHxle1OJ1Igzpiwnz1Gj6KStkl+nUsN13ruC0iLqigw0BfbM7LYR0YfcJllj7
	 rEvMiJYTV+FMJFkEPYwPAyWAlLQcDCxUdn7xbbMUPEEhwyBSYxiN97QMN/Y0eb2IvO
	 ZstzlG/46OtdtuvXkO/9vb+ERzn0BZ/bae1EajqNHsc8d3tx/mznXujnYwK7Dmy6wJ
	 sm7Chs3wkHEPh+kkInze94njl9HTSI4BWxc0gzlR2EpOgo2mv/ayOnZv2MEyqgLHO0
	 BIq779bjm7hyg==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@linaro.org,
	Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konrad.dybcio@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_abhinavk@quicinc.com,
	quic_nankam@quicinc.com,
	robh@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Date: Thu, 27 Jun 2024 16:25:58 -0500
Message-ID: <171952355517.143142.3914712375645233176.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240528141954.7567-1-quic_vvalluru@quicinc.com>
References: <CAA8EJpo=Q4_=JU83-9ooSqiSr=xUeHh2awDhzq9q3Xd56h83zw@mail.gmail.com> <20240528141954.7567-1-quic_vvalluru@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 May 2024 19:49:54 +0530, Venkata Prahlad Valluru wrote:
> Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
> reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
> Bridge supplies are Vdd connected to input supply directly
> and vcc to L11c. Enable HDMI output, bridge and corresponding
> DSI output.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
      commit: fd513b922e34edb0db1284a4abee7f6c10ffd9a7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

