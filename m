Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07BB05301BC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 May 2022 09:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238434AbiEVHyk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 May 2022 03:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236453AbiEVHyk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 May 2022 03:54:40 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D5F1CFF0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 May 2022 00:54:39 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u7so13191426ljd.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 May 2022 00:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zMBWfLQ7VImibIUBNFQNVRlWsCmwgRNDbMx0Ehor3dY=;
        b=srmBhmrTRJ7fZsq0Y4dU7NYMGkfv9n5fNKhtlUHcyUWJAuFeJ3G89DN1ab/uwLf6i4
         fLLCYIUTxs7sOgmmjRJxunlYC1iDF94NN4WY+DpJerD8jRkZ46p+oNf37cQ4k9hqR5BB
         OQPBJnfnN5RTaIELY5ty/XntFGZMF0K2ajkf+fL8dnB8fhlVrqga4UZNHch9l+20fGGL
         zfWIDeyW1QE6ISsjjddCPARId+rjKLLEoJoE/xpKc3uq7cPo/ODcJ9dBq/LWKLAzMLms
         Evc26zLELI5qwO/jc4+5c2EdYe7Klz25CIQ7l9rrFKBLN0gCa+UvqF6T00ESAjQo6Lh3
         guAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zMBWfLQ7VImibIUBNFQNVRlWsCmwgRNDbMx0Ehor3dY=;
        b=X8yEpMYIv2frLsVEnRrYPDOMZ3YLq94jLJsJMqCrOwcIfYQr/3IqU1tn8ZsoiCTC6z
         Old58hUqRu/hMHT/I9dqSnxbT17d1mP61iYbCEZEOfPDBOHXHc0CJ1/BiYjWjNfAtBd1
         yY+xK//dJH9lGOC8Ls2Ftw6A8KuwjWZrAgAWisTB+F7r8ugkwkI/GtI/jD34asYXcbhr
         Oi7l4XtIyUOhlZpGPpXvjbZG8luq0dqc73Lun51UGCpWW+bPOC225QQEMS28Xru85Y/+
         VkSd7sWujVDskLE2C+fXl2xgpk1zWjfHis4oU41Tt/4SZtkC1N3HWaX6cEikZUDzoeDO
         Pgsw==
X-Gm-Message-State: AOAM533kZ54in3Kmn4qQLci6U/LET3zwFuIQgt8Yjy0IPDh27fUjFdkw
        OUQHAID6mRy56bG/2Gpmx1ljXA==
X-Google-Smtp-Source: ABdhPJzYIUnOGXUEgsBP/qmKc1VkeCf2Mkm+8uXJ9Od4YU8W/4O+2cg7SkkcBV5kjin31GbZGZUKfw==
X-Received: by 2002:a2e:9350:0:b0:250:6a11:ff24 with SMTP id m16-20020a2e9350000000b002506a11ff24mr683753ljh.31.1653206077441;
        Sun, 22 May 2022 00:54:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q26-20020ac25a1a000000b0047255d210e0sm1357111lfn.15.2022.05.22.00.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 May 2022 00:54:37 -0700 (PDT)
Message-ID: <17456770-78fb-7c27-06e5-9102179239fb@linaro.org>
Date:   Sun, 22 May 2022 09:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 2/5] dt-bindings: arm: qcom: Mention that Chromebooks
 use a different scheme
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        patches@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Julius Werner <jwerner@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <20220520143502.v4.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
 <20220520143502.v4.2.I6418884d8bab6956c7016304f45adc7df808face@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520143502.v4.2.I6418884d8bab6956c7016304f45adc7df808face@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/05/2022 23:38, Douglas Anderson wrote:
> The qcom.yaml bindings file has a whole description of what the
> top-level compatible should look like for Qualcomm devices. It doesn't
> match what Chromebooks do, so add a link to the Chromebook docs.
> 
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
