Return-Path: <linux-arm-msm+bounces-49219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EFAA434F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 07:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 693E03B8D67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 06:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A1A256C76;
	Tue, 25 Feb 2025 06:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b="XrVUEkmO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D9256C6A;
	Tue, 25 Feb 2025 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740463815; cv=pass; b=OkE4r8gOOvUs43aWzWmx6U2ifxyO1GPwrRw17A1u+XsUa49HJQhlqQGoXIfqpffZE9JarBrlnB5+fTZsBNHvjpPFqLX8eS4vPe28fcKB6kMx+zdfhB9Bou5h6BxRqF9KSqf5VjFIi3SjWG70b2o0Vx92dyp1xTAdCTyhkj4P27U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740463815; c=relaxed/simple;
	bh=fxjYhhopdIJkGIyF0ESuXORJasUN6Sxa6lF8FBEgu/s=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O1DeISGbBASObqR68U6v8uPL1XYVsiVaeNGVS+LkA7d7H4fpDv8CIJ2w6VFMlsBoOYJ4s4vrfCSqrknC1GPwXrad2QpmjNdy7Ub8UhW3QgRNDdUtKQNtXZcPiPz+gMQMQ9r6+rVGzOCd3gi35i14tm7mp66F4js9ncuGTe6OR8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.b=XrVUEkmO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740463767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MoxhigzgjKJZtjuMmmxtmjfd2B95WHy56Is1CRIbfGaDh5fXMdDFuTpf1hlCX1QvilcJ9Nyk582gyDVWQc58QhMk/SpRxfOhEQye4UJVl+VfUpv4Nrj5tnYUrGuOGMaKtaMrOX3+eRIt14XzgyLFXXazgnkQR9KqKn7cYRWSZbw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740463767; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zlGJk/boTTi46WwLjRxSuU692UCYhuz4KWqBVlpFD2s=; 
	b=E77T+47VTEpF9m5gWxnlb58MjXvuDgg52KvKgXSiFJxPvMKdCxqrD9zimoSZGjm+/cpZNcId17F8Z91szlW+0Ok7jZFYONkasLf2znA+KhMdf6AjF1s7iuQiDqjxbLnR0fpq7sCLkbL8VIzBL4CJwxKap3JjPf3fvAWFEfmj1GQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
	dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740463767;
	s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zlGJk/boTTi46WwLjRxSuU692UCYhuz4KWqBVlpFD2s=;
	b=XrVUEkmOoIzAxB8edEvVsTnEK14wqXdy3pGXFAylllaIlyWVgeyugUziAX+W/F9J
	0Gke1Fh1EnBhDUJyGynb1WLxCfy9lPUTnYD7K77Ya1b32qOxaVdCxt0ei7oJW9FNXW9
	sYBv1atwcZ4x4ru0xyrftIZQIR+Ij3yNovzfvOOg=
Received: by mx.zohomail.com with SMTPS id 1740463764036975.0626584461274;
	Mon, 24 Feb 2025 22:09:24 -0800 (PST)
Message-ID: <b3540615-0dc1-41f8-bb8f-99f01f909b36@collabora.com>
Date: Tue, 25 Feb 2025 11:10:00 +0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Usama.Anjum@collabora.com, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Johan Hovold <johan@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 kernel@collabora.com, ath11k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [BUG REPORT] MHI's resume from hibernate is broken
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <59c036b6-a3d6-403b-8bb0-566a17f72abc@collabora.com>
 <20250214070447.scs6lpytjtecz3ko@thinkpad>
 <1cd4a1ed-f4e7-4c7b-a19f-f79afddbe310@collabora.com>
 <20250220075034.unsd5cq7xkip2by6@thinkpad>
 <ec8a01a3-5eaf-4fba-bb85-e7a677877e5f@collabora.com>
 <20250224164400.w3lpzxxwfbrj5lb6@thinkpad>
