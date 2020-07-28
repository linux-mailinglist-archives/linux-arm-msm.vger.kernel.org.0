Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE5422FFCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 04:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgG1Cow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 22:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgG1Cov (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 22:44:51 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB4EC0619D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 19:44:51 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id e13so17383699qkg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 19:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VyLDDLuDdqJmiGManC5xlHnemIFzVpCwA6D+aqPNpOw=;
        b=jykl9cwY2F2Czc5rRconhPiQak6LZ4ryBQmOeMUpbiKr4vE0R3DizxGa1Aj1gg6If/
         e0Ecqb14ImiL4Yx1I8PpFB0tzG/EpezHQfxDhpqL4qg3W6TphO9jSrJw6zPh1OsZc9p+
         JDHZpdqn1wq1G600ggQmiLHa9JGonuLFV0Orfeu1vf335JFckFdfhDxQz1tv3iS89gCp
         z5OLQoKh/uguTW01GivksOubgHPpZCPSNHAsdJorqgh05bzrJDGNywbos1AEopvD10gs
         Frc/jr1yjSpGPCb8jzPSJBk95mqvIN84jWoGMTPSzOg4N3DdfWGVNo5TBMxTsfR14lSr
         w1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VyLDDLuDdqJmiGManC5xlHnemIFzVpCwA6D+aqPNpOw=;
        b=flbXiFPa714wgdZf2/RqtBOg8yj9g35lGx7+Pa9n/VoTRk4D1nXi7LBwbJDOS31yCa
         iZwEy+2p+NKxLQo7qQaRWYrVq5O9PDny2aUDbaHotHnADpNCkKQKW8ijyw3UQqZpuDv7
         UBaig210244rrXLmTnFV1Ik+vO39ttLSFYwjqeESXvtb0ibW+uwgWWXH60MviQx/Cp7M
         5so/qiw28ue/NH1So/79rqUAZzMFRqGiGheKENqr/gZ81n2JTUgOAoScQIXOvlVOil2W
         MPDHphVfKNrXM6JKG3mddnqkjpeGPJP48VTe0FjPhq2PAEka84YLoOme7rcPzHcJOu+C
         aepA==
X-Gm-Message-State: AOAM530SwiB92PsS+jQNL42pnAXFpxnal27FgOeSZehFyIAqa21Mwl/Y
        53ycvYPr25SyqdhzJDJIq9Zlrg==
X-Google-Smtp-Source: ABdhPJzHOV4SgTMQIq93f+E1lwTrJWKjLM4N+7OAIb4AMuHWJqBSAnMxenK4JBTGQhq4JgtcF+IsaQ==
X-Received: by 2002:a37:8b01:: with SMTP id n1mr26580784qkd.370.1595904290530;
        Mon, 27 Jul 2020 19:44:50 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q16sm20538793qkn.115.2020.07.27.19.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 19:44:50 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: sm8250: add interconnect nodes
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kernel-owner@vger.kernel.org
References: <20200713154121.22094-1-jonathan@marek.ca>
 <20200713154121.22094-8-jonathan@marek.ca>
 <630319740d3f06cfb0435cae025e0ca1@codeaurora.org>
 <2b77bdaf-0c9e-c054-77d1-3bc21e857773@marek.ca>
 <4d984ecd68adc249f12eeb18bb7e5792@codeaurora.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <ec865088-bac6-e43f-c7ea-82a2198636eb@marek.ca>
Date:   Mon, 27 Jul 2020 22:43:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4d984ecd68adc249f12eeb18bb7e5792@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/24/20 12:55 PM, Sibi Sankar wrote:
> On 2020-07-24 20:06, Jonathan Marek wrote:
>> On 7/24/20 10:13 AM, Sibi Sankar wrote:
>>> Hey Jonathan,
>>>
>>> Thanks for the patch! Please use the
>>> suggested register space definitions
>>> instead.
>>>
>>
>> Thanks for the suggestions, I was unsure what to use for the sizes.
>> The reg field is unused by the upstream driver so it is hard to figure
>> out.
>>
>> However, I'm not sure about some of your suggestions for the base
>> address. For example, for "mc_virt" you suggest 0x0163d000, and I have
>> 0x09100000. In the downstream dts, "mc_virt-base" is 0x9100000 and
>> qcom,base-offset for fab_mc_virt is 0. Do you have an explanation for
>> why your suggestion is so different?
> 
> AFAIK for providers with virt suffix the
> register space definition is just an
> arbitrary choice and doesn't matter.
> Since mc_virt was just re-using gem_noc
> address space I suggested we stick to
> how it was done on sc7180 i.e place it
> between system_noc and aggre1_noc.
> 

I sent a v3 with most of your suggestions applied as-is, except for:
- sm8150: aggre2_noc, reduced size to 0x20000 to avoid overlap with 
compute_noc region
- sm8250: compute_noc, reduced size to 0xa180 to avoid overlap with 
mmss_noc region (could have been 0xd000, but 0xa180 makes it match the 
region in the downstream dts, so seemed more likely to be correct)

I did notice other inconsistencies, but since this is unused by the 
upstream driver I don't want to think about it too much..

>>
>>> On 2020-07-13 21:11, Jonathan Marek wrote:
>>>> Add the interconnect dts nodes for sm8250.
>>>>
>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 82 ++++++++++++++++++++++++++++
>>>>  1 file changed, 82 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> index 636e2196138c..dfc1b7fa7d85 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> @@ -11,6 +11,7 @@
>>>>  #include <dt-bindings/power/qcom-aoss-qmp.h>
>>>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>>> +#include <dt-bindings/interconnect/qcom,sm8250.h>
>>>
>>> please fix ^^ sort order
>>>
>>>>
>>>>  / {
>>>>      interrupt-parent = <&intc>;
>>>> @@ -978,6 +979,55 @@ spi13: spi@a94000 {
>>>>              };
>>>>          };
>>>>
>>>> +        config_noc: interconnect@1500000 {
>>>> +            compatible = "qcom,sm8250-config-noc";
>>>> +            reg = <0 0x01500000 0 0x1000>;
>>>
>>> 0x01500000 0xa580
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>> +        ipa_virt: interconnect@1620000 {
>>>> +            compatible = "qcom,sm8250-ipa-virt";
>>>> +            reg = <0 0x01620000 0 0x1000>;
>>>
>>> 0x01e00000 0x1000
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>> +        system_noc: interconnect@1632000 {
>>>> +            compatible = "qcom,sm8250-system-noc";
>>>> +            reg = <0 0x01632000 0 0x1000>;
>>>
>>> 0x01620000 0x1C200
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>> +        aggre1_noc: interconnect@16e2000 {
>>>> +            compatible = "qcom,sm8250-aggre1-noc";
>>>> +            reg = <0 0x016e2000 0 0x1000>;
>>>
>>> 0x016e0000 0x1f180
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>> +        aggre2_noc: interconnect@1703000 {
>>>> +            compatible = "qcom,sm8250-aggre2-noc";
>>>> +            reg = <0 0x01703000 0 0x1000>;
>>>
>>> 0x01700000 0x33000
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>> +        compute_noc: interconnect@1733000 {
>>>> +            compatible = "qcom,sm8250-compute-noc";
>>>> +            reg = <0 0x01733000 0 0x1000>;
>>>
>>> 0x01733000 0xd180
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>> +        mmss_noc: interconnect@174a000 {
>>>> +            compatible = "qcom,sm8250-mmss-noc";
>>>> +            reg = <0 0x0174a000 0 0x1000>;
>>>
>>> 0x01740000 0x1f080
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>>          ufs_mem_hc: ufshc@1d84000 {
>>>>              compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
>>>>                       "jedec,ufs-2.0";
>>>> @@ -1364,6 +1414,34 @@ usb_2_ssphy: lane@88eb200 {
>>>>              };
>>>>          };
>>>>
>>>> +        dc_noc: interconnect@90c0000 {
>>>> +            compatible = "qcom,sm8250-dc-noc";
>>>> +            reg = <0 0x090c0000 0 0x1000>;
>>>
>>> 0x090c0000 0x4200
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>> +        mc_virt: interconnect@9100000 {
>>>> +            compatible = "qcom,sm8250-mc-virt";
>>>> +            reg = <0 0x09100000 0 0x1000>;
>>>
>>> 0x0163d000 0x1000
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>> +        gem_noc: interconnect@9121000 {
>>>> +            compatible = "qcom,sm8250-gem-noc";
>>>> +            reg = <0 0x09121000 0 0x1000>;
>>>
>>> 0x09100000 0xb4000
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>> +        npu_noc: interconnect@9990000 {
>>>> +            compatible = "qcom,sm8250-npu-noc";
>>>> +            reg = <0 0x09990000 0 0x1000>;
>>>
>>> 0x09990000 0x1600
>>>
>>>> +            #interconnect-cells = <1>;
>>>> +            qcom,bcm-voters = <&apps_bcm_voter>;
>>>> +        };
>>>> +
>>>>          usb_1: usb@a6f8800 {
>>>>              compatible = "qcom,sm8250-dwc3", "qcom,dwc3";
>>>>              reg = <0 0x0a6f8800 0 0x400>;
>>>> @@ -2359,6 +2437,10 @@ rpmhpd_opp_turbo_l1: opp10 {
>>>>                      };
>>>>                  };
>>>>              };
>>>> +
>>>> +            apps_bcm_voter: bcm_voter {
>>>> +                compatible = "qcom,bcm-voter";
>>>> +            };
>>>>          };
>>>>      };
>>>
> 
