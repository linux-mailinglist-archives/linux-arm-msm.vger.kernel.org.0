Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3189B59E8F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 19:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244384AbiHWRQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 13:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343562AbiHWRP2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 13:15:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3635AA74CC
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 06:50:27 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id l8so2240046lfc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=QUolfiYZKhuZ0h0B3LuZHuKPS00eFUXYmA/Bd2y5s4I=;
        b=TOrVT7Bw1wcze2poGYZnEnhBFQKAsugEDX5vofp3qc4BWMsBQqESe8GO4YY84wIoe2
         l0VRiPpb5Xk23/mzscq87BN3bAWDYtQD+92/JPqA/4x97FtMSoB/DSZ/z8jH1dAcvZS1
         vjsZYZQDEdV70m3rbv+VpBPR6z4ZHRb2yxO1XbqRZccxlREcRL5387rvuayXpIh8hkDP
         YKnuSf0WbPG5cuDVQKsfAqVkpu9tuanHE9oFpbov8UmjGpWD1RSyC1xeDfD/LKR3NS44
         GrrWnh8nzHOCiCTqjdbXBGzztScXKGrAQULv0ss7IEa76YzvQPBG3SNKuW+Vf0frA6cf
         JWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QUolfiYZKhuZ0h0B3LuZHuKPS00eFUXYmA/Bd2y5s4I=;
        b=RqzDf6JBmhtRyKtTdZG8yl9SL5O7yH3guzf7mGC+5P41X0lWlBik1qShAkvaX8GDhF
         8jT7NGEqLKSuXOrFmJm51XE7Nc14KrHIF6N7TV1PVJiHJpVA0mrDOURuNf8chHsNm52f
         YaNMGIbhPAjqujtvXWsenSZjlPxk1mVltLkpFHHhgexJ1h8vWkYSM6zk9oO6rXh5p9VR
         4A15xmh9jhMmLp6D1w4WNw6qfvd6oygMxpLjvi+i2eV9IMzhWZlfTA/Hk8yxms66jax3
         qikzWgnYPyyCJNJM3PMk0OrOBu0ueDt9L7PTPHUycex5+/QdwRpQ5XGWY/E1F57INTM7
         8IHQ==
X-Gm-Message-State: ACgBeo2GISTyTL7kTBo5P5d2bB3VtKGib9w3ObslLweAKfdV3jr3sksH
        pM4IgTM4/xbURJDFiS+u1/LXuQ==
X-Google-Smtp-Source: AA6agR4ugY4cbiKVm7rGtwHlbVL0Ns3GCfIDgsM/fmAFTzn3OxYvT1bEvN4Wx75yq2QO2QJWGjVmNg==
X-Received: by 2002:a05:6512:1096:b0:492:ca89:a38d with SMTP id j22-20020a056512109600b00492ca89a38dmr7602295lfg.152.1661262625537;
        Tue, 23 Aug 2022 06:50:25 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id v3-20020a056512348300b0048af6242892sm953790lfr.14.2022.08.23.06.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 06:50:24 -0700 (PDT)
Message-ID: <6d08906f-fd8e-009d-fd0f-384165c88552@linaro.org>
Date:   Tue, 23 Aug 2022 16:50:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH linux-next] soc: qcom: icc-bwmon: remove redundant ret
 variable
Content-Language: en-US
To:     cgel.zte@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jinpeng Cui <cui.jinpeng2@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
References: <20220823133620.211902-1-cui.jinpeng2@zte.com.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823133620.211902-1-cui.jinpeng2@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/08/2022 16:36, cgel.zte@gmail.com wrote:
> From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
> 
> Return value from devm_regmap_field_bulk_alloc() directly
> instead of taking this in another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

I cannot find this report. This is an open source work and public
collaboration. The "Reported-by" usually means that the issue was
reported to us, in some way, usually in public. Can we see the report?
Otherwise adding non-public, non-verifiable reports is useless and
clutters our report-credit-system.


> Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
> ---
>  drivers/soc/qcom/icc-bwmon.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
