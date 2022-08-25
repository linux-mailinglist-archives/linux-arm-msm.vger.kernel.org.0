Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B765A1A12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 22:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243294AbiHYULw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 16:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240732AbiHYULv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 16:11:51 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC91B99DB;
        Thu, 25 Aug 2022 13:11:51 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id d18-20020a9d72d2000000b0063934f06268so7905360otk.0;
        Thu, 25 Aug 2022 13:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Oj86uGkClNsnwE1dPgwe6HKsJXAs0gnD9U8fRVhpgYA=;
        b=unLAfDLm6C+V8xfIZwP0BaEG+Q97YcQVTaRnRLsxM0k324GbI2WxirFEXwygFAW288
         y8maztEC5P+MoaJU5+CFmLH0KvekY3NgM+6bM5ZncihRvNNm9GrsbK4/Tnd4TdYDpYTR
         +Wz1WDmwANf5JJIaBe7BFiPGMj6o7dM7iCVlpuU/PAMg8WE9nAk8bdflKJk/tVyu3MH0
         hmREpKgsGHvaKVHnxDO9cItbhtW3M8tBQK9yWF0kHkZaREtz0v2UxrMpDDbm7YwwaRii
         W7lfXEB74CAGAujaSSoq1AnMi3O+9SGWI+MfuD8+Eo5QbPMAA72Z1bnsVpH7qU2aGMk5
         BS0g==
X-Gm-Message-State: ACgBeo2UIDeOdMYwXoLR7y3H2jvNh2TWv5okCoB5ujOD5czh5NCXYDJE
        IqoGx6r083DO7xpNcM88bg==
X-Google-Smtp-Source: AA6agR5hwcOt2GSmumZQPTU+DdvLWeb8FIdquxqTRq407DHgvOQFNI+9yln3wmNE7EjAWVfmy4sDkw==
X-Received: by 2002:a05:6830:d7:b0:639:ac3:7a6 with SMTP id x23-20020a05683000d700b006390ac307a6mr276969oto.162.1661458310460;
        Thu, 25 Aug 2022 13:11:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y16-20020a056870429000b0010bf07976c9sm73446oah.41.2022.08.25.13.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:11:49 -0700 (PDT)
Received: (nullmailer pid 1610468 invoked by uid 1000);
        Thu, 25 Aug 2022 20:11:48 -0000
Date:   Thu, 25 Aug 2022 15:11:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 00/10] dt-bindings: display/msm: rework MDSS and DPU
 bindings
Message-ID: <20220825201148.GA1607980-robh@kernel.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 25, 2022 at 12:50:53PM +0300, Dmitry Baryshkov wrote:
> Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
> devices). Cleanup DPU schema files, so that they do not contain schema
> for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
> afterwards.
> 
> Changes since v3:
>  - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
>    dependin on the mdss compatible string.
>  - Added sm8250 dpu schema and added qcom,sm8250-mdss to mdss.yaml

My scripts tell me I reviewed these, but I don't really follow what's 
changed.

Rob
