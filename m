Return-Path: <linux-arm-msm+bounces-48758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A68A3E373
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 19:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8CAC702392
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 18:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35152144C3;
	Thu, 20 Feb 2025 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeOMms5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40AD214212;
	Thu, 20 Feb 2025 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075004; cv=none; b=MI01V/Sklq6fNotc3E42l+LKvHvskpcun76Bsh3bk1jGFr1CpMZeYPVxq7kdoZeifsXztzGCE/Nh0rB0xFMglX8libYOzjiL0MiG0Rl6Yi15azXmIUyCWn2rDsouOyTpymeuzAZKIaMtv0t/DGVi77q1vWKxk07lmNFZmapWB/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075004; c=relaxed/simple;
	bh=+lTMN7k22+tbceScadXHP0FzfkytU2gCe6ALjtMRtXo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CEAGmklq8YExi6k4gbshL0gTiLVeqRleIAAoqymm3+HmUiHgeeTouaUqwxTzLG8mqaHJDzOGHgKgqryHuRRWFz1IBGbmXH/4giruSdEhWClEvY/zail03CsEX6W8SuqFjPyY/ul/xQOFb2J+c1UI6GOmRxufMUIoFMxqNyshslo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeOMms5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831DDC4CED1;
	Thu, 20 Feb 2025 18:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740075004;
	bh=+lTMN7k22+tbceScadXHP0FzfkytU2gCe6ALjtMRtXo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AeOMms5Ax/p+NCfthNt43308syT98/mSQMGYbmKw0YdH/Q5Nt6uPm89ez616XbmZK
	 4tCDi7VBiK51ywuiK53BUShX4S/bcOkHaMThEUyQznIKTHswUhsUc7Dfy4vwrZsDI9
	 1bJiQwA338OyZSwduNffh4bsGy7u5zFw+9laEQ+BPUm2IWF0dMN+jvatI8ppiItEKP
	 /e7n6szIK4gHP7mgRZw5/oQVkuJlu+vvR30psKchORirr4wtcrJplUMEUM0Q+qWA/Z
	 reKJngM3fjQfUCQ5ECwLfoAAk+p0KdKzRB7CFG6wvrQMjYVk6IS84390YAl1RNFyvd
	 qHU4Rc9VCYH5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71411380CEE2;
	Thu, 20 Feb 2025 18:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH v9 0/2] Enable Bluetooth on qcs6490-rb3gen2 board
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <174007503524.1411319.11668264523597671564.git-patchwork-notify@kernel.org>
Date: Thu, 20 Feb 2025 18:10:35 +0000
References: <20250220112945.3106086-1-quic_janathot@quicinc.com>
In-Reply-To: <20250220112945.3106086-1-quic_janathot@quicinc.com>
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcel@holtmann.org,
 luiz.dentz@gmail.com, quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
 quic_anubhavg@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 20 Feb 2025 16:59:43 +0530 you wrote:
> Patch 1/2
>   The new state node qup_uart7_sleep is causing a dt-check warning because the
>   base DTSI (sc7280.dtsi) is defined with individual pin configurations
> 
> ----
> Changes from v8:
> * Fixed the dtb-check warning  in P1 and removed tag: Reviewed-by
> * Link to v8: https://lore.kernel.org/linux-arm-msm/20250127064940.1360404-1-quic_janathot@quicinc.com/
> 
> [...]

Here is the summary with links:
  - [RESEND,v9,1/2] arm64: dts: qcom: qcs6490-rb3gen: add and enable BT node
    (no matching commit)
  - [RESEND,v9,2/2] Bluetooth: hci_qca: use the power sequencer for wcn6750
    https://git.kernel.org/bluetooth/bluetooth-next/c/3e968fd5dc0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



