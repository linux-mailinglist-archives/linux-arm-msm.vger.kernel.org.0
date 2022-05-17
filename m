Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA6F52A87F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 18:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351179AbiEQQq4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 12:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351105AbiEQQqy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 12:46:54 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976284EDF4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 09:46:52 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bu29so32433957lfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 09:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=vA9MGHALbB+9Q0y2UR7t42fhnR0UrTgvfqZrIveu9Cc=;
        b=EzHX8ExAL8o58vKiK6bTJ43XQZFYb6q0hkTBQTBcf7ktUCuIbVOz0oA9oYHfbrssCf
         8UG5ExsXHxRAIn7KPjfdsn5+oOflZfxxnjMC4hs25Tf07x5CkCMlStLq8mo5KkFHsMuz
         68nPVJN5oejQ90/naxoCgjKWODstSdzvy7tOgo1nlECkLCXMaiY1B1JCKufRsFyhWIMo
         6Dvi2MPLe8wdkTGiZfSdJcSGdN+R32OnkNxwYU59fMuALFo6teNrQpzXka8LLARqJ/Ik
         XbjD2OqFLQaj45CYavxHRXnzbbQUu4jP/wW9CvyqGtazsXts0S2VMn1uTTP7nkepvmQV
         tgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vA9MGHALbB+9Q0y2UR7t42fhnR0UrTgvfqZrIveu9Cc=;
        b=JCW1Vz15oePqWakYnr90Ki/PNv3bvk6ipOce01H40ryVgIsauTYDTYZy/rh8VqBP8j
         0y97kptjWYdQbp25tdtuVL3HeT53r1GZw8ZQ6KdRnoXzOV9Xxl8suQvH5rSEv8Qw7Qhu
         qYmp3y+2fbZdfd2U69tfffze3PD15RBa0yt7UNV5UhWb5jHqY4bM6UfvUJglHsWA4whb
         vNmmfcWMO6EjGlcpi1LLPdXnI5luIR84aoKSVdqEqJxrfz1wu5KUktsNSYVwFMJ+yurC
         /Ps/3VUYVepXl+DXrYbR3UYH+h384lPm1nC5joObX3Jw1MsiKr7nwjYUt/7YchAD/jVG
         58Ug==
X-Gm-Message-State: AOAM53150/Azt4aUNNH3HmaMb76etmXIbgSLVz8C3CIKkumRiV76Jj7K
        lsmZVI19VmpUsCupiuK+Eq7rHg==
X-Google-Smtp-Source: ABdhPJwVr5ZpgKS7rdjqmUnTL/3jYg8wNCfJlf1QbuGXld3L872UyhJjEwyTp9pewtHINjQcj0GP1g==
X-Received: by 2002:ac2:5b1e:0:b0:472:2c9f:5891 with SMTP id v30-20020ac25b1e000000b004722c9f5891mr17227499lfn.534.1652806010956;
        Tue, 17 May 2022 09:46:50 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h14-20020ac25d6e000000b00477a8c6b08dsm7331lft.100.2022.05.17.09.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 09:46:50 -0700 (PDT)
Message-ID: <2f73874b-430a-48d2-4739-b06eebed1ea8@linaro.org>
Date:   Tue, 17 May 2022 18:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/8] clk: qcom: alpha-pll: correct kerneldoc
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2022 12:35, Krzysztof Kozlowski wrote:
> Correct kerneldoc warning:
> 
>   drivers/clk/qcom/clk-alpha-pll.c:1450:
>     warning: expecting prototype for clk_lucid_pll_configure(). Prototype was for clk_trion_pll_configure() instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Any comments on entire set?

They are on the lists for more than two weeks and it's getting late to
apply it before merge window.


Best regards,
Krzysztof
