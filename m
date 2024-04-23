Return-Path: <linux-arm-msm+bounces-18299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFD38AE74B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 15:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0473928CE7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 13:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA0F1350C7;
	Tue, 23 Apr 2024 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jsccEwdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDE5131BB1
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877439; cv=none; b=FySKzCzplWsRHQyAIGYbCvfLHZb7xkUaWb3WKTfQwOlQ8aBMS77h9Ol2w1xzoqz7YLWLrh1B1eeFUrIQuhNH1d7Y58E0FSgdVf2estmqP4Ej1S7i5I1tQdsCP83+C+krsFlatOAc89FvE2eBhF7RMANQBMUZicYXNOE3VyxjxqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877439; c=relaxed/simple;
	bh=S25T3qbVz7Y5k5OAGJMgnWEF0GJuX3pk/nUOLoJFNSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROSaVzu1ZJ0XQjd747z9oR9DwB7RGyffRKhAbXFLtSkKAI70fkfY1sU17lrNjB+SqqpFylPQIzZ/8LlLkI4G9f0csk7YKSxzqXYUx9g3K2A9KnO9fcGr/49Rnqt9tuim4/PBFZEpLytVZPEAzwtQ5mj6IeIq4aPHtG40wuZtkJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jsccEwdO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51b09c3a111so3681775e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713877435; x=1714482235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kvy8LO+cIMm+HbZIf+ZYGi2YekLnZkMXi2GFq6BTKfQ=;
        b=jsccEwdO88o6Kik7i1fGGKIgPC4Xp9LTwmfVBexyxCeLW38LkdYWrbs9zzIJVTcEqq
         /8WP5ub3GK0EkorIwOXrVXguDbBaDRlCs0jM5mI95QcpGbk+0cM819S+ZmKNHzEUR4oF
         s1nl/7YwyzpCQJZgSTlCi4ryVVWf4iAc4+zTdFEWgAXqCQfR5J7n+kRAojM0pW72CtHV
         6Zt136pVLEo+OMHDpE094jLOZZhL7EeUWNd/Zp7sdwlPlRmxp0hjVKnhsMpFcfgUmq7B
         p5VhaWUWYTL2XvXIVG39xzjqHJTfGkhps0pLgWaNTaJpQcsxMbgTmQi6LM0SG/r6/oLt
         k/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713877435; x=1714482235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kvy8LO+cIMm+HbZIf+ZYGi2YekLnZkMXi2GFq6BTKfQ=;
        b=F/X6bDF3Pp9Jori04k/PnJ9ED3SBbXUeXvwyD2BGbM4JjBEJ5WlQj3gTfq8MT2XLS0
         pShCd9cOA8/VJ3cm3lhQt7r8lY4gWzEeKBVvgxqOWCLoCavaDfxC5BsZfRHLEZt6TnAQ
         0NidpByQ/+bOPrVY79aEFWgwNFz21v7RyxBkUuayq5eJKBZG9fJs4qcf9BTqSAONBPq9
         elc/UCy39T0HWpvp8fbMZ7FTCyyFrsduQOWWQMQREv+KDFzUErySr9bYS6/A4bo0JLUE
         kyJKcbo3WpWeGycD8hB2Y5APXCRcMmVxrFEqrV91+wmf8T2Q6GK/IpQGB1ePbSg3ofnE
         KPZw==
X-Forwarded-Encrypted: i=1; AJvYcCVlbR4D0wqkXywCsuP9MPn2atLvkHrlCFOwX1aMU/Q/mG0wii+szDwh35/0ChggV+tFxIPD3pFoAktTayvlBjeDRmuY8k6OH/vOJKpwHQ==
X-Gm-Message-State: AOJu0YySEOTw+ioHN0IQtKB7JAioDIget4CvoJMtVGqSO1ERsl5FWzlk
	3pvCvLRFJ4rEcT7oHKo44uAq4lRHzjrfHZ3P9wTh3TT5gPoSYx7E1lwEUkhNJ0I=
X-Google-Smtp-Source: AGHT+IGpySdaQcCROpQ5r5e9TsmfSInd7LVYx0iPlnKIMODKT5YasK7WcFwD6VkU7AE9jDrwMyk+5A==
X-Received: by 2002:a05:6512:36d2:b0:519:6c2d:9bdb with SMTP id e18-20020a05651236d200b005196c2d9bdbmr7266957lfs.43.1713877435006;
        Tue, 23 Apr 2024 06:03:55 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z4-20020ac24f84000000b00513d244005asm2019862lfs.199.2024.04.23.06.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:03:53 -0700 (PDT)
