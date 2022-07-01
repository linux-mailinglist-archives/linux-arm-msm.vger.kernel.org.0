Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A3B563B9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 23:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbiGAU4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 16:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbiGAU4J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 16:56:09 -0400
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFA75A2F6;
        Fri,  1 Jul 2022 13:56:09 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id v185so3351389ioe.11;
        Fri, 01 Jul 2022 13:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jsHTPyFmq7Sy/mfOS5zfc7d0iulgz+NtZu6W3N5zRAo=;
        b=hIJZy1MDksUQxHXd9Gwnn0/XdNFSVUAW+cDNkRC7/G4YrcXqzvQ8o1GArLIiPP0gcX
         LuvVMf/Xbwua1+fmwTIdbdJR5Ml+69w1wA5ENnENrQDb3hZLoHoRQsnbCgWEAOwqO1Oz
         CdDCuO1qqlwRs8YMWrhalzM8K2l/jcsCVX1Bk9j5yk7fJ7LKRjZngfaegKagazdVwU7x
         7LHlcdNCd86vxi7oHyCGmZdzwcVS01Yotu6HtUVQMNWjMvzEN8WhOzEy+R0Uumexwz9X
         gvC7vRvtodX/yPqder8M8Jt+UadvFj2kNTNHTKiOJU3zxnQ0LcbzgOvwX7IpaoaIrSzt
         K9NA==
X-Gm-Message-State: AJIora/AkOJc+teErlRggylR90ILiv+zkAJgC9oCkkN3SMgM/HUBP0dD
        0J1p8PbfvgzAj/RyZRQvig==
X-Google-Smtp-Source: AGRyM1tWhOAMhI/G1nHCHB8F/0l+0sNkNKm/PicJFZKRwQLIspy5H3+uNzWMeIU5aGdMVpyuHMpTGg==
X-Received: by 2002:a5d:984a:0:b0:675:7a87:d7bd with SMTP id p10-20020a5d984a000000b006757a87d7bdmr8657261ios.115.1656708968694;
        Fri, 01 Jul 2022 13:56:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n6-20020a92d9c6000000b002da835550fbsm7119497ilq.33.2022.07.01.13.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 13:56:08 -0700 (PDT)
Received: (nullmailer pid 1513930 invoked by uid 1000);
        Fri, 01 Jul 2022 20:56:06 -0000
Date:   Fri, 1 Jul 2022 14:56:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, cw00.choi@samsung.com,
        myungjoo.ham@samsung.com, stephan@gerhold.net, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus
 definitions
Message-ID: <20220701205606.GA1513870-robh@kernel.org>
References: <20220701100405.3586820-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701100405.3586820-1-bryan.odonoghue@linaro.org>
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

On Fri, 01 Jul 2022 11:04:05 +0100, Bryan O'Donoghue wrote:
> dts validation is throwing an error for me on 8916 and 8939 with
> extcon@1300. In that case we have usb_vbus but not usb_id.
> 
> It wasn't immediately obvious if there was a valid use-case for the
> existing code for usb_id in isolation, however discussing further, we
> concluded that usb_id, usb_vbus or (usb_id | usb_vbus) are valid
> combinations as an external IC may be responsible for usb_id or usb_vbus.
> 
> Expand the definition with anyOf to capture the three different valid
> modes.
> 
> Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
