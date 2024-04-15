Return-Path: <linux-arm-msm+bounces-17508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4678A5BE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 22:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ED8F1C21DB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 20:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BF715664A;
	Mon, 15 Apr 2024 20:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YXQ4S8Cn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E0F155A58
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 20:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713211219; cv=none; b=o4f/+DEA2L9ZaQMi0komNtxzVBXgxv25N8iUp5N4b/KBKday8bhi1Nej9kodHCHWq+QsJlsnzE0xAx+xRcBQ2FUhX83q7XStY8073RuSOSYv7p4Ld45z5HyG2vsR1fQ1TJQMNi1bPGSMY9C+Ey9aTFUVAuAa+j3PeocpwL+85vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713211219; c=relaxed/simple;
	bh=PZQGZ+VuA6ELgE/fgHcQ1AmTRp9jWAlTMUEZb5w9AZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mv3Y/8UA0pvIeuNMG0e5wvBXkt3AlW6wTPBsfDsswCb/jpz93XF1habQtzKsjxKjuYNS1vWiAOrpZ2ywX6436rAqSKTwWwsu8FwEH3kzVv+Oh89oR59hTRS+tr2ZlZB29PbX/YJjM/RZD9vuIIMvs6yY50HzXRy2SGaqlRUlGv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YXQ4S8Cn; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d0162fa1so4540523e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713211216; x=1713816016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iu4TsmsR0yr+hZlSUf3nbeWPU6VyzUbHeXgBs5JQM8I=;
        b=YXQ4S8CngQzihiWuDb3L4QzPQf7rUC91sjSFJgwCdKM/y0rfgTZX+ltVgIoo9aT58C
         ox5o7zKUOfrmDJQ/iNKiVeluh5QQsgLL/HfLMPiyaSwpVSZGLaD3bvhrQwPyjJ3zY+Sc
         zWvB0cIGR3tI4bm3K7aqQI5e7ouWGtt+yt43D7KV/OUPoljNheRaDl4YQRj0+q4NC/Bo
         dSUH7TX+ZH3/IRAUTwCgWDoTT1Gz3GEMX2uo8v6WcFstX6H+aSD3oz0724tctsWpa1MB
         uk3qvgKo6nQHzlH8s2Ph14WGZUFfOYCt/b5Fgc7WDeT1BhcboWESgfxUGW/o+HNU5Il7
         YdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211216; x=1713816016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iu4TsmsR0yr+hZlSUf3nbeWPU6VyzUbHeXgBs5JQM8I=;
        b=iiN18Ra74wm8h5fONcprqvM5efk3rcHfXLRf0YCefzzDlPUByNcygm+Sjo3taL89AA
         OYeXx9kwx5Re7d9kyAtVRG/yHAq5x/kMDFEDJcX5XJXIzyUN+0ilaNhZonQbByybTAwi
         dUnVGOdNKd2EIWKoj40NCnKDvk2oOssVH/TTSzAV4Wp/3l+FYnt1jyuVxiZvc5D/4jmg
         V2euAsTLofbbRKvWPaQupOgx9EF0SzJjpzPcVl06Z2AgRSG3ouju3LPj9nDTb61GM+sc
         wS7Q0cHTzSd2xyNW6ZS20rEf1VA0IByPLw8x++aU1apA13XkMpPAp9qaFSvWs0Yzo9Sw
         6CyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7YhdVrMbj6gnhVENt/DLhUHvdzhusiM7Gq/4vLm3U2hTXKtmsPkBiAOjB3PV9cUM70kmfCDOtAhW7ktWOnMi0Fz4BYYZoRxDRiPB8OQ==
X-Gm-Message-State: AOJu0Yz0xtsr5Lu/IkLLDY3PLaAxsQn3dcrr+oWUJSwr5LOV7OadXuJG
	0quE0bUSGn2DpVPIi/4i2IH4o4X9Z8j4T/tikCB/RhNPElG96IzWYpZza4djZHY=
X-Google-Smtp-Source: AGHT+IEg2HPeaum23ALkOp0qFvulXUMO+CauhwOhhqKEHowUZVDqwmA6Yvnmjzgd6CxVDLPgd6HQRg==
X-Received: by 2002:a19:7409:0:b0:519:3ce:a12b with SMTP id v9-20020a197409000000b0051903cea12bmr1612742lfe.23.1713211215573;
        Mon, 15 Apr 2024 13:00:15 -0700 (PDT)
Received: from [172.30.205.18] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g33-20020a0565123ba100b00518b0fdbf60sm706180lfv.258.2024.04.15.13.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 13:00:14 -0700 (PDT)
Message-ID: <b1462fb5-df86-45d9-9f67-697321e2b7dc@linaro.org>
Date: Mon, 15 Apr 2024 22:00:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Robert Richter <rric@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy"
 <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-fsd@tesla.com, Michal Simek <michal.simek@amd.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-realtek-soc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20240412222857.3873079-1-robh@kernel.org>
 <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
 <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
 <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
 <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/15/24 19:41, Dmitry Baryshkov wrote:
> On Mon, 15 Apr 2024 at 20:15, Rob Herring <robh@kernel.org> wrote:
>>
>> On Mon, Apr 15, 2024 at 12:05 PM Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Mon, Apr 15, 2024 at 11:52 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>>>>
>>>>> On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
>>>>> [..]
>>>>>>   arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
>>>>>>   arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
>>>>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
>>>>>>   arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
>>>>>
>>>>> Acked-by: Bjorn Andersson <andersson@kernel.org>
>>>>
>>>> Note, we'd need to override PMU compatibles in sdm636.dtsi and
>>>> sdm660.dtsi. Ideally it should come as the same patch.
>>>
>>> Uh, that's an A for reuse, but an F for readability... It's sdm632 as
>>> well. Will drop sdm630.
>>
>> Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
>> A53 PMU compatible is an improvement over the generic one still. We
>> can't just add kryo260-pmu compatibles because that breaks
>> compatibility. We could have a fallback, but then that introduces a
>> pattern we don't want.
> 
> I think it is believed that Gold cores are A73-derivatives.

8xA53 on 630
4xA53+4xA73 on 636/660

Konrad

