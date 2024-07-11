Return-Path: <linux-arm-msm+bounces-25907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B5892DFC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 07:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 575511C222C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 05:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A8842AAF;
	Thu, 11 Jul 2024 05:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJ+56EeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB202119;
	Thu, 11 Jul 2024 05:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720676982; cv=none; b=ASNVsNfJEK4j+72UrIZUzZgj1hjd8YZjLxmryJ25IturZtco/2sv3biYXqMwE+Guqyvi4QefwkQQGLycbhg6tnldod2B57agiG8T3m/Vy0TMPen7oZS1wb+mubmOgdpdQ9mtATQvzep0820rHiZkSR5G5kpuv8Gzcpnc9FmQa+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720676982; c=relaxed/simple;
	bh=IMMNbmISKN3AN3uDo01jjPKhfgtYPUQvEhZlKFLT7lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkgH+IIhq5MlwCTQie6XdL5hcOFNX6zT9VW4OqYC6WyyVUgjTEd63TkY3/z37K5EhWmvyWKa6i7iH9uxdKvoYE6msqa4mSB4f22PlVVWs3pBDJZOsIa1deXe5qZS870GWMXCSG05nvKFCfUg9WQkEDvVs4lK+616k7njsve19BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJ+56EeI; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d9272287easo277423b6e.2;
        Wed, 10 Jul 2024 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720676980; x=1721281780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCHZzAU8rNlCfCBN32z5tdinaQoz+7lypLVImk4abyM=;
        b=NJ+56EeIRyK5y4dtRFB76MlGlIB3zcRPKM+GK+IQNat+ud9AuqXZsNkJ3x8RxbtHK6
         sqpao7cr9PeeYMn5VTNECeq4Qfoiz3KKb2AaOqwGBrWcp20EMsTOKhJZrGZzTvV2ymVP
         Y+drqvx9UulbIE46LONObBD1yIVWUkALdHAoTBJ95aM62qnnd4gR8BUeba/k91hRy2xs
         iY15uTr2IxwLl4a0nwrRBihwUPbOlKxiQfCpK/a1azt/mvCGnKGD41o6xWZpxQ26ApU4
         Ak5nHZnc6QeYfvs5NGiBxa9q4z+pPcJoQNhhVBWOjFfPEN7VetCJF7Bm4sjSU8O3Rz0C
         HE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720676980; x=1721281780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCHZzAU8rNlCfCBN32z5tdinaQoz+7lypLVImk4abyM=;
        b=MCPp/eL8y5AJ/V9VTPcKuEoFUS9Ck7Zqgb/BCoSWGQ2gUojNRbDdXLaWAfG8IQaOYU
         KQgbwVf754KhgACYnj7j86RsEwX3r3WwacB5IfjM6cj4CG7RxSOJ1O1Yzq7GYuJXPF1S
         4vkVr55z9UB6Sju5LboYS5zBcESe7JE+ff5eQirrafW9uBxjkkqD/VWlsWMaD8Wal45S
         Xv5RmF2F1J38e23KgmqjTj9MU2scS6ZwP35g55Vp4YN/ZuXHtzr9hq8FHXwlmL1REIAd
         QiwYo6hQ0yMa3ULuwm0kvVFD3moExwXTP1voy+8Ic4gHkgiQ97DpPRAiEavRkUtyBHQB
         G4+w==
X-Forwarded-Encrypted: i=1; AJvYcCVtH2dM/RXhNdFfJIKEpINeKGt5ftfleIHEP+WcB2ebRNEKSRrK8iMzccPB3XSwwOdQxaZDmRw/2DvvtaQnYe5WInGldS/+2uaWxuyetrItmV7cAW3hFd4M975Pco+MBCHgZD2ZoLMZD03T3w==
X-Gm-Message-State: AOJu0YxjG8yhdEErRUdD8K3U6DiUT/dy1i0cCbWMNC4TWxbepRySxms0
	rnmgua4mCkNrAIYmwaiyb5BkEYdZ3UOz+Rtk1gyQy9XYNPXZ9b6D
X-Google-Smtp-Source: AGHT+IEFoGyxuqLL8qcwW8QVwzy8KwhCryR/Jet3lHCc4LS5wiSziHX270IbTD0y1y3Sh1aUD5IOHw==
X-Received: by 2002:a05:6808:238a:b0:3d9:2190:9d45 with SMTP id 5614622812f47-3d93bdd1404mr8494576b6e.10.1720676979923;
        Wed, 10 Jul 2024 22:49:39 -0700 (PDT)
Received: from bnew-VirtualBox ([2405:201:3020:7812:b416:d4b5:f43f:6324])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d667ec466sm3094454a12.60.2024.07.10.22.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 22:49:39 -0700 (PDT)
Date: Thu, 11 Jul 2024 11:19:34 +0530
From: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/clocksource/qcom: Add missing iounmap() on error
 when reading clock frequency.
Message-ID: <20240711054934.GA37910@bnew-VirtualBox>
References: <20240710110813.GA15351@bnew-VirtualBox>
 <2a3561cc-c6b3-4823-b488-fc8ebc53e1a6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a3561cc-c6b3-4823-b488-fc8ebc53e1a6@linaro.org>

On Wed, Jul 10, 2024 at 01:54:01PM +0200, Konrad Dybcio wrote:
> On 10.07.2024 1:08 PM, Ankit Agrawal wrote:
> > Add the missing iounmap() when clock frequency fails to get read by the
> > of_property_read_u32() call.
> > 
> > Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
> > ---
> 
> Or even better, you can extract:
> 
> drivers/platform/x86/intel/pmc/core_ssram.c
> 32:DEFINE_FREE(pmc_core_iounmap, void __iomem *, iounmap(_T));
> 
> into a common header, call it something less intel-specific and use
> it with __free() here

Can you please give a place where adding it would be appropriate? I am
new to contributing here, so any guidance on where to add the
DEFINE_FREE would be really helpful!

Also, just trying to think out loud. Will the cpu0_base pointer (and
also the source_base pointer) be required once this function exits? If
so, I think I will also need to use no_free_ptr() to ensure that the
memory doesn't get iounmap-ed once the function exits.

Thanks!
Ankit

