Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53D0E5E8AD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbiIXJal (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbiIXJak (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:30:40 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AE68E4D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:30:39 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a8so3653025lff.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
        b=XZ1V4ejxRvmjCcZUTxWLHU12whSdot5qtCzG6oCYK6lVY1sbvj3TqsS7MmDuj3M/8q
         3mF7YzORN893U9RMGOufMBgrwH3MAF9+ZBAMZaO1moTwyN3ChbdwRDeG66XDJEUjZGto
         0AF7g9mDbsnKceV7OtfpiOQ/aEDh5OuikwbkSi3Z47ga65fmbUnFLwWA0SYYxMkQThBI
         qNH2+Q8cX5psWunN+vWGyocL9pasWSehkiaZygVhfqC1uWvO9Kuap8aqEdhTosJGiuLv
         +zjktXpKqf89QVPX0kuq4GtlvHNuRGcah9Xs+u6kHqeBcz4dvOIn2xkAEO/4OPcBFaKp
         AhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
        b=RrSImMqvI973uqBmRHDKIXIJAyNNee6L//RBD4PTrTk0WBbaRIfqXqpSAK+Bv4bFd8
         opF0YHb2YbC8m5Zb5zFsyeMjkWCzBuOzHzfe1zqYTU/BvmiOsvCGXSnylpTfasdEbP2l
         J+a/YS8altGzirJr5BTQrIHy9eDGO40ivWVMgJcieyB0jIQL/VA9jKQQKY8HwErpqUec
         7TOAZeXAYzx1F1wcY3jHBnSWpb+WNYJ1+fTL1eTzsa+iQ3rNP7wkSxHmdOyXGh1fYZHA
         R5I0oA1e7GzD4iDlKRIIQdDgUaoCjpai/5b5v35yAQVyTQuGuEjTfkJvVktSVIzsWQeH
         oB2Q==
X-Gm-Message-State: ACrzQf1H4AWDOBQ4r009N8lotX5/iuxOLAuApWp7N2cE8F321qsE6saD
        KJmTzkXeU0QWslpiYid83SCM5A==
X-Google-Smtp-Source: AMsMyM4eY6Bb3ZQLBJIB0SXUbmPPatP5oPnH7NvZJ+Ska+7Q2v6jFE1iNDM12lNRUivZONcelFXghg==
X-Received: by 2002:a05:6512:2a8f:b0:49a:db9f:d498 with SMTP id dt15-20020a0565122a8f00b0049adb9fd498mr5158098lfb.435.1664011838085;
        Sat, 24 Sep 2022 02:30:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t3-20020ac25483000000b0049a5a59aa68sm1840353lfk.10.2022.09.24.02.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:30:37 -0700 (PDT)
Message-ID: <40cd341c-da16-7de1-bcb4-58d1d568ec43@linaro.org>
Date:   Sat, 24 Sep 2022 11:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/9] ARM: dts: qcom-msm8974: change DSI PHY node name to
 generic one
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

