Return-Path: <linux-arm-msm+bounces-86954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B82CE986E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73EE23004EF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 11:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492522E8B94;
	Tue, 30 Dec 2025 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eJ7ngUhg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="snZdCRfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1465B2264A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767093561; cv=none; b=drh0xyDUJtrU8A+ZACEu1niTodmES4PZfGwH7dY51ef05uAC5YOlzRNNf25Cyi5Z7d4hrvcXQsGmuDK0jtULIYSbl9S3cMsE3+Zp7TOcoSMbI65+DKKSW4WgBPM50zlxUIS+4QOE4RbBiIWz689BQM0uuRlW3Tq2AIZEWHRbTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767093561; c=relaxed/simple;
	bh=Jvz1P40VPI3GI2IPAvBlpLBMAOhptp9OUvSuPi++EAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Smj4aq3OHYpWq59HdLFIFzu42hw+wxzlh1c/TwkmAVMXMvrkioQ7ZObfHWZqSDceeyhNPn/9clCiPt9K5cf/UFmYYwds2SAdeHQ4zhGiQ+FrTNLqqr60XOHqXb0aO5N3FOUUKnyR1lgrOFuYwKwrvGWUnZl0EPMuirB4niQ0Qdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eJ7ngUhg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=snZdCRfU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767093557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7hrgwbUeI2Nj9FtXzSGQZOICXYg61l+/KAfCDFoCa4=;
	b=eJ7ngUhgr/2M1jFbMnM5FW/AsIAvBS0YcJ8ZFYV2Lbkg6vo/HW58ySMxry8SAUq9y3uT4a
	0VCkx/iGR06r6FfkMc13MaZr9C8oyV9XRya83tkWCNAYvSzv9nVclDYJR3MOgiQdyzI2aF
	QRtYt+585g+h3pLmduf9hERCflNgzDY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-a8aKRsg1MsucwqO3evnwFw-1; Tue, 30 Dec 2025 06:19:15 -0500
X-MC-Unique: a8aKRsg1MsucwqO3evnwFw-1
X-Mimecast-MFC-AGG-ID: a8aKRsg1MsucwqO3evnwFw_1767093554
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430f8866932so8026758f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 03:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767093554; x=1767698354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U7hrgwbUeI2Nj9FtXzSGQZOICXYg61l+/KAfCDFoCa4=;
        b=snZdCRfUVsUHphYv98uC/JZ7JVnfg2MrFWG0Wjphl/mIy9KICo13rujevSNchV8kMb
         J3FY85tzHN4rfWJfiTSqqb7IkE5nbLqxH6RCRmiHfqJJgoPcZXElZqnpq6pJjdbsxLa9
         tgjJpgCgLyUCsFwBpGFPgXNVSAEjEbT/Jv8icXS/tWr/+emX+RnvS8EehwoqImYtMp3p
         ahQnX5CJ1BiqZdT3tGkQJaA/LMEYoAgrGnShvgSx04jsnTpND2rV7gMDfWL9juKahJRz
         PqW4JSUOTUi/JpslFqHBgN3EMs6i3GQDQhh2vJ9sppavi/DmUrOw0RVOaTrM78rrOelG
         lgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767093554; x=1767698354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7hrgwbUeI2Nj9FtXzSGQZOICXYg61l+/KAfCDFoCa4=;
        b=Jjg9kxv6mMOigwmPNmNpmLMHqF3zQgeyCTO+39VuM5wVbZcxVEioMTuKEpTv3d/UQl
         nPdmM3/bW1a5lGY3RAlq6gURE+AfFh8ViA+jjWzdIon/Px0wDkVI7XEGIufOAzdnoQKz
         rQty9JJpgKY+9n9x+T+TvbactYGnNGHyIYnj0R/qbp+urtBPch3qyMl1Ouc1Ic8669jZ
         mUsRMj9kDY24UPWEin6ZyPTC+DoBklhUYFAVMfghInVR+beCP/J+qjZMku0TGaEM29TU
         AOS/kPzk1o4yJzsIeyQxVBaVawzji8SJod/RzVcyxUUHZMCvAedIz0K2x+CZLv44+agz
         bOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnLGVCtTAaQQKv9xaZy5/fU2UZWsEV1qwqrHo3n2SGlVYYsFYfM3NxKKcvzpJTo57aMLaLzb8rYeGNpSCs@vger.kernel.org
