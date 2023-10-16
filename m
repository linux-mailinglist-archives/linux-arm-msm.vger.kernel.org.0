Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5827C9DE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 05:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjJPDcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Oct 2023 23:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbjJPDcG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Oct 2023 23:32:06 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51774D6
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Oct 2023 20:32:05 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-27d2b814912so1859055a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Oct 2023 20:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697427125; x=1698031925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtou9jo8ceOCPqU/KWECd/0g33AIs6wAqCUeT6NsmgE=;
        b=yHB0fGYD31IdQ7gdaclIkR1pkYaAkci/CdiWnrJMRiAaiLgv3Yea6VDgnDk9fzewS8
         sciN9rmEkbSKrp96Cqx4zIyJK/V8AvZNsaxfzwiInUWRj6Sp0/eWbJ2yCxHJX/Agn7NU
         j0dwPJ1idIxbaYMQnMfNnA+LOVmHEniRL/tOfhZ1P02DasqNFFWsRHzB8zhDG6nNOd1t
         AR8LxPbpmn1KMw8S+4B+o/MfjiViXy+bSw6Qa34b93EZfFT3bhieNSYoiVDsgLjCG9Z8
         I+iodP+/sAFZjwUUx5Z8QsDsURX2wzcR0sDOAJTN/TNq+jjIRBsnAjYParhH4OfkkBFV
         y+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697427125; x=1698031925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtou9jo8ceOCPqU/KWECd/0g33AIs6wAqCUeT6NsmgE=;
        b=lLlfSHV5aaBYpN6yqecz5JY/9NcuXxHHuFDVY8eYEABF0rY5588FH1/9EkEfzIR7Ox
         FnAK6B0lJ5lSqLYDUk8fR8R+F9ESoyZmKsdOkcqHSmi4/grUeJZhE/gwt6cyFUE2/JZU
         n+uvxBMByQPJM32j4xBtAonrRjnwQbo9VZOVHSjx33uop1NrpvheHnLgRdtpQRDubLiy
         +YB1sF1jSv/2xX47kX3Qrabq0aSBn6rTWTvFc8RGWyWRQ4HJ66oH6mxIklXNBaIc5AB5
         Xhd6TmTZVqLJQSQIQ1zKdWNJJp7XVfreuDtN5AnkkRgwamkxqQWMa3zI3IjLf5UENoV0
         /log==
X-Gm-Message-State: AOJu0Yz45xVsNnGmo+wZSwhI0u2ruaKit6BhpXlFMmLUDX70HwwbBC3I
        UaqyYyz6Lo1WXNxuL2qbAD8+iw==
X-Google-Smtp-Source: AGHT+IEZNoWMm4u0b0zggb/lGpK6xt4YpBXnkPuGgOrI56Eu/SZusUtY1FkmHLeAZOyU9ps+n/vTdQ==
X-Received: by 2002:a17:90a:bc0a:b0:27d:2100:b57c with SMTP id w10-20020a17090abc0a00b0027d2100b57cmr8237733pjr.37.1697427124672;
        Sun, 15 Oct 2023 20:32:04 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id fv6-20020a17090b0e8600b0027d0d4d4128sm3629303pjb.25.2023.10.15.20.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 20:32:04 -0700 (PDT)
Date:   Mon, 16 Oct 2023 09:02:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     rafael@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, ilia.lin@kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6] cpufreq: qcom-nvmem: add support for IPQ8074
Message-ID: <20231016033202.i54nequofzea6mfd@vireshk-i7>
References: <20231013172033.3549476-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013172033.3549476-1-robimarko@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-10-23, 19:20, Robert Marko wrote:
> IPQ8074 comes in 3 families:
> * IPQ8070A/IPQ8071A (Acorn) up to 1.4GHz
> * IPQ8172/IPQ8173/IPQ8174 (Oak) up to 1.4GHz
> * IPQ8072A/IPQ8074A/IPQ8076A/IPQ8078A (Hawkeye) up to 2.2GHz
> 
> So, in order to be able to share one OPP table lets add support for IPQ8074
> family based of SMEM SoC ID-s as speedbin fuse is always 0 on IPQ8074.
> 
> IPQ8074 compatible is blacklisted from DT platdev as the cpufreq device
> will get created by NVMEM CPUFreq driver.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes in v6:
> * Split IPQ8074 from the IPQ8064 as IPQ8064 has additional dependencies.

Applied. Thanks.

-- 
viresh
