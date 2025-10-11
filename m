Return-Path: <linux-arm-msm+bounces-76836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EB462BCF5DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 15:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 493FA34B88C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 13:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0002D2773E2;
	Sat, 11 Oct 2025 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3fdJbau"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A022262FE7
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 13:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760190394; cv=none; b=e/n1MBgEj2tDrtobWUmJAEY7G9ETkbPsGTgAM5SrQt0r0XDcbtrQwk6ZgKqjtO6VbMw//pI5kr13RaW3Oje2Hjnx6CZSiy0J56L+Bj9Ze4c/x5m3GrVkIcTASpgtBGLpcEZbdeaE+hMFnuLcQe03CGFFVkZ3TMx0Vqff7kg8R0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760190394; c=relaxed/simple;
	bh=2mP/mdhx/PZWZwIOnFDykMB/bobzYkS+gWP6uY2NlcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XPmY1dAbS3QSWMTVWIPM7/qdzXy0FxfNqTLyPKJU2MRLi0rO8GOwwbrl/GttS/Dv8lLNtuXeO8yy0BImDtAksHZRl9uQMnEE9h3TgQibBqI7W4oh95+naRZhfeHNnf8mYVpYuwxHIBLV50ebW6rdcxNSSOFmhf3qUQu82kGZmTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3fdJbau; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b50206773adso724508266b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760190392; x=1760795192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7baLPO6ldN0wytk+dLo0ZV9RZqTyWkuy/xpv05pZ3Q=;
        b=K3fdJbaus7sImQKKGyI/gEpEe2zqX/DQ3pQ5LPqTPITtSmvfnN8Z4xBcDAOWAwEQga
         eTzwJEy8LMhOFcdQDWyQqSFc1MdyQr/ChqQCMGxZRvf7NgThABCGMn+TzBtRW06NdiFj
         Gd/yEtDHurkI58pkeGB7fm2USNJLOAst8l8kshiv7QQKGfpOc3+mfiePDP+mze+MJ2/H
         jUvZQ6zQ+KI8omqLAyyAFMEroYZ04Q3ZBOChyrjLTut6gbZD5xagnRI2DAe7PEiNrXdD
         Qr/hJTG8qp1RTEUCplDVlAUee1imRov/9/rajCfQ9FhIuQO3zBN4z2F0UuhR+2tlQw1g
         2kSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760190392; x=1760795192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7baLPO6ldN0wytk+dLo0ZV9RZqTyWkuy/xpv05pZ3Q=;
        b=M1RMonltdj8/0L4dTOy7rTrg2epKk9fSk8kcATl2HbrRofLEEOtqvH288jQVB7+cHr
         kvcLKsAytHyEGlur94l8OvveEoh8o/KPjZaHit3Zj89Z96ka8HEKGYjpOHY7XHJi9SYC
         VdSZtLdUZY3NB214l2lOydeXt032RH27354xkFhFyRarF8gTfkxiNEmJ4nMDIa3x1vep
         HtnYa+X9pWTB280TAPb8wHkncAlhFBEwykTFCIcqBIDB6L5IYsSZVKCy//sNsNkX3DVs
         2/0NqFuNqaNRSs083Nvu45pL5kCbUo7F0wfcSqEW71KTAtS3EEaC+986jWlCsCVG4R0J
         q8IA==
X-Gm-Message-State: AOJu0YxLnsQlfyVGoRPWHT86sdg4P79HoIDN5wcV9lA6RBMr4g9OK9Lp
	vFw1CEe94HVJwjE4WAP7OZlG+QGYCaGHq4BEqIyVaSQ3CEuIPnCJbAs=
X-Gm-Gg: ASbGnctuUar2KbywdT08yq0uEyMxpCdPU0aUwvUETV4TdZZq0fgV2im3AG4AptDnPf5
	rqzq00qQCYxQA/rUNzbTJYcWSWiZblY12UKYUJ7jS/NoKzXCB15KCqjrlYj7XoLT5fISHQ4Mqk1
	i7Bpv/gkX1fyIaCrKjoc5OO+Kdf3b7wbdboRLkg/iZx0UDqK/nONbmux3aj1TPolRPygXSPy3Cj
	/XuMdUa0KraTOqlfnDfIYpSf9TCB3ewSUcR/RWLp7KRqFXjEG8dOD01ZH+ErI2AK91qGS6UpdLj
	uIShTUBERsjQ+vUOKw/5n/dHGC1tF0oWCbz5xWwIgaU3uHCfm0l/BEjyyTGhqWY9uv1mKP3tZx8
	52XhC64tglyZ/DbvSY0Ivth4ifl6IOOr4bw0uXFgSGbEOMrijl828zBlrBL7KP94a7yACci2It5
	uXpwwELAWw5YIvVfJExa//roAUDIQI+lZA9Yd/Sx4=
X-Google-Smtp-Source: AGHT+IEeOXQezqtJMQ7hsE05lMpf7I93JoBsZfK1rO+E+6ZkZi1qgfeP+uOP/QAPO7I5q02P/gEzWg==
X-Received: by 2002:a17:907:6e86:b0:b04:48b5:6ea5 with SMTP id a640c23a62f3a-b50bedbed80mr1895801866b.17.1760190391512;
        Sat, 11 Oct 2025 06:46:31 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-169-144.retail.telecomitalia.it. [87.19.169.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d2cb1sm479786366b.34.2025.10.11.06.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 06:46:31 -0700 (PDT)
Message-ID: <9b074160-68ea-4c19-83a5-8beb6eeb3768@gmail.com>
Date: Sat, 11 Oct 2025 15:46:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
 <eb15cf16-f51a-4eb9-992f-158e2510184e@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <eb15cf16-f51a-4eb9-992f-158e2510184e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/25 7:30 PM, Konrad Dybcio wrote:
> On 10/10/25 4:39 PM, Anna Maniscalco wrote:
>> Update last_fence in the vm-bind path instead of kernel managed path.
>>
>> last_fence is used to wait for work to finish in vm_bind contexts but not
>> used for kernel managed contexts.
>>
>> This fixes a bug where last_fence is not waited on context close leading
>> to faults as resources are freed while in use.
>>
>> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
>> ---
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> Your sign-off will be removed by git, as it appears below the '---' line
>
> Konrad

I sent a v3, thanks for pointing this out

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


