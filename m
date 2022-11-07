Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFEE861F0AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 11:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiKGKbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 05:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiKGKbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 05:31:43 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3A115722
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 02:31:42 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id s24so15492460ljs.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 02:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcFOjmctkr6rYOa4TEefoY5zxAvgksDzbfZQgzrcKM4=;
        b=B1DEMFyZ6+KWycueEAoyQnmlEVYFEzruBtSCQNl6W4STY/1tL3LXmLxrDL8HZY8eiK
         C5BCPmX+DogIgWkkVy3hS9J4ugUEJldAwFkNFuBfzkID8RSHfcA4G/ps6p7lLkE3tZq/
         iu/uDSmVsafbPzgWFNkIH+YMfM4iA8QYQiR7Y4feW2+sog4DYrWInQvlIyLsebByATeU
         ri2Dkv+DGMjUEaeBwWy6ZvF6hTapi8C5uJLPVE+9Y0VGsYA0I/uhJkj7J4L1Bjd0O4gv
         Cqj7aYQGdPpDYqnWPl3kUAXxGg5+K+4KQTbFqQyj5js3PrKRoCpwxa4T+LfoTbQszy3H
         L8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcFOjmctkr6rYOa4TEefoY5zxAvgksDzbfZQgzrcKM4=;
        b=Qwv7KGzcCeQZLJ03e4PJs58BCksrPXw/6XuceMqyir0vaUHyraI8Hf4naM1mDHp+9H
         ByRJj1Wq+A8ysIIeSBZvgEy7LNaKw3R33pGsXGIO+Lg8rgFWCZw1E4lc11P4Gyl/Wx9g
         8OWnRuwqEjFKd0ehLJ7BWh5SgAqHb9b1hqH3PUkvIud/PDBrGHo9aztCQO3T4XDF68Cl
         a224uW8FNCHibuMz5m1WPcXZzZB3bWHl53U7qXPyugy4oKusJrLVvKSR0/zJaG9OiC2q
         N2UpTnHw+uS2k38k/YjgEC1j9mTwf3CiGhQU3jbeLvclCic7AaEGfUra1EKPQPn82xtb
         s5bw==
X-Gm-Message-State: ACrzQf2FtFSfkannJU6HY044SkszR/dQqsddkMYcMqy1n9aiFOD8m0Z4
        wPiLnSUQgKZSCoDoC2WDQpTCuQ==
X-Google-Smtp-Source: AMsMyM7BunC27yK9z8WV5Y8viQSNCg32AdUaXlN4SAUNGlf45/Ul4zn7RWnRhDwTBinYqKnD26SZpQ==
X-Received: by 2002:a05:651c:1786:b0:26d:aaec:1487 with SMTP id bn6-20020a05651c178600b0026daaec1487mr17428991ljb.287.1667817101769;
        Mon, 07 Nov 2022 02:31:41 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a21-20020ac25e75000000b004991437990esm1172618lfr.11.2022.11.07.02.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:31:41 -0800 (PST)
Message-ID: <e8e2db6a-33ed-89fd-ef1a-4cfee72cb3f7@linaro.org>
Date:   Mon, 7 Nov 2022 11:31:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] arm64: dts: qcom: hk10: use GPIO flags for tlmm
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221107092930.33325-1-robimarko@gmail.com>
 <20221107092930.33325-2-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107092930.33325-2-robimarko@gmail.com>
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

On 07/11/2022 10:29, Robert Marko wrote:
> Use respective GPIO_ACTIVE_LOW/HIGH flags for tlmm GPIOs instead of
> harcoding the cell value.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

