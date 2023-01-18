Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4EF6721A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjARPnw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:43:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjARPnu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:43:50 -0500
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3497298;
        Wed, 18 Jan 2023 07:43:49 -0800 (PST)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1442977d77dso35871547fac.6;
        Wed, 18 Jan 2023 07:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukaT+V3Vb1FjUPkT6hZm3l611ylAlOtjFyDVedo3F+c=;
        b=YbSsy/aAF744r07bnAc2GEEzS5HihZmK81pW03rHMdEvBjKaHoll65YUoS1ML+mnOo
         SfDhmyvM8GZd5LgM2nX2HNTpReojP3C5drz7SUKTOjDmVob7Czsjcbd1nWbTXpVRb+Q+
         E1fy2zKr7AbaoZXLt33ZHGGit/7FzbqVAC8QwAfl8RWE8OPBH7WUlPtg0ueaINSxLwAO
         klNuliDw9wYsaXP/fj1TTGrV8jRFy+KuMLsq2eiCuNs0tWVRdlfQGgRgfqRhi9s8Sivo
         t2UU8AtTmFjd5BzyOvZP7GRbaewjayT8J1hbmRJz2QAKQQ5fKNLe0IqcKZT7HtrEARLX
         dhPA==
X-Gm-Message-State: AFqh2krDTWf8+lJmVmg6zy1FTf7Yfv6+hKLYav8vjqMf0SzPFQQXM9cv
        SVWRAT7ZaOSkSrpu5hl/hA==
X-Google-Smtp-Source: AMrXdXslFOXnulpQe6RkBP46QyXxTX6HLS26sNC2/1L4zrMl2+ezht2EDmducLgMXaHjrnnLaD3ijg==
X-Received: by 2002:a05:6871:1c9:b0:15b:96af:50ac with SMTP id q9-20020a05687101c900b0015b96af50acmr3913424oad.29.1674056628728;
        Wed, 18 Jan 2023 07:43:48 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id r10-20020a05687032ca00b0014ff15936casm18355779oac.40.2023.01.18.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:43:48 -0800 (PST)
Received: (nullmailer pid 54719 invoked by uid 1000);
        Wed, 18 Jan 2023 15:43:47 -0000
Date:   Wed, 18 Jan 2023 09:43:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, Andy Gross <agross@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v7 04/11] dt-bindings: display/msm: rename mdss nodes to
 display-subsystem
Message-ID: <167405662664.54658.957028337731224500.robh@kernel.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
 <20230118041243.1720520-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118041243.1720520-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 18 Jan 2023 06:12:36 +0200, Dmitry Baryshkov wrote:
> Follow the 'generic names' rule and rename mdss nodes to
> display-subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Note, this patch might generate warnings in qcom,sm6115-mdss and
> qcom,qcm2290-mdss examples, but they have been fixed by the commit
> e5266ca38294 ("dt-bindings: display: msm: Rename mdss node name in
> example")
> 
> See https://gitlab.freedesktop.org/drm/msm/-/commit/e5266ca38294
> 
> 
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
