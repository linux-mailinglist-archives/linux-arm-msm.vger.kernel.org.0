Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2D43744EC8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 19:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjGBRh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 13:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjGBRh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 13:37:56 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4AEE73
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 10:37:49 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b69ff54321so57530471fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319468; x=1690911468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P832M/MKIVcAnwYyLxfAF/7C9YRHmHPww8zmwWUQWmk=;
        b=vjJydNpz7ul+/DI+LRuBT2DH+JHWkQxZHY1MPIEtQBBDUgXqyEVw5JEdy7gncByPno
         OuHVi8UbZvwHrGt0eOIFeAbi2d//tvfjgBKsgAqkpYc6k41NB+OLWr7/2Sjnk233/mh9
         98ZoB8wa3CdDy6uane0iEd46vk+qTbHfQ31qMgpoRKTaJ+WDGL6zCNJhTIrRwfY35/N9
         l3BA1pbVTbbGlKTrfzE2a9uOVYK2GePu6U9xzXGgwzVdQCcOfJvrnrBiXCYmU79TJQ/r
         7xVGCkEJhqBQjfi9O8pEp/aJm3FC/pF7TSsYAPvMClUQV7eU3KmGv21OTPyTgQDWW6xW
         1yUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319468; x=1690911468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P832M/MKIVcAnwYyLxfAF/7C9YRHmHPww8zmwWUQWmk=;
        b=L6eV4upqj1CKnPW2+UXlvE8hVO56KsWWl1ZRuMAbIZKdDz+gZQRrY9Ad8L031Jcg2w
         WnuzBl1mvIFYnNlCERQt7Tlff4Oopt8SbnZ1I5xE5BEFzXHkYnocKtdS5Y0kazRYz81o
         9pZ+2gPoC4hf+PAEQDEJumk+ZNSPA+SZL8Zij7//tnpgZC1LzjQYub3u7q6cHTf9uJJW
         rKFgVanCr6wJm6/C9lETN0l0i2HehxB6uwZkX7lwB3C/LRnKRF5aiZ+813+npo0B0eIM
         ABLyc5Djz7Yu/wqSzpcLq9W8IuevFvJ+Fcwkg3hgPAqaaPq9lgEA63KtD2CjhdsGXVih
         VCSw==
X-Gm-Message-State: ABy/qLaATiMctAuiw7NRNJKhjrP542AjX2/ZYdMbsS+8xP5TfCyAENgs
        vF5nnkLExNEWPFIP+JQkYPQpdA==
X-Google-Smtp-Source: APBJJlEBSvJdaoM+ESXqdWJdJ0GTZzt/18Fz2+w8eXAbm3VbXWt12w08jZ45D0SgsQd2fDoLDDjljg==
X-Received: by 2002:a2e:8095:0:b0:2b6:a344:29cf with SMTP id i21-20020a2e8095000000b002b6a34429cfmr4928765ljg.17.1688319468009;
        Sun, 02 Jul 2023 10:37:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a16-20020a05651c011000b002b31ec01c97sm3754351ljb.15.2023.07.02.10.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 10:37:47 -0700 (PDT)
Message-ID: <c71797a8-27e1-40fb-2487-7ce68470da2a@linaro.org>
Date:   Sun, 2 Jul 2023 20:37:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 09/26] cpufreq: qcom-nvmem: create L2 cache device
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-10-dmitry.baryshkov@linaro.org>
 <a15a2564-3b48-4592-1e40-2187ee89af1c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a15a2564-3b48-4592-1e40-2187ee89af1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/06/2023 14:50, Konrad Dybcio wrote:
> On 25.06.2023 22:25, Dmitry Baryshkov wrote:
>> Scaling the frequencies on some of Qualcomm Krait platforms (e.g.
>> APQ8064) also requires scaling of the L2 cache frequency. As the
>> l2-cache device node is places under /cpus/ path, it is not created by
>> default by the OF code. Create corresponding device here.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> I think a generic solution (i.e. for each cpu node call
> of_platform_populate in drivers/of/platform.c :
> of_platform_default_populate_init) could be beneficial

After giving it a lot of thought, I'm not brave enough to register all 
CPU-like devices (especially since some of them are registered by other 
means). So let's keep it this way, unless we see a bigger demand of 
populating cache devices.

-- 
With best wishes
Dmitry

