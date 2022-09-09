Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 621295B3CCD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiIIQQ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiIIQQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:16:55 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC36525FD;
        Fri,  9 Sep 2022 09:16:54 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-127f5411b9cso5153999fac.4;
        Fri, 09 Sep 2022 09:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=xlFFSOmL2Kg7d5JhqS1CuSA0YXH/t62smEQBhYJZXcE=;
        b=e7pJ0DLcDlhHx+L1sxNmsrkydOvLvaSQDxnhmROTanCPeoXZiFFEmt1gK/D04oxOTF
         Ic4zRr6vtKn5x3KfUZbf9RVfTCDWvRnRiWjEOEl/oQfXkccb+bqjd1Cz8/qEkp/Qv21a
         tgg6jZ03wnsh6VtY48XJv6RDnLqEKXxt/Jm/Z1es9ZCebl0UBajxn63z4lBtVuTjM3/T
         nrg24K6JQTyKj+iopcaqcAnDQG1xFV+InKWZpnF/ZVtztxxwSuWVrBAziXmMlS9g4dNN
         gpnWSCkes+Z7d8j6ZmpIhDZEJ1OYGTUeWcAOGVQeysF+xgBUxYXLa4+WK0R0G1Aj5oRK
         5BpQ==
X-Gm-Message-State: ACgBeo329udLEuxMQnuEvxVIW3l8j8EjoMo1vHE3i6tC2i15Qr/06DHj
        9kpPXszj1NNjicpdnYeQCA==
X-Google-Smtp-Source: AA6agR6FjeNPJpiQyU8SWVHCL1E0ufnFpNOjvgQWXz133s4R1ZwGtn0kH8BBE6egrbFH0lo632aPyw==
X-Received: by 2002:a05:6870:4727:b0:126:e6:3848 with SMTP id b39-20020a056870472700b0012600e63848mr5162213oaq.60.1662740213861;
        Fri, 09 Sep 2022 09:16:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870818600b0010d7242b623sm560178oae.21.2022.09.09.09.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:16:53 -0700 (PDT)
Received: (nullmailer pid 1449252 invoked by uid 1000);
        Fri, 09 Sep 2022 16:16:52 -0000
Date:   Fri, 9 Sep 2022 11:16:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
Message-ID: <20220909161652.GA1448908-robh@kernel.org>
References: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
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

On Thu, 08 Sep 2022 20:14:32 +0200, Stephan Gerhold wrote:
> Similar to qcom,glink-edge.yaml the smd-edge can also contain
> apr/fastrpc nodes for functionality exposed by the modem or audio DSP.
> 
> These nodes are already used in existing device trees, adding them
> fixes the following dtbs_check warnings after converting
> qcom,msm8916-mss-pil to DT schema:
> 
> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: remoteproc@4080000: smd-edge:
> Unevaluated properties are not allowed ('fastrpc' was unexpected)
>   From schema: remoteproc/qcom,msm8916-mss-pil.yaml
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> Since qcom,fastrpc.yaml only exists in Rob's tree right now and
> a similar change for qcom,glink-edge.yaml was applied there it is
> probably easiest if this patch goes through Rob's tree as well.
> ---
>  .../devicetree/bindings/remoteproc/qcom,smd-edge.yaml  | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Applied, thanks!
