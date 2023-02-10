Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987A8691DF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjBJLPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjBJLPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:15:51 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F085A5CB
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:15:33 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id d40so3211233eda.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/nDb+1G2Hg9ewX5c0k1gBGf1XvvZ5lw8Ee/MhP2h9Cg=;
        b=pNKkrpGnRE83xoilG6x1lSfsQg6AT0DobI+raAUTKAuKnWrgF5ZMcBuew5tnzjxMLb
         cPmYMviudekgs3aF481XV/78W8aTUKZQhGrZi5OaMidtNYrnCWG22dSy27odUNE6mok7
         sCEfGEmwEHUrQRCcK89x/NqLjzPdhV0hKS2gm42Nb0MHIlcvg9a7dTu2ClB7lPl1Sass
         2xJSyA41p5uG+5Y/41j6zGXYaRtzi2sTxY3jh0+1VxpoTwsrXGkr3YNuB3rdFKmbAnDc
         j9B9TCTQI2TQWqIVkdvSXLZ5q0025i0xirDIfv4dGTiOxvIOCevx6PSQhtO4oFBXFZln
         kQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nDb+1G2Hg9ewX5c0k1gBGf1XvvZ5lw8Ee/MhP2h9Cg=;
        b=6/5lErtQQfU0GCabsqJ9nFDQlQm4Z/hP6Tu66yKbgI9eH4YzKwTHlJfDwwJhhgS/W8
         5oH4GI7HWrHBjIDRYNjJJMxAhmPwI2n2bHZdx22WjygzLSAPK73mWUovJHGYQ30ZAmmN
         RrHX1FPqAptdhFlot75Y2RSOP71TaUrrBtatcEgMZhsgZGqBoDbgvWg/K24fKE4u+eaT
         FQjSiejiUEv+EM2ZNRxX3YKGwSTfaQ4qSFsh1fOJ8T4kwEGvD4DkKniTL5nFMrkwPA/G
         rG2hSRTzUV4FgQvk9jntsh9pEHydeUOTeDKc2/lGbRg0uOV8sN1xF0lqm0H2txjZi6cq
         cDiQ==
X-Gm-Message-State: AO0yUKVOfV/UbN7RE93JoHCHzdTNItbDCpImI2bodKRKtljMRc/v4sIZ
        7rzrn6H8RNDMZen4L/jshsvV2Q==
X-Google-Smtp-Source: AK7set9xjSG768re8CoHosg4OZZK6xmT196MPSG7VNm6tq6VOHCf7sBGUuq17NJ1ujjwzfnn1QD0NA==
X-Received: by 2002:a50:d08c:0:b0:4ab:15d4:4e0d with SMTP id v12-20020a50d08c000000b004ab15d44e0dmr10721172edd.31.1676027731851;
        Fri, 10 Feb 2023 03:15:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r23-20020a50aad7000000b0049f29a7c0d6sm2069263edc.34.2023.02.10.03.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:15:31 -0800 (PST)
Message-ID: <3af85f94-0de6-35dd-dbcd-5c01a4d3b3ce@linaro.org>
Date:   Fri, 10 Feb 2023 13:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: add DP Controller to SM8350 &
 SM8450 DTS
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 12:34, Neil Armstrong wrote:
> Switch the QMP PHY to the newly documented USB3/DP Combo PHY
> bindings at [1] and add the DP controller nodes.
> 
> The DP output is shared with the USB3 SuperSpeed lanes and is
> usually connected to an USB-C port which Altmode is controlled
> by the PMIC Glink infrastructure in discution at [2] & [3].
> 
> DT changes tying the DP controller to the USB-C port on the HDK
> boards will be sent later.
> 
> Bindings dependencies at [1]
> 
> [1] https://lore.kernel.org/all/20230206-topic-sm8350-upstream-usb-dp-combo-phy-v1-1-ed849ae6b849@linaro.org/
> [2] https://lore.kernel.org/all/20230201041853.1934355-1-quic_bjorande@quicinc.com/
> [3] https://lore.kernel.org/all/20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK

-- 
With best wishes
Dmitry

