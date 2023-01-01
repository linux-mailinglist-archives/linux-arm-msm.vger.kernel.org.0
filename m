Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E23A65AAB5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 17:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjAAQma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 11:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjAAQm3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 11:42:29 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0621152
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 08:42:28 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id e13so24496098ljn.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DyHmJqMwBFUTDUCLBa6xYcpZiFOVVP1mRqK8f17ZqlQ=;
        b=nlo6vvboC1gDKb90dwiGsoLvLW04p9t5Iuivx1rAOrJQ6IdEGnrYpwh7jiDBPfE/3D
         /SMwuvv2zdSpkX3dgprB2gdElbPIkRczorWVOEB821htUEsSZdQlXni1KB2PltWAtEiU
         duBP9BJ+ZUkQTfY3MHdF5GDxVfYlrnXii5Fe+uSAh2XXhhXWVppStGOaYMrQ0N3kRayx
         uDlPAxzZyXRVO7PyNKmoKgq2xT3baa+YWX5aLoMUFQ32mQGvmiqRLJqeQMA+YQ/0kBGG
         nG4V/dc/WuOXxNT7AqOKI3SGw0IDcnnOmQUljoQy3JwlvVxahlXdRn5EAaePVMzvq6E9
         Ga5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DyHmJqMwBFUTDUCLBa6xYcpZiFOVVP1mRqK8f17ZqlQ=;
        b=oJ9dfgMK8FDfNU6umrxvdDJBPg1AEgjP9MvHgu9YSr6i05xVwbxYvy86VCSQRAQ13P
         33un+15d5OPDPfCYo/bL0LxjXV2f7RS9ISpHLJ31RKY0anHZIAFK3hnkXTzUOPK6IlWL
         7z97iVB2N9FW8nrB4VbI+i9aWxCpRK35w3EQz2FEbyI0mPjNEzC1rizFuBO5rbeQBNDX
         wZcZHnmFxF/Wtp2DB17rf4EuSeq8PWW9wTx3C9ckLS/6qi3px/xvgqVCMFSDPadiqIMJ
         HeBIMdwwaN2i6OdedLoVxDKv3EewwLn/R8vO7VbLzPPMJ4jA5eiAppDiIo+iNEeE0C6Q
         x+Xg==
X-Gm-Message-State: AFqh2koByhNvCJT4f/AgGIbYMdEYmytNt6GQvTGPjGtlZED/XjlDjsaM
        HX8cFNLUrwNHGhmTHKeAELTBZA==
X-Google-Smtp-Source: AMrXdXtaUkfXq3/pXQqKV7l0Qid+mJyMwHrwTgiPlwkTGs86H4Do7vJZvJh904esgyxZHUHgnau53Q==
X-Received: by 2002:a2e:a54d:0:b0:27f:bc58:3926 with SMTP id e13-20020a2ea54d000000b0027fbc583926mr8113638ljn.43.1672591346531;
        Sun, 01 Jan 2023 08:42:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a2eb8c9000000b00267232d0652sm3055761ljp.46.2023.01.01.08.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 08:42:25 -0800 (PST)
Message-ID: <3dceb85f-1c1c-e8c6-1cc7-3c75f3f4c0b7@linaro.org>
Date:   Sun, 1 Jan 2023 18:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/adreno: Make adreno quirks not overwrite each
 other
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Emma Anholt <emma@anholt.net>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221229101846.981223-1-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221229101846.981223-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/12/2022 12:18, Konrad Dybcio wrote:
> So far the adreno quirks have all been assigned with an OR operator,
> which is problematic, because they were assigned consecutive integer
> values, which makes checking them with an AND operator kind of no bueno..
> 
> Switch to using BIT(n) so that only the quirks that the programmer chose
> are taken into account when evaluating info->quirks & ADRENO_QUIRK_...
> 
> Fixes: b5f103ab98c7 ("drm/msm: gpu: Add A5XX target support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)-- 
With best wishes
Dmitry

