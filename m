Return-Path: <linux-arm-msm+bounces-18641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F48B2D2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 00:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AFB71C2175D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 22:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F23C6CDC1;
	Thu, 25 Apr 2024 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBX6/cO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6943EA9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714084623; cv=none; b=aR84ARcHuP9a1ff71dhbxLE3K0IZvYHpm6gPIglWUKiG2X2irnLsygwycQH7p2dCxdffU4OZ0GSWuNOXsUe+Wqkuk6YDLjHU1095MrNl6HQhJ7N6GnmDAQwfZ431MjnFhfwIXX56X18PejOsdCKN1jnCqyCFV1aBSbg1MKcPIpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714084623; c=relaxed/simple;
	bh=fgYCqBDdsgL3TUYMV6KL67WzWgZ9C9IO/XvDEZ8F4x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cehiuGbXteyIaOYBqIgWt1sKxek2lCSG3ywhmq1bzOr1chLBUyzHE7iChSCXn8sV8ZiD3wS/pZXkNI2U/JNOhiix6aLU3vFOG8Du+yf9qLk+9TTZ1rEcihSAhvY8VxGVZfyo9mQdOzjlRGzkO+6htMcH+CXfJv/d9mtBh0Ea9q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBX6/cO3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34a32ba1962so1257843f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714084620; x=1714689420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4CBqUoCuF4O5Eh6sI6A8BEF5uavxSU2H/HBETvhMl/s=;
        b=MBX6/cO3xdQHUDBzwq/3SvLSmxgOrZlmTdyZ2M46fGc/eV8mSZ8601UcQQ4kLriPZt
         +v9DDdIaSlyEPRUxq/MhbO8ztb79Y4mO7HA8jNTOZx/qF4AE8UHTOKMSm2MxhtPEHZwe
         sAle7eXKi954HwFpsyXE7DNPwzqaTkmAQQi7G5utvalQiRN4VGHnDkp74mFDnTQAjCpJ
         Xr3o3kYhq5unTJK5mjxqVjFrIgdnVBI/WnEX4HBixS6NkwioqFzuTjlc8otU5hreyPQD
         pcGRfzTc5HFB4s1DLUZah6oyrx7Yl05w61POmRvg7MF+DUicCM39Jl5osO8Pr9d+ldUj
         4ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714084620; x=1714689420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4CBqUoCuF4O5Eh6sI6A8BEF5uavxSU2H/HBETvhMl/s=;
        b=bONqjHzEHyiM2a/9Mxd6ClYApzE8I7iGhqjC/QxPNFchCInwfKtWyMUoJ8gEjumSsd
         LR8f+EHlXdcSUIoQXPG2QHfOY0G5TctvyE/q54iJ+AS/hq0TbA+IMT0pp6QBlY9wZ/8N
         uQycV5A0gNV2OrJBV/vf0bvXkN5P13yQ+BBLd0OAT34wXSg42OjdW6whK6w0XmKNk/L8
         YAV3Y6c7VVjTjZ0AAYDoDLwDcsUBT0ZCyK+RIoNjtHn/N3O8Jq4o+019U0xS7iGzR2Ru
         kb2hIVrviv1IDmEYqvxPJPo1X19lAtiWX5ZoX23OFFzEPsab3eDdtOm0RLpiW4B7n7GG
         stKQ==
X-Gm-Message-State: AOJu0Ywp1dKmFq/omR56kPAaDW6sECO/9sSJceFTt6e7SnghdyQuCZR8
	F20LCEjsZIoHSmTHOWRmT6OyR77KNFIIWY4P3/mlWr5VqIRIWnaDTWYQsC8/tEKomHIXhS/gj0g
	y0XhVHQ==
X-Google-Smtp-Source: AGHT+IEj1KqhGA6FhnDPwscUjPiLe0XOqsAkCC9t+dPUSczfdPKmS5JH70aBVwFx8ei4v/vRmHcubA==
X-Received: by 2002:a5d:584a:0:b0:34b:58a2:dea3 with SMTP id i10-20020a5d584a000000b0034b58a2dea3mr644562wrf.64.1714084619779;
        Thu, 25 Apr 2024 15:36:59 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d67cc000000b0034a51283404sm18438538wrw.72.2024.04.25.15.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 15:36:59 -0700 (PDT)
Message-ID: <a510d3c5-039c-45c3-b134-84da8a37dc6e@linaro.org>
Date: Thu, 25 Apr 2024 23:36:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] media: venus: add msm8998 support
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <df6859ec-9fe1-4768-987e-cdb14a887b9c@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <df6859ec-9fe1-4768-987e-cdb14a887b9c@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2024 17:53, Marc Gonzalez wrote:
> Based on similar msm8996 code.
> 

Looks like something that should be turned into a proper submission.

---
bod


