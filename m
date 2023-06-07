Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF83726834
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 20:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjFGSM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 14:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbjFGSMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 14:12:31 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5F426BC
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 11:11:54 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so1791200a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 11:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686161512; x=1688753512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=38gFDOgOs7OiOboCZ97J7wgn0Fj+LylW3p4y2EEpitY=;
        b=lpv2yfhVs1ay4EQ/axvCEim0SnJftwinn+5AL4kiudbnjwRCz8+AwbFewKwK0pYXcm
         m4xcxqBrZWkCJNQ5XkGbLldksMjNL9ys+rNBkLDmbLCdIS5ovgRA6+kR91H3dMyS9lkZ
         ROCeEHqh98oSIg6SOUfyHh03KqzwZ64+uehdKviePDHwXNinpPey5n/s09H46aPU7x2t
         +ePVU/JemqY8zfkFP1BUkfD9o8yZ3DFNxS2idpdLqTUCXbei+uyv8Lsar8NP0kdz5ybr
         AL7jEWg4R/F5Cinb+UXx0txTu7jweBEOImKOeeHWgb3fm5EMclTY6D2nAHKp9olqMoUk
         OPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686161512; x=1688753512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38gFDOgOs7OiOboCZ97J7wgn0Fj+LylW3p4y2EEpitY=;
        b=TotsaNtzPah3GbqrlVazQRN5+RnYKZd8wQUnJL8YLKnULtFRT9Rm8gNfmqtlZ0sJlg
         XAouUlaC+d5uKYV4zF1rSgqTyvoFlBp3PtoYryTlV5gxMl/f0zJcfmMhO/oo7r8y1Fwb
         DGS8p90Ot8YGxRsdBZsgTD96VftSi+5P0yDl4KVVMJwpc9mfMnPaSKuqrXCl3J76eLPn
         bpHXpaF8qgoQaQwR/oB+K4MVugNBRnvKliSJnA2aL91E8xFotONAuoEoHgIwrrOvNNHx
         S3KzEP2gLfbKDM4nRgR7fu+7jXfU5yKcBumztb4U4ufMD0Xfv1o03OAT5blamSVw2l6m
         nXEw==
X-Gm-Message-State: AC+VfDzAkm+JZxXedSFG2TtEmQG8Q8MfWByA9UxcwdLbqKsANCZ35e/c
        4Jp1lO7q/2WCb/yEMeMIGjkyng==
X-Google-Smtp-Source: ACHHUZ6QlGsiXyrJcXM30ikCxTwLf17/dt+bW4ffQAr6CkTuL+AYvsWCQwfGH415M7X/kOv0SIGcWQ==
X-Received: by 2002:aa7:c3da:0:b0:514:7f39:aa80 with SMTP id l26-20020aa7c3da000000b005147f39aa80mr4770123edr.18.1686161512431;
        Wed, 07 Jun 2023 11:11:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g16-20020a056402181000b005149cb5ee2dsm6427652edy.82.2023.06.07.11.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:11:51 -0700 (PDT)
Message-ID: <7107e83a-c607-41da-f606-277400d40010@linaro.org>
Date:   Wed, 7 Jun 2023 20:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v6 04/12] dt-bindings: display/msm: Add SM6350 MDSS
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
 <20230411-topic-straitlagoon_mdss-v6-4-dee6a882571b@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-4-dee6a882571b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/06/2023 14:43, Konrad Dybcio wrote:
> Document the SM6350 MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 213 +++++++++++++++++++++
>  1 file changed, 213 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

