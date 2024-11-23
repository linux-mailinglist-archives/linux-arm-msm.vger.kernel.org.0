Return-Path: <linux-arm-msm+bounces-38890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D55F59D66A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 01:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6303316126A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 00:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6DBB667;
	Sat, 23 Nov 2024 00:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XK+vJq/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3561C32
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732321009; cv=none; b=EHpDTlFXFSkWQAtyNGXtqX4wpix5U0VN1w39t1cVUw1MVLOE5M6fxh5mbmRMVU1lpBR0at2J95Rj8iA7PuKhLPtRLqHxyJ6sjCA2EJMi0WrBjo0bjy4Z0qDMaUm/QEtiyL1WSMC0V69AibWmquiaJjyXanG8YpYJnaqp3DrpL7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732321009; c=relaxed/simple;
	bh=WMndp/1U43BOeEmcNjxQW+RTj3YpdrRE5+yI5TyY4sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGgg7Q8GADl2o4b7chh/RZnyqPe56VrEFSGJVvHVEPleu3xe79iejTB5bLaciZQ8rQJFl7cwKIVCuE3cj1+Oqxv3NsRlMrxWMp5w/80qA2R+JufSwjYactw9YgHSFldyyaWwk12FPEv3xQiX3K1R6j+QkX6PHs6u8epsNfwy+dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XK+vJq/c; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so23928755e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 16:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732321005; x=1732925805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZK707hN7X8pbhvNtjAb5hyxMgK0TWEk5zEjeGfHH3+k=;
        b=XK+vJq/cJExV1UFhUYPXrjBLWfyFp1XXJUCSKfh3D/3IvQ75h7nkuixIJ1wCv40cih
         rVKgDBWw7nfbaN7efdVu0Zb71NUXu12F1v2L57KEyM//bJz3E91zD2JvAhVXxTVFzLJO
         fR/IjS2kqfs13jiKQluoy2CHyJLYkNiv819shChjovFYgFV03ed71IimHw+4RsTlXcrM
         l1ba4yC0s15Kwf5CTHdbpNCXUMM32HV0xhoROqt2/Usg1+IgiGSVDCITh8AKIniTC12r
         4SWEUZ8zHaPqZlYSXM6zfS2oznSZ0FajPMwTgiINfkC790b8aTaFyEl0GD41kuNB6iER
         iS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321005; x=1732925805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK707hN7X8pbhvNtjAb5hyxMgK0TWEk5zEjeGfHH3+k=;
        b=Tdt14qFjkH0A6zf9KSTrE0iiUYQl1X+1vzRzYPxF6xmlzILXJvQLUrsY7ZfMZx2e6g
         ENnbW3kXqIbj5jn4li6fIWFF+Yp7AGx51POzb+VXtBpaZHvMZzRh9zOplwi+ORrGDLjL
         p4LH0qpjQh/pISCiJgPpDvgb+KjU4nzpZPwy6UzqeZQOZQQXR5nfEGpce/VtrB2leEOw
         fvg2R4U1pEN2vfqdQs1CFc6pWaHwawWH8ZCI5zOIHlUAC+IQcHA3s3DgfhLDBTA7H9cU
         JyBjPPUbOIGPyiXikP652o64DwdSclwIZ8TkVaAZYiaJGINeQzYLRwqWasf6BvulS9lW
         ZPxA==
X-Forwarded-Encrypted: i=1; AJvYcCVQMict7e91CEab49N3En1JM5bCBgozUEu9OD2LPCeD7eBONn7Ito5hWC3O4LKlV22iWpSWdsOi07qodAPC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OGrSOryBMwk5pW4y+x1mIMoRVXyUGvNuSRNPDrTbiaD2csjf
	0ZKIDx5HeDMOvHD5X1pNjAqCJgBZoR6eSZNpZpFmyJN4cNLPXg/WjYlfqvKBHLA=
X-Gm-Gg: ASbGnctqy/W1+o30geJDcMVhpa8Fo7ZVNBs6QCQ8QclP9HEQ1mfTtQZPwZlwnrlxAGG
	DsMJyNTcwV2uriHj/J/36++bKBm9+Lgo51QuaRfog7r83njVex2EphS6BITr5OEpu3J4IAdpqyV
	O2nbkhdMSZUQUCm3uvcwV9axGD6ZXFM+R2jkYPbLZgG2wvZkO1BeG8dATpb/z+zpD6mNwNFgnHX
	+W0FN8od0zNOYm8t6msjdNBrdNdorNQDQwcFuOTonQWTyeQHwQLyyqT7UlqVrc=
X-Google-Smtp-Source: AGHT+IH4Tm76HZYf7kSxuYhANv/lYmvlajicoSaytgP0VqlslVOg674TyZPcqjI1w4Uk4lPumVQJbQ==
X-Received: by 2002:a05:600c:310b:b0:42f:75cd:2566 with SMTP id 5b1f17b1804b1-433ce410fe8mr45055905e9.2.1732321004820;
        Fri, 22 Nov 2024 16:16:44 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafedbcsm3749485f8f.41.2024.11.22.16.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 16:16:43 -0800 (PST)
Message-ID: <eec92088-edfb-4d0c-b81d-9d4f1d968b20@linaro.org>
Date: Sat, 23 Nov 2024 00:16:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
 <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
 <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com>
 <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2024 00:05, Dmitry Baryshkov wrote:
> This leaves sm7150, sm8150 and sm8450 untouched. Don't they also need to
> use HW_CTRL_TRIGGER?

I believe the correct list here is anything that is HFI_VERSION_4XX in

You can't apply the second patch in this series without ensuring the 
clock controllers for sdm845 and sm7180

grep HFI_VERSION_4XX drivers/media/platform/qcom/venus/core.c

drivers/clk/qcom/videocc-sdm845.c
drivers/clk/qcom/videocc-sc7180.c

Hmm.. that's what this patch does, to be fair my other email was flippant.

This is fine in general, once we can get some Tested-by: for it.

That's my question - what platforms has this change been tested on ?

I can do sdm845 but, we'll need to find someone with 7180 to verify IMO.

---
bod

