Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D9D56266B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 01:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiF3XGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 19:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiF3XGa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 19:06:30 -0400
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A655724F;
        Thu, 30 Jun 2022 16:06:28 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id p128so691518iof.1;
        Thu, 30 Jun 2022 16:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dJf2WYWpGf7ZUYdOKXvLNmyrEzQg826Cfl8/PV8rr18=;
        b=3RRPn26ZLl7zg36VtBpWKpwkpE8rr18bCcQCdWxdqh+3hDbCsAXO4Mj3hiVb4Gv3z7
         gcwmES2nUtT30KoFmAPJKXEIWCzIKilWNL/ZZn1Edpu6OS4BPQ4qzw4e4bM2YH5NEugB
         p4nqrWszOamuTR9DFvL5LuZgorH6D4iIuq0mt3EtFv8P3FoOQrzAm7lTzvqs0BcCxUm9
         kRpCpnsn3k2Cxpfwhzsgx/VOoT96ABe3iqjW4K/5lEH4sq/S7tDlq6Ueb8iuflExJxOq
         r35F4uitQ93wVoq0NQ0XVLPPyUUi+c0WncsfSIe4S6/k3cNZdaM2wLsJtQSNlnpjIUgN
         2FBg==
X-Gm-Message-State: AJIora/rH33ifRT/ITbUll7+0taImY4xV2SnmCsaLTLr7oUbqMacYkfs
        8usPDrHPcjudqYTo1WBknQ==
X-Google-Smtp-Source: AGRyM1uqhD4MCteCjyBXeR7G4tc9fN4rpz7F8ubkcDdON8CUqUcFR3Ch9h/GzVuts+BDi7npUGkssw==
X-Received: by 2002:a05:6638:3a07:b0:33d:1340:8ac4 with SMTP id cn7-20020a0566383a0700b0033d13408ac4mr3927832jab.113.1656630387939;
        Thu, 30 Jun 2022 16:06:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y9-20020a92c749000000b002d8fbf31678sm8449874ilp.82.2022.06.30.16.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 16:06:27 -0700 (PDT)
Received: (nullmailer pid 3497641 invoked by uid 1000);
        Thu, 30 Jun 2022 23:06:26 -0000
Date:   Thu, 30 Jun 2022 17:06:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 10/11] dt-bindings: display/msm: add opp-table to
 dpu-sc7280
Message-ID: <20220630230626.GA3497589-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-11-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625232513.522599-11-dmitry.baryshkov@linaro.org>
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

On Sun, 26 Jun 2022 02:25:12 +0300, Dmitry Baryshkov wrote:
> On sc7280 platforms DPU device tree node contains child object
> opp-table providing OPP table for the DPU. Add it to the list of
> properties to let sc7280.dtsi to validate.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
