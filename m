Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD832661A13
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 22:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236101AbjAHVhZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 16:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236195AbjAHVhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 16:37:04 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043D22DFF;
        Sun,  8 Jan 2023 13:37:04 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id p17so5013051qvn.1;
        Sun, 08 Jan 2023 13:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VyZFAdbVKZG6wcddJqsDrMtHKYmEkYfo1SJkK0xxm4=;
        b=qCE5n/PKnFzKZwRpmLOHpB1FCb0vmGTwnWDdcUzLbERGYBDr0jns7rgGtnyXJeaG8o
         4FxAog7L8ohZXt8xmULNkB6fKB8WweiEBZ3a4zC/dxJE+YZRhB8tb/20cU2EdLHSEoxJ
         XpClrr1reL2GrRH9ZU9BUnrJy2HSILqDh31PJkR2VccEDSloeJ1WsrJ/yNUoyI+lkTrc
         mc0OF+yevRO5ifXWh3iaMUi9cBxlyFP3STRpr+E3Uc0VEOJPmQCnj1+q67PfKknWWE5I
         MxvavpPEAOsBVllLEdcFyp6fcaljWDUPeRpE4RYkZBFFVcZdNtnhltl56owVDeYdNzig
         tJ0w==
X-Gm-Message-State: AFqh2kqf0f70/R8PDeT3Psp6QHLZouTKB+W2Q5fZKFEitzmqpwoN55PQ
        gqmK1Jf5hHRhxDMtpYyBLIcPUU3kNQ==
X-Google-Smtp-Source: AMrXdXuPvUKuDNGKU6OcOXMWXnzDSYYt1g7mcimYedVJjIqe5idBdZnsxx/KJwN3omt6KWTgHi2img==
X-Received: by 2002:a05:6214:3986:b0:516:4770:1a4e with SMTP id ny6-20020a056214398600b0051647701a4emr86112257qvb.14.1673213823041;
        Sun, 08 Jan 2023 13:37:03 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80a5:9b51:39ae:24d1:33f3:811e])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a244900b006fc2cee4486sm4303715qkn.62.2023.01.08.13.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 13:37:02 -0800 (PST)
Received: (nullmailer pid 312452 invoked by uid 1000);
        Sun, 08 Jan 2023 21:36:54 -0000
Date:   Sun, 8 Jan 2023 15:36:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom,ids: Add QRD board ID
Message-ID: <167321380777.312200.81545477696057969.robh@kernel.org>
References: <20230104115348.25046-1-stephan@gerhold.net>
 <20230104115348.25046-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104115348.25046-3-stephan@gerhold.net>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 04 Jan 2023 12:53:46 +0100, Stephan Gerhold wrote:
> QRD (Qualcomm Reference Design) = 0xb = 11 is used on many devices that
> were originally derived from some reference design provided by Qualcomm.
> 
> Examples of existing devices in Linux would be:
>   - msm8916-longcheer-l8150/l8910, msm8916-wingtech-wt88047
>   - msm8953-xiaomi-daisy/tissot/vince
>   - msm8998-fxtec-pro1
>   - sm4250-oneplus-billie2
> 
> Add it to qcom,ids.h so the qcom,board-id properties can be rewritten
> more clearly using the macros in a future patch set, i.e.
> 
>   qcom,board-id = <QCOM_BOARD_ID(QRD, 1, 0) 0> instead of
>   qcom,board-id = <0x1000b 0x00>
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
