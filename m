Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63C8443A05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 00:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhKBXxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 19:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhKBXxL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 19:53:11 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A757C061203
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Nov 2021 16:50:36 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d21so1657571lfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Nov 2021 16:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fVBGk1MYyCWrNZI+cGnXDaPmanq61gpSQuTYWAYJ+rg=;
        b=ct6rwWB5FRv5Mti6ZNWlPXqu8r/Q2ELC3sZ//jRtNp/MEx7eF4jfyZIdP733Qhi1LS
         3zUM+Cdkey0NBeVZZhuNPNH/nkmYS7FtlOwQEYFYI/lFgzIj9UOxmiuKiZhImhAA8sFp
         +FvtNKpYI8yOZM5EGEQIgMkFwHA37YNcBlF3i6ercceteicQIpR+V4nvzLEyj1/e85nD
         6OL7Gp0bxn/3ZI02LjXDUH+G6TeVjTQrA9NVp/4A7FfeC2VOwEccVrYvKpl4b/Y1Xxgb
         WDqOU90M4L2K0yG/V6diro/qFJxz6Hbml+w28liXPAycWrahis2aOW+7+x7i28fSid5m
         xWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fVBGk1MYyCWrNZI+cGnXDaPmanq61gpSQuTYWAYJ+rg=;
        b=a6ZEZkcjfaw0M5Jw/F0v7AS/BV6YGUw3SuHqx34KNYyngaCi+R3xcNhdWhB76MKGhi
         cxo5coH7VPQX7zQjmSOIpnPxqaNZPg//vXrrm326JhPZP/uAuslVUu+0KpmxuvOt3BBU
         VmGikBIxp1lrgwG+YIryQBDqnJZHlkGPWZCZ0YgBciprfYOldrn1QtW3rVtWZXMsyj09
         RQJ7q5wojTFn5pGjFyXXSjx1CucmreEPBXpqetcftJf/wrhlEksYeeCfVQZpzom0jIfN
         ++5+trn8MTB31ytb5LciDOs+uLHojgN8Fz4TQpWKNuRA0eUhdZL4FWgQ3fDhwATyynK3
         v30g==
X-Gm-Message-State: AOAM531jLJxS+rIu5rizkFacXCtSUkO49xKJ/K1eyy0VLLOYiLlfcuJu
        2sK4EBoQrKLQIw1Ys2SkrIPzuw==
X-Google-Smtp-Source: ABdhPJzVjWt0dzeXhRVr9LeJ7wx4S7kb2JiWs4DZ1Y5b+WPKmsokaDHCGflD/Im5gu1IMPh0Ik3PVA==
X-Received: by 2002:a05:6512:2022:: with SMTP id s2mr36121348lfs.661.1635897034131;
        Tue, 02 Nov 2021 16:50:34 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o17sm30262lfg.211.2021.11.02.16.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 16:50:33 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: msm8996: Revamp reserved memory
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4455e52f-7e8a-c431-9977-dcf4aefe9822@linaro.org>
Date:   Wed, 3 Nov 2021 02:50:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXTNL7boyiRFKQiV@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2021 06:04, Bjorn Andersson wrote:
> On Sun 26 Sep 14:06 CDT 2021, Yassine Oudjana wrote:
> 
>> Fix a total overlap between zap_shader_region and slpi_region, and rename
>> all regions to match the naming convention in other Qualcomm SoC device trees.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> FYI, I like this series, but I held off applying it because I wanted to
> verify that the shuffling of the memory regions works on the existing
> 8996 boards.
> 
> Unfortunately it didn't work, either with or without the shuffling on
> the db820c - and I've not found the time to figure out why that is. I
> hope to get back to this shortly (or that someone else will figure it
> out and provide a tested-by)

