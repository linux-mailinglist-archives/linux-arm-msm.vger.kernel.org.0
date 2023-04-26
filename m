Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B52C6EF65B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Apr 2023 16:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241330AbjDZO0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Apr 2023 10:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241122AbjDZO0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Apr 2023 10:26:03 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51570729B
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Apr 2023 07:26:02 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-2fe3fb8e25fso4477271f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Apr 2023 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682519161; x=1685111161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfmaskdBjQn3V5pOU3nprV90+II0lcnGqRpRtitTHfw=;
        b=ejTmsmGfYQfwJCYh6kZezZgGeKRbb0HzEjKYT/IboF11o/HdoNgxLOpZAZsrm2vC8i
         ia7HvN71f04tSXEL5MQS74Sj/NqB3UZVN+My+uY8NpNR/2NNeFyWPchfQsGGPM0q0buZ
         PVkLzJMvIyL1wg7fKdzDsyuBvSiH+/DkkcLbpEIlAjDxQ8roicZVcMkrcN6FQjge62Zo
         OFkCa2wn8c+SIBktB+C5PVCj2dzNBZBKNQEqz0YBr319hwWwHXOHCLctdzsx4camiqS/
         dZwfnuPLy2GpXpLBsQdyMyOx0dN9Y4lpDqmg/RZG+jjCVPVOaKeRztbWkF/Gai8OskA9
         vKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682519161; x=1685111161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfmaskdBjQn3V5pOU3nprV90+II0lcnGqRpRtitTHfw=;
        b=SYTepSqIyMURWMP+eJN9iHbCv2LxY4v0bY8b//ayZvR0NPw9uPZuwjEwUexsmlWewE
         i2VywCPZDuibTIWDWB+gDcXqZOFzBx6o4d7N0X9YDEn1/m08vAbFPFAfPncpd0cuEr4e
         JxPvIW2Nccx+DNEBeZ+1HbQVUkZL8D2euxd33xi71Eh4B+K5/4Cub+XSEke5sZgiYPxH
         gmhiZwlRHQUvtHtryJo7RqEpAq+iXJJIqWooyy0OJ/amzc13cJIUU2AchqwriJ9ZSY5K
         cDdJyns4g2BRiRC2dqFFJJtEf4uwr37vBlDE+18AaGC/5Iem6qJ+Y/5tSXaWrOu8aRsC
         VhSg==
X-Gm-Message-State: AAQBX9dh3x94X9Gss7HjOt8YllQieO+goNqdlcK10SZE+NyQQ0UpgkSW
        hIJpSSzIa7zPfMTM1RaOTLn+jA==
X-Google-Smtp-Source: AKy350azFtxzLU/AHkuy/1AtdTBiM0pSm/amOMmVdp7ABZ+fS+j9uw2EfwnjcnvcZ0si6esLY5S6Ww==
X-Received: by 2002:a5d:6708:0:b0:2f5:8116:6458 with SMTP id o8-20020a5d6708000000b002f581166458mr14728187wru.66.1682519160710;
        Wed, 26 Apr 2023 07:26:00 -0700 (PDT)
Received: from linaro.org ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id m4-20020adffa04000000b002fe96f0b3acsm15944215wrr.63.2023.04.26.07.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:25:59 -0700 (PDT)
Date:   Wed, 26 Apr 2023 17:25:58 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] phy: qcom-qmp-combo: Support orientation switching
Message-ID: <ZEk0dnfoV9IlHlyt@linaro.org>
References: <20230425034010.3789376-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425034010.3789376-1-quic_bjorande@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-04-24 20:40:03, Bjorn Andersson wrote:
> This adds support for USB and DisplayPort orientation switching to the
> QMP combo PHY, as well as updating the sc8280xp devices to include the
> QMP in the SuperSpeed graph.
> 

Tested this entire patchset on my X13s. Therefore:

Tested-by: Abel Vesa <abel.vesa@linaro.org>

> Bjorn Andersson (7):
>   dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add ports and
>     orientation-switch
>   phy: qcom-qmp-combo: Move phy_mutex out of com_init/exit
>   phy: qcom-qmp-combo: Introduce orientation variable
>   phy: qcom-qmp-combo: Introduce orientation switching
>   phy: qcom-qmp-combo: Introduce drm_bridge
>   arm64: dts: qcom: sc8280xp-crd: Add QMP to SuperSpeed graph
>   arm64: dts: qcom: sc8280xp-x13s: Add QMP to SuperSpeed graph
> 
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  51 ++++
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  28 ++-
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  28 ++-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  34 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 227 ++++++++++++++----
>  5 files changed, 309 insertions(+), 59 deletions(-)
> 
> -- 
> 2.39.2
> 
