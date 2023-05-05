Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F05B6F86B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 18:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbjEEQ1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 12:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjEEQ1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 12:27:51 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3D38A50
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 09:27:48 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30639daee76so1388796f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683304067; x=1685896067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A0FBVsPayRzyQW5h+6Ul7mtmWRp9e2IC2wzaP19XslE=;
        b=Ff6+aKeqj9Cs0iVYsnUcqV2IVSlzxPMmxlfCI/4TaXpcwm41S0b8JgBzEnmC3o6KMh
         Sx/hnNYLYXH3CXOzO1bqOcQRfjEMmd1HoiBjqGv6ElCWmDtwv3/JNnyJuCstK1Yq4JNR
         XTka2VuIBO28L1E7YEUnw38zbii6FheumgCJHkX76TDm9925qCiqX5FA1y7e9jCh6KVb
         ggBxG+KhbsRcKhyvgqICwEH8qOK6RidyNaliJljNLEUeh0idrrdYH9t9Y3dyzEuKP/gp
         ECuDqkeEtt0u1aRi6OPBF0eawA7UzY1G15eSg870qICyHjw8ouu3f8l3jz/awek09oUo
         fDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683304067; x=1685896067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0FBVsPayRzyQW5h+6Ul7mtmWRp9e2IC2wzaP19XslE=;
        b=ebzpBRNUbdJNCcLzK8uAd1eYDuxDX/d5sY2NzMoUV3oE2LEsNFodkCcQdDjBhcANX9
         nsOWqdHeU1mVPyIXOW4JObJxRByFxRAbDZfq0V9Hri2Iau/JCa9Bc6j+PVLdaI+ElT6G
         qEKcax9G8RP1v4mNgfg++qxWQ+AfUaflHrHNQsajuhUYG4VA0F9lW4OUtdpi2kpT7+UY
         1dCeFa7tpV/O1iTaTDewU0qXCoYZ92+E0u8hfusiPoucoD1pSJ7KrMmu5x+UIPScvG6U
         f1NQfnwppnJ9KQAq4GEKrY44mORUVbzylExh7cvqUHKwLhI/yP2ceQC6c50jBTlMFwNN
         HFQQ==
X-Gm-Message-State: AC+VfDwCSJ2rKW4ELbduBp03N6E1g8DiV+fSd/Ep8f/W7Kxyld02RbLL
        le0v8xut+Rj7Y7mEoLIYlutT3KJhnDHvWuA+RV/hJQ==
X-Google-Smtp-Source: ACHHUZ7kwrITtSOVQ5adNWOqdDhrbcH0ZIzMp3KdWxPl6fFJAnlXSksGQave6MWvrgp5qCAN6QCFZx499CxXeYHd95Q=
X-Received: by 2002:adf:fdca:0:b0:2f9:910b:7166 with SMTP id
 i10-20020adffdca000000b002f9910b7166mr1582178wrs.57.1683304067267; Fri, 05
 May 2023 09:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
 <20230505064039.1630025-3-bhupesh.sharma@linaro.org> <1374d7ea-94a3-60b0-f9db-7528aae22a34@linaro.org>
In-Reply-To: <1374d7ea-94a3-60b0-f9db-7528aae22a34@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 5 May 2023 21:57:36 +0530
Message-ID: <CAH=2NtzuYqOV8pHcOJE-V=gCAF3pKZKSWsNbrXD48iXWstmruA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On Fri, 5 May 2023 at 21:54, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/05/2023 08:40, Bhupesh Sharma wrote:
> > Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.
> >
> > On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
> > needs to be set first to 'enable' the eud module.
> >
> > So, update the dt-bindings to accommodate the third register
> > property (TCSR Base) required by the driver on these SoCs.
> >
> > Also for these SoCs, introduce a new bool property
> > 'qcom,secure-mode-enable', which indicates that the mode manager
> > needs to be accessed only via the secure world.
>
> Cannot it be implied by compatible?

I can see this will be used by future SoCs as well from the available
EUD documentation.

So let's keep a dedicated dt property as suggested by Bjorn in earlier
reviews, as otherwise the compatible checks would start getting bigger
/ messier in the driver code, in my opinion, when we add EUD support
for other SoCs + boards.

Regards,
Bhupesh