X-Gm-Message-State: AOJu0YyqYCcZvzAhRen5NGGMUusr0GDVeviqX07FTch58PpvA782Nezy
	ec4NiiWQaL5FPCGTc1xFjdlv/qcUQNWG3Oev8SlV92T46zT5Ef+JbvUXGXDoEAOX+9PgncAM9Or
	GPTdb6fy/60so4eRMFU4egjCztFPdyzjFJL8flv923oW7eESr+7jzjhx6f9TzsLB5yaI=
X-Gm-Gg: AY/fxX7WvSdPnnqTUzwXvq1oeLIQBc5Jrf5rZZRcCN5OhZ9ZrpPfTUbaaRr4yNJpt9c
	uITH2x59yhUWF1Jxg3RR/+ApzuDS9nXsSYg1MdYV9du3jvYSKy1QUx1xHu3y1AinOXE4F4n/vpX
	8/YRNxUe8Rl3CSQHaanHb8O5RmpHBbS9BadnOUm8Kz703gcpr8kx8BzoBlFKzw9hhikahb+wSt/
	118m0wKssZQZfMbJ8tsM851KmEOdaoyXuhOgy6ZZfiBo3Wdp7lyeejdjP1162fwB7HALcnBSJzf
	gYkSwPhL4oyrBSUvbQm3xSAV8FW+Onk5ZE1ROKm7sM18kuenMUk6yOS1C9XJTwqD9yVCy1mhKtT
	PWqSNcVdjLHLU
X-Received: by 2002:a05:6000:2285:b0:430:f5ed:83d3 with SMTP id ffacd0b85a97d-4324e4c70damr45678314f8f.5.1767093554370;
        Tue, 30 Dec 2025 03:19:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHboRnDVzmL21EwUlm2sk+VKxBUKVEIOYW980hh/unpcMdOb28kmZ5YH4pTgiukG05Lr4ZGvw==
X-Received: by 2002:a05:6000:2285:b0:430:f5ed:83d3 with SMTP id ffacd0b85a97d-4324e4c70damr45678270f8f.5.1767093553933;
        Tue, 30 Dec 2025 03:19:13 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm67972803f8f.7.2025.12.30.03.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 03:19:13 -0800 (PST)
Message-ID: <d3c7fad0-2c59-46cf-a1df-72f4fbbbe666@redhat.com>
Date: Tue, 30 Dec 2025 12:19:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn
 T99W760
To: Slark Xiao <slark_xiao@163.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
 <CAFEp6-23je6WC0ocMP7jXUtPGfeG9_LpY+1N-oLcSTOmqQCL2w@mail.gmail.com>
 <4c4751c0.9803.19b3079a159.Coremail.slark_xiao@163.com>
 <CAFEp6-2NBa8tgzTH__F4MOg=03-LO7RjhobhaKHmapXXa9Xeyw@mail.gmail.com>
 <703d68c0.93c7.19b6ebaa741.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <703d68c0.93c7.19b6ebaa741.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/30/25 11:08 AM, Slark Xiao wrote:
> At 2025-12-30 17:50:39, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wrote:
>> Hi Slark,
>>
>> On Thu, Dec 18, 2025 at 9:01 AM Slark Xiao <slark_xiao@163.com> wrote:
>>>
>>>
>>> At 2025-11-21 20:46:54, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wrote:
>>>> On Wed, Nov 19, 2025 at 11:57 AM Slark Xiao <slark_xiao@163.com> wrote:
>>>>>
>>>>> T99W760 is designed based on Qualcomm SDX35 chip. It use similar
>>>>> architechture with SDX72/SDX75 chip. So we need to assign initial
>>>>> link id for this device to make sure network available.
>>>>>
>>>>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
>>>>
>>>> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>
>>> Hi Loic,
>>> May I know when this patch would be applied into net or linux-next?
>>> I saw the changes in MHI side has been applied.
>>> T99W760 device would have a network problem if missing this changes in wwan
>>> side. Please help do a checking.
>>
>> You can see status here: https://patchwork.kernel.org/project/netdevbpf/list/
>>
>> If the changes have not been picked together, please resend this one,
>> including tags.
>>
>> Regards,
>> Loic
> Hi Loic,
> I checked above link and didn't find my changes.
> This is strange since the changes in MHI side of this serial has been applied, but this 
> has been ignored.
> BTW, this changes may not be applicable because another change 
> https://patchwork.kernel.org/project/netdevbpf/patch/20251120114115.344284-1-slark_xiao@163.com/
> has been applied. 
> 
> So do you want me to resend the new changes based on the latest net baseline ?
> Any serials shall be assigned? V4 shall be used?

You must re-submit this patch, targeting the net-next tree (the subj
prefix must include 'net-next'), but please note:

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.




