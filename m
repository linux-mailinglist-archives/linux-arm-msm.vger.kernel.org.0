Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B003855E5F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 18:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347225AbiF1Oid (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 10:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346874AbiF1Oid (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 10:38:33 -0400
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923F7240A6;
        Tue, 28 Jun 2022 07:38:32 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id p69so13028291iod.10;
        Tue, 28 Jun 2022 07:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7CrZnSenKek654/97AlEV8LBLvyOsBKP8Iwz71p4ah0=;
        b=y8NKfZpt9/QoquGo8+AGxNHSsCduoDdQSyw1VpGdcgRJMCegmLB+W0Zy02ncwOHnc3
         8tCbJ6btXNSFKA+WUTmkN/HO/8ki7o9Go1CNdqA6iamCZl7d2fROA3OJU/W6Vvey9eg2
         n1sUaw0PntZSVPI/9KYzSxWbe/+0utc2EbH9P82uUeaS/9rLJj/CturlpW+qapEJQ9X3
         0z7FI0n4CiL3txbMQZNzJamUpiu3kur2zJahc1HYOsYBTfDaBsDMkx91/UC1qFIJdNhD
         RnPC4+Plmdlg6BReFYat9kmIcoaxqwSZAbdAdHUH1I+DgSKsV0arqV12lYt0kx8pNEVW
         bG5w==
X-Gm-Message-State: AJIora+aIOM6OOmSA6492g8L0VfTxdLp2tFyE6p+4z8jPQl7bbw5If3B
        8/JJSBh759kTF53W1PClN/lHrQZCqA==
X-Google-Smtp-Source: AGRyM1tHobz2HHZ9ZW7lmUlWJYgEIxqzEnozzVpJe3OIRiHCxfP+ZbuX9OIAJQCNim3DX5gCHqZOyQ==
X-Received: by 2002:a05:6602:27cd:b0:669:3d8d:4d77 with SMTP id l13-20020a05660227cd00b006693d8d4d77mr9655992ios.216.1656427111678;
        Tue, 28 Jun 2022 07:38:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id f9-20020a02a109000000b00339e3a22dbbsm6144706jag.21.2022.06.28.07.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 07:38:31 -0700 (PDT)
Received: (nullmailer pid 427504 invoked by uid 1000);
        Tue, 28 Jun 2022 14:38:27 -0000
Date:   Tue, 28 Jun 2022 08:38:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 02/11] dt-bindings: display/msm: move qcom,sdm845-mdss
 schema to mdss.yaml
Message-ID: <20220628143827.GA425727-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625232513.522599-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 26, 2022 at 02:25:04AM +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,sdm845-mdss from dpu-sdm845.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> While we are at it, rename display-controller node to mdp to reflect
> actual node name in the sdm845.dtsi file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sdm845.yaml      | 137 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml | 112 ++++++++++++--
>  2 files changed, 135 insertions(+), 114 deletions(-)

What's the base for this series? Patch 1 applied, the rest did not.

Rob
