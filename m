Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD865BDECF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 09:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbiITHv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 03:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiITHuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 03:50:50 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98945A3D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 00:50:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id cc5so2861713wrb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gY39qtZMtYnSCBI5ag2fwPcPioNDUJTIO745L137KJU=;
        b=OERt7TQSDtT7HYlnanZ7FoZR2Kl9yzn5smbPxktEdKAPl9FDLWkL11jnw2QsXohUJ/
         tlgzD+8vBiFjjKiRWciLQIK24MSdYXqvFTZJbbg3LZfDmBCZ6fTq8PoN+vXePxG6MArb
         PODBNbiOvB5YUooBRLkL7OZkkqztndCa52OQpj0/37K+EuqOSRtMpq6MMUAQegoSm3IN
         3ce0Zy3voWtDv03vAua9SMR36dxSTFxM4BQPDVPoOTnjKi8nS85J4aLCARK3/MuO45wz
         Vm+d90YX4x0n6u6JxPZh4iZJ2OmJQE7CrT7oqNKGC+HPTtou+qe6U/WYvW56uEqB49Eh
         ra4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gY39qtZMtYnSCBI5ag2fwPcPioNDUJTIO745L137KJU=;
        b=rdssqpkIUUBYR9ps0sFfPbElSHcnv0BEAJJoN3FusN7+SFKXwKinolvSb81HKE8LaA
         aBC2VsFS6n9xtcdWl1ctNLVIhu0BF67vUMT8IO6E1Clgy8XL8gxekZ8m3y22HJhMHZXa
         TFwUL70bNNqoC1tB5BE+ag8x6KZKiJGY4BRZ5Xy9d6dlF6opR+t+2MroAlF6FdegYpON
         nBXarJIVpDIdsdETPa/6RhPrfdHwOfe30C3uPYwXfwSCx2DN90RN2RnoSM342McZpD8z
         Xp4iLTbEwJwYaub8a25ukgWJI3lDjLsXufzuRo9UTkV/gFI98wJ09GOkzwYf+N8bY5UZ
         G1UA==
X-Gm-Message-State: ACrzQf0CrsS47Sbtg8pL0pLJ0egpeYAOXzZ4imZHqpy+owk/op/HKL00
        lb7slTtZr0vaZhPwc7rOwMbZcw==
X-Google-Smtp-Source: AMsMyM64ATfa2EQHIABE25QxpQFzzoUQY4ZPSBH71pRvBnJc/OapbTG7YrMDdhHHfBQHx9nGgldNUA==
X-Received: by 2002:a05:6000:681:b0:22a:3007:df45 with SMTP id bo1-20020a056000068100b0022a3007df45mr12406498wrb.149.1663660232112;
        Tue, 20 Sep 2022 00:50:32 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id r13-20020adfa14d000000b0022af5e36981sm1016337wrr.9.2022.09.20.00.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 00:50:31 -0700 (PDT)
Date:   Tue, 20 Sep 2022 08:50:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3 1/2] mfd: qcom-spmi-pmic: convert hex numbers lowercase
Message-ID: <YylwxQSulh7C48T7@google.com>
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915113523.44074-1-luca.weiss@fairphone.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 15 Sep 2022, Luca Weiss wrote:

> There are some IDs that are written in uppercase. For consistency
> convert them to lowercase.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes since v2:
> * Split out to separate patch
> 
>  include/soc/qcom/qcom-spmi-pmic.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

These aren't MFD patches.  Please reword the subject.

-- 
DEPRECATED: Please use lee@kernel.org
