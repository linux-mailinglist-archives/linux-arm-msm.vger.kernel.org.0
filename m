Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80185072F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 18:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343938AbiDSQeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 12:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiDSQeW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 12:34:22 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D422026104;
        Tue, 19 Apr 2022 09:31:39 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 12so18666374oix.12;
        Tue, 19 Apr 2022 09:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MCwo7DGqBQCKp4JI4emM4uu1enKdCNTOXjY11292Ytw=;
        b=rDbEJ4QDgQwLzNmImCj0VnbThnldS0Hrv1I57wmSJizUzF0K/q3/K0fRm8D14/O1aH
         bAJAYUTccijty70mZthrBjybw/xo3cSXSYNNWUgWPi3tItzusfl6p5JrqWnLpHuH23xG
         d0BPcdaxuoO+fUK10IdeMo6n9hW/47E4nPhlZVGja88KRnzyZd8yMxSTKzXuEhN3aHFU
         xbrnms9l/BZzdlrnkZl163N6S67mBhOv4xC69OuGf8l1T884d4m+psw/oxr2jdNi9YD+
         e4nank/KoRYUzjr+bovvJQRJJy1S8my9XhT4ID/a+TOndochCQS2jcWMfiakGfH5Vxyo
         t2PA==
X-Gm-Message-State: AOAM533oaVH8Scl/LgFXbdWPWPCJAUSFKGX705qo0kFzy3JkbeZJAfy+
        FbvkYxuRx94IgyWPq1uDjUth0fQZoA==
X-Google-Smtp-Source: ABdhPJysuK3Y5yzRvHHcTEYlSN35k2U0+yXUEb4ZKSgONUNKu8LtTfgN7S4IK19flO2JIEe6ew/iFw==
X-Received: by 2002:a05:6808:347:b0:322:6053:ba4d with SMTP id j7-20020a056808034700b003226053ba4dmr7140692oie.295.1650385899190;
        Tue, 19 Apr 2022 09:31:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k14-20020a0568080e8e00b003224d35c729sm4425462oil.3.2022.04.19.09.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 09:31:38 -0700 (PDT)
Received: (nullmailer pid 2899056 invoked by uid 1000);
        Tue, 19 Apr 2022 16:31:38 -0000
Date:   Tue, 19 Apr 2022 11:31:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: smd-rpm: Fix missing MSM8936
 compatible
Message-ID: <Yl7j6n0hvN9ND2F6@robh.at.kernel.org>
References: <20220418231857.3061053-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418231857.3061053-1-bryan.odonoghue@linaro.org>
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

On Tue, 19 Apr 2022 00:18:57 +0100, Bryan O'Donoghue wrote:
> Add compatible msm8936. msm8936 covers both msm8936 and msm8939.
> The relevant driver already has the compat string but, we haven't
> documented it.
> 
> Fixes: d6e52482f5ab ("drivers: soc: Add MSM8936 SMD RPM compatible")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
