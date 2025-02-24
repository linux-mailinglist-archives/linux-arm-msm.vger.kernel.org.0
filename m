Return-Path: <linux-arm-msm+bounces-49206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F9A42EA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 22:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F043B3B49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 21:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049DC19E96A;
	Mon, 24 Feb 2025 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eM96Wpgs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C187719ABB6;
	Mon, 24 Feb 2025 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740431403; cv=none; b=UjtsGRMT9s10pq6d/meGLEi+Z8BIkfRUmiThdRkg1qB24pN8XDUyRQ4wigZ01V/GOEl8lwB3MfaAsn7a8WOzCe8J/6QJqeg0s36gHcX4f9NOwBG/+jcmezRVoN4kGpOaJYSySYRbmj2QBE9x3/Owyr+BhTFGWjAPEmczjtcYj3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740431403; c=relaxed/simple;
	bh=ODMDPnUIj7jlAw0M/wbe31+KuqGOm0TmlZhNWLpCwzE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TOzg8fJB/7UqcyXGYt+1PZZeYrtLTFZ9y351gR9PLAyEMSsTa+2CPRAGJZnIs1ngmJuOdvMwrQLEK8nwQZxxwiYw5GfCirhvBdLZZDTTBVG0gUQ1DcNJwk0F+IG1MfWOlMQAyeh7L7GVby0NFlEUozAqOuSJ2fjB/Y0+reZQCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eM96Wpgs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE64C4CED6;
	Mon, 24 Feb 2025 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740431403;
	bh=ODMDPnUIj7jlAw0M/wbe31+KuqGOm0TmlZhNWLpCwzE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eM96WpgsEgFDABBzkQbjUF1Wjuwtyvntse9gwMjQVWLofsUKqzqGf498QhPbyszZ+
	 p7FEYUwiarX/CY4TNLYC49WEHkIAAmmTvaKNyjIw0JDQ26LwPxLmr0mlMB6eyK4Oem
	 enqEpTmh1UPTPmDLfuc5jfP8kt+IBqIoeG5I9dGrzYQS0bVLUPhrw872ozdc6rdUAy
	 FOuAXsESDzIpix1zzLBt6LJBZo6jAS8nqLDE4rZxK4PHOS9mlJLMKWXd6t6FUO+HHL
	 +LK3u4UsgM9jQz1ml59vH3JVTnOEjMkneK5pwysWocku70s8uOpl/7hOgmR3Mhtory
	 QTqmaKKEjS+vA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB58D380CEFC;
	Mon, 24 Feb 2025 21:10:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/6] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <174043143476.3609111.6085562933196082342.git-patchwork-notify@kernel.org>
Date: Mon, 24 Feb 2025 21:10:34 +0000
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
In-Reply-To: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bgodavar@quicinc.com,
 quic_rjliao@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, konrad.dybcio@oss.qualcomm.com

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 07 Feb 2025 22:41:14 +0200 you wrote:
> Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
> of BT/WiFi chips. Add support for this member of the family and enable
> it to be used on the RB1 board.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v4:
> - Added empty line before status property (Konrad)
> - Reword Bluetooth commit message to follow linux-firmware changes
>   (cmnv13t.bin and cmnv13s.bin were merged).
> - Link to v3: https://lore.kernel.org/r/20250202-rb1-bt-v3-0-6797a4467ced@linaro.org
> 
> [...]

Here is the summary with links:
  - [v4,1/6] dt-bindings: net: bluetooth: qualcomm: document WCN3950
    https://git.kernel.org/bluetooth/bluetooth-next/c/a3d5067f33d1
  - [v4,2/6] Bluetooth: qca: simplify WCN399x NVM loading
    https://git.kernel.org/bluetooth/bluetooth-next/c/28a5679ac56f
  - [v4,3/6] Bluetooth: qca: add WCN3950 support
    https://git.kernel.org/bluetooth/bluetooth-next/c/f6d6a24db7b3
  - [v4,4/6] arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
    (no matching commit)
  - [v4,5/6] arm64: dts: qcom: qcm2290: add UART3 device
    (no matching commit)
  - [v4,6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



