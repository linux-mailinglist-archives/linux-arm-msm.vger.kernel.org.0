Return-Path: <linux-arm-msm+bounces-79336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF3C18740
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F118534F65D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 06:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FC430216D;
	Wed, 29 Oct 2025 06:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THRlDaHv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94696253F07;
	Wed, 29 Oct 2025 06:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761719255; cv=none; b=rXWbJaBktS1AK1/KMuxUtTlZY66EbHA9sP1vtlaerQ2XpO7BXB2Ux0K4IK9Pk2isoY4v+GhzB/TsCKqRSjlfd1JTBq0ntTJ4IJvDlRJ77l0e8Kp7QRtHEZYMQnfxm47iP5yYiAEKO3/YuZg9evfwBEq2ocM1XKtLpqvF2wno6D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761719255; c=relaxed/simple;
	bh=wqnVcNG/joy6DI3ie5C6IORuAyGZoP9UUrdUYZRfIME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BD5eLsCFNLSRJxTxyhkMbs4ZubnfGMeEBRg3a1TH47wmmk0G1+ezuvhMNwzr/yHKPb3tLAUvtwiVLkigI7w0+pksBCzvFWXbmoAHckE9x/2hWvYEtwVS5XmkOmXVOBP0f921Z1knJdSyFWRC6q+FBGeSEFOItP0Ll2X1XhMZ/uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THRlDaHv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB83C4CEF7;
	Wed, 29 Oct 2025 06:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761719255;
	bh=wqnVcNG/joy6DI3ie5C6IORuAyGZoP9UUrdUYZRfIME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=THRlDaHvDQJw0Vjmgk2A04rRrqtWVaBjMDVH9SBhGb4VhiDfuaJkwFTPCzp7TCD0z
	 94g8qDV2aAF+/iF42RzuqKPXrXWenBVPfsyqU3BfwwrD+kxPiV6pedyj6QwQ9piJpH
	 vR3A9jWMtll3E4tceaHwyrQvtaV7qMZqqa4FDIQdo3mcZSp5Ft1o6d2/Ar3OdPtboT
	 /cbdPjIJBiQNMPIIKlxwZJikO+oS8QIugO2QCNJCK2RWyx3Wt5amLE2W9wE9MWMyvS
	 LgjPl3NIeVnQanHbKcDOIE7bP2ru1fSophJBMY1wRrcLLaiTcY3eaSqngIu9hamqRY
	 9XF45Ij7KOa6g==
Message-ID: <2db06bcc-f04b-4a57-afd2-1d0c665d376a@kernel.org>
Date: Wed, 29 Oct 2025 07:27:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 jesszhan0024@gmail.com, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, quic_rajeevny@quicinc.com
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abhinav Kumar <abhinavk@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
 <921afe20-42b1-4999-b5c4-035669dc831e@linaro.org>
 <32eb3b4f-b2c4-4895-8b48-ade319fd83de@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <32eb3b4f-b2c4-4895-8b48-ade319fd83de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/10/2025 07:20, Mahadevan P wrote:
> Hi Krzysztof,
> 
> On 4/26/2025 1:24 AM, Krzysztof Kozlowski wrote:
>> On 25/04/2025 21:34, Dmitry Baryshkov wrote:
>>> On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
>>>> DTS is ready and I consider it ready for review, but still RFC because:
>>>> 1. Display has unresolved issues which might result in change in
>>>>     bindings (clock parents),
>>>> 2. I did not test it since some time on my board...
>>>> 3. Just want to share it fast to unblock any dependent work.
>>>>
>>>> DTS build dependencies - as in b4 deps, so:
>>>> https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
>>>> https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
>>>> https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/
>>>>
>>>> Bindings:
>>>> 1. Panel:https://github.com/krzk/linux/tree/b4/sm8750-display-panel
>>>> 2. MDSS:https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
>>>>
>>>> Patchset based on next-20250424.
>>> If the DisplayPort works on this platform, I'd kindly ask to send
>>> separate DP+DPU only series (both driver and arm64/dts). It would make
>>> it much easier (at least for me) to land the series, while you and
>>> Qualcomm engineers are working on the DSI issues.
>> DP has also issues - link training failures, although it feels as
>> different one, because DSI issue Jessica narrowed to DSI PHY PLL VCO
>> rate and I have a working display (just don't know how to actually solve
>> this).
> 
> We at Qualcomm are currently working on bringing up the DSI display on 
> MTP. For this, I’ve picked the following patches on top of |v6.18-rc2|:

Display on MTP8750 was fully brought already. I don't understand why you
are doing the same.

> 
>  1. All the DT changes mentioned in this series
>  2. [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
>     https://lore.kernel.org/all/1154f275-f934-46ae-950a-209d31463525@kernel.org/
>  3. [PATCH v2 0/2] drm/panel: Add Novatek NT37801 panel driver
>     https://lore.kernel.org/all/20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org/
> 
> However, when testing with |modetest|, the panel appears blank. I wanted 
> to check if there are any additional patches already posted that I might 
> have missed and should be included.

Many patches are missing because Qualcomm did not send them for months.
I was pinging multiple times and I gave up - my job is not ping Qualcomm
to send their patches.

I have no clue what you have already, what is your base, what errors you
have and I will not be guessing this. For convenience, you can use my
integration WIP branch from my github. I already shared that tree with
Qualcomm more than once. Please reach internally first, instead of
poking community.


> 
> Also, I’m curious to understand more about the DSI PHY PLL VCO rate 
> issue that Jessica had narrowed down—could you please share some details?

Sorry, I am not going to repeat stuff done year ago. Please reach to the
archives.

> 
> Lastly, I’d appreciate it if you could share the plan for merging these 
> changes upstream.
I don't understand what you ask me. Process of contributing to Linux
kernel is well documented.

Best regards,
Krzysztof

