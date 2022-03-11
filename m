Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C8C4D591B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Mar 2022 04:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346061AbiCKDcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Mar 2022 22:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346168AbiCKDca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Mar 2022 22:32:30 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA4C1AAA6F
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 19:31:07 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id e3so6903648pjm.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 19:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PjEzHXhBQw4nuatCRH1QTW/Mg4fDvrKguLcxURaCjB0=;
        b=NsXj1fBbaZ+OGfMXqGmARi8JawvRSOc/kXdAbRi8A2vjdxtPYquBVky+s3t1JYgc69
         BjJqw6euLBCyQfXXeppjLrpV2neKMna6Y/cs+c9E4EaGpNbpAdrYJqgXHIx6bRSRvj6/
         u1Us6HHV/0gaJvAR3iMoKlI/ViHg8pQE8PF0ilezZJ7iloRVJ09yBRX8cZ5isxhhEpdG
         kkTbkio2cpT/8f7Rx/EplTZ4qkdTMCK3FbS0hkVIITxVR6DMlejNx4GaxsImKFyo+akg
         3VrR9KtoRkcm+MjWBGDZvKTVwxZ19NEb2IEw6peH3I+nSZN3mN8WLq3VMeWT38N8joiA
         881A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PjEzHXhBQw4nuatCRH1QTW/Mg4fDvrKguLcxURaCjB0=;
        b=670HnAhQQGW6ezCX1985W0D/wijHXmZhnJlLHr+RNVEaNuje4glulgfpF4rvzQHqEd
         HO9ftZd2uho6uJ+/WMtyZnSldHk6Cg6XIj0l846ZqI+LymiOxpk3qL9WLIr96+JPBzdb
         3jTwL62kFuGFlCWBCitWzoFWy1gyVas6rBkIn73HAh/jy5PhWkA9KtLlUWjdLoZbyKkA
         GikxIVumFEep29jvHICRfPwm19roBL7bkztf5icXwPc6Cu5zl20CRdTdJF2bG1nQJUS/
         b/8o/ABgPI/8ZUB399ntoqDpcl1hN2cvpKZ9myiJD9WuV7gODwmWBT8gjDzlQ1Vft89/
         wn0A==
X-Gm-Message-State: AOAM533RkO63aeaY8oHm+CpB3+PBxtQwShFZG5tSiVjlRXYhx4Ua62Yx
        /7ZEJAmPXQB3mLKP6CW1R77Dvw==
X-Google-Smtp-Source: ABdhPJyIGPNOxQUuhY18oStH37LoB+iKWWQ+PAEg3o1jJBEmifnj84y5wRWsOvFdb/QlXely9NH2wg==
X-Received: by 2002:a17:902:ea09:b0:151:f547:90a with SMTP id s9-20020a170902ea0900b00151f547090amr8384778plg.63.1646969463989;
        Thu, 10 Mar 2022 19:31:03 -0800 (PST)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090a178c00b001bd036e11fdsm11104982pja.42.2022.03.10.19.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 19:31:03 -0800 (PST)
Date:   Fri, 11 Mar 2022 09:01:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        bjorn.andersson@linaro.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org
Subject: Re: [PATCH v2 0/2] Convert Qcom CPUFREQ HW binding to YAML
Message-ID: <20220311033101.p5n3a5ik5i4nzrc6@vireshk-i7>
References: <20220309151541.139511-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309151541.139511-1-manivannan.sadhasivam@linaro.org>
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

On 09-03-22, 20:45, Manivannan Sadhasivam wrote:
> Hi,
> 
> Patch 2/2 was submitted separately [1] but Rob's bot reported errors related to
> the performance domain binding that used Qcom CPUFREQ as an example. But Qcom
> CPUFREQ driver doesn't support the generic performance domains yet.
> 
> So I've added a patch 1/2 that fixes the warning by using MediaTek CPUFREQ as
> the example and added both patches to this series.
> 
> Thanks,
> Mani
> 
> [1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20211005044920.78544-1-manivannan.sadhasivam@linaro.org/
> 
> Changes in v2:
> 
> * Moved dvfs binding patch to 1/2 for avoiding DT Bot error.
> * Added Krzysztof to "To" list.

Applied. Thanks.

-- 
viresh
