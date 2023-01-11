Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B22A665C7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 14:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234212AbjAKN2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 08:28:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234269AbjAKN1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 08:27:42 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF2F1CB05
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 05:24:47 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y25so23478704lfa.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 05:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjEzAJnxvZjkQBtT5BaPgN39p3WvcRVPXdEbD72ImL0=;
        b=HysprtlVoruv/9jlA9vJ6DJJqifky2BB71g88qI7nExlvc4skJwHmZYHmB4ZfCCNZv
         yIbqLGLz9h/0IAHKbCCfRfvdj5f5Vasl/VzgkDAYYYnTcwU3arbLBPXPIj4XfM++AEkv
         8gW0L8WRt5czQKJ8RCQ9BFFT6yVfFrBMd3zrIGUUayHHwxoBgcjtRKaFFKm+jtuGUCfd
         xShffTH4hJwB8qInm6dKK3ZHgGvojWqGsM8FdlxKWhfYIaivZZxk0noaZhIbjYNSNJ7z
         7vKn14PhZc0rgsnrJmz04aqL3njcpPgYWLp+lnTMCOQxav3Lh0TcPVbvcOS8kwPMd50l
         EMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjEzAJnxvZjkQBtT5BaPgN39p3WvcRVPXdEbD72ImL0=;
        b=iR1nqqgvmDWnX6GWLTsSmeJCUGDooVAKRsZca660uE/AHrPm3AZtXetp+cQBYvxt/J
         jH62BEqSyWYNevCf4sBCkicqG7CB4ALLOAWzBFp3Sh4xOA/FX8GncjIM8FPkAXqjPcDY
         R5g8e+6pXQn7nxWqIhkth4dmYVIUkRKlTi+9QvEEOlqm4efFPNyCh5ycKkLp57PbeG6C
         Q2w+8AuIUQKuLHHrDvDlg53xjLhZQ3NAXlezCnmeI24JdlFVm/fEqWFDViX52enZcBml
         zad/kRSRyILymFgsGgwieDvT/1QCMm77si3+j5IKZKkzpbG1X3e/lHEu/tAu3MDtnTkD
         EJag==
X-Gm-Message-State: AFqh2krCWu15PpDbWsmzVmy8X7CFF2wa1CYeitZewwREQpE01bGBrh4y
        Tat0RtFxjwlFiE6BmSd/FsKobxTw+2KoE+gv
X-Google-Smtp-Source: AMrXdXstBDlCKVrgkqswhtU/UmxRBq6yNCTL28lrDtsrUbzKil8jo0dQVozr9YalSikbVYFk2iQb4A==
X-Received: by 2002:a05:6512:22c8:b0:4cb:88c:c795 with SMTP id g8-20020a05651222c800b004cb088cc795mr20277153lfu.23.1673443485390;
        Wed, 11 Jan 2023 05:24:45 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id o11-20020ac2434b000000b004cc9ddce3adsm36290lfl.82.2023.01.11.05.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 05:24:44 -0800 (PST)
Message-ID: <0e246e11-bc2b-9784-5182-82a9b3333d2c@linaro.org>
Date:   Wed, 11 Jan 2023 14:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8 0/5] Add support for Core Power Reduction v3, v4 and
 Hardened
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        angelogioacchino.delregno@collabora.com
References: <20230110175605.1240188-1-konrad.dybcio@linaro.org>
 <14849fc1-4f80-95a8-1764-a689da84e18a@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <14849fc1-4f80-95a8-1764-a689da84e18a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.01.2023 03:52, Dmitry Baryshkov wrote:
