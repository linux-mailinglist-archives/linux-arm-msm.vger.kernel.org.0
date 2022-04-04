Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEE04F0F68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Apr 2022 08:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377468AbiDDGeC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Apr 2022 02:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351199AbiDDGeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Apr 2022 02:34:02 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37AD31518
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 23:32:06 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id w7so8025406pfu.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 23:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=trCjLQ34/8K4vS3Gt3GYWJs9bJFpowByYX2NTsK/Ir4=;
        b=M4uqlSVrofPluiMngt4qfcktYblCdgZ5P4PjAbSZU9m1N5IqPKpqTP/6Q8HwBFiyne
         fE6GAjXGFbAz6fjpeiHyCyt31E5wtCFmvrIp3dS0lKNtCvql5slW95UZmswc6UuV0z8X
         5SRh9OFb5aWTK9W54Z/zI6nVloyO5syqkDym0w6BDMvkMtQ3c/YVYACKNBoowSDxlsa8
         2AzbSphJW+uC8gR3RQW05roBGyP2oS7BTN9jSbd6mielWAgrL3zbm5jCOK2JRsk/SJs3
         ww8fWQ7qkYcI++QnAJwLvMfeUDlP12mCiTcjvvnAFKtrvmhin1U9yyMR8+FAOAoQBoo5
         xG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=trCjLQ34/8K4vS3Gt3GYWJs9bJFpowByYX2NTsK/Ir4=;
        b=im+L6OjKM7/aOI64/pHIJVbTEU6P/fgu5mYNv+ehA/8GQlsTGggYC7X1ECINnpGyDf
         fbHfp7SCFP8eaGhkYjChHRC8SHSejq5eOizBaHhzswF7cJOaKGJMYRmQ0KbG/h9pW1Pm
         oDbOWOOidMJeK4JIGMvqkrMSnpIUdSM5J5r4bAidZdayIqn/Tz5G2go48Eq9EaeF+cjX
         rZp3HYHlZRkWgM07upmPMzU4epjfeVPgPkVxDnsjom1Juxsn7YKAcY8dhLk8aNwkUKZ/
         m0UfPef2dexcJz3JYuIV2gziu4JA0E23D/m+GAufAY3w48F9zp6VguK0DJz/SfFCiO/o
         R37g==
X-Gm-Message-State: AOAM530yjmpYwGain7om2BaYyA8kCQbbS/SQIylbXEUZkgWYFs8bPLhP
        xLz9BbfvB23IYRyPK5/bvnSB/g==
X-Google-Smtp-Source: ABdhPJxLwONeIQOcIW/pFFL1GoOhjWw+M56cxi0uGtg5P0gM0sw3YjOtfWa9vGHtX9WN5h4DS6rYtQ==
X-Received: by 2002:a63:6f85:0:b0:398:3e74:bdd8 with SMTP id k127-20020a636f85000000b003983e74bdd8mr24733958pgc.423.1649053926318;
        Sun, 03 Apr 2022 23:32:06 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id v63-20020a638942000000b00398dde2120bsm8934451pgd.5.2022.04.03.23.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 23:32:05 -0700 (PDT)
Date:   Mon, 4 Apr 2022 12:02:04 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: qcom-cpufreq-hw: Fix throttle frequency
 value on EPSS platforms
Message-ID: <20220404063204.43zfnky5khr7h5qs@vireshk-i7>
References: <20220401071424.2869057-1-vladimir.zapolskiy@linaro.org>
 <20220401071424.2869057-3-vladimir.zapolskiy@linaro.org>
 <Ykd8FUgLhGb0x7VI@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ykd8FUgLhGb0x7VI@ripper>
User-Agent: NeoMutt/20180716-391-311a52
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-04-22, 15:26, Bjorn Andersson wrote:
> On Fri 01 Apr 00:14 PDT 2022, Vladimir Zapolskiy wrote:
> 
> > On QCOM platforms with EPSS flavour of cpufreq IP a throttled frequency is
> > obtained from another register REG_DOMAIN_STATE, thus the helper function
> > qcom_lmh_get_throttle_freq() should be modified accordingly, as for now
> > it returns gibberish since .reg_current_vote is unset for EPSS hardware.
> > 
> > To exclude a hardcoded magic number 19200 it is replaced by "xo" clock rate
> > in KHz.
> > 
> > Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> This could have been picked up by the maintainer already in the previous
> version, if it wasn't the second patch in the series. Please send it
> separately, or as the first patch of the two, so we can ask Viresh to
> pick it up (just in case we don't reach an agreement of your next
> version of the other patch).

I have applied 2/2 now. I hope it doesn't break anything.

-- 
viresh
