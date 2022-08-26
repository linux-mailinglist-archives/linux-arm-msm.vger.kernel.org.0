Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4CA15A24F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 11:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245421AbiHZJt2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 05:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344088AbiHZJtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 05:49:22 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF831D7CD2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:49:20 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id z20so1081763ljq.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=GsqQd6SAPDb0fT70p8X6mFpGFngwmS41ZDD9UsqFcxM=;
        b=ZKjXAMz8pcymkVteFl94YoiUT4i+0H/GnJWZZD+19egMi9JRgYIzvgBmCgceFkobin
         GJ/ByY5Rn34tSNA9+0J3y2k2w7mID9Br4UDV1ziUweyTvrgC22eR/a6jxQ/Xz3cwb12L
         WR3r3qy4A3AVCXdAXOmEjVe87Al5+bbkFj8rnFR0QST3F4jJ2yqzT3wx0N/kfmvHb1rG
         gdf+cqGzv5tNeQIxf8GsVMH72XdcFQE+zmAVBt9rhM4bbc99xkQKOypE5hE/nxJnACqh
         EPmEbE+dxz1lTUVuQXb1ZTj/He2B/RMM8qfPdB/0zatUW2AbBQAkoUp9piDsNrzMB3S/
         jScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=GsqQd6SAPDb0fT70p8X6mFpGFngwmS41ZDD9UsqFcxM=;
        b=LXsgfpAP0L4/dF8BdnDpy/1vd+DNfuNg6mv7et3bnr4E6Tzk13qGbNIlZKmatMCN7O
         oizKZTNiOf0020Oc8Rw5pA9p/iKizyjAYUjkyXtvI7tsSdXnE1q3Sw9e9jsKRE9S/xl+
         0Msf19lMoeDf2rPcCEIi3q8WvAjeiFvhHM2yGTJJKuNqZ9sDnPKqqcRdn4hVN2INGdcO
         dMcWlPj4zA3zcW9LgtK2l25Yxu846Tpj6tHKP5ZmsegBnVtDUJVuFK0H+p0J8PQb2P6A
         s8vCZxeGwTLmUSosUdzGVwxERO2HilKx5NpKmcm2mgqlgv2aQZjnVgZmG/qcDbtSXba8
         Qflw==
X-Gm-Message-State: ACgBeo1F1kwxUxj/7BELocLEcp5OMKHtU4e0Id1OAq+EV2moBRldEvo/
        RGrR3jG5G3YhhSjgMA0hZBLLjQ==
X-Google-Smtp-Source: AA6agR7ECId76gxdTj+Hok9vpI+zeUXckjiUcPYxRPDp7nQ9KYixIuJxEsgttN74oxS3l80Y9y9SAg==
X-Received: by 2002:a05:651c:88e:b0:261:b5e5:8622 with SMTP id d14-20020a05651c088e00b00261b5e58622mr1990934ljq.99.1661507359218;
        Fri, 26 Aug 2022 02:49:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f13-20020ac251ad000000b0048d1101d0d6sm327311lfk.121.2022.08.26.02.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:49:18 -0700 (PDT)
Message-ID: <8489a606-9894-acb6-1b59-bb29f7a6baac@linaro.org>
Date:   Fri, 26 Aug 2022 12:49:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 3/5] dt-bindings: display/msm: dpu-sc7180: add missing
 DPU opp-table
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
 <20220817062059.18640-4-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 17/08/2022 09:20, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 3d7a0dd8f39b ("dt-bindings: msm: disp: add yaml schemas for DPU bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

