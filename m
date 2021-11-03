Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F7E4442D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 14:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhKCN5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 09:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbhKCN5s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 09:57:48 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796F9C061203
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 06:55:11 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s24so3903420lji.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yfikhx5lD6H4OrTwev9q1XoxrbyVQ+Nr+SFoJkjr/Qc=;
        b=WRPeotSogutRyERtr8+k7ErZJzMVL1RlafpF9XIcpCxP0sS47WcRVR9PBUuWRUm0V1
         mfGFzUjfCv/xe1jxXKkn70BN89qou1u8TT5Utr12MNRlwf1wNR9bl2zgF45wVaq8YLvh
         r0s4hTW0LSZECUKHPSb1+g0eUTADzkxc88FawkxvhBCog/PgV2dkyrErtul1BuuHxUIn
         9powIfTAp1oHWh2J2eBhvtDOqMnGfV8Ya6JC5/hhP1KikAKGKMhy4tDGvHOo9I0SfqUk
         ADxGABR4i5ePr06NWoKo7O7LEx/5XKzTPN5FN6qfUGOg+1vElDsYpDXd7p5dk9/Cy74v
         m30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yfikhx5lD6H4OrTwev9q1XoxrbyVQ+Nr+SFoJkjr/Qc=;
        b=orkfvEzPh9FPSUfc7MP2vVTuCsZAx7mtAtyLFeQjViNzUaZ7qoWvvjW24STtYXXY/V
         0YLnQ2qSdU24uEWEOUgfyYgNlN/83QFsIv5VRq6A4n5rOrugWztKCEkPNUvlwuZraIue
         3A8UioxUOoL17HjwCO0di1NLezuElMJGX9QWEN0XVwUae6e9XlVr08HmexVRba3AGVpJ
         +kxw3HA2YbL+qOEDzXIJE4z2FLWT+BM0xqDBrDs+ftY9NAPXRM6loU6drT2waHI6u7Yu
         E+KYTYel5Ar9W0rj/DG7NUi2ZdOgFgPv2WzviGJXrQS+NzupifrnWBjKSnpvHbzJ9NUR
         8Q2w==
X-Gm-Message-State: AOAM5301PzVgXvq9BeqTY6t7r16m76fwl4HwRWbZNxIa2SiAxO0OwPXY
        AZ2K+CTVYScCZQbuZCd3UD5cKg==
X-Google-Smtp-Source: ABdhPJzEU5Irc+DqLsdFfRseBtZZbnYSPeOfQRE9nJ+tuVxW+0QisgPUoU99hKMstcCDkLyWYVBmTA==
X-Received: by 2002:a2e:b8c7:: with SMTP id s7mr16502027ljp.73.1635947709655;
        Wed, 03 Nov 2021 06:55:09 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y11sm185930lfs.135.2021.11.03.06.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 06:55:09 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: msm8996: Revamp reserved memory
To:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210926190555.278589-1-y.oudjana@protonmail.com>
 <20210926190555.278589-2-y.oudjana@protonmail.com>
 <YXTNL7boyiRFKQiV@builder.lan>
 <4455e52f-7e8a-c431-9977-dcf4aefe9822@linaro.org>
 <91b184266e545efcc5969fe6661b50da82351119.camel@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <05b1f668-4dbf-36f7-76ef-6559e277d3c6@linaro.org>
