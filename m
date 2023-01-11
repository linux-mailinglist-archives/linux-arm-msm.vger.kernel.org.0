Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5020E665206
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 03:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbjAKCxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 21:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjAKCxD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 21:53:03 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3311401B
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 18:53:01 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id v25so21406511lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 18:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78voLsvfwC4Qpq9zTVCI/KFwGexbbEtGfFGSMWbcdsM=;
        b=eJmDchKbZGEJb6mNmYSicdLrpb09/OwVSaRJEkNzXYIIrsZubJMscTDp1SeFPWERl0
         qJKSBmzjdj21SFvoqo4fQfIqHGHZ2WS7RLmvmVLyBMDrMJQYJp1fl6ysM52nJzPHeJiu
         g1fnMTbDwaohwH76dpnlR3bjQvmUmwHUCXFTQEu15GsHAPpAZRgtOIyOQtgY1UYox4wz
         Ok8c09R+by1/e6ZScCE6mf9XxUzLIGw6+G1GMjNlb+Ce3ip8nZS69+LKlHyLtfWzFmue
         4q3zLiFc88dYyjRkC+VgXIUXExxC7UsNXXC9Ys0hexhLASY7+FfdGVntU/M5oPfngbRK
         E46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78voLsvfwC4Qpq9zTVCI/KFwGexbbEtGfFGSMWbcdsM=;
        b=oD2XJnC0/Bhm7HX9eVp9sLCfHsixyd8QjYttILhEz6zx4xuo9S3tYkToEP1dl1tUiR
         9xKckiWwzu3VQixCpvh6FIqdiTQ1QnOp9+867ElZ7GnX0JLClte0kgq/oNU4efW+cEUn
         b5sDxaZQQEVOcg4KLhsnbhC687Sjkm823gWerrGnIAcKTjoVHbv9sxCYHOGXEYvkBWjw
         O8AH1h5KbPfTbhC6kAytbwvr3uJR0I+s3cl3J5yV21bIDs1DCn8cXqikWHNlr2B5yTyc
         ZA2aXiQmIidEV8yM9kGdBhhkaDQk+gsICLiW56HjH0GguVPlmGFoimeGVHA/Laifp3JJ
         /I3A==
X-Gm-Message-State: AFqh2kpIPgIuyG3cwbunDvuUF00jX/jZGX1JlOn/IlmeLcgbyy5pNqEA
        6LW93QKHvzZAVX64eP2R53ctbvMFgdRsd6Sw
X-Google-Smtp-Source: AMrXdXvfbzDynRezDs9YM5t61MgZbxtf+NFuzf0BYZwhetOhg1FmY92zJJ7P9tQ7DRtfHMIROAx9nQ==
X-Received: by 2002:a19:6b15:0:b0:4cc:7adb:1c20 with SMTP id d21-20020a196b15000000b004cc7adb1c20mr3278501lfa.48.1673405580197;
        Tue, 10 Jan 2023 18:53:00 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l9-20020ac24a89000000b004cc99cd94basm21208lfp.113.2023.01.10.18.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 18:52:59 -0800 (PST)
