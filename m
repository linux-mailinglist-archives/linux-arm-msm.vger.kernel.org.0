Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6D051CB9B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 23:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344061AbiEEVyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 17:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245484AbiEEVyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 17:54:10 -0400
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146EA3B547;
        Thu,  5 May 2022 14:50:29 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id c5-20020a9d75c5000000b00605ff3b9997so3818460otl.0;
        Thu, 05 May 2022 14:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GamJ/l/RmrXyjJkKVpT8+cS0nZD1kxYuueRTHFM/AHw=;
        b=VbFOItWulArwv2vuf/0enxVGbegr/tRx3sd+43cgFcpR8lVc8bMEOfoCrzYy++a/ds
         XXjtQd7pCex/bBrx8DQDrq5MNTFAtAJmy3wn5hDNG09RpXTF7hEhUMiMhLYriuXDRBmY
         Z/3HfuI0d6mzveX9uEWEiTlg1GGw49FfshBgg5IbJi8vUxHlJ/TYW4D9NlpHyLyKtWtr
         NLMJTdtvvwmQLbNizV9pjkdiCxFmPmUprj7Df8Gi1yQPOm3mf/vtj88xqj/NpXK0CeNA
         7+H7dACBbn64qJqoIs0pZbBPfY6DPkQppr4AqW2lXru4yLOqnHC+TRRXpOwuhY7ubanR
         co7Q==
X-Gm-Message-State: AOAM532fUc5Vu7JXrROznkD/2KiJdi12hfJxXmZXuIhAhUC4sp9PIbVl
        wk4ijOAXMbvJsb22BObTLmdRCMhMDQ==
X-Google-Smtp-Source: ABdhPJyw2OZojfrwTZkE7UzCEPW3jLRPRO22Xs230qHkYMlb7hwvfUIyusCROmwP5/ICTt+T/CITTw==
X-Received: by 2002:a9d:1b6a:0:b0:605:5d7d:92cd with SMTP id l97-20020a9d1b6a000000b006055d7d92cdmr92930otl.121.1651787428366;
        Thu, 05 May 2022 14:50:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cv39-20020a056870c6a700b000e686d13889sm918111oab.35.2022.05.05.14.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 14:50:27 -0700 (PDT)
Received: (nullmailer pid 253104 invoked by uid 1000);
        Thu, 05 May 2022 21:50:27 -0000
Date:   Thu, 5 May 2022 16:50:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: add QCOM SM8450 camera clock
 bindings
Message-ID: <YnRGoypIFbV5S3c/@robh.at.kernel.org>
References: <20220505121213.4121802-2-vladimir.zapolskiy@linaro.org>
 <20220505181317.4125934-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505181317.4125934-1-vladimir.zapolskiy@linaro.org>
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

On Thu, May 05, 2022 at 09:13:17PM +0300, Vladimir Zapolskiy wrote:
> The change adds device tree bindings for camera clock controller
> found on SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v4 to v5:
> * fixed a typo in a usage example found in the yaml file.
> 
> Changes from v3 to v4:
> * renamed a filename in $id value after the rename of the file itself.
> 
> Changes from v2 to v3:
> * renamed files to match the compatible value "qcom,sm8450-camcc",
> * fixed a typo in a usage example found in the yaml file.
> 
> Changes from v1 to v2:
> * updated qcom,camcc-sm8450.yaml according to review comments from Rob,
> * changed qcom,camcc-sm8450.h license to dual one.

Please don't send 1 patch of a new version. Send the entire series. 
Otherwise tools and maintainers get confused.

Sending 3 versions in a day isn't great either. Give folks time to 
review all the patches.

Every version you've sent until this one has had errors you should have 
found yourself at least after the first time. My bot is not a free 
testing service, it runs on my machines and I review the emails before 
sending.

Rob
