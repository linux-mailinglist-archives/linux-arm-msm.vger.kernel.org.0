Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4078A570D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 00:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbiGKWcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 18:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiGKWb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 18:31:58 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B735D5508E;
        Mon, 11 Jul 2022 15:31:56 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id p128so6315871iof.1;
        Mon, 11 Jul 2022 15:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2HDZ/g/L4L8Mu4j/+/gfX6YW3AXyQsXVB04cFj4sl5o=;
        b=yjQ9Zxdv6AEmmmFllao2vzW+CqESC4z479cNqFvm0vjrVnjeO2RA/bmxnZhoBe2Jym
         dhMRWjyyWNpp3+lMzCCQPSLx4KaYtrWM2oKCCVG671Eafnd0edS5sDoEqotTQCPUP+Ti
         A1skfsviKrnB0bHffb1SneUQbc5lvJgno/ZK542aSJ9TzC5cwW3CIm7KPDEHoTuJmdMD
         Xwp5cQefCvTAyrU6LkFYWHIMYD4vS1QZ/dtggp4ocuuwQIB+uIn6ipAUKPb8wq3Pk6CB
         KgVzj2dg9/d6RjDUBRhGLnETTSqozs3pKWcbRqkV03p03Q6RDMy8M1tXF5HhM32pI6WA
         k8eQ==
X-Gm-Message-State: AJIora9sFmxKI2wIEyLg2p/umc+fAE46NlO7USsgk+uck7uXN/mtETHn
        Tj2pNXn5FMzyj5SXe9dhZA==
X-Google-Smtp-Source: AGRyM1tX5qfUNZQKNMwx106ge/8+5UKVYFsgg1ju7nkV5Mfw8Bo3q35gV95KdTYFp3jb71VB/RMWHQ==
X-Received: by 2002:a02:c984:0:b0:33f:3c79:8918 with SMTP id b4-20020a02c984000000b0033f3c798918mr8589407jap.270.1657578716011;
        Mon, 11 Jul 2022 15:31:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j10-20020a02cc6a000000b0033158c4a312sm3318225jaq.55.2022.07.11.15.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:31:55 -0700 (PDT)
Received: (nullmailer pid 388681 invoked by uid 1000);
        Mon, 11 Jul 2022 22:31:52 -0000
Date:   Mon, 11 Jul 2022 16:31:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, shawn.guo@linaro.org, jassisinghbrar@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add
 syscon const for relevant entries
Message-ID: <20220711223152.GA388648-robh@kernel.org>
References: <20220707150933.1889371-1-bryan.odonoghue@linaro.org>
 <20220707150933.1889371-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707150933.1889371-2-bryan.odonoghue@linaro.org>
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

On Thu, 07 Jul 2022 16:09:32 +0100, Bryan O'Donoghue wrote:
> msm8916, msm8939, msm8953, msm8994 and qcs404 already declare or should
> declare syscon as they have drivers that use syscon inside of the apcs-kpss
> block.
> 
> grep apcs arch/arm64/boot/dts/qcom/* | grep syscon
> 
> Add in the additional syscon in the documentation for the above mentioned
> parts.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 46 ++++++++++---------
>  1 file changed, 25 insertions(+), 21 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
