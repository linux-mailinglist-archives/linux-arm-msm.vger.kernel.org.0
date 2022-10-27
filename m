Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5ED60FBD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 17:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235711AbiJ0PX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 11:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbiJ0PXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 11:23:52 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBEA4449F
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:23:51 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id ay12so700408qtb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Fbe7mxn/t+MnsKCoxtxUZqOoAmLQusG457Yfjpmkqg=;
        b=PgbeDDojhtJ9BP+mVIxxE+1xdNVZ1YffDp1ch7diYSZILaF+c/GhAzkkfsCiB5j9Cm
         SGNsBfSjl9IyXrb4/KuXZhJL+KplNpyh1tFF4vrYr6vPeDRjlCXfsq+s5JM9RUPwcWmr
         ZC9c4JpVPhSrxSZdsH5k//tUIoofahrW1gRGygZSQQ5s7rDd8f7AgnxTwO1lOB40hEL9
         ZE2LiW1wJqCNylWrn1ViMhpbQC64IScQmC0e3KQWB7TKXg5RFtuy8YB/mdOq51/78inl
         IvADSOPyYblN8o6qp9aeGQA/k454ApS+yyBMVLjGcs7g06f752MHDL/OapLAI5JLK5ju
         uThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Fbe7mxn/t+MnsKCoxtxUZqOoAmLQusG457Yfjpmkqg=;
        b=2e9fubLa72OLDNfJav+BvsmX5//juKIhZqUnFMPccOMmgUxt9quqEnUepq8U/XjjO+
         NmSWGYktPmVWLJMkcq7roDAdngcZraF7EW+Ngv3tAHUszbRuFm2lVarQSLPTJhkdI06S
         O2NQfzHOsCVOMU4RgpbV2qKICfZknqNPrGt8Bfpw9WUOnpck9mbvkZ3XaqvSj4lKJ+RK
         rhawlusVFvox2AMdHooNGHn1hJ6LKgqBfH0FWkVfs7YBBOcGE4SBU9NkrRiQGlF9ei8k
         hbU48sh2j27IYvJWVFFlMH5oRL+xlcx5v3BwXD8bJUyits4AAeH/bBpNAvbTK2vTArr1
         Mp4g==
X-Gm-Message-State: ACrzQf102MAmb5d0uX4ycLPIkI/bXCwmmz4iTKYRDvJVpaTSts9HcIrM
        a4hV7cIiBKeoDancGsIHGk837Q==
X-Google-Smtp-Source: AMsMyM6UOUD96TtQDSngHBeIGPvpD6rYSaaH+WvJkfPk6DGa23sg0Kh8QDVU3Ey3WN/U+Ch9HoeFaQ==
X-Received: by 2002:ac8:7fc6:0:b0:39c:fdf3:6540 with SMTP id b6-20020ac87fc6000000b0039cfdf36540mr37043215qtk.185.1666884230660;
        Thu, 27 Oct 2022 08:23:50 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id r3-20020ac87ee3000000b0039442ee69c5sm962224qtc.91.2022.10.27.08.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 08:23:50 -0700 (PDT)
Message-ID: <d64a73b0-fc0f-8616-0d87-3fe2af7aa70d@linaro.org>
Date:   Thu, 27 Oct 2022 11:23:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 0/5] Add misc support for QDU1000/QRU1000 SoCs
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190549.4005703-1-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026190549.4005703-1-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 26/10/2022 15:05, Melody Olvera wrote:
> This series containes firmware, SoC, rpmpd, and tz-log bindings as
> well as pmic, rpmpd, and socinfo support for QDU1000 and QRU1000 SoCs.
> 
> The Qualcomm Technologies, Inc. Distributed Unit 1000 and Radio Unit
> 1000 are new SoCs meant for enabling Open RAN solutions. See more at
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/qualcomm_5g_ran_platforms_product_brief.pdf
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

