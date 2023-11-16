Return-Path: <linux-arm-msm+bounces-827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F80A7EE702
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 19:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA65B1F24864
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 18:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94E93158A;
	Thu, 16 Nov 2023 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="YKnoJTwW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E66D4A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 10:46:45 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-41b7fd8f458so6443911cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 10:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1700160405; x=1700765205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=If/44f1KPyVE2d2iqlt11gTcl1EXO2kaaJZBfwh5YxI=;
        b=YKnoJTwWuoErDwGyNtj03dwhKkhdBux3KS6L8wRcNoDxWyMYs7u/4uOC2SkaFliGVB
         9azwrgMmXVc6DnUfOVYn1nUuM2HiB5B0f7ioZloLqc5f9hLPrhZ8EbULvoou5bE9UCvQ
         c3M3d5gBZL72swIsGsEUxfsyQhmIKQY6yJKjCdkN8a/Ziss2Nkfe3Hg7e+zuUGjwMZEM
         yZhRGFE1Cxex8vvYi0+l23UcyC4R/NtObdKkKtjH3NmC9Loj7ILIQj7OjagCvkqSZcRc
         OHdS10Of/jcECJGmzQpazM4bHDPERKgCfsYj5+hEHoziVgJcscSel598xwSWF+qkqXVa
         7Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700160405; x=1700765205;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=If/44f1KPyVE2d2iqlt11gTcl1EXO2kaaJZBfwh5YxI=;
        b=d6Zog9q7qXIxbkSHFCYSbB9/9odPMRwEDK4/yBLqweowHDfJYwYxBRiVNThl5IkodG
         aXhTUb9Tbf2ErD5XxLzZ6LrEmBirQrISBJWQk5q56X9DgNHjMi8lsS0XDbBpYnCEz4rE
         Ea+z3BKVulOaOYovAQ1Nb8aPpSXWmBvgFkGjR6zxaDdVb5MnR3Wc5WScl5fS6u7hBqRb
         wwj5qGFymX5ik9UgdNkOQ5jUvoHEav4NUoLacJRS79CfjwuITZ60R/Yo/4Q2fEehl63U
         /19KthFXSYMxcPEqS/NBjtyVkRlFS62Tp8fImglHfQo2v6WOZ0iBg6hZodgsL2CCcP2U
         cUhg==
X-Gm-Message-State: AOJu0YykobZStL8aHMh7kVLYyp35+LkVjeKu/siRbCoyxH7naGPl5u/5
	1rpUo9COpfhgzKp7Q+5B/5K2hA==
X-Google-Smtp-Source: AGHT+IFQlwjNqtRd3lxS5p0T5Vg8UQ+JyMTZejmIFz8gVnKZabprGWmddPa0pf0JYS0omO1Kk+ALrQ==
X-Received: by 2002:ac8:7f14:0:b0:419:6954:3ba2 with SMTP id f20-20020ac87f14000000b0041969543ba2mr11124161qtk.43.1700160404914;
        Thu, 16 Nov 2023 10:46:44 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id w19-20020ac843d3000000b0041991642c62sm4493571qtn.73.2023.11.16.10.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 10:46:44 -0800 (PST)
Subject: Re: [PATCH v2 4/6] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-5-jonathan@marek.ca>
 <CAA8EJppg=pYh73ncHBCO6Ddv9gG7+WNnpwLYGEv6xEu_3MRNWw@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <ebec534a-4c72-7d33-4c18-4e0b43338568@marek.ca>
Date: Thu, 16 Nov 2023 13:45:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAA8EJppg=pYh73ncHBCO6Ddv9gG7+WNnpwLYGEv6xEu_3MRNWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/23 2:38 AM, Dmitry Baryshkov wrote:
> On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> Make it clear why the pkt_per_line value is being "divided by 2".
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 66f198e21a7e..842765063b1b 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -877,6 +877,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>>          /* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
>>           * registers have similar offsets, so for below common code use
>>           * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
>> +        *
>> +        * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
>>           */
>>          reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
> 
> Should we switch to ffs() or fls() instead?
> 

Just a ffs() on its own can be confusing as well (without the 
information that only powers of two are possible), I think like this is 
better.

>>          reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
>> --
>> 2.26.1
>>
> 
> 

