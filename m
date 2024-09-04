Return-Path: <linux-arm-msm+bounces-30706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C590796BAAB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F317E1C22AAA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 11:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD5F1CF280;
	Wed,  4 Sep 2024 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlOlmIXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA20192586;
	Wed,  4 Sep 2024 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725449375; cv=none; b=pbDjJoC3yxLVBEoBpDNt65YJfejWnncqW+eN6A+A2r5VdE4N+mjoFQ705e9EMRg19TrzD5WptXd6v2Y1vQ6bXaS4NPOLXa4mhZxds8K90FOwWEntkSdIoUNLhM+6HBTEg6/GW+73059e4Doyl1ZmIl3rMK7/VTirGip1RpXts2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725449375; c=relaxed/simple;
	bh=IbTO/VrN9chRHIbadlaqKaZrqY35Ivbs3FjR5xZuAkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvxPbgSmECfxAgpEUadbyDEZybTXkv4hbWzuk+babHyswKJWNL0eIngGG29ynyFKZ+nneUIpdh1HYr7WvCTpX7p2k1c2IjOL4lBoBuFAKHS3MPHcTEmSbLcaXiy6khInqRVGV9nYz9aVvTJlfqCp6spywVZ0b31lSKWC04Y1Jiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlOlmIXI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BB6C4CEC2;
	Wed,  4 Sep 2024 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725449374;
	bh=IbTO/VrN9chRHIbadlaqKaZrqY35Ivbs3FjR5xZuAkE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GlOlmIXI5IRmIy4MvvV51X9PeO9cBBWw1dSsdJ/A/fZNZVyUAKv8lOYlcImwOzgaQ
	 oA7h4heWcFj2VsAb7QD6shcmnfi9Ou3EPTo4lkQU3A+XeUht+OOqFcv+0p9CDQNMKo
	 bx802WS9+9vAMg5qThbA9bOklo8qz4px1Q1fMqgEC5ceZRM+JJ6zO0Ni0RojPJDADl
	 VeZCfzxoUgjtHaMcubBlxXAp2vBRsgYQq6WW0OQ2UkIqbQDHoxr2Rwf/LXI+1xZSZc
	 bV3khTAcZq1DkkjOvIp92b58eljiGp5h124ERqsM+PWfSqGEoU2XS3cpHSWwBoqf1g
	 EZfQ9Y9s5yjhg==
Message-ID: <d482dca4-e61b-4a94-887b-d14422243929@kernel.org>
Date: Wed, 4 Sep 2024 13:29:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] firmware: arm_scmi: Ensure that the message-id
 supports fastchannel
To: Johan Hovold <johan@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 konradybcio@kernel.org
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-2-quic_sibis@quicinc.com>
 <ZtgFj1y5ggipgEOS@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <ZtgFj1y5ggipgEOS@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.09.2024 9:00 AM, Johan Hovold wrote:
> On Wed, Sep 04, 2024 at 08:43:23AM +0530, Sibi Sankar wrote:
>> Currently the perf and powercap protocol relies on the protocol domain
>> attributes, which just ensures that one fastchannel per domain, before
>> instantiating fastchannels for all possible message-ids. Fix this by
>> ensuring that each message-id supports fastchannel before initialization.
> 
> Please include the warnings that I reported seeing on x1e80100 and that
> this patch suppresses to the commit message:
> 
> arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
> arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
> arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
>  
>> Fixes: 6f9ea4dabd2d ("firmware: arm_scmi: Generalize the fast channel support")
> 
> And add:
> 
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Link: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> 
> (or use Closes: if you prefer).
> 
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>
>> v1:
>> * add missing MSG_SUPPORTS_FASTCHANNEL definition.
> 
> Unfortunately, this patch breaks resume from suspend on the x1e80100 crd:
> 
>         [   26.919676] CPU4: Booted secondary processor 0x0000010000 [0x511f0011]
>         [   26.960607] arm-scmi firmware:scmi: timed out in resp(caller: do_xfer+0x164/0x568)
>         [   26.987142] cpufreq: cpufreq_online: ->get() failed
> 
> and then the machine hangs (mostly, I saw an nvme timeout message after a
> while).
> 
> Make sure you test suspend as well as some of the warnings I reported
> only show up during suspend.

Eh it looks like PERF_LEVEL_GET (msgid 8) requires the use of FC, but
the firmware fails to inform us about it through BIT(0) in attrs..

Konrad

