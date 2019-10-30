Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79991E9D5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 15:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfJ3OXj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 10:23:39 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40573 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfJ3OXj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 10:23:39 -0400
Received: by mail-qk1-f196.google.com with SMTP id y81so2890273qkb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2019 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Iieil+MuDaNJ5lIJEOFs9h7jIoiG48MeHaP0+PASXlo=;
        b=bf2xTGjUYAa3MySkebfnobaQ/S7IFbvS3B8bSmpGJw21kTSBXvaEKLTGw+yavb0Dgz
         Dw/dnD8CYZHxAuOvQrPSFUCZ/ggeRfDkgx444Sojdaa90kTduIlrOB9d69bpjAFWkAgO
         iFKxRGN/WlM09anCsNQxhTKqBBTNObXzGqksZXZh1y5Xyh6UO+8EEv//zy84HhvzsJuH
         iFKxK5PG0h0u0HO4h2JNTDGyeCbdkQ8QXHSdoDGDWM/zmThHe8lsMzrqI0qeHYlwKq7s
         FFlVfJs/amMOXNIROl2Hq0GlFPvtATS00Dv6LBb+lrMpb0tttEUpSE03ufeyFMA9BRDT
         7r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Iieil+MuDaNJ5lIJEOFs9h7jIoiG48MeHaP0+PASXlo=;
        b=TECoOP0lhoRwZE3X16YLoesQIgVOcO6YS5DILIsLFa6BVrE31toVunTtervRvW+0A9
         bK2f6sCqR5B2KB1Dvi9RU9M6rBXMftPzitHwPuMlL9zDXprwgFj01now2+vutjB/dVG2
         Y5MScY47n4tNQHbqz/XXl6XJ6pTq+63G5wg+69bSy7mOYyTF/XsM0LAtOrPn3ePxEoNS
         WskeVU0RSLwBZX9x/HU5RCB6T4PPlQG2v/lt1bhbGyGNnSPj2YiMN3TjuqVk+EAxFYiP
         oqL0JZ1gVdDUe4EL/5jeY79RPQGJr+suUj7ZVbj5AXI/s84gKa7AnjYzZtAnMz/ntp2w
         v+Zw==
X-Gm-Message-State: APjAAAXGT4Z0b5m7W0AVVpW5/B7cEC2zi42OZ0DkShHrRStp5HDZt2XN
        QRFQ33k0cIGZv0e81OvY8c4YJg==
X-Google-Smtp-Source: APXvYqzmbqgk6/kz7QU3nlWaRgKvHPWEG3ZIdKB73xjHpjGorCH8t3zSH+3B/Dh6UH8mTXW9UuCW5g==
X-Received: by 2002:ae9:e713:: with SMTP id m19mr127213qka.338.1572445418273;
        Wed, 30 Oct 2019 07:23:38 -0700 (PDT)
Received: from [192.168.1.169] (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.gmail.com with ESMTPSA id q4sm219231qtj.41.2019.10.30.07.23.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 07:23:37 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: Add mx power domain as thermal
 warming device.
To:     Rob Herring <robh@kernel.org>
References: <1571254641-13626-1-git-send-email-thara.gopinath@linaro.org>
 <1571254641-13626-8-git-send-email-thara.gopinath@linaro.org>
 <20191029013111.GA27045@bogus>
Cc:     edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, amit.kucheria@verdurent.com,
        mark.rutland@arm.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <5DB99CE8.1050506@linaro.org>
Date:   Wed, 30 Oct 2019 10:23:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20191029013111.GA27045@bogus>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/28/2019 09:31 PM, Rob Herring wrote:
> On Wed, Oct 16, 2019 at 03:37:21PM -0400, Thara Gopinath wrote:
>> RPMh hosts mx power domain that can be used to warm up the SoC.
>> Add sub-node to rpmhpd node for mx to be recognized
>> as thermal warming device on sdm845.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 0222f48..0671c8a 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -3788,6 +3788,11 @@
>>  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>>  					};
>>  				};
>> +
>> +				mx_cdev: mx {
>> +					#cooling-cells = <2>;
>> +					.name = "mx";
> 
> Copy this from C code?
Hi Rob,

What do you mean ?

> 
>> +				};
>>  			};
>>  
>>  			rsc_hlos: interconnect {
>> -- 
>> 2.1.4
>>


-- 
Warm Regards
Thara