Date:   Wed, 3 Nov 2021 16:55:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <91b184266e545efcc5969fe6661b50da82351119.camel@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/11/2021 05:42, Yassine Oudjana wrote:
> On Wed, 2021-11-03 at 03:50 +0400, Dmitry Baryshkov wrote:
>> On 24/10/2021 06:04, Bjorn Andersson wrote:
>>> On Sun 26 Sep 14:06 CDT 2021, Yassine Oudjana wrote:
>>>
>>>> Fix a total overlap between zap_shader_region and slpi_region, and rename
>>>> all regions to match the naming convention in other Qualcomm SoC device trees.
>>>>
>>>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>
>>> FYI, I like this series, but I held off applying it because I wanted to
>>> verify that the shuffling of the memory regions works on the existing
>>> 8996 boards.
>>>
>>> Unfortunately it didn't work, either with or without the shuffling on
>>> the db820c - and I've not found the time to figure out why that is. I
>>> hope to get back to this shortly (or that someone else will figure it
>>> out and provide a tested-by)
>>
>> I gave this a test too on my db820c. Usually the board MSS will crash
>> after ~0.1 - 0.15 seconds after booting up, then during recovery the
>> board will crash/reboot somewhere at the end of q6v5_mss_load() (and
>> typically after successful q6v5_rmb_mba_wait() call.
> 
>> Occasionally (approximately 1 of 20) the MSS will not crash, presenting
>> PDS service to the userspace. Even in this state it doesn't seem to be
>> able to lock the gps location (but this might be related to the big UART
>> mezzanine sitting on top of the board).
> 
> I've had MSS crash on xiaomi-scorpio too, but far less often. It seemed
> like some sort of race condition, as it only happened when ADSP and MSS
> were booted at the same time. To workaround this, I delayed loading of
> the rmtfs service to leave some time between booting ADSP and MSS.

For the tests to get 1:20 I've disabled ADSP (and WiFi/BT) completely. 
Without that I think I never got MSS to boot successfully. I think this 
is some kind of power/regulators/clock with ADSP and MSS draining too 
much power.

Note to myself: check rmtfs/partitions usage on db820c.

> 
>>
>> Unfortunately there seem to be no SLPI firmware for the db820c, so I can
>> not test slpi.
>>
>> A notice regarding the patchset itself. It looks like pil_q6v5_mss.c
>> driver misses mx and cx proxy power domains for the MSS_MSM8996 case.
> 
> I didn't notice that. I guess they stay on and MSS is able to boot
> anyway. I'll add them similar to PATCH 2/5.

Thanks!

> 
>>
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> ---
>>>>    .../dts/qcom/msm8996-sony-xperia-tone.dtsi    | 18 ++++--
>>>>    .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  | 18 +++---
>>>>    arch/arm64/boot/dts/qcom/msm8996.dtsi         | 63 ++++++++++---------
>>>>    3 files changed, 55 insertions(+), 44 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
>>>> index 507396c4d23b..4c26e66f0610 100644
>>>> --- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
>>>> @@ -13,9 +13,10 @@
>>>>    #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>>>    #include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
>>>>
>>>> -/delete-node/ &slpi_region;
>>>> -/delete-node/ &venus_region;
>>>> -/delete-node/ &zap_shader_region;
>>>> +/delete-node/ &adsp_mem;
>>>> +/delete-node/ &slpi_mem;
>>>> +/delete-node/ &venus_mem;
>>>> +/delete-node/ &gpu_mem;
>>>>
>>>>    / {
>>>>    	qcom,msm-id = <246 0x30001>; /* MSM8996 V3.1 (Final) */
>>>> @@ -46,18 +47,23 @@ cont_splash_mem: memory@83401000 {
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		zap_shader_region: gpu@90400000 {
>>>> +		adsp_mem: adsp@8ea00000 {
>>>> +			reg = <0x0 0x8ea00000 0x0 0x1a00000>;
>>>> +			no-map;
>>>> +		};
>>>> +
>>>> +		gpu_mem: gpu@90400000 {
>>>>    			compatible = "shared-dma-pool";
>>>>    			reg = <0x0 0x90400000 0x0 0x2000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		slpi_region: memory@90500000 {
>>>> +		slpi_mem: memory@90500000 {
>>>>    			reg = <0 0x90500000 0 0xa00000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		venus_region: memory@90f00000 {
>>>> +		venus_mem: memory@90f00000 {
>>>>    			reg = <0 0x90f00000 0 0x500000>;
>>>>    			no-map;
>>>>    		};
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
>>>> index d239b01b8505..a5e7bccadba2 100644
>>>> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
>>>> @@ -66,32 +66,32 @@ memory@88800000 {
>>>>
>>>>    		/* This platform has all PIL regions offset by 0x1400000 */
>>>>    		/delete-node/ mpss@88800000;
>>>> -		mpss_region: mpss@89c00000 {
>>>> +		mpss_mem: mpss@89c00000 {
>>>>    			reg = <0x0 0x89c00000 0x0 0x6200000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>>    		/delete-node/ adsp@8ea00000;
>>>> -		adsp_region: adsp@8ea00000 {
>>>> +		adsp_mem: adsp@8fe00000 {
>>>>    			reg = <0x0 0x8fe00000 0x0 0x1b00000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		/delete-node/ slpi@90b00000;
>>>> -		slpi_region: slpi@91900000 {
>>>> +		/delete-node/ slpi@90500000;
>>>> +		slpi_mem: slpi@91900000 {
>>>>    			reg = <0x0 0x91900000 0x0 0xa00000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		/delete-node/ gpu@8f200000;
>>>> -		zap_shader_region: gpu@92300000 {
>>>> +		/delete-node/ gpu@90f00000;
>>>> +		gpu_mem: gpu@92300000 {
>>>>    			compatible = "shared-dma-pool";
>>>>    			reg = <0x0 0x92300000 0x0 0x2000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>>    		/delete-node/ venus@91000000;
>>>> -		venus_region: venus@90400000 {
>>>> +		venus_mem: venus@92400000 {
>>>>    			reg = <0x0 0x92400000 0x0 0x500000>;
>>>>    			no-map;
>>>>    		};
>>>> @@ -107,7 +107,7 @@ ramoops@92900000 {
>>>>    			pmsg-size = <0x40000>;
>>>>    		};
>>>>
>>>> -		/delete-node/ rmtfs@86700000;
>>>> +		/delete-node/ rmtfs;
>>>>    		rmtfs@f6c00000 {
>>>>    			compatible = "qcom,rmtfs-mem";
>>>>    			reg = <0 0xf6c00000 0 0x200000>;
>>>> @@ -118,7 +118,7 @@ rmtfs@f6c00000 {
>>>>    		};
>>>>
>>>>    		/delete-node/ mba@91500000;
>>>> -		mba_region: mba@f6f00000 {
>>>> +		mba_mem: mba@f6f00000 {
>>>>    			reg = <0x0 0xf6f00000 0x0 0x100000>;
>>>>    			no-map;
>>>>    		};
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>>> index eb3ec5ff46eb..1495fff6ffc9 100644
>>>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>>> @@ -384,60 +384,65 @@ reserved-memory {
>>>>    		#size-cells = <2>;
>>>>    		ranges;
>>>>
>>>> -		mba_region: mba@91500000 {
>>>> -			reg = <0x0 0x91500000 0x0 0x200000>;
>>>> +		hyp_mem: memory@85800000 {
>>>> +			reg = <0x0 0x85800000 0x0 0x600000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		slpi_region: slpi@90b00000 {
>>>> -			reg = <0x0 0x90b00000 0x0 0xa00000>;
>>>> +		xbl_mem: memory@85e00000 {
>>>> +			reg = <0x0 0x85e00000 0x0 0x200000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		venus_region: venus@90400000 {
>>>> -			reg = <0x0 0x90400000 0x0 0x700000>;
>>>> +		smem_mem: smem-mem@86000000 {
>>>> +			reg = <0x0 0x86000000 0x0 0x200000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		adsp_region: adsp@8ea00000 {
>>>> -			reg = <0x0 0x8ea00000 0x0 0x1a00000>;
>>>> +		tz_mem: memory@86200000 {
>>>> +			reg = <0x0 0x86200000 0x0 0x2600000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		mpss_region: mpss@88800000 {
>>>> -			reg = <0x0 0x88800000 0x0 0x6200000>;
>>>> +		rmtfs_mem: rmtfs {
>>>> +			compatible = "qcom,rmtfs-mem";
>>>> +
>>>> +			size = <0x0 0x200000>;
>>>> +			alloc-ranges = <0x0 0xa0000000 0x0 0x2000000>;
>>>>    			no-map;
>>>> +
>>>> +			qcom,client-id = <1>;
>>>> +			qcom,vmid = <15>;
>>>>    		};
>>>>
>>>> -		smem_mem: smem-mem@86000000 {
>>>> -			reg = <0x0 0x86000000 0x0 0x200000>;
>>>> +		mpss_mem: mpss@88800000 {
>>>> +			reg = <0x0 0x88800000 0x0 0x6200000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		memory@85800000 {
>>>> -			reg = <0x0 0x85800000 0x0 0x800000>;
>>>> +		adsp_mem: adsp@8ea00000 {
>>>> +			reg = <0x0 0x8ea00000 0x0 0x1b00000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		memory@86200000 {
>>>> -			reg = <0x0 0x86200000 0x0 0x2600000>;
>>>> +		slpi_mem: slpi@90500000 {
>>>> +			reg = <0x0 0x90500000 0x0 0xa00000>;
>>>>    			no-map;
>>>>    		};
>>>>
>>>> -		rmtfs@86700000 {
>>>> -			compatible = "qcom,rmtfs-mem";
>>>> -
>>>> -			size = <0x0 0x200000>;
>>>> -			alloc-ranges = <0x0 0xa0000000 0x0 0x2000000>;
>>>> +		gpu_mem: gpu@90f00000 {
>>>> +			compatible = "shared-dma-pool";
>>>> +			reg = <0x0 0x90f00000 0x0 0x100000>;
>>>>    			no-map;
>>>> +		};
>>>>
>>>> -			qcom,client-id = <1>;
>>>> -			qcom,vmid = <15>;
>>>> +		venus_mem: venus@91000000 {
>>>> +			reg = <0x0 0x91000000 0x0 0x500000>;
>>>> +			no-map;
>>>>    		};
>>>>
>>>> -		zap_shader_region: gpu@8f200000 {
>>>> -			compatible = "shared-dma-pool";
>>>> -			reg = <0x0 0x90b00000 0x0 0xa00000>;
>>>> +		mba_mem: mba@91500000 {
>>>> +			reg = <0x0 0x91500000 0x0 0x200000>;
>>>>    			no-map;
>>>>    		};
>>>>    	};
>>>> @@ -1013,7 +1018,7 @@ opp-133000000 {
>>>>    			};
>>>>
>>>>    			zap-shader {
>>>> -				memory-region = <&zap_shader_region>;
>>>> +				memory-region = <&gpu_mem>;
>>>>    			};
>>>>    		};
>>>>
>>>> @@ -2001,7 +2006,7 @@ venus: video-codec@c00000 {
>>>>    				 <&venus_smmu 0x2c>,
>>>>    				 <&venus_smmu 0x2d>,
>>>>    				 <&venus_smmu 0x31>;
>>>> -			memory-region = <&venus_region>;
>>>> +			memory-region = <&venus_mem>;
>>>>    			status = "disabled";
>>>>
>>>>    			video-decoder {
>>>> @@ -3008,7 +3013,7 @@ adsp_pil: remoteproc@9300000 {
>>>>    			clocks = <&xo_board>;
>>>>    			clock-names = "xo";
>>>>
>>>> -			memory-region = <&adsp_region>;
>>>> +			memory-region = <&adsp_mem>;
>>>>
>>>>    			qcom,smem-states = <&smp2p_adsp_out 0>;
>>>>    			qcom,smem-state-names = "stop";
>>>> --
>>>> 2.33.0
>>>>
>>>>
>>
>>
>> --
>> With best wishes
>> Dmitry
> 
> 
> 


-- 
With best wishes
Dmitry
