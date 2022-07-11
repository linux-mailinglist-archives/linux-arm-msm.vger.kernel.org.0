Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D7C570D65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 00:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiGKWcy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 18:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbiGKWcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 18:32:36 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC5C5D0E0;
        Mon, 11 Jul 2022 15:32:35 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id u6so6116249iop.5;
        Mon, 11 Jul 2022 15:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X+/dfQuZ6Dq9LOalmbX3YzG6ELWGuiqTAy4W7p9HQHg=;
        b=ezZKIdu34th4hdzW/31N0SZtmJ54F2E/Sig4MmFDgd/SiyDW/CJVSH2Kq5UaqzZM+i
         +4XcmzgkhmUQZGsWFjYYndAHpCOxm7AM33sj6Ym0V1fUbg2C227LVns4nVBigK+joVj1
         tYjGoqDoQ3sAvZOzqX03J59czzcVlGsyCxhGvjhjGsA+DeXI9CDSV8P2KKV05UCT8TJT
         eLqR4UNVJY8GtbuSAcardgD5Y92X4bVmBWfs8CjVvamZHQTblNaTRnQaED1PcOn0+VMz
         0v8Vllx3v9uT3oYRTtziJJrxYQuwUEhDeMH8CJw5N2L1vKMy4QH7hcFhHUXNEuGLv8b2
         Lodw==
X-Gm-Message-State: AJIora85hsgJE6vMJuvm0ifLLu//Owfl1oOp6C8KlFeMk76Mqln81yo5
        byGzvksXp/hJV1Dghq1U2Q==
X-Google-Smtp-Source: AGRyM1vhHAS/3aRq73FiRFvS/dJB++zCReLpfq2fVzC7WoZqdf9vOwvvdOeeRJTqUSNFZAiugwoDfA==
X-Received: by 2002:a05:6638:1a13:b0:33f:1f32:6248 with SMTP id cd19-20020a0566381a1300b0033f1f326248mr11385741jab.53.1657578755033;
        Mon, 11 Jul 2022 15:32:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s3-20020a056602168300b00678b7e2e040sm4141709iow.7.2022.07.11.15.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:32:34 -0700 (PDT)
Received: (nullmailer pid 389702 invoked by uid 1000);
        Mon, 11 Jul 2022 22:32:33 -0000
Date:   Mon, 11 Jul 2022 16:32:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     shawn.guo@linaro.org, jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, konrad.dybcio@somainline.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add
 clock-output-names
Message-ID: <20220711223233.GA389646-robh@kernel.org>
References: <20220707150933.1889371-1-bryan.odonoghue@linaro.org>
 <20220707150933.1889371-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707150933.1889371-3-bryan.odonoghue@linaro.org>
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

On Thu, 07 Jul 2022 16:09:33 +0100, Bryan O'Donoghue wrote:
> Add clock-output-names as optional so that SoCs such as the msm8939 which
> have multiple a53 PLLs can latch the appropriate output name in
> drivers/clk/qcom/apcs-msm8916.c.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
