Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF1A764735
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 08:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbjG0Gva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 02:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjG0Gv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 02:51:29 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFDE2129
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 23:51:27 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5222bc91838so802785a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 23:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690440686; x=1691045486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rjfM6EP0os742Rb1PYJNoNXLoSv8TXRejMtrnF8tiZA=;
        b=aRbbwga8G2x+RK9wfsmD1mGnDvaStbwGBuVXwD8coLmHf0Wwfz8yV5WP8jZfGQrYNO
         57+Wcg+e1aIGNkoUppS8Yec+tq/KrTOKIvvVc+V7x1HYYWkzq9ZqTAZdnvhacbUJ8eS+
         zTI9PPD0m1oYAf/G8deee7n5r82k2nDurg4YIGdYhyNEXTYHKGcyGX7JVbvbNvWXBHNr
         8adZba+AkMpdwDqxmCY4Xf/I+QsEXcpLylX0bl6OrgArQzCTcXdUErCRVrrrSJrQcobV
         Em0THdI9E81q58xUxPo7XD2eiktOIJLOq2Zf7kYL9z3S+sMpeQukTkMRWjZWHiRkH4Eu
         B6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690440686; x=1691045486;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjfM6EP0os742Rb1PYJNoNXLoSv8TXRejMtrnF8tiZA=;
        b=BOVoV5E3bZZFZ/MsbQcsdxkZNpS4fFdZ9sFF7SkNgj1pW5CojHzPYiMSAstn+AWlEm
         xbGyuclpoqHdlhQl9GAY9vk6c4zpITpVq1W2kdgc+KWjEY5cIKzUlNjhcPdrvkH78y30
         KjYi63bX5l+Bz5FyGu+R0/QZWAl5vdLjtmOy+b7iPITDtozkVOjwcGpSckBPaQS3tV4j
         NTGQW3Mr12MIWdmiDJslgJqScnyR8/RRfnODYzScNe+JkTq8i6XmSbbY4HqKIGjkkb5e
         7NFXS/fzZGcLBSJnOpQJv1MKKZxomUWt6trj7il0b4Y7aSPPcq63mo/98e0SH7+m+kCL
         RkIA==
X-Gm-Message-State: ABy/qLbJu97TBc9dqbDWUMITKqpLb/ZCqjxs2+IJ1kCdqelNJ20WqBPz
        e4A58ztKcoH1iLsbiWrefN8CMQ==
X-Google-Smtp-Source: APBJJlH86ABw4i2K5sHhKxUc2RfBj+H1c7AhFe2m1GGcjggfjDXXEZjifEr+XdEcm9DrMicsAyvfAA==
X-Received: by 2002:a17:906:9bd6:b0:994:1844:549c with SMTP id de22-20020a1709069bd600b009941844549cmr1168839ejc.0.1690440686114;
        Wed, 26 Jul 2023 23:51:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b00992665694f7sm388408eja.107.2023.07.26.23.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 23:51:25 -0700 (PDT)
Message-ID: <1439b07a-780b-7ff7-587f-0f271d15eec5@linaro.org>
Date:   Thu, 27 Jul 2023 08:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V3] arm64: dts: qcom: sm8150: Fix the I2C7 interrupt
Content-Language: en-US
To:     Zeyan Li <qaz6750@outlook.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <SY7P282MB378712225CBCEA95FE71554DB201A@SY7P282MB3787.AUSP282.PROD.OUTLOOK.COM>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SY7P282MB378712225CBCEA95FE71554DB201A@SY7P282MB3787.AUSP282.PROD.OUTLOOK.COM>
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

On 27/07/2023 04:53, Zeyan Li wrote:
> I2C6 and I2C7 use the same interrupts, which is incorrect.
> In the downstream kernel, I2C7 has interrupts of 608 instead of 607.
> 
> Fixes: 81bee6953b58 ("arm64: dts: qcom: sm8150: add i2c nodes")
> Signed-off-by: Zeyan Li <qaz6750@outlook.com>
> ---
>  [v3] Change to use my real name
>  [v2] Fixed issue of not using full name

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof

