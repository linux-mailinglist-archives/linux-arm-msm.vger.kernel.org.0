Return-Path: <linux-arm-msm+bounces-17056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6916789F456
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 15:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B1621C22711
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 13:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC3B15ADBF;
	Wed, 10 Apr 2024 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gd8vujph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C48115F301
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755888; cv=none; b=pisAgI8wgFSq6055tBwrF2Z0pOtoZwtn6pv9nhbJIAALHpZB0kgsDt/CUpf4rXjb20ogJyCty5igfv3K7kfTecWDBRVFbqwV0ZCOublGZ+kj8X9++ni7nHwtnD+vVPSSfUseSl/5JAq+O1fqdH3SjMJI6KeWQJQDZiWUSrA/T1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755888; c=relaxed/simple;
	bh=mGwmQ+HTARhCnrsE9piRI3sSo3QhVsi1e7XBnxl+xTY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ohkan7883vXmvDJDOnQ6M1fOVHLVLv+6aLDa+VKh+vMC3amZRpj9BsByq0FfmCgF2IBYP2eoVaa3qAUDBzrYwqK9NGy3hiclV2YkgT+S68LrXe/w9iAS6IOsnZJ+q8HPlmbAVaY7rlG4S/WMxjWDgRfdfBK6ZFNtDVU33Wyqmv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gd8vujph; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-416b5f6813cso15823815e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712755885; x=1713360685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGwmQ+HTARhCnrsE9piRI3sSo3QhVsi1e7XBnxl+xTY=;
        b=Gd8vujph2K0iQDTEYAEExtq/SWUHKKmRC33Plo245YTuw2iCEZf3IKP+daV4/eL5RL
         dg69QruJkuYNbXxU5JyfafSof/yYGB9Zqn51n1w4SzZwpxQpZrZaAk3fXF7CEEjtvKOJ
         uj4x6Is75S4CashdfmJa7bUy33ZJPPkqLKc/NTvRJqrR36tEPlTykc1ZeSIB/WBhyp80
         d6VOAx73TQu9ftZ1Z8AyO0F9lPNN2FflE7WD5G0gP5N/bXBlpF8w7yCv6EQBJ7qauF9W
         BrnjF7IOb9eUD0ts69e6onEjd0bkZSM14Lv5H5NP33Dj8RFSbBo+7K9HNe46e3y+sP5X
         +E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755885; x=1713360685;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGwmQ+HTARhCnrsE9piRI3sSo3QhVsi1e7XBnxl+xTY=;
        b=fIpb43IC9jF+4eJp5KEtFimc+mtPnJIj46z2gB9+/PHSVTjFpGGiWaEiA8d0Kb1r6d
         qvONu/79xIJ9Ff45Q3k9qJBnaJ9n6PpQ2MBIuXtloj29CgsORxqW/4gm9k5lFJWXUgGt
         ekZ7s8OA2ZIVMSwYZmwpLAcl9cX+24felwu+H+OtZtEJjUCXSipFDQRwoGmhEuK6HFdk
         i4fKRD4JrhtXWtdPdJDUZnxZHyO0FZQYgKUdOzB1KAG1xoaCRl6OIc1vlQkBFsPDaN8+
         PLRVwhCKxExewBL4En9EjAPKJPaqbriw9xmfk61Na3UQuNUJ3UOYw6nBLFrfw+w9Qd9c
         nGkg==
X-Forwarded-Encrypted: i=1; AJvYcCWp7jwYoWwodD+fqKKoQUOifQ8MhjRzsjxPI/xfBZAJWxWx61b2nxgnI+1CZRZ/EEZwPNzoZ99s3+MmvlnaKTZ9SIZlallxoTX83xscGg==
X-Gm-Message-State: AOJu0YwKouxwRf8pG+yasdEj6E+E12LDoTS9F157XmYRSIVV3Gc9MS+P
	U3qxIfOE+CCkRwFI0bDbFqXhV+wclTti0/tnFCs2h/EP5En3NQxIu2jPYE98TSg=
X-Google-Smtp-Source: AGHT+IET1/j27E/VSPvxv2cFHKGJCbuf9qrZaa/4WCzXZjOiKGq5PphsXhNWpvferOKjeZHshMz88Q==
X-Received: by 2002:a05:600c:3146:b0:415:6728:a565 with SMTP id h6-20020a05600c314600b004156728a565mr2597917wmo.16.1712755885429;
        Wed, 10 Apr 2024 06:31:25 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b00416b79e5389sm2290306wmq.2.2024.04.10.06.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:31:25 -0700 (PDT)
Message-ID: <b2a15593-22a1-43dd-be13-a36af680c40a@linaro.org>
Date: Wed, 10 Apr 2024 14:31:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pierre-Hugues Husson
 <phh@phh.me>, Marijn Suijten <marijn.suijten@somainline.org>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
 <a8c5b27c-47a9-044a-78e8-51c67acf19a6@quicinc.com>
 <c6a9c20e-02d3-4334-badd-2efe5be9ce7e@freebox.fr>
 <d5abf142-3a2b-454c-660a-249c0fb25208@quicinc.com>
 <33382ecb-8a73-4d2f-96b1-8048df7a6414@freebox.fr>
 <3914555d-3c89-a5c5-2906-0bd24d0bf735@quicinc.com>
 <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
 <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
 <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
 <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
 <c2ce34ce-d532-4039-bb9f-d4d1b2fb23b0@freebox.fr>
 <09bc9231-0e59-4cb2-a05f-02e2fcaf3d15@linaro.org>
 <02a32387-1a30-44cd-b552-6e47023b997d@freebox.fr>
 <8b9cc46d-4267-43fb-b2be-f5996566a349@linaro.org>
 <0159169f-8da9-4ca8-a427-8160a9b09a9c@freebox.fr>
 <bd49cfcd-13d2-4e4f-bc9d-c491558e5af7@linaro.org>
 <651b56f2-1261-43b9-a078-adde5da555e7@freebox.fr>
 <014f64ca-fed4-4a44-bb61-154a2d6cd268@linaro.org>
Content-Language: en-US
In-Reply-To: <014f64ca-fed4-4a44-bb61-154a2d6cd268@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2024 14:29, Bryan O'Donoghue wrote:
> venus_fw_debug = 0x2f;

* 0x3f;

---
bod

