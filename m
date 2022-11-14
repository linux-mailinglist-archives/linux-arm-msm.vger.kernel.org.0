Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB276284A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 17:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237335AbiKNQHU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 11:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237337AbiKNQHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 11:07:19 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759802ED69
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 08:07:16 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id r12so20058381lfp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 08:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1j7PQfNtNj7P/WpzwUhjqr+L7iC6jxZZqm3Xv+n2Hc=;
        b=LlqYGZze3fTHKIihvWZEiDhC44NYtCEa7u5AybeTMGCQayZSobW7hg20vb4Uf8B7JX
         P5KTp7Gnzbb7GotYQmWqcDfOBVLsuXvKn5WJFmD2OhgQQUwIhVUW7/wRKEGw2YmceK6i
         7FMXyA7rzueWvC4TLd2Q/a3C8sWy7sdQ30TZS7rH72BVnaYmZDfR0K5UA3pD/Vopb/uc
         uCErZDbcZUfFgxkr2wXhVmVeVSQZhelrV0NOD0oVcAmd8TS48r5FMlvemVWfbLk4rSnS
         N5ZeLl7vm4o8nQ5RB5I/WLto1obzUS4ESdCGDBn2ser2BBT6ZfoRvKLP+eGQ/01SzaBb
         L1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y1j7PQfNtNj7P/WpzwUhjqr+L7iC6jxZZqm3Xv+n2Hc=;
        b=gOoA5HVqG1jzEV0qOS0eKXWfR4JxaDHLXU6ACJdTn0xbjHkOMduql1So9pX6++fYHd
         cy7GdV9SLJgi4T1rdBmwApW9IpaqWee3aXKkv/V6XswXxNRq2gAK6JsMJhx7Nu9+7cMl
         QDwBYl2B7GKxlFD4AqdOx9gC/9Y599FscQ6EVuK0Mp8V4mRqmtPG4nLQFd6j1GXQ3LDJ
         TNm0YWUWgDWnvvABRjp3TfXPq09/C9hKRnFLCHxZ20ntsijhVsTyDYc88wuuKLaJhwx+
         4vWuSUNQk/tVEYWHOQG6B0rxxqq/uoosajIeujZfRZabpZhEOFWFHQnJ29uDmv5MIwuB
         iWUw==
X-Gm-Message-State: ANoB5plorxVOmJgwZsxQvCgmbNW4Bh9uxujz68ZHXe/gYM48o25f6cHo
        uUZz/ZiCaAMhFrsvtP3QFgSp7XFsmRG98At/
X-Google-Smtp-Source: AA0mqf5G1IEmA2b3Yosw7pdeHomumX2+t5tM7NiPqxDTzP9eSz7jUtq5AZqGrL1RXxS/ECd5OvuW+w==
X-Received: by 2002:a05:6512:298d:b0:4b1:7c15:e8ca with SMTP id du13-20020a056512298d00b004b17c15e8camr4226757lfb.601.1668442034273;
        Mon, 14 Nov 2022 08:07:14 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id j6-20020a056512344600b004978e51b691sm1859932lfr.266.2022.11.14.08.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 08:07:13 -0800 (PST)
Message-ID: <be12f2d9-ec06-350b-8664-549b39d6f175@linaro.org>
Date:   Mon, 14 Nov 2022 17:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix PMR735a S3 regulator spec
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        satya priya <skakit@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <20221110210706.80301-1-konrad.dybcio@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221110210706.80301-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/11/2022 22:07, Konrad Dybcio wrote:
> PMR735a has a wider range than previously defined. Fix it.
>
> Fixes: c4e5aa3dbee5 ("regulator: qcom-rpmh: Add PM7325/PMR735A regulator support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Leaving this in to avoid confusion:


Please note this is different to the recently merged patch (that one was
for the SMD regulator driver).


Konrad

>   drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 4158ff126a67..f90bcdeecea5 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -1187,7 +1187,7 @@ static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
>   static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
>   	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps520, "vdd-s1"),
>   	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps520, "vdd-s2"),
> -	RPMH_VREG("smps3",  "smp%s3",  &pmic5_hfsmps510, "vdd-s3"),
> +	RPMH_VREG("smps3",  "smp%s3",  &pmic5_hfsmps515, "vdd-s3"),
>   	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l2"),
>   	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l1-l2"),
>   	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
