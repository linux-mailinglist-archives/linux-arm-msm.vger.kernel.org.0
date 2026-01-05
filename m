Return-Path: <linux-arm-msm+bounces-87475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4008FCF4326
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91C2E3153747
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8998033506D;
	Mon,  5 Jan 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q92hqr6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53A334C3B;
	Mon,  5 Jan 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622092; cv=none; b=NBZ1fy0wXb+Q21lR7/5xW6YmJkAE0qE/l+sAks+b6briJFQBy5YT9rJw9hQ4mjSdKadzaEUrGsCv128WqnOWHBlwjQlv2vXjuAUJISnhHnWgDFLihs76yGHuz7Tr2anolWGJuXxSA52Atvar3vSlMhdUbRBwPRUzTl8UgnXCpbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622092; c=relaxed/simple;
	bh=SB2ajjVTteseBB/ot2A8Te/hirodq1dq/MFLbMupgFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGNlgESohEzAuVj4oeDnk71y05QntmIeaBpo8Amc49CZuABef2rlD9LZekC5iOk4YPicwTTHgzbJ2USUj5UeFYVNMVkugngAxo8J1NbO6WlIaIyAj7tXV3ioVdr1eZRpA6zvM0pFQ72QeapYW4KDrvkteLEdliRSZcD1htX2T1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q92hqr6A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1C3C19421;
	Mon,  5 Jan 2026 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622092;
	bh=SB2ajjVTteseBB/ot2A8Te/hirodq1dq/MFLbMupgFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q92hqr6AHtLQPwqe+/8GMJKFf39v8DyzytrLzoWPwaIFwfLllIFhCH7EykL+CCH7n
	 NI0g8K+aDuRqzMqM1MrNN4kITf9oE4AZ8wy0yx49X5b+8z0fmG3StU1v0bu5CRFaqW
	 /M0UmowWlpdBZA/qZtyg1P8+tkpcFaDjGLcHlm64aNdNMaKWB1hDTt53SlTABARlHw
	 4eHLlzXyOAmRK0Js5NVVsb1DaZSVfiBE4tnJROPnj1D0zIu/JKTnfUeGfrT0n7GyOB
	 v8/7YqZXUmYaKW7xx7L5ZGhK65xhlPqzDtDNKToHcUu5dLEgCKflVwcdrqDPzSjgyB
	 MM4b6k2K0vBxA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roger Shimizu <rosh@debian.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v7 0/2] arm64: dts: qcom: Add qcs6490-rubikpi3 board dts
Date: Mon,  5 Jan 2026 08:07:22 -0600
Message-ID: <176762206399.2923194.13075616829729338390.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126-rubikpi-next-20251125-v7-0-e46095b80529@thundersoft.com>
References: <20251126-rubikpi-next-20251125-v7-0-e46095b80529@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Nov 2025 00:07:01 +0800, Hongyang Zhao wrote:
> RUBIK Pi 3 (https://rubikpi.ai/), a lightweight development board based on
> Qualcomm Dragonwing™ QCS6490 platform, is the first Pi built on Qualcomm
> AI platforms for developers.
> 
> This commit enables the following features:
>     Works:
>     - Bluetooth (AP6256)
>     - Wi-Fi (AP6256)
>     - Ethernet (AX88179B connected to UPD720201)
>     - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
>     - USB Type-A 2.0 port
>     - USB Type-C
>     - M.2 M-Key 2280 PCIe 3.0
>     - FAN
>     - RTC
>     - 40PIN: I2C x1, UART x1
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Thundercomm RUBIK Pi 3
      commit: 640565d3f3654b7e8848c5bcf01843f04bfa769a
[2/2] arm64: dts: qcom: Add qcs6490-rubikpi3 board dts
      commit: f055a39f6874b0e86926fe17f40b676cf287ac11

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

