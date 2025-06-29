Return-Path: <linux-arm-msm+bounces-62977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A3AECE2F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0907717032F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E4F19F11F;
	Sun, 29 Jun 2025 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HeIoxax3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276EC226CEB
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209011; cv=none; b=jXyj1cXtX8+8lb/82rIqh28KU0SwQviFeywsLXzJIwkm2AwtriYQdbV00dSvDu1EKgsEkBB4whqHlpS86PTZbFwmmWnV0r7oPtcVbzudalfE+xHrXjFAnogs5ZRQ/3eyiOYmOOIqfb6Qe1eaSitYVdfqVWH2AafnnUI+j5wEGIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209011; c=relaxed/simple;
	bh=J316jFgbpq5YXKrNYAt7lgGdY1nIB8PU/oR+sY4DAfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdC+l+Jc72ZHQI/AmW1OeDcenxH6X/1KYWtEJrmRLrZRzqPwKsdmgnMwu32/Fiw8qGL0wRr2oGD3lRuMHf+z8K3LmQMz9CJsGEEZJuMe3+lM82b5FKA6Pri3XhVCC1hmZBMACG9MekbE/ca+t4K08sPKiTXTewCoJFzjmhEi1DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HeIoxax3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751209009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23nBsXGE98DROnysLRUCmBBmFEY55o2S0OpjTv0kX+I=;
	b=HeIoxax3f+d5CiTMvbUc8qQ6xuafvkkJqaortcWrQYcapKuakG62tcKFak5s7g7V4zi/Uo
	W2e/vMBN8n7b6zEBAaXF0GxQb3I5PoQHHozR4thlKUWH1tmi/B+/mIHp0jF9mBiVwuTbB+
	lQ2K4rP75cbbdqCEIVWxwajnkLelUas=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-A26y0FZgP0Cc_HmlrdC-qA-1; Sun, 29 Jun 2025 10:56:47 -0400
X-MC-Unique: A26y0FZgP0Cc_HmlrdC-qA-1
X-Mimecast-MFC-AGG-ID: A26y0FZgP0Cc_HmlrdC-qA_1751209006
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450db029f2aso14976735e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751209006; x=1751813806;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23nBsXGE98DROnysLRUCmBBmFEY55o2S0OpjTv0kX+I=;
        b=AxG9XA4aJFNJ3GoP+PGEBFO+oLq2sQc5xbsAPiPSMN8twKJsbUefxAH77E4eivNBAb
         Mwa9VUChjaa6yNsAU8GBLUqRsIOthnRPT3M+/jeyZ+/QI9NjfEIqZ17OfMzf/M5ohHMW
         ooWiS/KsKiVEWfNRZsUn8n/2RMam0D1Rl+x2LhTIDxXsLP1rLXU0rcqXajMAPdjq+qi2
         q4noDJr+AfxjPRbgDeAbfDN50cUsFKO95V8+G4Khywww3akNXvVCe8EhkZc5r7kDZaBN
         oNhd94aTnn3F59f5A25LiE0YHtR5H0Ep/kC41x7bI16gL4vbvcfOZDPDhi5IaMNob5ik
         rxYw==
X-Forwarded-Encrypted: i=1; AJvYcCXDuzsOgFcI8RN8xwCV8HzDLL9TL9NiNTpQdXJhFxwBTDOUUFOdj6NBCx9BoKZACKc/n+RdjeZSlLvWVves@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfma5Astfq7e8p0DSYgpFoxhB/0EWJ7Ei5E6fx8OF+L2dXe2uG
	RKxr+8aNA/RvRo80EefX/738yDj0GvauVf1OHlVIwjfEuKGqbKO+k0G8DxqN2QsuOTcSvb/yAju
	z3ziuU0q/PuFawW0gTXUk0YSdnaBodH02SuXF08HTMPtQEtOyXPmC/zj1vcGKUFV6/EE=
X-Gm-Gg: ASbGncvzeJ9vxTplLY69k+o2Ef4RTYePxYpwVstmvmqCpDsefxGvMr4uT7uoeOZthlq
	XWretmM3X9OVn555PT7KcMHRZl9bXZMjychrx+GR3M65A8eW1D4wajfe3PmjTfeHsKC3vIjwqLT
	kCBwAFCsgvglTWUZyl3BAHsLQ5wL9T8iMYWwcH6xNnZo7iXFMHSfVb5Wm4W9Xja+U3s8ac6rXgU
	Simlr2KFRcrvrlpft+EBIhKbnHoCNwZ+P1ptnHbvgBKDKia4yOexJ0eyOzDWZ+NdMtn4Rv0mK4v
	yKJrCPHplx+xC3pGJ/2KzeOeZ8PNsb93dW+8Q58bEU00tIhrgAqQvKC0x9Ea1g==
X-Received: by 2002:a05:600c:1ca0:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-45390bfd05fmr100453995e9.15.1751209005845;
        Sun, 29 Jun 2025 07:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzwxSKog3DMgujlctJnFDZzoxRMzCEAFRJd/Z3o45oYA0FJvn/qBy7zWWf7etH266Pm4C3Zw==
X-Received: by 2002:a05:600c:1ca0:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-45390bfd05fmr100453805e9.15.1751209005387;
        Sun, 29 Jun 2025 07:56:45 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b? ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a6716sm107501365e9.11.2025.06.29.07.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 07:56:44 -0700 (PDT)
Message-ID: <da066412-9514-4475-9602-0317efa458e3@redhat.com>
Date: Sun, 29 Jun 2025 16:56:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/gpuvm: Add locking helpers
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
 <20250620154537.89514-3-robin.clark@oss.qualcomm.com>
 <CACSVV03d-3J2SxSnm3oS2OG9LHEJzLKpmgWF=Cx8_Qgw3PZPVQ@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Content-Language: en-US
Organization: RedHat
In-Reply-To: <CACSVV03d-3J2SxSnm3oS2OG9LHEJzLKpmgWF=Cx8_Qgw3PZPVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/25 3:04 PM, Rob Clark wrote:
> On Fri, Jun 20, 2025 at 8:45 AM Rob Clark <robin.clark@oss.qualcomm.com> wrote:
>>
>> For UNMAP/REMAP steps we could be needing to lock objects that are not
>> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
>> VAs.  These helpers handle locking/preparing the needed objects.
>>
>> Note that these functions do not strictly require the VM changes to be
>> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
>> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
>> call result in a differing sequence of steps when the VM changes are
>> actually applied, it will be the same set of GEM objects involved, so
>> the locking is still correct.
>>
>> v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
>> v3: Expand comments to show expected usage, and explain how the usage
>>      is safe in the case of overlapping driver VM_BIND ops.
> 
> Danilo, did you have any remaining comments on this?

I replied to this in your MSM VM_BIND series.


