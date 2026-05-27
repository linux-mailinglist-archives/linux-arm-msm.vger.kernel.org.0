Return-Path: <linux-arm-msm+bounces-110024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHzvAP5XF2oPBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:45:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED085EA298
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91C3130417B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 20:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E783B637F;
	Wed, 27 May 2026 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F86nRPIO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C93B0AE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779914621; cv=none; b=UmfseNcU/u3SQ27z4sGKrZCJMz+/M1QuYsyZ0cpzTll2S021RagmWl+WHuW086mXBJ9NkDFK1H08e5cEjpvhjgDELMZ3/+MCnLIJEJuk1BvPwul7e1b75LOBuvzUvLJALd2vvCHoMTHQMtzAdDjJDnWUDRHey+T/O/N+5Br4w+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779914621; c=relaxed/simple;
	bh=AkzX2MlqKTaRtxCpwMIv0eAGJ5QPIVZAFJN0tzOXrjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WByq9IDiDd+VsHe3kDxswMsWrMk7LpIaMiDPq8rMwZAxKPbOzrm1apAZwT/kFnwdN89ynjw99nc7YbFWFPJAILDw8yvlGzkFfrkyt0zIUj8Uk/iTVeaySHHDXA94L6me6amQFOtelVTQyEfTG8eekk2ne6Wp1awKfNSacO3tE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F86nRPIO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf008a99d4so2291695ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779914620; x=1780519420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXTPczjLvJobFRbkK7xxt7iJVHks66505vqIfh89VkA=;
        b=F86nRPIOL+UmKq/0fSBPrIWnBhdDDjUeLuo6B9etacPsr7AUj4XuEJZyidJxi3Rsa+
         p9KStBE+v9G3pxocxGsq5mjnUPAJSCMUMSNBE8zfVZYmT5Pvxo0jQ52feZAiuZd/iOQW
         DKPTwcrU3+/n/KP33L13QY9SBagjiOfK2IyWTcZtE0kLsAoOM/+6OInNcW8FESYtuuup
         YDE2nohfslPNpI4dKTG01OFCQxCWGDd3XWcs1DOOnTbtr6jmcXbRpNbputF8dlWysNAw
         +CnZdn//WCEJFHoo3lX1cElT/bkVuKPB8RrQl7JzbknOyPALTrlsBrunyQf0wfzM5P6I
         azCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779914620; x=1780519420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXTPczjLvJobFRbkK7xxt7iJVHks66505vqIfh89VkA=;
        b=PPgqVcQwHOLi9c2G116nvAB7gC88fEFJZy4tVaKjnzseLy+d3h55AOBTtBvZPKxnOC
         k9OrNKd+S7KgCQKmpF/L/14XRU2bF0BS1iOuc60tRiAjtt7UGqlUw8K5i+iB+Y7mp/gD
         i473++DIpGAIqK9xb5VO96Oj0XRGkbJOzuDPKL7nIQ6XBLYN7GTSbo7FECQ4ibApRkhV
         CIC+KkKK5uPQ0KDQ0OEmMhgsu0NZ83rc+N5tdtfktMVJJY3bzFhd6fITF72c5Bk9Wxte
         EW++VwMeDRScazGq7zXwdw+CJnvgNrseac/lJ7eK0vU4DO4At7bs3LBT5YdoQNUsiUU1
         chdw==
X-Forwarded-Encrypted: i=1; AFNElJ99QUzWKFmgxqeG+7ciVLKOhCuUvUDpPHIIS3beQSwU/mTTcHKgJCx41sHVcraFSChCQZHbmUvmpc2aPHiA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx//WwMUF/VEK40DoG1XxCeHxfPmEGH9u0K8gvqSoSiZtSHZiLM
	rQKQH2SkNIBTP89glMm+/ChCfURR8gC5wuQhhn09eSL1rbU0iD2NMJ9I
