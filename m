Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51C2951F8D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 12:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbiEIJvm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 05:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234032AbiEIJ3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 05:29:44 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EF9201B3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 02:25:48 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id j15so18564124wrb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=H+DsutZj1L+ifdMTMDgXzW8ycmvYXow7irv3R3N0G0A=;
        b=EMVg4qQf/QsULTjsrV0B3/wwtsJ9Vf60yiGAFh/5rTydM1bnxbv6hPXNIE/GuCENIN
         q0vbAv2ZGCcs1HtKiJuox1M9qD/l2M28yzb0yjVd+CMkkSkHA977QCHazwlls3m0Z184
         ZiH8eNySBC3/+JNrzj3pDmEg5NvtkNnTosNu/AK0lXNpQ+9kIRweJJBynlJs53Vn1nWQ
         SEuMUaaaIqkiU0gHNLr8IcQqqgNWo/mUSdzeCcYr1e7zN4CS9qay/S1vbyVD5Io8g2W7
         U7CGKtOoipiwPY3OiwTrbj0cOJGXPp/Ef5LbBjLXC9D3nxCur4gwoIts/3CilELEOV+C
         CmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H+DsutZj1L+ifdMTMDgXzW8ycmvYXow7irv3R3N0G0A=;
        b=7PPXKlXYKWXVoQtEA/H+k9tyBleBWDtNqh0GjL8dkKAjKMD7R0Ea8eEFM+vOLkOrTp
         OAVnzzdrlj4Sx8A4ROVFC6DUgLIgkdEOACXOLMitjBnRWiVnNrzZcKUYXq97Ur/7cNyO
         xj/OnBkJZWyEmC2161wmeB+NlvuA4nQ/fi23cVhmBkZtHVcMfYd4pRzlg9+WrIS2sE2L
         7sE6o4a2t74/cPf9Lm0vb3UNQaP4O78nyTnB0AQ5RInMQDRWKkB/q2TOsi+JCyTuSSK0
         YJbORCdfF1ALYwsxZgY96E8cXQvqxRFnM8v8LeYGPqzO2RKZ6rUCqi77FJ72aqVXi+3g
         A/6w==
X-Gm-Message-State: AOAM5301yFPUqUuWJTJSaEjFhmnQxwIdjLHU5FE5qcoqcev8i5bxQJn9
        +OOCtKWGvSLzwyJRMaRqCU5TxA==
X-Google-Smtp-Source: ABdhPJwRIgJEwabhbXHOhG62yNCJpaXOkH5nLrt212aoSggBdFxwKKAoFPKPI2PUu9Vk/jJ1E9iVmQ==
X-Received: by 2002:adf:e104:0:b0:206:109a:c90f with SMTP id t4-20020adfe104000000b00206109ac90fmr12894538wrz.259.1652088346627;
        Mon, 09 May 2022 02:25:46 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm15854582wmp.12.2022.05.09.02.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 02:25:46 -0700 (PDT)
Date:   Mon, 9 May 2022 10:25:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, ~okias/devicetree@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: spmi: convert QCOM PMIC SPMI bindings to
 yaml
Message-ID: <YnjeGIGW6Pe1R/gY@google.com>
References: <20211227170151.73116-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211227170151.73116-1-david@ixit.cz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Dec 2021, David Heidelberg wrote:

> Convert Qualcomm PMIC SPMI binding to yaml format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> ---
> v2:
>  - add #address and #size-cells
>  - add reg and remove spmi include from example
> v3:
>  - fix doc reference error (make refcheckdocs)
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/mfd/qcom,spmi-pmic.txt           |   2 +-
>  .../bindings/spmi/qcom,spmi-pmic-arb.txt      |  65 ----------
>  .../bindings/spmi/qcom,spmi-pmic-arb.yaml     | 120 ++++++++++++++++++
>  3 files changed, 121 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
>  create mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
