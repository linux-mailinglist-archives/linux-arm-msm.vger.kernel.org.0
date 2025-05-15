Return-Path: <linux-arm-msm+bounces-58062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F93AB86EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 14:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A59CB4A1D4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 12:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690322BCF6E;
	Thu, 15 May 2025 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFWEWNel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E382BCF53
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 12:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313238; cv=none; b=dvi+yCgDrYApT3qNwY4TGgJ0lkG/0uNvc8mZGUeTFgcRP07QtMtXepO7ul9QrlevWYdXyWGjbEXHPTo2oO9Cl9fxmOiAPh+FrGe5VBXar++rKzpgtmnv71LhWF4CDJTLvp4I/HAi9X/XgFxykAtU8IQOEPMkAKu3cbWHgxBZcYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313238; c=relaxed/simple;
	bh=cdRMK6LJuIuR53a5d5m6jO15/NvO43ubYVwBhvHh5nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjt4N0732oTxxiYnzQzVf9/18ShNFf7wY9bA1XhRXJOhsGqR0pSpEDtDPWucy9D5j4VSfoGwk+nNB2gMkepH7L0wHllD1fMqYUjcV0eKWcfBVffI9ybQQXJmSpUTbnGDtHqOZTrpPONfw4fJc8TNU64z0eb1k6qrKLkS5upK75c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFWEWNel; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe574976so6156635e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747313234; x=1747918034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3h/2xGx5o+cXR4Tj3+quHhSs36iBw7d2tJFhbvplbE=;
        b=dFWEWNelejdOMA0C/11IMQiIVqfMwzx8ImvnyN186GeNsgIxQ4g5rmdOOS3sNzBn0n
         aVLG+RY+tlm2fGzbMO6tzuO1P8MA6joNU+F96dT4VLAYQl4ion4qo9qsu7HectR2KU8b
         JYKzsNrgGI+xDFDVXx6sGOw3Nidm4trBRwtdN5LT2stAuqqsaDW17zxAzyZtxE3rkz1I
         bmOlk3UoH3eGPYS0kVjqZbU89og1Dlvs3lXvSszHxUApGd+wR91urPdj/3FZphANlo79
         veCBiK8tCQgic2+7saAX/qh++vlVhV5ICbElbu3iD3GLC5XNDZQddfCoBUSoH1GbHAbM
         isEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313234; x=1747918034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3h/2xGx5o+cXR4Tj3+quHhSs36iBw7d2tJFhbvplbE=;
        b=FWgAG8yJvMESjIBP01VLh3zSSBuPofmc0yz0OwVCGpa1ZQScVzHhG5UQK9K4UTnBoj
         Alr2Sjqa62i2v+yJ1YoclUTAoq3Yplwo3fJHvc/g0+V62wlIJncRfoW7wnofC5bmdK7E
         7ncbftJn4+FsNW2W+6V1ll2t4+NdQOtt3hr7PWFmw74X/J5PJc8xBGze0miSAbPnmjSz
         BguBiV6wl39TUzGyDYHVEFkNOStufuRsv+G7kBcfIpaeVguIFpYt81gEet61LOtBiY6R
         b2oGgoOGxJkYZ9IIIcesqfSr59URoslJUSZ1A/K0Kzi0vlYuwFlHa/3Sm1mtctODwSST
         uV3g==
X-Forwarded-Encrypted: i=1; AJvYcCW93MignlMhzUMZaA2vyDMhf4U1nKQjlZjON6c9OGVD2EvkzGrwm5HC8SM7kvZKg2fMmTViXdj0Dy5eWzKY@vger.kernel.org
X-Gm-Message-State: AOJu0YyoVGpWU+wY9D4C7hAgBaJrl6m0soHJsY/tNwCfBooBctYu7PhW
	Mqk1Yz/0bvRbv2s7IRJmnXWCs8Eu4g0ahFZe/U4K6zI2+iPZul263WoidBBCl/s=
X-Gm-Gg: ASbGncu+1k1dJFMaN858pc8KkYxYOv0IY3kUJSZeiS/coVqGoXNwprYVqN70FDiRB+/
	w1CSUl2LorZXHI7wVyxpYHmQfYTOgAXdEq8wArRgdKRUgzlCR8NCHykimlN6WtZQePvIhULQwjf
	/SHVDuif+E3AnbbWQlNU9tbnxAGkJ49ELFzQKmSUuzVLhFT8Adi1BhOMROFFeZKEsMcrFsZCIz+
	IEhYcm68f5a51PtsgqIFh6srltucC4kH+pL8VO3nAsFIL8kofHLu41ZSwCMYylSlbMdCCo2juFD
	i0m5QQ8zXtmRKTrNkeLWaslgANNL3JbXkDmL5z1EdmjmNCuvLnSCTIlguXfxrdrKv/vcK1v3GDD
	E0ABUF1itEWHm
X-Google-Smtp-Source: AGHT+IEPJwFSjhLimrJ1U1Wl5OiPN1oaEgyc2W4Wag4f3o9ljBIBLfptIZjZl0NRHAgrEMrevxQNMQ==
X-Received: by 2002:a05:6000:200d:b0:3a2:45f:7c3 with SMTP id ffacd0b85a97d-3a3499502bamr6070044f8f.57.1747313233806;
        Thu, 15 May 2025 05:47:13 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde0esm22983992f8f.18.2025.05.15.05.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 05:47:13 -0700 (PDT)
Message-ID: <bd704149-694f-4d89-90d9-a22307488743@linaro.org>
Date: Thu, 15 May 2025 13:47:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: venus: fix TOCTOU vulnerability when
 reading packets from shared memory
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
 <ad92cf06-636a-417a-b03b-0d90c9243446@linaro.org>
 <0c50c24a-35fa-acfb-a807-b4ed5394506b@quicinc.com>
 <b0c48989-4ce7-4338-b4bb-565ea8b6cd82@linaro.org>
 <b663539d-5ad6-399b-1e7b-0b8b9daca10d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b663539d-5ad6-399b-1e7b-0b8b9daca10d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/05/2025 13:11, Vikash Garodia wrote:
>> But what if the "malicious" firmware only updated the data in the packet, not
>> the length - or another field we are not checking ?
> That does not cause any vulnerability. You can check and suggest if you see a
> vulnerability when the data outside length is an issue w.r.t vulnerability.

I don't believe you have identified a vulnerability here.

You read a length field, you check that length field against a MAX size.

Re-reading to see if the firmware wrote new bad data to the transmitted 
packet in-memory is not a fix before or after the memcpy() because the 
time you do that re-read is not fixed - locked wrt the freerunning firmware.

---
bod

