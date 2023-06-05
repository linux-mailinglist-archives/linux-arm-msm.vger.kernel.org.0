Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A59722EF5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 20:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjFESx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 14:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjFESx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 14:53:26 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20421ED
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 11:53:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f3b4ed6fdeso6528118e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685991203; x=1688583203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9rzG8UD/ldrMcAHE1T1BvaSz6ylxNrtU5fahC9y+bI=;
        b=VcDYifDHedypBZZ1STGBiZySLcfYg6Ha4zn3yorgcINosc89BKZJdtIMuJgtZECZkD
         suMzOHUU8ehqsA0Wpa877CG9/FLtsx74VctyzYiySmhcge98ZeZAkaYO2TzTcRJJ5FOx
         cpWaZc0VzEceKgfQdqF4ylRl9WlG6KgRUuzTZHuh16casmjilzBAsKW4SHVhjNmT/pbK
         G2juGHH2dKJoiwejOcnK+ge+gnwLkVkoZQVtaTPIJxGiE0UPF6ATOf6XdtT5NxPtxc5k
         bFJfsLGSSyHFL3Bh0HRrOGEyoqLcWOnDB+t8JTwbsGdV0JOdvAI0Eje5ZVV9nhIAZ+GA
         l7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685991203; x=1688583203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9rzG8UD/ldrMcAHE1T1BvaSz6ylxNrtU5fahC9y+bI=;
        b=jQDQQPAoRzd94VMYwN1D+/MU7zHkGlczSUXEv0qgsdMs9yhfK8/xxzINeQQ4MMBbmn
         NwKONgTi5we65wyd30ZpNjajfj5kFvLTe/IKUbZQBel+NeFm81pTxaen3fECp9QxskB0
         6g6KN8XINfQc5iO5+Q5xrJgkecCnZ/tbzJOyXq0Fw9JXjwIKwx2AOY5pNYgW3gRLk6AX
         05sWSywnFwW0COlHx8KSHLbAGapeZ0RhQEQtcRaSo9AY8vVXmq4PJaidj9fOaq1XOEY5
         xP0DJy9TPZR7waNic8UA5Gh0D7dd/gfdOT+EzP2/FUjZFy8rmThfEBnGiJp5pdDvx/Hh
         Bqpw==
X-Gm-Message-State: AC+VfDxsEXea1od1xUQo2Beg7YWKJr79bTZ6Vurs9GcPnpORowrg8EHw
        Vc6J3TtkNEfy7OtIczzYyg1NNg==
X-Google-Smtp-Source: ACHHUZ5rjHaJj9TnfKZQcvYFsyp47ETkS5pDK6TXhDJrno9DBi7/s8YUHv5LhjP9bPqJ0YP85Jy5HA==
X-Received: by 2002:a05:6512:11eb:b0:4f5:1ca1:30ce with SMTP id p11-20020a05651211eb00b004f51ca130cemr5825409lfs.47.1685991203383;
        Mon, 05 Jun 2023 11:53:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj96.neoplus.adsl.tpnet.pl. [83.9.29.96])
        by smtp.gmail.com with ESMTPSA id n7-20020a195507000000b004f1482d9db6sm1197914lfe.155.2023.06.05.11.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 11:53:23 -0700 (PDT)
Message-ID: <f755a2d9-353d-edae-f397-cbc48460db75@linaro.org>
Date:   Mon, 5 Jun 2023 20:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 08/14] soc: qcom: smem: Add qcom_smem_is_available()
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-8-e0a3b6de1f14@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v1-8-e0a3b6de1f14@gerhold.net>
Content-Type: text/plain; charset=UTF-8
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



On 5.06.2023 09:08, Stephan Gerhold wrote:
> Avoid having to look up a dummy item from SMEM to detect if it is
> already available or if we need to defer probing.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/soc/qcom/smem.c       | 9 +++++++++
>  include/linux/soc/qcom/smem.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index b0d59e815c3b..3d93a6681494 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -359,6 +359,15 @@ static struct qcom_smem *__smem;
>  /* Timeout (ms) for the trylock of remote spinlocks */
>  #define HWSPINLOCK_TIMEOUT	1000
>  
> +/**
> + * qcom_smem_is_available() - Checks if SMEM is available
> + */
Shouldn't kerneldoc explicitly say "returns x if y else z"?

Modulo that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +bool qcom_smem_is_available(void)
> +{
> +	return !!__smem;
> +}
> +EXPORT_SYMBOL(qcom_smem_is_available);
> +
>  static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  				   struct smem_partition *part,
>  				   unsigned item,
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index 223db6a9c733..a36a3b9d4929 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -4,6 +4,7 @@
>  
>  #define QCOM_SMEM_HOST_ANY -1
>  
> +bool qcom_smem_is_available(void);
>  int qcom_smem_alloc(unsigned host, unsigned item, size_t size);
>  void *qcom_smem_get(unsigned host, unsigned item, size_t *size);
>  
> 