> On 10/01/2023 19:56, Konrad Dybcio wrote:
>> Changes in v8:
>> - Overtake this series from AGdR
>> - Apply all review comments from v7 except Vladimir's request to
>>    not create the include/ header; it will be strictly necessary for
>>    OSM-aware cpufreq_hw programming, which this series was more or
>>    less created just for..
>> - Drop QCS404 dtsi change, account for not breaking backwards compat
>>    in [3/5]
>> - Add type phandle type reference to acc-syscon in [1/5]
>> - Update AGdR's email addresses for maintainer entries
>> - Add [2/5] to make dt_binding_check happy
>> - Separate the CPRh DT addition from cpufreq_hw addition, sort and
>>    properly indent new nodes
>> - Drop CPR yaml conversion, that happened in meantime
>> - Reorder the patches to make a bit more sense
>> - Tested again on MSM8998 Xperia XZ Premium (Maple)
>> - I take no responsibility for AGdR's cheeky jokes, only the code!
>>
>> Link to v7:
>> https://lore.kernel.org/lkml/20210901155735.629282-1-angelogioacchino.delregno@somainline.org/
>>
>> Changes in v7:
>> - Rebased on linux-next as of 210901
>> - Changed cpr_read_efuse calls to nvmem_cell_read_variable_le_u32,
>>    following what was done in commit c77634b9d916
>>
>> Changes in v6:
>> - Fixes from Bjorn's review
>> - After a conversation with Viresh, it turned out I was abusing the
>>    OPP API to pass the APM and MEM-ACC thresholds to qcom-cpufreq-hw,
>>    so now the driver is using the genpd created virtual device and
>>    passing drvdata instead to stop the abuse
>> - Since the CPR commonization was ignored for more than 6 months,
>>    it is now included in the CPRv3/4/h series, as there is no point
>>    in commonizing without having this driver
>> - Rebased on v5.13
>>
>> Changes in v5:
>> - Fixed getting OPP table when not yet installed by the caller
>>    of power domain attachment
>>
>> Changes in v4:
>> - Huge patch series has been split for better reviewability,
>>    as suggested by Bjorn
>>
>> Changes in v3:
>> - Fixed YAML doc issues
>> - Removed unused variables and redundant if branch
>>
>> Changes in v2:
>> - Implemented dynamic Memory Accelerator corners support, needed
>>    by MSM8998
>> - Added MSM8998 Silver/Gold parameters
>>
>> This commit introduces a new driver, based on the one for cpr v1,
>> to enable support for the newer Qualcomm Core Power Reduction
>> hardware, known downstream as CPR3, CPR4 and CPRh, and support
>> for MSM8998 and SDM630 CPU power reduction.
>>
>> In these new versions of the hardware, support for various new
>> features was introduced, including voltage reduction for the GPU,
>> security hardening and a new way of controlling CPU DVFS,
>> consisting in internal communication between microcontrollers,
>> specifically the CPR-Hardened and the Operating State Manager.
>>
>> The CPR v3, v4 and CPRh are present in a broad range of SoCs,
>> from the mid-range to the high end ones including, but not limited
>> to, MSM8953/8996/8998, SDM630/636/660/845.
>>
>> As to clarify, SDM845 does the CPR/SAW/OSM setup in TZ firmware, but
>> this is limited to the CPU context; despite GPU CPR support being not
>> implemented in this series, it is planned for the future, and some
>> SDM845 need the CPR (in the context of GPU CPR) to be configured from
>> this driver.
>>
>> It is also planned to add the CPR data for MSM8996, since this driver
>> does support the CPRv4 found on that SoC, but I currently have no time
>> to properly test that on a real device, so I prefer getting this big
>> implementation merged before adding more things on top.
> 
> MSM8996 is CPRv3, both CPU and GFX.
> 
> After hacking up 8996 I found it quite hard to retrofit it into this driver. Especially if we look at the GFX CPR (it uses multiple ROs, which this driver is not very well prepared for).
CPR(>3) has 16 ROs and that's taken care of with regards to programming
the Qualcomm-given values in cpr3_corner_init().

I have the feeling that this patchset/driver should concentrate on getting CPRh done. We can consolidate CPR3/CPR3-GFX/CPR4/CPRh after getting (some of) them done. In the least case I'd suggest using the per-generation functions that call each other rather than having generation-conditional code in a single big function.
In my opinion, they are not *that* different and the main changes from
3/4 to h are that some code paths are just skipped, as they're
partially handled in the secure world. The complexity of this hardware
pretty much requires gigantic functions, unless we want to split them
"by paragraph", which may not be much beneficial to readability if we
separate out functions that are only called once etc.

> 
> Some design questions: how do you handle the mem-acc programming?
There's a code path for setting memacc, involving cpr_set_acc() that
is not taken on either 630 or 8998 that are the initially-supported
SoCs, as they implement CPRh which mostly forbids memacc access.

My understanding is that for CPR3 it should be set on a thread-by-thread basis rather than having a single global setting.
cpr_set_acc() callers, cpr_{pre,post}_voltage() have the thread ID
passed to them, so if I understand correctly, this would just be
a matter of turning acc_desc->settings into an array of reg_sequence
arrays, instead of it being a 1d array like it is now?

Does CPRh need additional handling of APM or is it handled by the hardware?
Firmware*, AFAIU.

> 
> For the reference, on msm8996, CPR3 has two threads (one for power and one for performance clusters).
(Just like msm8998+CPRh)

And then the power thread should scale accordingly to both power cluster and the CBF (an interconnect between clusters).
If by "scale" you mean "work with scaling values provided", it's
already taken care of, check msm8998_{gold,silver}_scaling_factor.
> 
> And CPR3-GFX is a lightweight (or reduced) version of CPR3 (and of course just a single thread/single vreg).
For once something with less complexity ;)

Konrad

> 
> 
>>
>> As for MSM8953, we (read: nobody from SoMainline) have no device with
>> this chip: since we are unable to test the cpr data and the entire
>> driver on that one, we currently have no plans to do this addition
>> in the future. This is left to other nice developers: I'm sure that
>> somebody will come up with that, sooner or later ;)
>>
>> Tested on the following smartphones:
>> - Sony Xperia XA2        (SDM630)
>> - Sony Xperia XA2 Ultra  (SDM630)
>> - Sony Xperia 10         (SDM630)
>> - Sony Xperia XZ Premium (MSM8998)
>> - F(x)Tec Pro 1          (MSM8998)
> 
