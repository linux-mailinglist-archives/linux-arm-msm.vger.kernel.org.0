Return-Path: <linux-arm-msm+bounces-28261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D800994DCCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Aug 2024 14:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70C491F21856
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Aug 2024 12:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A835F158552;
	Sat, 10 Aug 2024 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WY0M2ZL1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F33158520;
	Sat, 10 Aug 2024 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723293309; cv=none; b=JSFPc7bF5JVgayhc0UjbThZTu8Sz3gzdqOZBlnNVt2q2fpdlcWb9A/igKlql8ybl35MZoXS22M6xficQ3hGAqXO3yTXvjKNvDRw/iTXQyBSFHds2oFvDrwq9LxEQ4yBa7xVRoOyO5YSOUDiXhe++NrZMa8JPOuMkEsOVuLbSnmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723293309; c=relaxed/simple;
	bh=ptzjTGluuL+41Igjh0PWCntVwN8czL3T2wfcNMPpkKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkIKey0+jTCOUaJybDLcsYg/ooMjw/P4EMy5+UznAZy0mGqWonS+GxmuFqVzHfrHr4MsfqeEhSJTsZ8O/8m6z88+8pvfaT5eDCb3pmIXbG7nrfuPq+WuPqTi/X8X5UlsGy/C43teGV+C2QXXeAFTO01QfubzS082uFf7dHQNfDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WY0M2ZL1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21498C32781;
	Sat, 10 Aug 2024 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723293308;
	bh=ptzjTGluuL+41Igjh0PWCntVwN8czL3T2wfcNMPpkKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WY0M2ZL1p77mv5fwSxY9HB6+2MkMxt8dYvk6lQoMd19QWPfRtnrnCaicdEJyismKh
	 bqxOR4w5yyWThGtYTsGCQVNA8KCPZflF4Ed5cCju3UFTgL/W0+hGlNs+puMijBVuZr
	 w6sNy7S7B9RKPQMgHVs/2NtMO9L02QYEyT+ttIWJPPVCOvvtRPrU+fZoExehV96k0R
	 VTMa/PdzXkrvcQfrR/kCgec5QCrQ8bS3yf4fmFtvlLG4O04lLeNeaaX6ZJtJyjF8Gi
	 gxdPalOxr/UD+3abDqxxr2Ul/6vGDQMN6whiMlE3cL2nEWizkn3h4M24nD0zm3YcTU
	 j8V6kL3lB3zYA==
Message-ID: <192e3c22-fd63-4891-86b2-89a3383ab76d@kernel.org>
Date: Sat, 10 Aug 2024 14:35:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add DisplayPort sound support for Fairphone 5
 smartphone
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.08.2024 10:33 AM, Luca Weiss wrote:
> Add the necessary sound card bits and some dts additions to enable sound
> over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.
> 
> The UCM files can be found here:
> https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm
> 
> Two extra notes:
> 
> 1. I don't quite understand whether the sound driver should have
>    SoC-specific compatible or device-specific compatible. Some earlier
>    patches by another author for a QCM6490 board and a QCS6490 board use
>    device-specific compatible - but from what I can tell this is not how
>    it's generally done for other sound drivers?
> 
> 2. Unfortunately DisplayPort enablement itself for Fairphone 5 is not
>    upstream yet. This is blocked by DSI display bringup upstream which
>    is blocked by DSC 1:1:1 not being supported upstream yet and just
>    working with a hacky patch. Nevertheless, DisplayPort audio was
>    validated working with no additional sound-related changes so once
>    DisplayPort gets enabled, sound should also just work upstream.

You can enable DP and keep DSI disabled for the time being

Konrad