Content-Language: en-US
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
In-Reply-To: <20250224164400.w3lpzxxwfbrj5lb6@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/24/25 9:44 PM, Manivannan Sadhasivam wrote:
> On Thu, Feb 20, 2025 at 05:34:06PM +0500, Muhammad Usama Anjum wrote:
>> On 2/20/25 12:50 PM, Manivannan Sadhasivam wrote:
>>> On Mon, Feb 17, 2025 at 07:35:50PM +0500, Muhammad Usama Anjum wrote:
>>>> On 2/14/25 12:04 PM, Manivannan Sadhasivam wrote:
>>>>> Hi,
>>>> Thank you so much for replying.
>>>>
>>>>>
>>>>> + ath11k list and Jeff
>>>>>
>>>>> On Tue, Feb 11, 2025 at 01:15:55PM +0500, Muhammad Usama Anjum wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I've been digging in the MHI code to find the reason behind broken
>>>>>> resume from hibernation for MHI. The same resume function is used
>>>>>> for both resume from suspend and resume from hibernation. The resume
>>>>>> from suspend works fine because at resume time the state of MHI is 
>>>>>> MHI_STATE_M3. On the other hand, the state is MHI_STATE_RESET when
>>>>>> we resume from hibernation.
>>>>>>
>>>>>> It seems resume from MHI_STATE_RESET state isn't correctly supported.
>>>>>> The channel state is MHI_CH_STATE_ENABLED at this point. We get error
>>>>>> while switching channel state from MHI_CH_STATE_ENABLE to
>>>>>> MHI_CH_STATE_RUNNING. Hence, channel state change fails and later mhi
>>>>>> resume fails as well. 
>>>>>>
>>>>>> I've put some debug prints to understand the issue. These may be
>>>>>> helpful:
>>>>>>
>>>>>> [  669.032683] mhi_update_channel_state: switch to MHI_CH_STATE_TYPE_START[2] channel state not possible cuzof channel current state[1]. mhi state: [0] Return -EINVAL
>>>>>> [  669.032685] mhi_prepare_channel: mhi_update_channel_state to MHI_CH_STATE_TYPE_START[2] returned -22
>>>>>> [  669.032693] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
>>>>>>
>>>>>
>>>>> Thanks for the report!
>>>>>
>>>>> Could you please enable the MHI and ath11k debug logs and share the full dmesg
>>>>> to help us understand the issue better?
>>>> The ath11k debug was already enabled. CONFIG_MHI_BUS_DEBUG wasn't enabled. 
>>>
>>> Sorry for not being clear. I asked you to enable the dev_dbg() logs in the MHI
>>> driver. But it is not required. See below.
>> I've disabled the MHI_BUG_DEBUG. It only enables some files. Ideally if those files
>> being used, there shouldn't be any difference. But they are definitely changing the
>> timings.
>>
>>>
>>>> I've
>>>> enabled it and now the hibernate is working without any issue. It is very strange
>>>> how can CONFIG_MHI_BUS_DEBUG make any difference. I don't have much background on
>>>> how it is helping.
>>>>
>>>
>>> Probably some timing issue. But enabling the MHI debug logs could also hide the
>>> issue. So you should disable the CONFIG_MHI_BUS_DEBUG option and collect the MHI
>>> trace logs that we recently added.
>> Disabled the MHI_BUS_DEBUG and collected logs by Dynamic debug:
>> [  584.040189] mhi mhi0: Allowing M3 transition
>> [  584.040202] mhi mhi0: Waiting for M3 completion
>> [  584.040480] mhi mhi0: State change event to state: M3
>> ..
>> [  584.535478] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
>> [  584.535482] qcom_mhi_qrtr mhi0_IPCR: PM: dpm_run_callback(): qcom_mhi_qrtr_pm_resume_early [qrtr_mhi] returns -22
>> [  584.535490] qcom_mhi_qrtr mhi0_IPCR: PM: failed to restore early: error -22
>> [  584.831583] mhi mhi0: Entered with PM state: M3, MHI state: M3
>>
>> It seems like the state save was success at hibernate time. The error is originating
>> at resume from hibernation.
>>
> 
> I just tried hibernation on my RB5 board featuring QCA6390 WLAN chip which makes
> use of ath11k driver. I did encounter the resume failure, but the error log was
> slightly different. Then looking at the ath11k driver made me realize that they
> reverted the hibernation support due to suspend issue reported on some Lenovo
> platforms: 2f833e8948d6 ("Revert "wifi: ath11k: support hibernation"").
> 
> So that explained the resume failure. I reverted the revert and that allowed me
> to resume properly from hibernation. So please try to do the same and see if it
> helps you.
On my side, I've reverted this. But it didn't create any difference. This commit is
reverting hibernation for ath11k. It isn't changing anything in MHI. 

On my side, it seems there is some timing issue on MHI side. I'll try to dig more in
MHI.
>> [  584.535478] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
>> [  584.535482] qcom_mhi_qrtr mhi0_IPCR: PM: dpm_run_callback(): qcom_mhi_qrtr_pm_resume_early [qrtr_mhi] returns -22

-- 
BR,
Muhammad Usama Anjum

