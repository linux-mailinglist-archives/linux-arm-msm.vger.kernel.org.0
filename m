Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7651056D249
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 02:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiGKAsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 20:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiGKAsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 20:48:43 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD4260FD
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 17:48:42 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id y14-20020a17090a644e00b001ef775f7118so6846025pjm.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 17:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YD6Q06B/SQAWNtwCMdABWQHoqLls9qjoeRujGGhLFGg=;
        b=mpw5JrMx6CxTMug6v/6Ew71C+1TNw5Bz9zPZkIBFk+OzvkrY2HU9FHX1posEVnN42w
         Oq5OuTK1eAJuuSySqoBDjxfrYNqzqy9zF0DKezy/LIrvK7vPuE5aZyeeSoH8tQ4cpe51
         rTx/iN9ZUg2yT9SQlZdCCpKe0VRglILbzPILo/gWMLjrQfcj00LxZTwPgeoHPcgVPKLN
         WlK8yFgdmlLd7U4fOTWcR4sKdgpwZCI4MSTHbw/vqJmqjPMy70wlTZsJz6Db12Aow/A1
         VG3mhzBQC8+4GdlQmGCwfkqe69f4NzSIFaj+kdW3iPlxqpSFIXnUZHTZ/UXVCrjQjM/t
         +23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YD6Q06B/SQAWNtwCMdABWQHoqLls9qjoeRujGGhLFGg=;
        b=Nw+f3ldIlhdTDUOCExwOydZP7f0Is+egycFNutBH44rLVU1BmSzgWa4RdVaCBgIfw3
         iYQ1cePGSAaHo2+jBobjZ3ws2cQiL6jTyH2Ek4G5J6ik1HaAprzKDzZQ+ipatlpYQGPi
         DmNekwvZz+vROYrrsNphkYWho95+3vc9dnay9hKHVULAGxV5sBJOPDcvbezXyyQ5J/yd
         wUeO6+XrZRCPRwrZxHw+uhi0NHG55OBTJ1kmw9hvUD4gc83RDzVS4tuTJMwBAClbMD8k
         cZ8vBJTbVYq9MjiBlIJu5WXlM+Nc3XlNwsDFpHz96DozKVpATBMz04iO+j7gan0+q9ye
         BZUw==
X-Gm-Message-State: AJIora9YtN619NNiQ8dpW3vxkKM9hMLG8Lpq5Qy32l5E68lP0yu6RqIg
        WyWdVRQBVUsj8XlHExERD88KVQ==
X-Google-Smtp-Source: AGRyM1v2crBlrnv/9ATiX4diY/lzqqj1Nu/uk7HmkUkg5S2ayhqMwUbLbUUFDjDAyX1nPtBhgC3gFg==
X-Received: by 2002:a17:903:1105:b0:16c:32e4:6453 with SMTP id n5-20020a170903110500b0016c32e46453mr9695740plh.131.1657500521922;
        Sun, 10 Jul 2022 17:48:41 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id j14-20020a170903024e00b0016bf10203d9sm3308502plh.144.2022.07.10.17.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 17:48:41 -0700 (PDT)
Date:   Mon, 11 Jul 2022 06:18:32 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     ilia.lin@kernel.org, agross@kernel.org, rafael@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        stephan@gerhold.net, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] msm8939 cpufreq preparatory work
Message-ID: <20220711004832.scmddlnl5nq4npxi@vireshk-i7>
References: <20220708121156.2165250-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708121156.2165250-1-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-07-22, 13:11, Bryan O'Donoghue wrote:
> V3:
> - Drop the exclusion of msm8939 from cpufreq-dt-platdev.
>   I'm happy enough to bundle this in with CPR. - Stephan
> 
> V2:
> - Previous series title "qcom-cpufreq-nvmem: Add msm8939 with some fixups"
>   https://www.spinics.net/lists/linux-arm-msm/msg116201.html
> 
> - Drops adding msm8939 to the cpufreq-nvmem layer at all.
>   cpufreq and CPR go hand in hand so we need to do the addition to
>   cpufreq-nvmem in tandem with the associated CPR driver update. - Stephan
> 
>   We can still add in msm8939 to the cpufreq-dt-platdev block list and
>   fixup the dt binding check errors found doing that.
> 
> - Adds a patch to the error reported by Rob's bot.
>   Rob said he thought Krzysztof had a patch for that but, I couldn't find it
>   so I just added a fix as the first patch - bod
> 
> - Adds Acked-by Rob to second patch
> - Adds Acked-by Krzysztof to third patch
> 
> V1:
> Fix up some missing compat strings for the qcom-cpufreq-nvmem yaml.
> Add in msm8939 as a compatible qcom-cpufreq-nvmem.
> 
> 
> Bryan O'Donoghue (3):
>   dt-bindings: opp: opp-v2-kryo-cpu: Fix example binding checks
>   dt-bindings: opp: Add missing compat devices
>   dt-bindings: opp: Add msm8939 to the compatible list
> 
>  .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml      |  7 +++++++
>  .../devicetree/bindings/opp/opp-v2-kryo-cpu.yaml  | 15 +++++++++++++++
>  2 files changed, 22 insertions(+)

Applied. Thanks.

-- 
viresh
