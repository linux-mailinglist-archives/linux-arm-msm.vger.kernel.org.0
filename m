Return-Path: <linux-arm-msm+bounces-76095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBC8BBE9AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 18:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52A203BF96C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 16:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EFF2D9EC5;
	Mon,  6 Oct 2025 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ULvoXn2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249AD2DBF4B;
	Mon,  6 Oct 2025 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767234; cv=none; b=LJ+kP/rhL7011/GVF53TeXKPiSgRTNOOfKX/hsIK0tMSuIGOCzoNEnpEfvlZYxpbBxkFPtJuoorv3B8ZQXX1DWnzbsRbfCxfDJW1PfPqZ6GkV5Au2EYM57ptjWp9Kt5dPE3IhyFNGCkHDV+TzsFEiA3OKyg2SorhS+17VBSv0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767234; c=relaxed/simple;
	bh=7PpltU9DGGP6qfqzqgQNBhyvFnEH5t9R+C6nSh6GRO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fN2k2J/ZohzbpDjajC4yDWLoZkmFxgsniVibrycW0YK5vPDsZGm7i/uri5aYPOjEesQy5ADYOsCAa8MeagBVF/owdblMiH22eN36mWtFdJB/uIGM/OdBwdb7GXb+BeBlQ8YL4u+XE6uKNuVmqab7nYAGvMgIJIUFhHVimZIpGKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ULvoXn2N; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <2564cdec-9726-4efa-ba07-a2f2646168c6@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1759767230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXidAQDLxmoPTgrGv7pYlMirqlSYDUPqKshvVJjRl/U=;
	b=ULvoXn2NmM9A547Ta6cpDp3p7vf06JYkkubX/G15oFdb/s4IuGCeAWJFjGXcBpGrCmVZxe
	PJW9epfxlOxoPlOFpnxr9hi7JuXAvem9IqqJK0zHIdqzgsMoksVqSpmKpddtKtRwBOK6q1
	8HMc/ExFVs9AbpORmMPfOdDYf3mENwDn5idIzBqZ90dkvrJU7E8pbKAh1XZxUXA/HlIERF
	pZm3NmI3oMjYgSsLluxOOzdDIBSyTgwXkh8MmvH7OJqdbsUzSFLIW57croeCG9vin13SCG
	HuGZ5njg7qSFs85Ua0g121AfUt+5HUZqcQBd1vsbKlaygScKR/YQETgWBnXoLA==
Date: Mon, 6 Oct 2025 13:13:42 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] phy: qcom: qmp-combo: Move pipe_clk on/off to common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250927093915.45124-2-val@packett.cool>
 <e6754738-76c9-4080-bbed-17f02e6535bf@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <e6754738-76c9-4080-bbed-17f02e6535bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 10/6/25 11:44 AM, Konrad Dybcio wrote:
> On 9/27/25 11:17 AM, Val Packett wrote:
>> Keep the USB pipe clock working when the phy is in DP-only mode, because
>> the dwc controller still needs it for USB 2.0 over the same Type-C port.
>> [..]
>>
>> In [1] Konrad mentioned that "the hardware disagrees" with keeping the USB
>> PLL always on. I'm not sure what exactly was meant by disagreement there,
>> and I didn't find any specific code that touches that PLL in the driver,
>> so I decided to just try it anyway.
> So what I did was playing around with the RESET_OVRD settings, which
> dictate what parts of the PHY (and their associated PLLs) are kept online..
> but I totally forgot that there is a branch/gate clock in GCC that sits
> inbetween!
>
>> [..]
>> I'm sure it might not be that simple but from my limited and uninformed
>> understanding without any internal knowledge, the "sneaky workaround"
>> might actually be the intended way to do things?
> Normally the clock which you're enabling is sourced from the QMPPHY.
> The other option (bar some debug outputs) is for it to be driven by
> the 19.2 MHz always-on crystal (instead of $lots_of_mhz from the PHY).
>
> For USB hosts without a USB3 phy connected to them, there's an option
> to mux the controller's PIPE clock to be sourced from the UTMI clock
> input. In those cases, the UTMI (and therefore PIPE) clock runs at..
> well, 19.2 MHz!
>
> (you can actually do that on USB3-phy-connected hosts too, at the cost
> of.. USB3, probably)
>
> So I'm not sure how much of that is well thought-out design and how
> much is luck, but this ends up working for us anyway, with seemingly
> no downsides.
>
> At least that's my understanding of the situation.

I wonder how Windows drivers handle this.

The ability to use the UTMI clock sounds more appropriate for when only 
a legacy USB2 device is plugged in and the entirety of QMPPHY is 
unnecessary and can be shut down to save power.

BTW I'm still seeing USB2 functionality die if I boot with the monitor 
cable *already* plugged in, but that sounds like a very different issue 
(the host controller starting to touch the bus before the PIPE clock is 
up? something something probe order?)

> The suspend logic is broken and unused anyway, but that's a nice catch,
> the PIPE clock in question is even conveniently called "usb3_pipe" in DT

Hmm. Is it unused? Oh, you mean the pm_runtime_forbid(), right.

Do you have any pointers about what exactly is broken there? I've been 
poking at the runtime PM stuff too 
(https://gitlab.com/Linaro/arm64-laptops/linux/-/issues/14 for USB), the 
PHYs are the biggest missing piece there overall..

>> [..]
>> @@ -3103,6 +3110,7 @@ static int qmp_combo_com_exit(struct qmp_combo *qmp, bool force)
>>   	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>   
>>   	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>> +	clk_disable_unprepare(qmp->pipe_clk);
> Let's disable this one first, to preserve existing behavior (and it
> makes sense logically - if the PHY doesn't have its clocks, it can't
> really generate one either)

Sure, nice catch. Will send a V2 with this fixed.

Thanks,
~val


