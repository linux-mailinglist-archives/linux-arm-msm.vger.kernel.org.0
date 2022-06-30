Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9233562666
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 01:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiF3XFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 19:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiF3XF3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 19:05:29 -0400
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD5053EFE;
        Thu, 30 Jun 2022 16:05:26 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id r133so678337iod.3;
        Thu, 30 Jun 2022 16:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=StGBGoL887RV+pa/gU61O9aI/AKdQo+rQc4kYJWNvEs=;
        b=uZFxFyzlEzqQUrEf0Y2CyMWTmxq+bKeiopVct24BdpSJjs0kCnRV+mEetgbn056y4R
         fd+UpGgijlI2cQlfyXIxma+rgIPr+hU2UhxM6bMiQpNFwumgz1MNvFDzCkP5hpyJVDZn
         1jR+a0nMRvy6PW2l+BEp0mH+CXgvl6Dq+gwYj63kGL17VFihvvAXu14zF654KxyEE/rj
         js2L2EY/7zsw5zoVyLV1jVUBuAM2m8H7i9C/UTPf2nu9YqR8eJKAz+qlf5xYPMV5Kko1
         5f2fFdE6GNj4HzrhXBm32LacKxe6lQPVLJIUAJEC7hm3mNhY8x4oNLOKoak66bf+7mjJ
         Mm/A==
X-Gm-Message-State: AJIora/XExzTV6BQH1RKOFqHAzU8A0Pw3q+BDmzUKytYHG9AMHmGIE5I
        XOBLnrGanBXHonmPJzgkpg==
X-Google-Smtp-Source: AGRyM1v/aoxZAZ2Wd8c6Wfbrup41HjLkIz2dHcIR+iDZh4hon5mfkYSCCwYh1CwFlBDU3oLojlC+wg==
X-Received: by 2002:a05:6638:430d:b0:33c:d3e2:ab04 with SMTP id bt13-20020a056638430d00b0033cd3e2ab04mr5621513jab.319.1656630325460;
        Thu, 30 Jun 2022 16:05:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s12-20020a92d90c000000b002d92c91da91sm8526396iln.77.2022.06.30.16.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 16:05:25 -0700 (PDT)
Received: (nullmailer pid 3495873 invoked by uid 1000);
        Thu, 30 Jun 2022 23:05:23 -0000
Date:   Thu, 30 Jun 2022 17:05:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 06/11] dt-bindings: display/msm: move qcom,msm8998-mdss
 schema to mdss.yaml
Message-ID: <20220630230523.GA3494161-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625232513.522599-7-dmitry.baryshkov@linaro.org>
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

On Sun, Jun 26, 2022 at 02:25:08AM +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,msm8998-mdss from dpu-msm8998.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 142 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  25 +++
>  2 files changed, 65 insertions(+), 102 deletions(-)

Similar issues in the rest of these MDSS moves.

Rob
