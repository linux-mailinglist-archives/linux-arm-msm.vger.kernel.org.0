Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E70793AB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 13:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238989AbjIFLHj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 07:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238950AbjIFLHj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 07:07:39 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0691709
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 04:07:35 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso519774866b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 04:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693998454; x=1694603254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04RIGrK/sYk5OEkLrRYOMD1ZJ/ZWGe5NicOO2NNDqGM=;
        b=g2RZ7viM3qg28RPm9per4gBRmS4hHvRe36pMbtBvIru6mbr4VFwrISkvj729QQmSxO
         yGsCxLLYe8OM1C/m/jA8UcCKEIY1N7VW0IJIohd+HJZi2Abp50lF5oC8ZOV7cthz3NLg
         m2feGK5bazOcqF0g5NqCgRZxl7xBv/DUPzJZeDm4ew4Skaf2eogNH1x2qrQx1MHcEK0M
         KQzJvn6CczEnVHtV6NMMNjKEn3F4gbaHZ1qbDNb1VVFk+gdFfL/5VdLohh7/o9WZM/ia
         0afePleBLEZY+EMq/sNVe34+pzeMFViIVqZKa+gQldzB6TUiqCT08zvijEykLa4D9Bdj
         dJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693998454; x=1694603254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04RIGrK/sYk5OEkLrRYOMD1ZJ/ZWGe5NicOO2NNDqGM=;
        b=QA+ddnHD+CVOdr7Jp9DIN/6fE8QZSogLOt119XI+vagEpuLREmmhIRhLZNxx5VnOBm
         aGcsH/6VF4gSjqoefH8//nZqHdqFqgEzd0J+6xcc5YjOUc7rIt6RdIcvhkFKjsxQ50ju
         hb0PLoUkWPTAV9i8myYEucuPSZE6wjuUai13ySp2zh1V1rv0y5sc1/wx+s3+1xvaRCgv
         G56XLK5AK3vfhu/DvUYV/jZZvYdDtS4qZQjYWBoAWSgR8nbk4fDOdXlxEVIwa/SGQyjG
         3txoXGFzFqbTUOjivbjeV73Sj19wgAqK1jbTp/K81VXqcTLw9jYIOo//1DVP9wtrjKFY
         OghQ==
X-Gm-Message-State: AOJu0YzMYMRrdTwGMZW2cVFCqjwO36468ExkPsEUuDSXKKDtjaDr1u5b
        lmapiA9lRCzaVPWAhUPEHVD3KA==
X-Google-Smtp-Source: AGHT+IF0urhKp2q2CDwmVHJCxuzg/kdWzGPsd6ABlX27s8VGanwmnIb6Dc/tu2jAo/fmuU0NM6H8sw==
X-Received: by 2002:a17:907:2cd9:b0:9a4:119b:741 with SMTP id hg25-20020a1709072cd900b009a4119b0741mr2003575ejc.8.1693998453998;
        Wed, 06 Sep 2023 04:07:33 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id ja8-20020a170907988800b0099bd5d28dc4sm8775909ejc.195.2023.09.06.04.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 04:07:33 -0700 (PDT)
Message-ID: <f29efb36-99c0-4dc1-ad99-532b88a331d6@linaro.org>
Date:   Wed, 6 Sep 2023 14:07:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qrb2210-rb1: Hook up USB3
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
 <20230906-topic-rb1_features_sans_icc-v1-5-e92ce6fbde16@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230906-topic-rb1_features_sans_icc-v1-5-e92ce6fbde16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2023 12:24, Konrad Dybcio wrote:
> Configure the USB3 PHY to enable USB3 functionality
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

