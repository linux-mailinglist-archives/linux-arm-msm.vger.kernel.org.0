Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E5D527DFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 09:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240633AbiEPHC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 03:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240630AbiEPHC6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 03:02:58 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9819DFBE
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 00:02:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id g16so16976886lja.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 00:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oirpwm1AGe5M0caD4aV4H+XlkR1kteVHxSnmnXrKWU4=;
        b=ZXA7vD6G8P26CPF7HOtRct655zWhRS7fd6hici/WgzOo1e74kAWL7FgXV8f1aYt7oY
         ogzUnuWff17xFKp1lSm6NdqxdDVUxutVJuVRwAFuPhzXDYUoamk6IYgP/dq3P3lSNRca
         RA6VNBibPx2RWV8wFrL1wD0vdUWAc3zchV4mp5jE48ycPIC9Ifsj2qWD2+0slDmTtblV
         9ZLnZ8jOrh949/DfQuAgknydvDBmEDrUxFNswZMxEqhH1YtpntBGTXFcRp9wGr+bUN/U
         idnhvEd+FsGAKEEEmgUgyJ0OLHB1TW/EH8zXF75Kl6H5yWZg8nLjXsUEL9DCU3JT9J/V
         O2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oirpwm1AGe5M0caD4aV4H+XlkR1kteVHxSnmnXrKWU4=;
        b=2qlWbzt3niDXfEZ0gY8Hn6jTcIkqHbqHdWAyUM/UFUSHTGITFVUAXPnulvHqsdfAjE
         wbqfPkwYrZDVnqK7MvZIEAv27RZpxVrmuCVQGUuknjfuNFVyHfdg5fL6t8D1PDp6M9t7
         ASAFsqlw+ZH1qc4fVeK5KqcUCBVr5niRLwV0VXCAwD/JL90oSTImnvsCY6HxC5C3sH0V
         fYfjwDN5ad5OYvB9i16bSvX4EP0zF14yIlWxPv6n+Aa14gg31Q2qpqLLek7Px5LqTW4Q
         Up020iO1KUf23Ov66FI03UaYirwJi0nkjrVxmGtGLtLy/72t3qqqTXviMoHNPol05ikU
         CYNw==
X-Gm-Message-State: AOAM533eJ7MNWehkXGF3lX5JI27+WrSwNRnOOYV77ipdDJGpz5T442CW
        B3HekeMk6nQLNkiH7dBHidxk3Q==
X-Google-Smtp-Source: ABdhPJxj6ZZdDkD9cnljvIwwhF7SAmKjDxjdXJbfWaHgwbjDJfpcyojxAmpzoC3ILaKnvVlcK0Q2/Q==
X-Received: by 2002:a05:651c:a0e:b0:250:6a11:ff24 with SMTP id k14-20020a05651c0a0e00b002506a11ff24mr10194829ljq.31.1652684573778;
        Mon, 16 May 2022 00:02:53 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512078200b0047255d21166sm1219236lfr.149.2022.05.16.00.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 00:02:53 -0700 (PDT)
Message-ID: <c05d8369-0e95-0f57-eeb7-f23161a8c101@linaro.org>
Date:   Mon, 16 May 2022 09:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom: Add / fix sc7280 board
 bindings
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Alexandru M Stan <amstan@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220513095722.v2.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
 <20220513095722.v2.3.I1318c1ae2ce55ade1d092fc21df846360b15c560@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513095722.v2.3.I1318c1ae2ce55ade1d092fc21df846360b15c560@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/05/2022 18:59, Douglas Anderson wrote:
> This copy-pastes compatibles from sc7280-based boards from the device
> trees to the yaml file. It also fixes the CRD/IDP bindings which had
> gotten stale.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