X-Gm-Gg: Acq92OFtGqAhocEhtvuLg26Ov1xBO6jVzH7wnVkz1j0nFgZzw42oelIGtC2fEIOzXpK
	iya3QuXMAQhGpXAGV8NdYGqkS52fRe5EbMcLdQ9zxzSFBlI9gYEYrXQmHLneuA8vwXTdvH3oFhp
	wcdt9KEuMJcIgjSUMcQQ7JhGS/BXRL4jZ45b/Jzc2ds70U+9gDrjS+5LG2bX/XZfRncggLggMFV
	/3mPdg0OpR1xjT9J1UeCCnEVsHDCfrRGkYd6PdqlvEsbIoQHPzNwT/korBHv9L+TlR0MkRuHhSz
	+jMw8zuDkNzaa/q95brqDfSbKbRtL11IKDAft3kzjHXHzJUD4Y7RQ9A/Ur+pPluv+JFoWSu6eQq
	dWZ4GvJa456uQe8xZPcTUEkek6iBQWWJ9hn1Fbn59anqf5+jJCgrubsVfnVsePm7aShTkkJa4Vj
	6iQyIPsh2SbNnwTMfet8U0pEj5nXzPncqHZN6+arT460gPjZg=
X-Received: by 2002:a17:903:f86:b0:2bd:2de3:5198 with SMTP id d9443c01a7336-2beb033f48cmr279229085ad.3.1779914619757;
        Wed, 27 May 2026 13:43:39 -0700 (PDT)
Received: from [172.18.227.108] ([219.88.198.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ccbsm165239385ad.48.2026.05.27.13.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 13:43:39 -0700 (PDT)
Message-ID: <30edf212-f656-4c09-a066-d765debf3fcb@gmail.com>
Date: Thu, 28 May 2026 08:43:31 +1200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: qcom: Enable additional hardware on Radxa
 Dragon Q6A
To: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522101323.31911-1-graham.oconnor@gmail.com>
 <15015D7EB84640D6+cc21a9f7-ae1b-4a22-bb38-34d6fafe1bcb@radxa.com>
Content-Language: en-GB, en-US
From: Gekko <graham.oconnor@gmail.com>
In-Reply-To: <15015D7EB84640D6+cc21a9f7-ae1b-4a22-bb38-34d6fafe1bcb@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110024-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8ED085EA298
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xilin,

Thank you for the response.

I appreciate the offer to take over your patch set to move things 
forward. However, I feel I must respectfully decline. This is mainly due 
to my lack of experience with both upstream kernel development on this 
hardware and the patch management process itself. It would be 
irresponsible of me to take on something that I'm not knowledgeable 
enough to ensure successful completion.

I'm happy to work with you to help in any other way that I can such as 
testing patches, but I think you should maintain ownership of the 
patch-set and submission process, at least for now.

One of the reasons I withdrew my own patch-set is that from what I can 
see your series covers everything I was trying to achieve, and does it 
correctly :-)

The only one that isn't covered is the patch for early TCS 
initialisation that I'm discussing with Konrad which may be unnecessary 
anyway.

Graham

On 24/05/2026 13:58, Xilin Wu wrote:
> On 5/22/2026 6:13 PM, Graham O'Connor wrote:
>> Thank you to Konrad, Neil, and others for the very prompt and helpful 
>> reviews.
>>
>> Based on the feedback received, I think it best to withdraw this 
>> series to
>> address the issues raised, most notobly:
>>
>> 1. The DP_TRAIN_LEVEL_MAX change (patch 3) is too broad - it affects all
>>     devices using the Qualcomm MSM DP driver rather than being 
>> specific to
>>     the RA620 bridge. A proper fix should be implemented at the bridge
>>     level. This is going to take more investigation.
>>
>> 2. The display DT nodes (patch 5) should use the radxa,ra620 compatible
>>     string per the existing Radxa upstream series from Xilin Wu, and the
>>     lane ordering needs correcting.
>>
>> 3. The rpmh-rsc early return (patch 1) needs further review regarding
>>     the implications of returning before full driver initialization.
>>
>> 4. DTS patch label dependency issue (sorry)
>>
>> I'll integrate with the Radxa upstream effort, re-evaluate the other 
>> areas
>> and resubmit corrected patches addressing these concerns at a later date.
>>
>> Thanks for the feedback.
>>
>> Cheers
>>
>> Graham
> 
> Hi Graham,
> 
> Thanks for working on the additional hardware bring-up for Q6A upstream 
> support. I'm really glad to see someone pushing this forward.
> 
> I actually posted a patch series [1] last month, and it is generally in 
> good shape. Unfortunately, I got busy with other work and haven't had a 
> chance to send v2 yet.
> 
> If it helps, please feel free to take over that series and fold your 
> additional patches into it. I think that would be a good way to move 
> things forward.
> 
> Also, I believe patches 10-12 in my series are no longer needed and can 
> be dropped.
> 
> Thank you again for the work you have done.
> 
> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/? 
> series=1078242&state=%2A&archive=both
> 


