Return-Path: <linux-arm-msm+bounces-62975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F4AECE16
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A015F7A6201
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876531EA7DD;
	Sun, 29 Jun 2025 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TDubuIuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D6A2A1CA
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208566; cv=none; b=hdJbqkEp9spofy2BBceqntliNTsieDyq5Q4WvR/tG178DPTp93/keS/wwRQIGkRywEEz+XUpAk1BH0ugfixSNUgG6Vo3KYT61VolloRhIPz11mxpsMdMvkey4IvwrSo/sTUCmrVe9g5w8oACIUUVbEiSm1WsRIf/UNC1v9rkdQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208566; c=relaxed/simple;
	bh=cvh/eRSTCF7UEu5QBsgWoqMSWqnvc+vpBtIM/odhqtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhKl070c52iUSyqayvK6NkVJfS0WqTKFWWpk2S8N8i7IwDPyYRxPi9XnmEblRyKbzAVWEViuF5KniqPy/ZXjdjicHPo0mc3wYKaTMNbTMUV/Z/pnORZVViIx2rKktQ3ZaF/fCfYgMphWbBs2cfNJQqgOVoKL+sENypGGCBCkxC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TDubuIuz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751208563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMo4hXlw+x8qKQedb4fDzGU6UZAlnq0HY+9C+6mhqr4=;
	b=TDubuIuz8AyGxcUtwXXVDp9obA0QPkOv57cViwkdeiVA/JffILnNlFJg/769pKl/IK2pnB
	AVXgf58SJsY8JAN4rBwQpCYtKFscywnxpdIeX05pOvI9LdzH4T/2vvJRV6HXNs5bNo0An9
	+irO09ElTxvpzVhdpLM72HhUzSP7AlM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587--ghvJt3WMByHmhNv6IpVGw-1; Sun, 29 Jun 2025 10:49:22 -0400
X-MC-Unique: -ghvJt3WMByHmhNv6IpVGw-1
X-Mimecast-MFC-AGG-ID: -ghvJt3WMByHmhNv6IpVGw_1751208561
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f3796779so1836382f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751208561; x=1751813361;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMo4hXlw+x8qKQedb4fDzGU6UZAlnq0HY+9C+6mhqr4=;
        b=qecsdJwz5fHGUGEfIynCF01qYCuyDz/URg+P3+mgW7c93ugc8dB+EXrLVwOShW06PT
         1Vv3r/qrgoV+8GgGxRIFKS1BVfEBLv+lWBfZeRrvx8tglPfk5N6/HyDmquNQEBlKQzvh
         V/SZ7iE8nQONhVEpbrd8XggxkX8cAAJHCyR0SxNfQYnPoXt0agqmITClfhtomUQpzmUD
         X/VKdNTrzt9YRdsX729JoZe/Xog6GU2AkulOfj+gDYJH4pDTLJzzW6FpezGAVa96P9pU
         lMS7+CrJilvqJ/jPmmDjS9l4MN39KvAGNPNtigDdf5Y3oMuGyusUqnXWNjbUpHDBKsoL
         he2w==
X-Forwarded-Encrypted: i=1; AJvYcCUKYM2GChzs1ZrX974lB8jDAiEKB8o0w7PrW5s4n8lOebmo0I2Dsrf94bGmkS72zZ/lYCYIJd/CFMQsscjl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2FRUKa7EXvwuoD9puuZC9cxI5wPC1pxQpiSTQPpV7K8zI6c2
	lkwZiRZomnjTEX5m7JF7Py+z0OBx2VoBCezrpprd+viHrA5eo3ZF+PXNbXHU5PlV4oZGoc03Oz/
	ThaPUZSRb8H1PcoCfzNsfKEM6L/Car9SIIVhcdG/j+ybw0vxiJq8lpMTi1JVXw56T2Co=
X-Gm-Gg: ASbGnctfUIq0at0glTDJjP9CoJDLDqgW2qJZuQ6IkqHaUXnJ7Kk5lpN9avqnC9hhznb
	7E2Dpvq4XtwXICojiFBYSJ4l5BYVxuoRg9OY+7EzZ8yfxUEbkgoXrNPditHzrJWeCJySc2EHXex
	dIBwoOc0R/zYkm06jWyfbApV+8tz+NbdfDEFIoG+QG4hcnsXa980c3XHJpkuBlKyrU51OuM909Z
	rQV+KqKHo1iZjrUciIdlPKPUdUY2zwsFN4VTy7JjJVsDZhcTKBbR0J2kUoBRGOX7HyFaka8r9WK
	xhh/f1KcplpKI6HCymVDFkEwcxrqcuD1zc/g0ZNXnf9XG4I7RvVLTbRPhGHryQ==
X-Received: by 2002:a05:6000:40c6:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3a90d0d6ce1mr10106116f8f.1.1751208560859;
        Sun, 29 Jun 2025 07:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEglecXEkF/z7cvyPDkLXht+rIkJ5l7TX//baZlvQGm4Pvn+sfnI3+HYTKX4a47o/g4mXZXLQ==
X-Received: by 2002:a05:6000:40c6:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3a90d0d6ce1mr10106102f8f.1.1751208560423;
        Sun, 29 Jun 2025 07:49:20 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b? ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa8aasm7826048f8f.27.2025.06.29.07.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 07:49:19 -0700 (PDT)
Message-ID: <b7fafea0-2a0d-43fd-a3a9-847d61273cee@redhat.com>
Date: Sun, 29 Jun 2025 16:49:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/42] drm/gpuvm: Add locking helpers
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
 <20250629140537.30850-3-robin.clark@oss.qualcomm.com>
From: Danilo Krummrich <dakr@redhat.com>
Content-Language: en-US
Organization: RedHat
In-Reply-To: <20250629140537.30850-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/25 4:03 PM, Rob Clark wrote:
> For UNMAP/REMAP steps we could be needing to lock objects that are not
> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> VAs.  These helpers handle locking/preparing the needed objects.
> 
> Note that these functions do not strictly require the VM changes to be
> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> call result in a differing sequence of steps when the VM changes are
> actually applied, it will be the same set of GEM objects involved, so
> the locking is still correct.
> 
> v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
> v3: Expand comments to show expected usage, and explain how the usage
>      is safe in the case of overlapping driver VM_BIND ops.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Tested-by: Antonino Maniscalco <antomani103@gmail.com>
> Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>


