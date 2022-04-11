Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061FF4FB4C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 09:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245379AbiDKHaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 03:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245364AbiDKHaG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 03:30:06 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3993CFDF
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 00:27:52 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id n8so13123037plh.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 00:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dPQb2XUhCwirAl6RZqcjJK++gcgif/8kvwh+CadUz3I=;
        b=vk8tSK2SuBtu1pR68M+NpcoBAAxowa3wJlU3AMOY72md1Hscl+QNeJNVcx10ejkuuV
         NKZxxgnF1yldlX2MkwYMlndhvYLdVpauINzM1OJe7Gm4Ja0ONJJ+moREvoB2tju7IFxG
         S2uciJD12fnvlOYAOjli/Oc0252AsxXr19m7FjVkfEfVt7d+4W8EhVfPiayUUIK55VO2
         1OYinPvHp8r7yCmeTFS6M61kgx9Sby11bwnsIxYHeJC71r9vlPUoCggPbNqj876PY8KC
         MZ55RMC5eFxv0ZOnQF7zxi+0Nfwm8wE7DR3hGUQhMy9kF/pIKmngY7NXMpyUPOcxegs5
         ID2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dPQb2XUhCwirAl6RZqcjJK++gcgif/8kvwh+CadUz3I=;
        b=10mz1ZsJNdn1zimGsGdFU0/ppI9GmEc8u5LvK7b+ltS5i1nU1XXlrHeHuQLvFlLsDW
         FXNDFVLHpBF8ZlB+QtIdNqZ9Mb9uXwxAk9TVc2OAr0CPr3Y/S7XmNg+LQlOWygNOkdd9
         R39X9YiaF1Fbf9S7lceVkmU5cCiLpoc8hEo/10xXCkyKlgUoCKdLoynNz9ci776Kwydz
         +oyIbDEupnKPSPGGfFE3i9uMJWPIl8oBNWNGdnRGoE7LunWKVrjQhLWk9IG9EEaSB7SY
         1w8/E8WfDO318CtCtSo1TJx+/jLeWbz5oQCpemhLuhlByZphXHIMqe+1zAm6iJpKFBvL
         bi5Q==
X-Gm-Message-State: AOAM5322zKCpHemEjTnyf01CBco9UddNiY0u6bJ4XX+ml0qwVSmVEIEd
        LmhID4IHgxVeKPe/R2UExsN4
X-Google-Smtp-Source: ABdhPJwfZOmz7bn126D73jA4tU3ELBxulz6f/9h9UuNvv751oKovp9R+buhc7tnYmqMckMjra91bgA==
X-Received: by 2002:a17:902:f68e:b0:154:6518:69ba with SMTP id l14-20020a170902f68e00b00154651869bamr31399663plg.60.1649662072219;
        Mon, 11 Apr 2022 00:27:52 -0700 (PDT)
Received: from thinkpad ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id m1-20020a17090ade0100b001cb3feaddfcsm8828185pjv.2.2022.04.11.00.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 00:27:51 -0700 (PDT)
Date:   Mon, 11 Apr 2022 12:57:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, ulf.hansson@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/7] SDX65 devicetree updates
Message-ID: <20220411072743.GA24975@thinkpad>
References: <1649660143-22400-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649660143-22400-1-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 11, 2022 at 12:25:36PM +0530, Rohit Agarwal wrote:
> Hello,
> 
> This series adds devicetree nodes for SDX65. It adds
> reserved memory nodes, SDHCI, smmu and tcsr mutex support.
> 

Please CC me to all SDX65 related patches as I'd like to review them.

Thanks,
Mani

> Thanks,
> Rohit.
> 
> Rohit Agarwal (7):
>   ARM: dts: qcom: sdx65: Add reserved memory nodes
>   dt-bindings: mmc: sdhci-msm: Document the SDX65 compatible
>   ARM: dts: qcom: sdx65: Add support for SDHCI controller
>   dt-bindings: arm-smmu: Add binding for SDX65 SMMU
>   ARM: dts: qcom: sdx65: Enable ARM SMMU
>   ARM: dts: qcom: sdx65: Add support for TCSR Mutex
>   ARM: dts: qcom: sdx65: Add Shared memory manager support
> 
>  .../devicetree/bindings/iommu/arm,smmu.yaml        |   1 +
>  .../devicetree/bindings/mmc/sdhci-msm.txt          |   1 +
>  arch/arm/boot/dts/qcom-sdx65-mtp.dts               |  21 ++++
>  arch/arm/boot/dts/qcom-sdx65.dtsi                  | 110 +++++++++++++++++++++
>  4 files changed, 133 insertions(+)
> 
> -- 
> 2.7.4
> 
