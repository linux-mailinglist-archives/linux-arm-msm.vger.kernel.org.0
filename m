Return-Path: <linux-arm-msm+bounces-32872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01DC98BCA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E28FC1C23586
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89F21C244E;
	Tue,  1 Oct 2024 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mj7rdSzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAFA1A0AFB
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786997; cv=none; b=Kv5Sh/valnsW+r+bCddBYB6fcekjZuHjWI0mA/bq55IGI9E7Sws5/LhbLfyBbtdue+PuT44Oh9y8jQ86XiqUCzIXDJps/DQ3jniCsjCxcGJNwHZkoj9y3Jbe0LmXdgQMR+e7aeugl2H7d8MTSWa1dPjwo1JM4DVxjRnfKEMTo0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786997; c=relaxed/simple;
	bh=CbT+qiU/vq9R0tnkpOy3+PJvaW5jLycGAU8OpY63rRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwkLyxntgIksGKFtgJqIfMct3oUKhpivXgoP0WSOaRs6Hw0bU3ueMFpklwQ+2+4PYg2VUCWsuA2jc91NG8MNalkiVwDN3+XC+f+LwR3D9PFAdl+ZpZx+kH95arqLWQ9KQd0uzhMSwc0nFLicG4kZJfikIzTa4LpnFjOaqBObvHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mj7rdSzd; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c88c9e45c2so4831731a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727786994; x=1728391794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9afpXEL55MUlwjnfdU5WzlBLeVBfmS2NJq+jPkuACDs=;
        b=Mj7rdSzd4w+kU0IrgmMBpiSG67XbvddizBUp1g8mEukNy1gtluFwIrD6epDoloHJIo
         m7uTQvLuvTuEqFRHc1JPmOrUITTRw4WPLV7Phj5+SD5hBZ9Kunjd1L0bPXFDd6DZSRut
         WZq0xg97pXd+LYR+rAFhSpFrfnc/CY4sXy6NwvooFfTNvaiZpvDG90c7gFWKIQvHqZyG
         R9M3hHnGXWp7JNDXE4Q0ns2cH5VEU18wkIXHvJwhajvbNjBvnI0BA07EyUWTSotxv5x8
         YmeYEWVWn3KZ5QyG1E8q1UT+lvgy1eBof6jnAtYCWDNU67Nl3lTWd+2pxqtFXv62Lite
         5WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786994; x=1728391794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9afpXEL55MUlwjnfdU5WzlBLeVBfmS2NJq+jPkuACDs=;
        b=pa/aJZwQOyfEaqu5J5xKzOBSBC/evFfRJnE+el0oeEiiBMoZhtbNBj4sNyWrNGZzKV
         JGSa89ogk7IsnKJIweBApqkpf9lkknC/2l1gp1pcBJXCJ71RA7xGLe/0+b7MocMuPYQX
         1zNfi7OOo+To83IpR+CMEsDv/IGirlK2MwKORZE4t7Q6tbq0BuFBi/3rr4hPYQsQkw+T
         Klud6YjZIdxn/7a8dlEX6O5BJntygOYH+l3LydCACQQxQjkPq9mP7PcMucpq4EcOtQa9
         rJTm+pGIC8REcWmkIx7Oi8H5ERPXHMXTJGQwSrAiUkGNHtqQ8xr2ngoRW+ulgZ9UMHeF
         IAmw==
X-Gm-Message-State: AOJu0YyO/yDRCZUKs4oGYWEuBKVXLuXP7obbBysNAk2xb2nCIqjQ7Gwp
	aFI+tOsNi18+A0HnEPQkmCQy8H4aKVgUimZmLUxUgkfe1MqkxgLg/I09QhxhzF0=
X-Google-Smtp-Source: AGHT+IFdeytN/mmapjvnod27wfN3C5x03kaUeBmTVVQbHTk9ROmaV2euFnRoXPRA5dJwoBB2aYDOeg==
X-Received: by 2002:a17:906:dc90:b0:a8d:592d:f56 with SMTP id a640c23a62f3a-a967c0b53e0mr293748866b.31.1727786994094;
        Tue, 01 Oct 2024 05:49:54 -0700 (PDT)
Received: from [192.168.0.15] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299861bsm705327566b.192.2024.10.01.05.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 05:49:53 -0700 (PDT)
Message-ID: <c912f2da-519c-4bdc-a5cb-e19c3aa63ea8@linaro.org>
Date: Tue, 1 Oct 2024 13:49:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] (no cover subject)
To: Luca Weiss <luca.weiss@fairphone.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 cros-qcom-dts-watchers@chromium.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>, stable@vger.kernel.org,
 Hariram Purushothaman <quic_hariramp@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
 <D4JK8TRL7XBL.3TBA1FBF32RXL@fairphone.com>
 <fc0ce5cd-e42a-432b-ad74-01de67ec0d5c@linaro.org>
 <D4KBQ3ENKF5Y.3D2AK81PELAEZ@fairphone.com>
 <e7cc5f91-a0a8-48fc-9eb6-b9c46b22dfeb@linaro.org>
 <D4KFVNV1A4KG.CFLT81CFBDTM@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <D4KFVNV1A4KG.CFLT81CFBDTM@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2024 12:39, Luca Weiss wrote:

> And v4l-subdev5 is msm_csid0 on my device.

<snip>

> 
> - entity 16: msm_csid0 (5 pads, 22 links, 0 routes)
>               type V4L2 subdev subtype Unknown flags 0
>               device node name /dev/v4l-subdev5
>          pad0: Sink
>                  [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colorspace:srgb]
>                  <- "msm_csiphy0":1 []
>                  <- "msm_csiphy1":1 []
>                  <- "msm_csiphy2":1 []
>                  <- "msm_csiphy3":1 []
>                  <- "msm_csiphy4":1 []
>          pad1: Source
>                  [stream:0 fmt:SRGGB10_1X10/4056x3040 field:none colorspace:srgb]
>                  -> "msm_vfe0_rdi0":0 [ENABLED]
>                  -> "msm_vfe1_rdi0":0 []
>                  -> "msm_vfe2_rdi0":0 []
>                  -> "msm_vfe3_rdi0":0 []
>                  -> "msm_vfe4_rdi0":0 []

<snip>

media-ctl --reset
yavta --no-query -w '0x009f0903 2' /dev/v4l-subdev5
yavta --list /dev/v4l-subdev5
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p

That command list and this

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

should work.

I have to test Vladimir's two patches. I'll verify rb5 TPG while I'm at 
it, perhaps the error is not sdm670 specific.

That said last time I tested it, it worked and no changes have gone in, 
in the meantime.

---
bod

