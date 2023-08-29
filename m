Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7E4578BFC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 10:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjH2H7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 03:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbjH2H7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 03:59:10 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FBA113
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 00:59:07 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso61402061fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 00:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693295946; x=1693900746;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jf6v0PlN8K4+VHfayvhTrk9SlvJxu66Wz5h1U5gN+U=;
        b=cd8xfWfjkkhYba1/kYyetBH67HS0W0MECg2+Vy3Nljp/upBOU4HLjkNtg499yYWW4W
         W3U3iy7pfrr/CJbJC1KkRNOYWiT8B+GyErH+6h6Jb19h6aky7n9XffOnxZAGg7wyt8AN
         ntNQ+UKwoE6Y+LGtbeelgCH7J+5VIgMkXjyf1YdNq7VwbU95NC2cr3i60lZpEbetbN3u
         xh91FnAAT1JkEP6jLY/cmlOiHHNfqadap16bp2eTwRM1T7v8hL7p//HqPMnsJZx3s8XZ
         8n7wiNht4v9u3gUIZq3dwbMIlt/HihWr1Dedk96edBnYOC4KvgESHqgdGQwtNe581eMp
         Dzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693295946; x=1693900746;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jf6v0PlN8K4+VHfayvhTrk9SlvJxu66Wz5h1U5gN+U=;
        b=CKQHqszoaLCvPLZcqajGArIqL/k9uGFoHj2xqR5h96T+HKoF+4K7f3fpLoyngGmhFG
         JGcNTmGjAEuivsHcWKrQ2Eg9iMk3NFnDaTCTM8AamZA4K5SkJK9tFDQtF9oDroSIjJdG
         SRsOtQ1b00X3qQhmR9t6FljBsIV/Nhla53OhMGD9tcBdAKyRZBm6wcTUxhMyTSeo1LHI
         zTP8FNsfZyS9BeFWlXgJF+2VKeaCR5EdZK0nKQ28Qr7PEz1IXW34tAxm65ZxIU17MpDZ
         JS0tw5934R3SqVOI30wM9broxR7eROcHm/C2NgBJGQvC2Y6kFftlC8JYeUlbwAX90bOx
         k6TQ==
X-Gm-Message-State: AOJu0YwIPMdy2D57VnBhTkoWPK4e7wzsh6Bza2lnNY+DzctZW1KFLaAG
        spVxuk6BlahqS5mD415f27TM9Au38ceC7uyaE3M=
X-Google-Smtp-Source: AGHT+IGD3NBFm0dQrv9JfQP1cUMzD8RLzRvv182ZXM5rp4G+qw40YF7KSL9RbgB7Im6bml2LAPfX1Q==
X-Received: by 2002:a2e:99ce:0:b0:2bc:b27f:4019 with SMTP id l14-20020a2e99ce000000b002bcb27f4019mr17828364ljj.6.1693295945950;
        Tue, 29 Aug 2023 00:59:05 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090699d200b009920a690cd9sm5606794ejn.59.2023.08.29.00.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 00:59:05 -0700 (PDT)
Message-ID: <cc35c729-df33-087b-2df4-95e8cc174ec6@linaro.org>
Date:   Tue, 29 Aug 2023 09:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 03/11] firmware: qcom-scm: atomically assign and read the
 global __scm pointer
Content-Language: en-US
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
 <20230828192507.117334-4-bartosz.golaszewski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230828192507.117334-4-bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/08/2023 21:24, Bartosz Golaszewski wrote:
> Checking for the availability of SCM bridge can happen from any context.
> It's only by chance that we haven't run into concurrency issues but with
> the upcoming SHM Bridge driver that will be initiated at the same
> initcall level, we need to assure the assignment and readback of the
> __scm pointer is atomic.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom_scm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 980fcfa20b9f..422de70faff8 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1331,7 +1331,7 @@ static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
>   */
>  bool qcom_scm_is_available(void)
>  {
> -	return !!__scm;
> +	return !!READ_ONCE(__scm);
>  }
>  EXPORT_SYMBOL(qcom_scm_is_available);
>  
> @@ -1477,8 +1477,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	__scm = scm;
> -	__scm->dev = &pdev->dev;
> +	scm->dev = &pdev->dev;
> +	WRITE_ONCE(__scm, scm);

Your re-ordering is not effective here, I think. I don't understand it's
purpose exactly, but scm->dev assignment is not WRITE_ONCE(), thus it
can be reordered:

"compiler is also forbidden from reordering successive instances of
READ_ONCE and WRITE_ONCE" <- so compiler is not forbidden to reorder
other stuff.

"Ensuring that the compiler does not fold, spindle, or otherwise
mutilate accesses that either do not require ordering or that interact"
<- which means you do not require ordering here.

Best regards,
Krzysztof