Message-ID: <f2d96f99-d8ac-4ff1-83fa-742e541565e4@linaro.org>
Date: Tue, 23 Apr 2024 15:03:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 0/7] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Luca Weiss <luca.weiss@fairphone.com>, neil.armstrong@linaro.org,
 Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
 <CZUHV429NTF7.1GW9TN9NXB4J1@fairphone.com>
 <7a7aa05f-9ae6-4ca0-a423-224fc78fbd0c@linaro.org>
 <liah4xvkfattlen7s2zi3vt2bl5pbbxqgig3k5ljqpveoao656@iacnommxkjkt>
 <236a104c-fc16-4b3d-9a00-e16517c00e3a@linaro.org>
 <D064242SMIVM.1GUC1I9GE9IGC@fairphone.com>
 <963b60e5-6ab7-4d9f-885a-ba744c2b7991@linaro.org>
 <D0C42YR1270X.23P9WCWWNB8XF@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <D0C42YR1270X.23P9WCWWNB8XF@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/5/24 12:19, Luca Weiss wrote:
> On Fri Apr 5, 2024 at 10:08 AM CEST, Neil Armstrong wrote:
>> Hi Luca,
>>
>> On 29/03/2024 10:02, Luca Weiss wrote:
>>> On Tue Mar 26, 2024 at 10:02 PM CET, Konrad Dybcio wrote:
>>>> On 16.03.2024 5:01 PM, Bjorn Andersson wrote:
>>>>> On Fri, Mar 15, 2024 at 06:35:15PM +0100, Neil Armstrong wrote:
>>>>>> On 15/03/2024 18:19, Luca Weiss wrote:
>>>>>>> On Thu Feb 29, 2024 at 2:07 PM CET, Neil Armstrong wrote:
>>>>>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>>>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>>>>>
>>>>>>>> The DisplayPort phy should be left enabled if is still powered on
>>>>>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>>>>>> PHY is not powered off.
>>>>>>>>
>>>>>>>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>>>>>>>> will be set in between of USB-Only, Combo and DisplayPort Only so
>>>>>>>> this will leave enough time to the DRM DisplayPort controller to
>>>>>>>> turn of the DisplayPort PHY.
>>>>>>>>
>>>>>>>> The patchset also includes bindings changes and DT changes.
>>>>>>>>
>>>>>>>> This has been successfully tested on an SM8550 board, but the
>>>>>>>> Thinkpad X13s deserved testing between non-PD USB, non-PD DisplayPort,
>>>>>>>> PD USB Hubs and PD Altmode Dongles to make sure the switch works
>>>>>>>> as expected.
>>>>>>>>
>>>>>>>> The DisplayPort 4 lanes setup can be check with:
>>>>>>>> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
>>>>>>>> 	name = msm_dp
>>>>>>>> 	drm_dp_link
>>>>>>>> 		rate = 540000
>>>>>>>> 		num_lanes = 4
>>>>>>>
>>>>>>> Hi Neil,
>>>>>>>
>>>>>>> I tried this on QCM6490/SC7280 which should also support 4-lane DP but I
>>>>>>> haven't had any success so far.
>>>>>>>
>>>>> [..]
>>>>>>> [ 1775.563969] [drm:dp_ctrl_link_train] *ERROR* max v_level reached
>>>>>>> [ 1775.564031] [drm:dp_ctrl_link_train] *ERROR* link training #1 failed. ret=-11
>>>>>>
>>>>>> Interesting #1 means the 4 lanes are not physically connected to the other side,
>>>>>> perhaps QCM6490/SC7280 requires a specific way to enable the 4 lanes in the PHY,
>>>>>> or some fixups in the init tables.
>>>>>>
>>>>>
>>>>> I tested the same on rb3gen2 (qcs6490) a couple of weeks ago, with the
>>>>> same outcome. Looking at the AUX reads, after switching to 4-lane the
>>>>> link training is failing on all 4 lanes, in contrast to succeeding only
>>>>> on the first 2 if you e.g. forget to mux the other two.
>>>>>
>>>>> As such, my expectation is that there's something wrong in the QMP PHY
>>>>> (or possibly redriver) for this platform.
>>>>
>>>> Do we have any downstream tag where 4lane dp works? I'm willing to believe
>>>> the PHY story..
>>>
>>> Just tested on Fairphone 5 downstream and 4 lane appears to work there.
>>> This is with an USB-C to HDMI adapter that only does HDMI.
>>>
>>> FP5:/ # cat /sys/kernel/debug/drm_dp/dp_debug
>>>           state=0x20a5
>>>           link_rate=270000
>>>           num_lanes=4
>>>           resolution=2560x1440@60Hz
>>>           pclock=241500KHz
>>>           bpp=24
>>>           test_req=DP_LINK_STATUS_UPDATED
>>>           lane_count=4
>>>           bw_code=10
>>>           v_level=0
>>>           p_level=0
>>>
>>> Sources are here:
>>> https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-5.4/+/refs/heads/odm/rc/target/13/fp5
>>> And probably more importantly techpack/display:
>>> https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/opensource/display-drivers/+/refs/heads/odm/rc/target/13/fp5
>>> Dts if useful:
>>> https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/refs/heads/kernel/13/fp5
>>
>> Could you retry with this applied ?
>>
>> https://lore.kernel.org/all/20240405000111.1450598-1-swboyd@chromium.org/
> 
> Unfortunately I do not see any change with this on QCM6490 Fairphone 5
> and 4-lane DP.

Hm, could you like dump all the PHY regions up and downstream with the display
connected (and nothing connected) and compare them?

Konrad

