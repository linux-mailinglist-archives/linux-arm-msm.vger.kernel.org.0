Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2BC260296F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 12:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiJRKhW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 06:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiJRKhW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 06:37:22 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720C48F95F
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 03:37:20 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id l4so13408397plb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RWwcbHxc4gNZkpX9lULBb97jbG0T6/PKCXFFwxy3BRo=;
        b=Q/VWQoheR0jWqMa+lig4NkopBmoRotDVaP9cGfl7W4DQXcbenSZTvnHlU8ec5aY5Cd
         jBcPRpEQBqqGzCmNQmhr1llswDmnoxy4Vj1PMy0QYDpv6AVlZC7OQXu0eAY4SQmNIhBh
         v8Ej7R1pjU4YXoKJWzA3RMe3ynKxYOBjVlE56Ebbg795HXfU1w9F137tWGRC+aqPzyV7
         iEehitdslfnyYbRf7oFhgqGOjtU2fml9JibMeOeuXxwWUeWifXf9VW8qJLdY9e5tN/5K
         P2Bs5z9LTvlwQw4z0p5reRgY8WmxLyLYIXQH45UFupvLtkdIxLDtAjzquUMDFa9ElfU9
         P30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWwcbHxc4gNZkpX9lULBb97jbG0T6/PKCXFFwxy3BRo=;
        b=A245OW1wnch1+JzC/+MErKOpOKmwnLDo7qRgCo3mJhCf/ghc2dGLSL0f251L37xEQz
         BtemtEF6FEHwqZzxYimWgaYXseJyn4+iNOWbXUKa0QPP3IX0wYanihF9VaQdOkPM5+S6
         zQ1TS/0b5xyehVMKoorFDvBrxPRSkPMwR366g/VTpzYyYj8+Pp4Z/OCFZ7EjHkw20DUG
         muhKNr6jjt/bvOqEzGQPeuA7vU/hPMGzCKw7wUXgU7EYYbkbFzJHYzIDxxNLV5zNYB0M
         LbUjjyAeK+b5tc7yBvPOQA/RlZd0km8D7/oihgFPo9uIHbBtmAK8wsITuhzGeJ/7FxLH
         RzKQ==
X-Gm-Message-State: ACrzQf1Gvq5xhNhuKnWv5Q3A8HdrdvhzVQSAY9C4sLHxNAieWC0C5vSM
        Vbg2hH69rWHJfrDCnKFjUNzruQ==
X-Google-Smtp-Source: AMsMyM4Fyb5TgyL3VpXLmiFDY5cvDh03vJUy5fgOn3WKBILuMSVwtJ1mW+U1Wh6C6g7EfbpKaVxMzg==
X-Received: by 2002:a17:902:e750:b0:17f:71fa:d695 with SMTP id p16-20020a170902e75000b0017f71fad695mr2519699plf.105.1666089439919;
        Tue, 18 Oct 2022 03:37:19 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902ea1100b0017ec1b1bf9fsm8523191plg.217.2022.10.18.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 03:37:19 -0700 (PDT)
Date:   Tue, 18 Oct 2022 16:07:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Fabien Parent <fabien.parent@linaro.org>
Cc:     ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] cpufreq: qcom: fix memory leak in error path
Message-ID: <20221018103717.kjwmecadk6dknwxm@vireshk-i7>
References: <20221015130424.1923706-1-fabien.parent@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221015130424.1923706-1-fabien.parent@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-10-22, 15:04, Fabien Parent wrote:
> If for some reason the speedbin length is incorrect, then there is a
> memory leak in the error path because we never free the speedbin buffer.
> This commit fixes the error path to always free the speedbin buffer.
> 
> Fixes: a8811ec764f9 ("cpufreq: qcom: Add support for krait based socs")
> Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
> ---
> 
> v2: Added missing "Fixes" tag
> 
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied all three. Thanks.

-- 
viresh
