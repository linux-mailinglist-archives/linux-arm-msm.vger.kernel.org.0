Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC14661964
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 21:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbjAHUhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 15:37:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbjAHUho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 15:37:44 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6ACB7C6
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 12:37:42 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f34so10014373lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 12:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2wjZyCiu39kHUTVUWrdgmj76POWhIfcwRPWfaQQRFjg=;
        b=r7U+cjr4XjIRJ9ex/9VUYCK6QbDVM2k6XxYJarY5oqgtych3zMU0OX5lHjddibz04M
         qNApQuNg3HCaTvcp+5ZeDJ79AT5Quf0tsM7GO9marhR3t0bLDVG1TaSHnqamFSFgpYQd
         LuV1w7WKR0aGgUdI/IfD3JHLKs9HxwE154N641TQQ5HdzUeoqu+abHuDiq2k0ViFYyrS
         PFOKnb3Xieu0FeOBgDtn/543Wo0jIhIkEbOrW/NqtJKolWDkeqAUQb4aPQx95C/qLplA
         EGmcov6zshQTAmhSwGALPOmrlBw+WBEALuQcI+BOs/IIz2RE8IQHkzOzl7pPXEf1c/MB
         P1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wjZyCiu39kHUTVUWrdgmj76POWhIfcwRPWfaQQRFjg=;
        b=Xd47+2Bi7Wb11UMNhsGW8lQSj6hyrjJoTqMrPSlzr1cXaGtpS76ZU2BO6597/AEX2b
         V1fLTiok39chLlbLDcJoY8q8DD1NCkIQf1mMnwC9mmqOmh0MJVLUzBcE2mPAL+cCqMQV
         Eh7qedITRu587C9G2UQOmQ4PlVRPcmx0/y5OwO6ILjfrdEzuyyHBQGNo69rM/mCxPttX
         iuxBv9mkCaR59b86goNM/1R/YE3jpD95aDCw7QFZ9qoxTUQU3Ut8IZpkeLT04gKh9dis
         RzIYH5Cc7mMCh+hrdTHGVdBQvveVdLFt0Izg4JWWRicEe3OloBd6FQAYVqMRUGak7s1p
         qsVA==
X-Gm-Message-State: AFqh2konH2hXifbdG2ORZfF87RiHISGpK3rHb1ANH/MmpTmwtD4TLMTq
        INIhmdscoAkZsXqpzOyheEI28Q==
X-Google-Smtp-Source: AMrXdXtgtS0VMjYKAzLIJTHfulWhxtMeF0KdIBMpQ/AdWm6YN0w9H1vHgNvF0Y+GlLFsKuiokwi7Ag==
X-Received: by 2002:a05:6512:1049:b0:4b6:edce:a192 with SMTP id c9-20020a056512104900b004b6edcea192mr19485618lfb.4.1673210261249;
        Sun, 08 Jan 2023 12:37:41 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651220d000b004cc8207741fsm295936lfr.93.2023.01.08.12.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 12:37:40 -0800 (PST)
Message-ID: <2f6ea88f-9b84-3a8b-dacf-41af80f8574d@linaro.org>
Date:   Sun, 8 Jan 2023 22:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 04/11] drm/msm/dpu: Add support for SM8350
To:     Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        quic_jesszhan@quicinc.com,
        angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
        vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, swboyd@chromium.org,
        dianders@chromium.org, liushixin2@huawei.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-5-robert.foss@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221230153554.105856-5-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/12/2022 17:35, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-dpu", for the display processing unit
> used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

