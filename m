Return-Path: <linux-arm-msm+bounces-30910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D738596D971
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D7C71F2A174
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A6C19D881;
	Thu,  5 Sep 2024 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txu4W7qK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE1319B587;
	Thu,  5 Sep 2024 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540847; cv=none; b=p0IAavlqeRoy+Oj9HEiNZtERvO5HIwQ100cEwyYJvZTfokFApQPwfHFFYIdwH4VpLA2wOVxI4PgV2cdPKQADdqGcZrmUmzPXTI+I8GPL1x7IZIEXw/Lt8Y/tc2AOpWRhY7lBE20I8XWNkX+j5LKRxudAravICFpq0zQM5cXQhcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540847; c=relaxed/simple;
	bh=4XmQrAWJa5piLkccrwPYm7CbCPObuT5Tr2OL+43Vsc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLsSS1c7A4VlJCoePeUHoUlA/f62drOj37rGXUbjUaAmw2Rc82cvSwZ7iiBpktN9q8mhYVxD0r1Iuo9mFbrEHeTpOUQPOc4FHFKjTur+XT7+DYbV4EiiqORHXjdVWWnx2ldFvgz0DEjzp3C7NqY5VaDtbmjZyXRtv8NB0sA3aQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txu4W7qK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A7CC4CEC7;
	Thu,  5 Sep 2024 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725540847;
	bh=4XmQrAWJa5piLkccrwPYm7CbCPObuT5Tr2OL+43Vsc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=txu4W7qKn8OrUNqks3clxcNgtI03eSEqYPGKxseaFpb3VVT+cQbLADzUqZbxjhuV7
	 kr964Vc9rTdbND8dpwVDDIfp3SW3V7tlEL0SyoR/0py/cp4noniTyItlLO8oUXcBIF
	 y+UeiBTqaN3cCCMv4CUTJ3aWTWrTMFPSxxPKg78qA1O+rUu6zzKn8+Prsm2vNSvBlW
	 KfGrbfkOjBd/RrkuapZB01929cjMkUed4Z62nuzx+m0TRT6zzIXkZtnjNnw7hLP1D4
	 pLqFD3pdKqYZP5nsGxi/6lLhoRBv32QYZFM/cNY2NzjoAmzmORI3wwFFwJggwox0vJ
	 wJUHJha6rVW+A==
Message-ID: <7d47081b-e7f8-4391-946a-f23e110976ec@kernel.org>
Date: Thu, 5 Sep 2024 14:54:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] firmware: arm_scmi: Ensure that the message-id
 supports fastchannel
To: Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 Sibi Sankar <quic_sibis@quicinc.com>, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-2-quic_sibis@quicinc.com>
 <ZtgFj1y5ggipgEOS@hovoldconsulting.com>
 <d482dca4-e61b-4a94-887b-d14422243929@kernel.org> <ZthU36Qkzwa5Ilrb@bogus>
 <ZthrRHmV8xTsPbZ8@pluto>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <ZthrRHmV8xTsPbZ8@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.09.2024 4:20 PM, Cristian Marussi wrote:
> On Wed, Sep 04, 2024 at 01:38:55PM +0100, Sudeep Holla wrote:
>> On Wed, Sep 04, 2024 at 01:29:29PM +0200, Konrad Dybcio wrote:
>>> On 4.09.2024 9:00 AM, Johan Hovold wrote:
>>
>> [...]
>>
>>>>
>>>> Unfortunately, this patch breaks resume from suspend on the x1e80100 crd:
>>>>
>>>>         [   26.919676] CPU4: Booted secondary processor 0x0000010000 [0x511f0011]
>>>>         [   26.960607] arm-scmi firmware:scmi: timed out in resp(caller: do_xfer+0x164/0x568)
>>>>         [   26.987142] cpufreq: cpufreq_online: ->get() failed
>>>>
>>>> and then the machine hangs (mostly, I saw an nvme timeout message after a
>>>> while).
>>>>
>>>> Make sure you test suspend as well as some of the warnings I reported
>>>> only show up during suspend.
>>>
>>> Eh it looks like PERF_LEVEL_GET (msgid 8) requires the use of FC, but
>>> the firmware fails to inform us about it through BIT(0) in attrs..
>>>
>>
>> Just trying to understand things better here. So the firmware expects OSPM
>> to just use FC only for PERF_LEVEL_GET and hence doesn't implement the
>> default/normal channel for PERF_LEVEL_GET(I assume it returns error ?)
>> but fails to set the attribute indicating FC is available for the domain.
>>
> 
> Is not that FCs are optional BUT PERF_LEVEL_GET standard messages is
> support is mandatory by the spec anyway ?

So doing a bit of poking I think it's that FC is not marked as supported,
but we need to read out the frequency from the .get_addr.. which is only
populated if we go through fastchannel_init

Konrad

