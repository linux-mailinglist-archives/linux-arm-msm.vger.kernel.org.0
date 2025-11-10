Return-Path: <linux-arm-msm+bounces-81148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF0C49455
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 21:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1BAB834AD63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3C72F1FEF;
	Mon, 10 Nov 2025 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnFgranO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28DD2F1FE7;
	Mon, 10 Nov 2025 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762807236; cv=none; b=NsntcXKx3PsBncxr9spX8x9zo7/shCxuTsN8TpHvhgD4LThr70ar88UdIfxL5idUNG1HYOlfA/RyKOV0/xEdOF1dcKYf8Zqm3fmGNkdQvvv7aXQi2dXlkABoCz5I7ix/E0ivoKi2CADKdjvkGPPmMoi4u6EdL73hD4ljAOAvZWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762807236; c=relaxed/simple;
	bh=g1nuj22bUx0S2UfHirPMIAptlN2mZ+0pR9IkG1RTWbc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ngbf6zjuoj8jkbUQLmMXWDP4AeKJBWBF70JuaqGBnA8U6BMebjaS62cg/9+ZFiRmBeJYmqfjuSP2oyMoRxSiXnpGvAvAz88QlB712KUvY92+uwwu37T4nn+Xm/b8AXwBRdh+kDIGYWtyGtA1xvc03yo9Wj7E9eIIMMKJZ/MAanc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnFgranO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDE7C113D0;
	Mon, 10 Nov 2025 20:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762807236;
	bh=g1nuj22bUx0S2UfHirPMIAptlN2mZ+0pR9IkG1RTWbc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EnFgranOhwyOiS4qBJoAiOurXF0ZYHAEYvClmtm04NRUYrwP+ZTfJOBBkkZwiRNRs
	 64Jin+aMtJZPdXMGqIP1chqbq4INrGhAGdKabCVH1H6hcSjRzH9uchgJBeJUHCNMSd
	 a9ySAjsbG2PdzUDp1gCVvHNwXWuBp2BSLza4W8tzcUwL5KCLofHrRNnQZYxlcMQvxU
	 zJdrX2zRiAxfinq9OC6EpUMGGOKtD9ODCkI4SBBlCwqeEAo1EG5+JbH2ulEywtNJIK
	 dVQOAc8vzBWkYYtkFV3TU4r7EtmpXtCL2FZpXXR3kVSaMBh4hvOEqg9C5PB8vZZBQr
	 bavmTHqdJErpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C9A380CEF8;
	Mon, 10 Nov 2025 20:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/1] Bluetooth: btusb: add new custom firmwares
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176280720699.2767842.6693108366892631498.git-patchwork-notify@kernel.org>
Date: Mon, 10 Nov 2025 20:40:06 +0000
References: <20251109092437.252022-1-quic_shuaz@quicinc.com>
In-Reply-To: <20251109092437.252022-1-quic_shuaz@quicinc.com>
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_chejiang@quicinc.com,
 quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sun,  9 Nov 2025 17:24:36 +0800 you wrote:
> add new custom firmwares
> 
> Please refer to the link for information about the qcs2066 folder.
> 
> a3f9f6dd047a ("Bluetooth: btusb: QCA: Support downloading custom-made firmwares")
> 
> Changes for v3
> - remove CC stable
> - V2 link
>   https://lore.kernel.org/all/20251107125405.1632663-1-quic_shuaz@quicinc.com/
> 
> [...]

Here is the summary with links:
  - [v3,1/1] Bluetooth: btusb: add new custom firmwares
    https://git.kernel.org/bluetooth/bluetooth-next/c/c1b7e4ae360b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



