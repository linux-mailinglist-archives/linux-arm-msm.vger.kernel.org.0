Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0954567652D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jan 2023 09:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjAUIrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Jan 2023 03:47:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjAUIrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Jan 2023 03:47:16 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579056D341
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 00:47:14 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id w11so7574453lfu.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 00:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cm74fKZ7PZKO31bFrqMzbCutmQbZrACGraN6keA/CmQ=;
        b=uj6cCnvWG0/ZX8xm8FR+j1zcbSNOW3rIXuCUo4T7P5iCD6z0owTIqRJjIDmlXFZWTO
         ui/Vo+4rRrrh8YGN1DZd73mD06Aa4/qrDZja9bF3CTb69ulx1Gm5ONYd5PpPKtwycV3i
         1ga251Lw3HlSsEA3BM2McwlgV+51FombUViiXBjRfZALziGab9ooI/gKYysiIYy9xVMj
         cqwZXI9YlXxzilhpS36wa6k9GmQQtt6jGSuIw69qnL6U/FpnCx4gvoBuvV2komsSF7BY
         MTA578W+8PmZ3jCkn/HCliatmpe+0E6Pwte4avVRyTCw58kpB8Au/kbGevdLgzLESum5
         t2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cm74fKZ7PZKO31bFrqMzbCutmQbZrACGraN6keA/CmQ=;
        b=nJ0J1m6LfFd9PHE1jCrx8b4tC5jFQbxtRbmdHoo7z3yaJD6DZFPJyiqFpOJtcbMhnu
         vsYGzOkCc5yDSOvf4Wq5wc9btgTHgzyzkOs2wGaFFumU5vXQ2W4Us2HeqE0L8sfe1xXG
         gVRqWlMYjTjN3tIDbCGYKlQHXqAAit440cYYOk8cjqyWcaEA2SyUaKbf0ZIb2aZzmiXo
         tBKwQDOkw/OHxSd4/1AlK72XrYIHj7qXZBdHjvkDEM1axkPLxUe6//IXR7Ca4YumoMjc
         r24oFfaCvzbQkcks7UAIGJwTsdaajl4i+OLb01w0kZO+He5OFUV+TXc2HDacKN2MI6hX
         zazA==
X-Gm-Message-State: AFqh2koR5cuIv+Fd2jJFNjRkvi/ROOwK56kY+NB9k0wrw29ldK55uZ13
        TXqJIpmjSBS1Zt/txkKckfJqIg==
X-Google-Smtp-Source: AMrXdXvf4thwlAFvQa5ElA008GmdQU1GQgdTR0z3t1Z5PgAMFsJ/qN1VUM0x207OjxGo8TxT3dJ14g==
X-Received: by 2002:ac2:4bd2:0:b0:4a4:68b7:f878 with SMTP id o18-20020ac24bd2000000b004a468b7f878mr5454709lfq.28.1674290832741;
        Sat, 21 Jan 2023 00:47:12 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p9-20020a2eb989000000b0027fb76a4b44sm2074958ljp.97.2023.01.21.00.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 00:47:12 -0800 (PST)
Message-ID: <26fc1ff5-d150-35cc-867c-23683f104521@linaro.org>
Date:   Sat, 21 Jan 2023 10:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/8] arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to
 DISPCC
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-4-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-4-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 23:00, Konrad Dybcio wrote:
> This was omitted but is necessary for DSI1 to function. Fix it.
> 
> Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

