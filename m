Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032B66AE01D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjCGNPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjCGNPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:15:15 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA12BDD3
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:13:58 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id k14so16997746lfj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3RGJsxW2mZ6YK2vSWLUn1VWroGwxCh40q2+uvcFwRq0=;
        b=Y2/HaVYbigstDk28wbyl0mnZ0+kQ4dcAaD+XWImVqSyju6Khcj5Ybc/ZOolUztOmRz
         uHuYWAXWXVxIu7BGxLL4QVfTQKhLmNUJMB6L4MK9AIVkQp25231O1oL9rKlGZxZg2osA
         kp1llG64T8PduVzZ6AWmlUuqsY+2kK52wBnJXGdsIzNoxFaSwtvbhXKvMHO6iF5vB4/q
         GhGaZhvlUNGUsRdCLcD7XpYsazMax2If/EegMs8WWaX8C335KEzmCCBhb35VAP6hEKLT
         D3D2KJ6ELsy9u5RaOX4fnxpUGYB83e8g07NfkYoF27N3RUFHARVu2hCFQTmzYmm17IPd
         caHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3RGJsxW2mZ6YK2vSWLUn1VWroGwxCh40q2+uvcFwRq0=;
        b=UhH9HTPEZNE9OWXb2UFm6+URC3FXupe1bKPFPBn/oxVeGkOhe50BCNCfayhzhtjCfW
         nty49ZZZq4nBZeBAhLZmGVnPhGvyYQ1XTYBTnIf6YZ5F4vNa9rbgYz2xVa7T+QBj+OkJ
         dCCJHOvvNbHUNJ6Z5JUAFzJh78CqoBz0n4NgN7K5V38DPE3DQxsZAAfH1PRKrlWPiexh
         ygj+jQQr7dG+KprsVmsZocHcA6Lk30+eI1oX5CKQTrsdENAZtiKDuxc5etsO7adUvH2O
         eDi5/m01f+QCX6AxbycVxyfwo/C0WejUfqSaE+ucLPzZLZXvSD2yyhRb33y8wONpSHVB
         7IGg==
X-Gm-Message-State: AO0yUKXx07F1TRn8VJupsj/cbv+RSifgr2zMZXO/j8OW4Rmzn1QLjznP
        eZKBWUzFZzWXcbSt6jU+Oi2C3xptyit/MP7F0kU=
X-Google-Smtp-Source: AK7set9BnfzCM/0PKMhiTvDKoLbDXgQYTu5+SDyFFlcTRB7cIsnnJ7LgMS833H3WUFwTx5rLyGpfJg==
X-Received: by 2002:a19:5210:0:b0:4a4:68b8:c2e4 with SMTP id m16-20020a195210000000b004a468b8c2e4mr3943261lfb.59.1678194835019;
        Tue, 07 Mar 2023 05:13:55 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id j8-20020ac253a8000000b00497a32e2576sm2027677lfh.32.2023.03.07.05.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 05:13:54 -0800 (PST)
Message-ID: <ca7a9708-8909-d663-d02f-240f8087aa9a@linaro.org>
Date:   Tue, 7 Mar 2023 14:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] firmware: qcom_scm: Add SM6375 compatible
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, linux-kernel@vger.kernel.org
References: <20230307012247.3655547-1-konrad.dybcio@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230307012247.3655547-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.03.2023 02:22, Konrad Dybcio wrote:
> While it was introduced in bindings, requiring a core clock, and added
> into the DT, this compatible was apparently forgotten about on the driver
> side of things. Fix it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/firmware/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 916a0c2fc903..2e8961c84b68 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1494,6 +1494,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
>  	},
>  	{ .compatible = "qcom,scm-msm8994" },
>  	{ .compatible = "qcom,scm-msm8996" },
> +	{ .compatible = "qcom,scm-sm6375", .data = (void *)SCM_HAS_CORE_CLK },
On a second thought, maybe the qcom,scm compatible could optionally consume
all three clocks with schema guarding how many should be used, to prevent
having to add nonsensical compatibles?

Konrad
>  	{ .compatible = "qcom,scm" },
>  	{}
>  };
