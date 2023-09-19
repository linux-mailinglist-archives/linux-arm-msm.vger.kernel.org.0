Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2A77A6CCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Sep 2023 23:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbjISVPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 17:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbjISVPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 17:15:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18661BD
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 14:14:59 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52c88a03f99so7137768a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 14:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695158097; x=1695762897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+vdRAFQtk65RLgeHuJ32cdV42XxyxYfOdPY6ilYWbE=;
        b=J26pHuXLmqEkZfOZfiVHX/j2yEFu+26VI4v9QU+SyexeIJF89sITvHa1QdTLs4hEqi
         qOAovk+iFa1ZJf6NtF7LCVVi6cB4r9cquCdLZdgMzvTcKi2/YhVluZ1AyLJyh92WAosL
         L+nzhQyFPozlZy3vMXIZsB0e0ABYknFFLzgQi+N58yhqs+UatPoCwKricUYas1rdsi7e
         1c4N8uM5DAOERyVbiy30WT1EC5Ur4Iflxg2crCMf+K55PXD/xHIYnkGUYLJbGJBJL7Yf
         duy/nXxk/q4g1qCkKJH7X5OEPBlGOMWVDLZ/pmnbxTA+O/I+YVX9F5E13c6h6sgTdPJa
         v4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695158097; x=1695762897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+vdRAFQtk65RLgeHuJ32cdV42XxyxYfOdPY6ilYWbE=;
        b=u1X9vAXvbFezKJQ0EE+1Eel4vreagD5DkDbrX32rRirWjr9ep5C6e/0PvyIn12XwOa
         5ZI5cchcSRhAke47nhxBxvUTXY5MbXsx8CNk+NX/hxqr6nef4QqSTcVys4Oe+7V3aj7A
         lJrjyKuyO8BIFc5MYYTg7pEqE2rFOKQem82ARUcE8uqZqtyWnEaRHcb7yb2Z7o0/RqWT
         8D4LD+0T2+7ub0n1sg5fTG0vsbkeH35VgUZ3qx049FGiu+hs/FP1gcR7/NnduXsznYQe
         RrS98v5u7N+EpZ+LFHKgk7eSCu+ABQ8hl7WfN3VfX2kaQ4wI0SJ7d/ZGYIkRqf33yUxc
         W2xw==
X-Gm-Message-State: AOJu0YzhZw40UZqc3wkJL6TZ+HEiawAUZ0mHOiGHaPQAnoXbLvGPOf5V
        cIUmbkQfh5eERad0qFPV6zM23Q==
X-Google-Smtp-Source: AGHT+IEAwmmlWU6JGwfOt0t8pmOBkmRPfnSE4PoNAZ4c3slAcim9P7D0V4hcCEc/BynXzi8SCuX8Ww==
X-Received: by 2002:aa7:c54f:0:b0:530:ccf7:37af with SMTP id s15-20020aa7c54f000000b00530ccf737afmr508015edr.12.1695158097495;
        Tue, 19 Sep 2023 14:14:57 -0700 (PDT)
Received: from [172.25.80.155] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id b17-20020a056402139100b005259dd903e5sm7865359edv.67.2023.09.19.14.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 14:14:57 -0700 (PDT)
Message-ID: <32cda956-8c13-9f06-1fd6-b7ad0e4be6d7@linaro.org>
Date:   Tue, 19 Sep 2023 23:14:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 18/49] iio: adc: qcom-pm8xxx-xoadc: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        kernel@pengutronix.de
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
 <20230919174931.1417681-19-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230919174931.1417681-19-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/19/23 19:49, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
