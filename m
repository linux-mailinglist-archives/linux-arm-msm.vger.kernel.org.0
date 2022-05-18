Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C0A52AF5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 02:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbiERAuQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 20:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbiERAuP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 20:50:15 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3DE50E1B;
        Tue, 17 May 2022 17:50:14 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-e656032735so851702fac.0;
        Tue, 17 May 2022 17:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M8YodSaIL3XIguJqnjKaQ29DnOe9L7t1qut8wR8S8QE=;
        b=JTT2VKf6hMmt5gKKmMBadqDHvXTfF4tbPNbFRzpckibRQb3O30x4rGDvxeqQjbUXT9
         oj+OHYO3NlO8MIqwt8/SlhvhHmuQ/vuE/UVlvw5raY6DN0VbYcyIid0Ld8OiyABFEcMb
         3hCqSjpyXFPt3AI7CHEWlFMdeNPTzid8VGNql5kCrm15mitguyc4MZrsx45teYRTB9wD
         EpxNUryE6HO89j0oq8sSM8l+xuAembTvUKB9Pz8UDuR4yyDANNswTQ2L1/1SpB5EEMsD
         RZE5h0+/Yq6U6sxQe8+1ZMFqQlQlKpexrGl0mnt9ne/uvvxeZNEZRy9R2TATXBrGs2dm
         iGbQ==
X-Gm-Message-State: AOAM530RX2DMiZpZ1HDZyl4W/H8xdztxUP7J3SmcNtitAuhiPd+gWGif
        ZPVCtYuggPpwy6XCkrgY4fc6EQJgsQ==
X-Google-Smtp-Source: ABdhPJyZA2Z6t2d7NfNhgqyjSBJru9fkgwJG1XW1yLn2pUBGKck8A+rGtXlzQvocyzSzRzziWNgXGg==
X-Received: by 2002:a05:6870:618e:b0:e5:c2f3:e009 with SMTP id a14-20020a056870618e00b000e5c2f3e009mr13799500oah.10.1652835013717;
        Tue, 17 May 2022 17:50:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j8-20020a9d7688000000b0060603221281sm300612otl.81.2022.05.17.17.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 17:50:12 -0700 (PDT)
Received: (nullmailer pid 1970704 invoked by uid 1000);
        Wed, 18 May 2022 00:50:12 -0000
Date:   Tue, 17 May 2022 19:50:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: qcom: pas: Add SDM660 CDSP
 PAS compatible
Message-ID: <20220518005012.GA1970678-robh@kernel.org>
References: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
 <20220514000108.3070363-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220514000108.3070363-3-dmitry.baryshkov@linaro.org>
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

On Sat, 14 May 2022 03:01:06 +0300, Dmitry Baryshkov wrote:
> The Qualcomm SDM660 has the usual audio, compute, sensor and modem
> remoteprocs. Add compatible string and conditions for the compute and
> modem PAS.  While we are at it, also add missing conditions for the
> audio PAS.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