I gave this a test too on my db820c. Usually the board MSS will crash 
after ~0.1 - 0.15 seconds after booting up, then during recovery the 
board will crash/reboot somewhere at the end of q6v5_mss_load() (and 
typically after successful q6v5_rmb_mba_wait() call.

Occasionally (approximately 1 of 20) the MSS will not crash, presenting 
PDS service to the userspace. Even in this state it doesn't seem to be 
able to lock the gps location (but this might be related to the big UART 
mezzanine sitting on top of the board).

Unfortunately there seem to be no SLPI firmware for the db820c, so I can 
not test slpi.

A notice regarding the patchset itself. It looks like pil_q6v5_mss.c 
driver misses mx and cx proxy power domains for the MSS_MSM8996 case.

> 
> Regards,
> Bjorn
> 
>> ---
>>   .../dts/qcom/msm8996-sony-xperia-tone.dtsi    | 18 ++++--
>>   .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  | 18 +++---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 63 ++++++++++---------
>>   3 files changed, 55 insertions(+), 44 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
>> index 507396c4d23b..4c26e66f0610 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
>> @@ -13,9 +13,10 @@
>>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>   #include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
>>   
>> -/delete-node/ &slpi_region;
>> -/delete-node/ &venus_region;
>> -/delete-node/ &zap_shader_region;
>> +/delete-node/ &adsp_mem;
>> +/delete-node/ &slpi_mem;
>> +/delete-node/ &venus_mem;
>> +/delete-node/ &gpu_mem;
>>   
>>   / {
>>   	qcom,msm-id = <246 0x30001>; /* MSM8996 V3.1 (Final) */
>> @@ -46,18 +47,23 @@ cont_splash_mem: memory@83401000 {
>>   			no-map;
>>   		};
>>   
>> -		zap_shader_region: gpu@90400000 {
>> +		adsp_mem: adsp@8ea00000 {
>> +			reg = <0x0 0x8ea00000 0x0 0x1a00000>;
>> +			no-map;
>> +		};
>> +
>> +		gpu_mem: gpu@90400000 {
>>   			compatible = "shared-dma-pool";
>>   			reg = <0x0 0x90400000 0x0 0x2000>;
>>   			no-map;
>>   		};
>>   
>> -		slpi_region: memory@90500000 {
>> +		slpi_mem: memory@90500000 {
>>   			reg = <0 0x90500000 0 0xa00000>;
>>   			no-map;
>>   		};
>>   
>> -		venus_region: memory@90f00000 {
>> +		venus_mem: memory@90f00000 {
>>   			reg = <0 0x90f00000 0 0x500000>;
>>   			no-map;
>>   		};
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
>> index d239b01b8505..a5e7bccadba2 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
>> @@ -66,32 +66,32 @@ memory@88800000 {
>>   
>>   		/* This platform has all PIL regions offset by 0x1400000 */
>>   		/delete-node/ mpss@88800000;
>> -		mpss_region: mpss@89c00000 {
>> +		mpss_mem: mpss@89c00000 {
>>   			reg = <0x0 0x89c00000 0x0 0x6200000>;
>>   			no-map;
>>   		};
>>   
>>   		/delete-node/ adsp@8ea00000;
>> -		adsp_region: adsp@8ea00000 {
>> +		adsp_mem: adsp@8fe00000 {
>>   			reg = <0x0 0x8fe00000 0x0 0x1b00000>;
>>   			no-map;
>>   		};
>>   
>> -		/delete-node/ slpi@90b00000;
>> -		slpi_region: slpi@91900000 {
>> +		/delete-node/ slpi@90500000;
>> +		slpi_mem: slpi@91900000 {
>>   			reg = <0x0 0x91900000 0x0 0xa00000>;
>>   			no-map;
>>   		};
>>   
>> -		/delete-node/ gpu@8f200000;
>> -		zap_shader_region: gpu@92300000 {
>> +		/delete-node/ gpu@90f00000;
>> +		gpu_mem: gpu@92300000 {
>>   			compatible = "shared-dma-pool";
>>   			reg = <0x0 0x92300000 0x0 0x2000>;
>>   			no-map;
>>   		};
>>   
>>   		/delete-node/ venus@91000000;
>> -		venus_region: venus@90400000 {
>> +		venus_mem: venus@92400000 {
>>   			reg = <0x0 0x92400000 0x0 0x500000>;
>>   			no-map;
>>   		};
>> @@ -107,7 +107,7 @@ ramoops@92900000 {
>>   			pmsg-size = <0x40000>;
>>   		};
>>   
>> -		/delete-node/ rmtfs@86700000;
>> +		/delete-node/ rmtfs;
>>   		rmtfs@f6c00000 {
>>   			compatible = "qcom,rmtfs-mem";
>>   			reg = <0 0xf6c00000 0 0x200000>;
>> @@ -118,7 +118,7 @@ rmtfs@f6c00000 {
>>   		};
>>   
>>   		/delete-node/ mba@91500000;
>> -		mba_region: mba@f6f00000 {
>> +		mba_mem: mba@f6f00000 {
>>   			reg = <0x0 0xf6f00000 0x0 0x100000>;
>>   			no-map;
>>   		};
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index eb3ec5ff46eb..1495fff6ffc9 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -384,60 +384,65 @@ reserved-memory {
>>   		#size-cells = <2>;
>>   		ranges;
>>   
>> -		mba_region: mba@91500000 {
>> -			reg = <0x0 0x91500000 0x0 0x200000>;
>> +		hyp_mem: memory@85800000 {
>> +			reg = <0x0 0x85800000 0x0 0x600000>;
>>   			no-map;
>>   		};
>>   
>> -		slpi_region: slpi@90b00000 {
>> -			reg = <0x0 0x90b00000 0x0 0xa00000>;
>> +		xbl_mem: memory@85e00000 {
>> +			reg = <0x0 0x85e00000 0x0 0x200000>;
>>   			no-map;
>>   		};
>>   
>> -		venus_region: venus@90400000 {
>> -			reg = <0x0 0x90400000 0x0 0x700000>;
>> +		smem_mem: smem-mem@86000000 {
>> +			reg = <0x0 0x86000000 0x0 0x200000>;
>>   			no-map;
>>   		};
>>   
>> -		adsp_region: adsp@8ea00000 {
>> -			reg = <0x0 0x8ea00000 0x0 0x1a00000>;
>> +		tz_mem: memory@86200000 {
>> +			reg = <0x0 0x86200000 0x0 0x2600000>;
>>   			no-map;
>>   		};
>>   
>> -		mpss_region: mpss@88800000 {
>> -			reg = <0x0 0x88800000 0x0 0x6200000>;
>> +		rmtfs_mem: rmtfs {
>> +			compatible = "qcom,rmtfs-mem";
>> +
>> +			size = <0x0 0x200000>;
>> +			alloc-ranges = <0x0 0xa0000000 0x0 0x2000000>;
>>   			no-map;
>> +
>> +			qcom,client-id = <1>;
>> +			qcom,vmid = <15>;
>>   		};
>>   
>> -		smem_mem: smem-mem@86000000 {
>> -			reg = <0x0 0x86000000 0x0 0x200000>;
>> +		mpss_mem: mpss@88800000 {
>> +			reg = <0x0 0x88800000 0x0 0x6200000>;
>>   			no-map;
>>   		};
>>   
>> -		memory@85800000 {
>> -			reg = <0x0 0x85800000 0x0 0x800000>;
>> +		adsp_mem: adsp@8ea00000 {
>> +			reg = <0x0 0x8ea00000 0x0 0x1b00000>;
>>   			no-map;
>>   		};
>>   
>> -		memory@86200000 {
>> -			reg = <0x0 0x86200000 0x0 0x2600000>;
>> +		slpi_mem: slpi@90500000 {
>> +			reg = <0x0 0x90500000 0x0 0xa00000>;
>>   			no-map;
>>   		};
>>   
>> -		rmtfs@86700000 {
>> -			compatible = "qcom,rmtfs-mem";
>> -
>> -			size = <0x0 0x200000>;
>> -			alloc-ranges = <0x0 0xa0000000 0x0 0x2000000>;
>> +		gpu_mem: gpu@90f00000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x0 0x90f00000 0x0 0x100000>;
>>   			no-map;
>> +		};
>>   
>> -			qcom,client-id = <1>;
>> -			qcom,vmid = <15>;
>> +		venus_mem: venus@91000000 {
>> +			reg = <0x0 0x91000000 0x0 0x500000>;
>> +			no-map;
>>   		};
>>   
>> -		zap_shader_region: gpu@8f200000 {
>> -			compatible = "shared-dma-pool";
>> -			reg = <0x0 0x90b00000 0x0 0xa00000>;
>> +		mba_mem: mba@91500000 {
>> +			reg = <0x0 0x91500000 0x0 0x200000>;
>>   			no-map;
>>   		};
>>   	};
>> @@ -1013,7 +1018,7 @@ opp-133000000 {
>>   			};
>>   
>>   			zap-shader {
>> -				memory-region = <&zap_shader_region>;
>> +				memory-region = <&gpu_mem>;
>>   			};
>>   		};
>>   
>> @@ -2001,7 +2006,7 @@ venus: video-codec@c00000 {
>>   				 <&venus_smmu 0x2c>,
>>   				 <&venus_smmu 0x2d>,
>>   				 <&venus_smmu 0x31>;
>> -			memory-region = <&venus_region>;
>> +			memory-region = <&venus_mem>;
>>   			status = "disabled";
>>   
>>   			video-decoder {
>> @@ -3008,7 +3013,7 @@ adsp_pil: remoteproc@9300000 {
>>   			clocks = <&xo_board>;
>>   			clock-names = "xo";
>>   
>> -			memory-region = <&adsp_region>;
>> +			memory-region = <&adsp_mem>;
>>   
>>   			qcom,smem-states = <&smp2p_adsp_out 0>;
>>   			qcom,smem-state-names = "stop";
>> -- 
>> 2.33.0
>>
>>


-- 
With best wishes
Dmitry
