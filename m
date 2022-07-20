Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C08657C03D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 00:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiGTWqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 18:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiGTWqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 18:46:11 -0400
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8761F13CF6;
        Wed, 20 Jul 2022 15:46:10 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id 125so57124iou.6;
        Wed, 20 Jul 2022 15:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7fJqAHYv/e5MRGfwQS2QwxmL0W6+8ciRB/YwHGWHQFk=;
        b=VMM8r+XSwoUERuLHe3pAgYxHM7zsr851aE8TNrwfstEOMkDcXB9ARFBRSY1JCI1Q4J
         q8VeNQ0z56Fe7RC2tWioMkwbPT7mu3+Apo1HlrS73ugfODnlvLR0SkTlp1YV3DbYT4xw
         III54UGyPpR/fFcaW64A7IjXOBf8+l66fcsmffNG0tPROyZCSn44uYAPqHY97gsTdukL
         RpzGs0RPPbUbaNM9jqSvoaKtlB+ZGAKyGrjwphJ/ypo019bR1lfX7EQ3v2FKjdRsyEyB
         GPuM9+CQyxPTv2ExzJqk2lDMr/p1cbHZvpkB8TCIXXlKSiH2q4krF1DMAnyFPGjBtrOp
         CZvQ==
X-Gm-Message-State: AJIora+oS0gFGwuhXLLvKCj+WwLwo7IH+JuesNiqMICoPG8NgL/JwODl
        lIO99LeP0D/FqmAJxeNybA==
X-Google-Smtp-Source: AGRyM1sMJiRBS/KvsrXJPU6XhiUJ7qH5dRdaof9vxE2dzv6IVnCLk1o/OGzQuanFv/qLBna90S6X1g==
X-Received: by 2002:a05:6602:2d4f:b0:67b:f7c9:a3e with SMTP id d15-20020a0566022d4f00b0067bf7c90a3emr9887172iow.77.1658357169768;
        Wed, 20 Jul 2022 15:46:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id i20-20020a023b54000000b0033f4b1c2151sm53341jaf.154.2022.07.20.15.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 15:46:09 -0700 (PDT)
Received: (nullmailer pid 4120175 invoked by uid 1000);
        Wed, 20 Jul 2022 22:46:08 -0000
Date:   Wed, 20 Jul 2022 16:46:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916
 to schema
Message-ID: <20220720224608.GA4107504-robh@kernel.org>
References: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
 <20220718140344.1831731-3-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718140344.1831731-3-stephan.gerhold@kernkonzept.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 18, 2022 at 04:03:41PM +0200, Stephan Gerhold wrote:
> qcom,q6v5.txt covers multiple SoCs with quite different binding
> requirements. Converting this into one DT schema would require
> several if statements, making the DT schema overall harder to
> read and understand.
> 
> To avoid this, follow the example of SC7180/SC7280 and split
> "qcom,msm8916-mss-pil" (and the equivalent deprecated "qcom,q6v5-pil"
> compatible) into a separate DT schema. The schema is somewhat based
> on the one for SC7180/SC7280 but adjusted for the old platforms.
> 
> Compared to the old plain text bindings, add missing documentation for
> the "bam-dmux" subnode and recommend one particular approach to specify
> the MBA/MPSS "memory-region" (the other one is marked as deprecated).
> 
> Cc: Sireesh Kodali <sireeshkodali1@gmail.com>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> Changes in v2:
>   - Add blank lines between top-level properties
>   - Drop "deprecated" in "oneOf" list, it is not clear if this is valid
>     and it should be redundant since the properties itself are already
>     marked as "deprecated"
> ---
> Like Sibi's patch series for SC7180/SC7820 [1] this is somewhat related
> to Sireesh's series that converts all of qcom,q6v5.txt [2] (with a lot
> of if statements). However, this series focuses on MSM8916/MSM8974 (or
> actually MSM8909) only.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/1657020721-24939-1-git-send-email-quic_sibis@quicinc.com/
> [2]: https://lore.kernel.org/linux-arm-msm/20220511161602.117772-7-sireeshkodali1@gmail.com/

Is that one abandoned or do we just get to review both approaches 
without coordination?

I think you need a common q6v5 schema here with all the common 
properties. Having the same property name with the type defined multiple 
times is not great. In fact, I'm working on a check for finding those.

Rob