Message-ID: <14849fc1-4f80-95a8-1764-a689da84e18a@linaro.org>
Date:   Wed, 11 Jan 2023 04:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 0/5] Add support for Core Power Reduction v3, v4 and
 Hardened
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        angelogioacchino.delregno@collabora.com
References: <20230110175605.1240188-1-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230110175605.1240188-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/01/2023 19:56, Konrad Dybcio wrote:
> Changes in v8:
> - Overtake this series from AGdR
> - Apply all review comments from v7 except Vladimir's request to
>    not create the include/ header; it will be strictly necessary for
>    OSM-aware cpufreq_hw programming, which this series was more or
>    less created just for..
> - Drop QCS404 dtsi change, account for not breaking backwards compat
>    in [3/5]
> - Add type phandle type reference to acc-syscon in [1/5]
> - Update AGdR's email addresses for maintainer entries
> - Add [2/5] to make dt_binding_check happy
> - Separate the CPRh DT addition from cpufreq_hw addition, sort and
>    properly indent new nodes
> - Drop CPR yaml conversion, that happened in meantime
> - Reorder the patches to make a bit more sense
> - Tested again on MSM8998 Xperia XZ Premium (Maple)
> - I take no responsibility for AGdR's cheeky jokes, only the code!
> 
> Link to v7:
> https://lore.kernel.org/lkml/20210901155735.629282-1-angelogioacchino.delregno@somainline.org/
> 
> Changes in v7:
> - Rebased on linux-next as of 210901
> - Changed cpr_read_efuse calls to nvmem_cell_read_variable_le_u32,
>    following what was done in commit c77634b9d916
> 
> Changes in v6:
> - Fixes from Bjorn's review
> - After a conversation with Viresh, it turned out I was abusing the
>    OPP API to pass the APM and MEM-ACC thresholds to qcom-cpufreq-hw,
>    so now the driver is using the genpd created virtual device and
>    passing drvdata instead to stop the abuse
> - Since the CPR commonization was ignored for more than 6 months,
>    it is now included in the CPRv3/4/h series, as there is no point
>    in commonizing without having this driver
> - Rebased on v5.13
> 
> Changes in v5:
> - Fixed getting OPP table when not yet installed by the caller
>    of power domain attachment
> 
> Changes in v4:
> - Huge patch series has been split for better reviewability,
>    as suggested by Bjorn
> 
> Changes in v3:
> - Fixed YAML doc issues
> - Removed unused variables and redundant if branch
> 
> Changes in v2:
> - Implemented dynamic Memory Accelerator corners support, needed
>    by MSM8998
> - Added MSM8998 Silver/Gold parameters
> 
> This commit introduces a new driver, based on the one for cpr v1,
> to enable support for the newer Qualcomm Core Power Reduction
> hardware, known downstream as CPR3, CPR4 and CPRh, and support
> for MSM8998 and SDM630 CPU power reduction.
> 
> In these new versions of the hardware, support for various new
> features was introduced, including voltage reduction for the GPU,
> security hardening and a new way of controlling CPU DVFS,
> consisting in internal communication between microcontrollers,
> specifically the CPR-Hardened and the Operating State Manager.
> 
> The CPR v3, v4 and CPRh are present in a broad range of SoCs,
> from the mid-range to the high end ones including, but not limited
> to, MSM8953/8996/8998, SDM630/636/660/845.
> 
> As to clarify, SDM845 does the CPR/SAW/OSM setup in TZ firmware, but
> this is limited to the CPU context; despite GPU CPR support being not
> implemented in this series, it is planned for the future, and some
> SDM845 need the CPR (in the context of GPU CPR) to be configured from
> this driver.
> 
> It is also planned to add the CPR data for MSM8996, since this driver
> does support the CPRv4 found on that SoC, but I currently have no time
> to properly test that on a real device, so I prefer getting this big
> implementation merged before adding more things on top.

MSM8996 is CPRv3, both CPU and GFX.

After hacking up 8996 I found it quite hard to retrofit it into this 
driver. Especially if we look at the GFX CPR (it uses multiple ROs, 
which this driver is not very well prepared for). I have the feeling 
that this patchset/driver should concentrate on getting CPRh done. We 
can consolidate CPR3/CPR3-GFX/CPR4/CPRh after getting (some of) them 
done. In the least case I'd suggest using the per-generation functions 
that call each other rather than having generation-conditional code in a 
single big function.

Some design questions: how do you handle the mem-acc programming? My 
understanding is that for CPR3 it should be set on a thread-by-thread 
basis rather than having a single global setting. Does CPRh need 
additional handling of APM or is it handled by the hardware?

For the reference, on msm8996, CPR3 has two threads (one for power and 
one for performance clusters). And then the power thread should scale 
accordingly to both power cluster and the CBF (an interconnect between 
clusters).

And CPR3-GFX is a lightweight (or reduced) version of CPR3 (and of 
course just a single thread/single vreg).


> 
> As for MSM8953, we (read: nobody from SoMainline) have no device with
> this chip: since we are unable to test the cpr data and the entire
> driver on that one, we currently have no plans to do this addition
> in the future. This is left to other nice developers: I'm sure that
> somebody will come up with that, sooner or later ;)
> 
> Tested on the following smartphones:
> - Sony Xperia XA2        (SDM630)
> - Sony Xperia XA2 Ultra  (SDM630)
> - Sony Xperia 10         (SDM630)
> - Sony Xperia XZ Premium (MSM8998)
> - F(x)Tec Pro 1          (MSM8998)

-- 
With best wishes
Dmitry

