Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D31C6118D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 19:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbiJ1RGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 13:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbiJ1REf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 13:04:35 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C011D5575
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 10:04:19 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id z6so3846516qtv.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BecPoUdtyriaGRdEC0yaq/kOsCgwleGfAD3v/inHFss=;
        b=VEi/o4qlwmTmTinWpfVFLR6J+3qtjckJn+wM4ZNwHu7NEeztPi/GG7w6OGYUOYPrdT
         uE8w0yMNfCH0EYrIFX9xrNaLPRQCxbvwY0e34UcOMkt1IH6Mw0t9qlgNkCOMsicL1yaT
         Nm8SeeghKlgDAOz2FPNfOqgcJnva7SKRmfGN9AaFf1F6WsEcOfPL4TRqTKprgIUsLzvn
         9D5ZUIhczJdga93U9qAX1FVn1iLxUUKcGkk13uDPD9eoSPrrxffUz8XYUB7xAQQhtCGC
         1uCD/mRsUNOlTnchtk+suRj0IkQgMaoziTwnnlvywb8pMgVyS7JSJ8fP5QLGma4p+8d2
         g/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BecPoUdtyriaGRdEC0yaq/kOsCgwleGfAD3v/inHFss=;
        b=l1ZFYmqkD2/F8Okrl4n0Z7lcawMx1SCspeXwtOg3YWqMbQW9fLeZvcYCLsE2xHnzPv
         cb2L8afP1dgirCjnpfbiIhjPcjN4y/kIjeQiys7op3q7nt3cGNSQDQW6jT2E5xdm4Cvk
         z3a3nzwlHe7tNVL/qUCWNzLra6qfHwiwzgdzaZAwRE12g8AOB5VsYUkzX2Dq+h2uVMLu
         GZMaFnA9CV2ppWBNq2YvdfhOBcWoa0cC+n0Bad/pFTxSJjcz1ZqHDb1eHUB8BL2Vpw9r
         Ft7WH1JAMRdZfcpSJxtuS/GBnrOF7TmUIP4zjqEeifwGdmUvyuFinOXnVNhpNxUzKvLQ
         e/cQ==
X-Gm-Message-State: ACrzQf0j0r2uur1EtFuBry+iDbSxIhGIRqIn+lB6CEB2wQ/fY+4fW+Kl
        6H+M56X2Pv2YEuRWFrIVc9yM9clmZsAwfA==
X-Google-Smtp-Source: AMsMyM4N5WenspONfhfhkjmQ49KrFNFDIeVzvcVu0RlUAOyiClI7XXp7mAXHj4iIG+vnvp4TsKakFg==
X-Received: by 2002:a05:622a:12:b0:39c:f028:4881 with SMTP id x18-20020a05622a001200b0039cf0284881mr437026qtw.94.1666976658685;
        Fri, 28 Oct 2022 10:04:18 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id m22-20020a05620a291600b006f926a0572asm3367853qkp.27.2022.10.28.10.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 10:04:18 -0700 (PDT)
Message-ID: <dd8e5bb7-e2e2-90a8-24ff-cf6428123a2b@linaro.org>
Date:   Fri, 28 Oct 2022 13:04:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/5] dt-bindings: firmware: qcom-scm: Add
 "allow-multi-call" property
Content-Language: en-US
To:     Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     David Heidelberg <david@ixit.cz>,
        Robert Marko <robimarko@gmail.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>
References: <1658529438-9234-1-git-send-email-quic_gurus@quicinc.com>
 <1658529438-9234-2-git-send-email-quic_gurus@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1658529438-9234-2-git-send-email-quic_gurus@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/07/2022 18:37, Guru Das Srinagesh wrote:
> For firmware that supports it, allow multiple SCM calls to be passed
> down to it by removing the serialization lock in the SCM driver.
> 
> This patch is based on this YAML conversion patch [1] that is in-flight
> currently.
> 
> [1] https://lore.kernel.org/lkml/20220708090431.30437-1-david@ixit.cz/
> 
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

