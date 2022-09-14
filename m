Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD565B8809
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 14:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiINMSR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 08:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiINMSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 08:18:15 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CFC80019;
        Wed, 14 Sep 2022 05:18:14 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id e17so21963280edc.5;
        Wed, 14 Sep 2022 05:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date;
        bh=VcePFoHCdCMGoc3XnRyFf7EZFoCyzPHKXPJZ618fQfM=;
        b=DJ/pxzbz4VfHmd75Ffmf2gKmJ99u3686ChHEMlqJsSbUssRfXR6GoQyPHIHoOVuxWI
         uKkVTJHWO5HSnyF6fqJOq9ii2j1RiT9IVpMm1FhBPEy33NUKj/fthjfuxD5VyrSWS3Pp
         bn5OeBWGMct8V1uCFLY8CWRO5/pGLrpiChOTX+IdflUG8Cr1xxPyBO2N7RolAXpMGm75
         e3kT5fYgtVWsnloovTkCOnnr1a5CSGWgEO7nrCYxrkm0/YjFf0f4jtad8RPbb1Wb1Ymx
         0i+yDZvZbVRuoPeibZiFTL5WIPQUSkiWGhhbhx4Gz2XjMZ6g7vm5U4lkuIKKImjEzI1B
         lVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=VcePFoHCdCMGoc3XnRyFf7EZFoCyzPHKXPJZ618fQfM=;
        b=I/jBywU2xyeuGc6xE2tkSwIy1VAvUxRU9EvRFYdsQRCVzzEQHMjU7b21dMX03X+jZM
         yNtseGagQM1E5KPbRcJhv31Jbf5kJ0BQOQzc1a66obfI8Mcc1CB5zpY+sH6i+Syk7hZD
         qNJv4v6f1Qiq230+mOjgeLiOrcThC6BNKPETqpa6lo3zbBrnjdQedRWrhj+nQHC6rx3I
         NDc7XWW9coVIFQwo1ZnIFlBHrIQiEuvq3tjRET57IUHzZR9JeKSYCdtBLx2mySyx2yMQ
         n3Xk8lqF3VyTLKW+ugcSPBhQ4GwEGhEtYwN2UM11L5UjJUQZl73vYPpTz+Nc4iMloWML
         Mv6Q==
X-Gm-Message-State: ACgBeo3QsCxjgZX7tLs3h2skHOxoOja6XX51iup7ORNrOqtJzfuw7YNO
        Ah5SKuzhDJhYY/R7x+bOH44=
X-Google-Smtp-Source: AA6agR7N9dUEuT+bF3EU8bkT6/AnHRqcQO5EV2Md7grxRVGM/CaYeoF/ybsQiFJ3w+oXO+6ltbZS4g==
X-Received: by 2002:a05:6402:550c:b0:443:7d15:d57f with SMTP id fi12-20020a056402550c00b004437d15d57fmr30402904edb.147.1663157892986;
        Wed, 14 Sep 2022 05:18:12 -0700 (PDT)
Received: from [10.32.2.21] ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id gc33-20020a1709072b2100b00731803d4d04sm7402561ejc.82.2022.09.14.05.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:18:12 -0700 (PDT)
Date:   Wed, 14 Sep 2022 15:18:02 +0300
From:   Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 0/6] clk: qcom: cpu-8996: additional cleanup for the
 driver
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Message-Id: <2U87IR.XNEV8J5LGC5H@gmail.com>
In-Reply-To: <20220914031928.i6x6gumzcvdilgh3@builder.lan>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
        <013f2dd7-c15f-5b0e-c98a-595dd4d5a2c5@linaro.org>
        <20220914031928.i6x6gumzcvdilgh3@builder.lan>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, Sep 13 2022 at 22:19:28 -05:00:00, Bjorn Andersson 
<andersson@kernel.org> wrote:
> On Fri, Sep 09, 2022 at 01:22:40PM +0300, Dmitry Baryshkov wrote:
>>  On 14/07/2022 13:03, Dmitry Baryshkov wrote:
>>  > This patch series depends on patches 1-5 from [1].
>>  >
>>  > Path 1 is slightly fixed version of patch 6 from the mentioned
>>  > patch series (fixed to use parent_hws where applicable). The rest 
>> is
>>  > minor cleanup of the driver.
>>  >
>>  > [1] 
>> https://lore.kernel.org/linux-arm-msm/20220621160621.24415-1-y.oudjana@protonmail.com/
>>  >
>> 
>>  Gracious ping. Yassing, Bjorn, Konrad?
>> 
> 
> As I haven't heard anything from Yassine or Konrad I went ahead and
> tried to pick this, unfortunately [1] doesn't apply.

Seems to apply on next-20220914. Do I need to base on a different 
branch?

> 
> Could you please rebase the patches from [1] that you want applied and
> resubmit that?
> 
> Thanks,
> Bjorn
> 
>>  >
>>  > Dmitry Baryshkov (5):
>>  >    clk: qcom: cpu-8996: switch to devm_clk_notifier_register
>>  >    clk: qcom: cpu-8996: declare ACD clocks
>>  >    clk: qcom: cpu-8996: move ACD logic to
>>  >      clk_cpu_8996_pmux_determine_rate
>>  >    clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
>>  >    clk: qcom: cpu-8996: use constant mask for pmux
>>  >
>>  > Yassine Oudjana (1):
>>  >    clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks
>>  >
>>  >   drivers/clk/qcom/clk-cpu-8996.c | 191 
>> +++++++++++++++++---------------
>>  >   1 file changed, 100 insertions(+), 91 deletions(-)
>>  >
>>  >
>>  > base-commit: ca48adcc40b09d7f26a7754d4d54cfc4bd611f38
>>  > prerequisite-patch-id: ff67ff7bea1aef8e367a2589c46cf2c9ebb48664
>>  > prerequisite-patch-id: 1fdf02d8161689f3e571816d73ec94b115f51c34
>>  > prerequisite-patch-id: 837945fbb40427dac2e95a58b7660a3cf26d7d53
>>  > prerequisite-patch-id: df10945929f6f558c1363a23e2993d748a40236f
>>  > prerequisite-patch-id: a657a27256ef4be0cb932cb0ca7b3e4768e466f9
>> 
>>  --
>>  With best wishes
>>  Dmitry
>> 


