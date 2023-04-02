Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0700F6D3756
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 12:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjDBKfD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 06:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjDBKfC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 06:35:02 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E3510A87
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 03:35:01 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id eg48so106400144edb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680431700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lYxRtQCnJGmS5U01oWiKVzivoSmGFL4vbcMjdoXYdSg=;
        b=Sb5IeeSMSBIxky5+96t22ojhb0T8SqDakIA+88EP7TFX0zfb5+OShR+PbPzNa2pZLl
         ebSgf8kZNPl1l5hAk0Ogzz1pcnIRUsE6gAwaYr3r99uvKkTBpbdXpuZReqKPLswv/UJH
         k9aIOyxOZOqGJiUxSUKc2wNKs9XPKjEG7KNACeUJ4HdbruW+5hCn6wHMmP7/rX1Xpybh
         m0dk/wse6oAdAV3dv+RurIOr4ff8v6M5G0tqEAEBTpXBoLjZVZtF3nh90weWG90ow3Ax
         KadYLzDaKI7QkAr2Y4mTTBC1QpKTvYgqrqtIxkQUU0Cquhu0bVcDMeVGbV8vM/p1PSDl
         21uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680431700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYxRtQCnJGmS5U01oWiKVzivoSmGFL4vbcMjdoXYdSg=;
        b=A7WQAwKvG9LlgldkRUOZagkBVa+ATOZ6S3AZPNMo1YsdR6TZU6oiAr73hI6U9pVr4M
         xuPRSbtcMETtXCQIcg86E5ViA6VqxSxvhorjxR33KhygIa3aLhjQPRquow+y1vl7D9YP
         jmDMt8oEe6BPKwXp3SohYhN1MK0M00BdrIZyX2kiI5d1CbMwM/gBXnQEO8fbcLKhZrYI
         COA0dG+ly1mBb4/9nZm1SUj5BghltOCsTK+RYkHUqXM4gB4OLpAFI/k7WqQR576GAu5n
         FQ7A9OGrHEKmx0vH+6oy/P/mcxyTxYzFu3FFDv4SGhI0Z0eISkFxOQgRtmZgStAng/Iq
         x9wg==
X-Gm-Message-State: AAQBX9cwk2MDvrnKQM9K4MWnRG24K8S8Ur96bxb6CWyB6nblZUGlUQyg
        DBz7z/INPoISNreMncfq5ONlvA==
X-Google-Smtp-Source: AKy350ayV5wC2kjjDOsSF9BoJR1UZ5vb6yDOHo3bpK1tRxUFU3NkIfCy6yxzZ4QoOfgLbnlBuOgZYQ==
X-Received: by 2002:a17:906:3148:b0:930:fa8e:9597 with SMTP id e8-20020a170906314800b00930fa8e9597mr32252880eje.42.1680431699986;
        Sun, 02 Apr 2023 03:34:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id rv27-20020a17090710db00b008d606b1bbb1sm3086291ejb.9.2023.04.02.03.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:34:59 -0700 (PDT)
Message-ID: <47efb05a-d1e7-a3c5-c423-4eb53fe86386@linaro.org>
Date:   Sun, 2 Apr 2023 12:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 02/22] arm64: dts: qcom: pm8350b: fix thermal zone node
 name
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
 <20230401220810.3563708-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230401220810.3563708-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/04/2023 00:07, Dmitry Baryshkov wrote:
> Correct the thermal zone node name to remove the clash with
> pm8350c.dtsi. Remove unused labels.
> 
> Fixes: 5c1399299d9d ("arm64: dts: qcom: pm8350b: add temp sensor and thermal zone config")

Please describe the observable bug from that commit being fixed here.
Any future clash, which did not exist that time, is not a bug. It's future.

Naming changes here are more a matter of style, because the old names
were correct according to our coding guidelines, just not precise (c
instead of b). But node names anyway are not important from the point of
view fixes and adding such tag will cause a needless backport.



Best regards,
Krzysztof

