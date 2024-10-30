Return-Path: <linux-arm-msm+bounces-36423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE169B6236
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C76501F221D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055001E573C;
	Wed, 30 Oct 2024 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSBOKeT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEB41DC759;
	Wed, 30 Oct 2024 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730288916; cv=none; b=rLcXAtW4ROamfHFaC5harQ8AwdoWg7aUj65+Zqe1EHBdw9DMys7RsIUfkFyI4ONN+5PZ1Xk6ecSSvcRxZVdtKzy5pstF8OQHOfUP6uuBgIjLle79FdlKRWubwY+E08g0++Cw16Ca531IUEI6oo4xWqvm+VYyKWK/5KjkjRQauos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730288916; c=relaxed/simple;
	bh=vQdaZWTismRSR1RwA+QoQPnrWdtdxnycqAXlRNG5AkE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=XK9ThWPPEj0mybkL6l1EgzIqhmqwhCgsUV+XefpJqafWiRixqqrmETfAIbhRmY09KN7y3sturgFma8AgjZbck26T48qWDEbV0KuBV1yNyyy7Cn1I0qw1wyMaPPShuINAbVAFXWHEy/ADn6uMQ6gB8uBdAb/FF4CXQ4zhAubzpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSBOKeT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166A6C4CEE5;
	Wed, 30 Oct 2024 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730288914;
	bh=vQdaZWTismRSR1RwA+QoQPnrWdtdxnycqAXlRNG5AkE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fSBOKeT4rskvYGzrKk+t6aHGUIJ025NhddV3on3sW/l4LJ1ggN/M7zjLk3W8RThkW
	 cJz3xCqdANv6RQDLv0VNZAxvMQ21OjgR7WI7M5WtfKbh8X6hNS2lghtxoJqwq1f+4t
	 AfpLrauefNC2u0a4C2yDnR+rtBKk5SCOwK/ForLraNhHLxDgi/WTk7Cb9AsTE6AQdf
	 KGDM/jv1OeqR8+nkZ+RRIMez5KmRBoqtQlEgpX5cOulMcwU7y0ax6zPAgI/Rpczl/4
	 gRfK8E9qLuM+p41dVyCGsKQSiOVSEgWDyLLCO79QEpHSHgb9HS+Jc68X9Zlk1t9UEl
	 vAGgUOmXH0ocQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  jens.glathe@oldschoolsolutions.biz,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  Merck Hung
 <merckhung@gmail.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,
    ath11k@lists.infradead.org
Subject: Re: [PATCH v6 0/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for Windows Dev Kit 2023
References: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
Date: Wed, 30 Oct 2024 13:48:30 +0200
In-Reply-To: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
	(Jens Glathe via's message of "Wed, 30 Oct 2024 12:02:00 +0100")
Message-ID: <87r07xzu9d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> writes:

> "Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"
>
> Device tree for the Microsoft Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
>
> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
>
> Supported features:
> - USB type-c and type-a ports
> - minidp connector
> - built-in r8152 Ethernet adapter
> - PCIe devices
> - nvme
> - ath11k WiFi (WCN6855)
> - WCN6855 Bluetooth
> - A690 GPU
> - ADSP and CDSP
> - GPIO keys
> - Audio definition (works via USB)
>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
>
> This dt is more or less deducted from the Thinkpad X13s.
> It contains a lot of guesswork, and also a lot of research on
> what works with the Windows Dev Kit.
>
> The WiFi definition references qcom,ath11k-calibration-variant = "MS_Volterra"
> which is unfortunately not yet in the linux-firmware. The ath11k driver finds
> the default one for 
> "bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2|18,qmi-board-id=255"
> when the entry with the variant is not found which is quite sub-optimal. I 
> have placed a pr on github/qca-swiss-army-knife:
> https://github.com/qca/qca-swiss-army-knife/pull/9 that provides an amended 
> board-2.bin and a board-2.json to generate it. 

qca-swiss-army-knife is only for scripts or similar, not for board
files. For ath11k board files it's best to file a bug in bugzilla:

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html

For ath11k discussions we have a mailing list, adding it now:

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/mailinglist.html

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

