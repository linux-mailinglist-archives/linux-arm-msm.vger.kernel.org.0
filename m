Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD0D6D7DEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 15:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238324AbjDENnd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 09:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237920AbjDENnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 09:43:31 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127FB4C28
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 06:43:30 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id l12so36239624wrm.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680702208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=91zpGfc1a4L74i5yjY800PRBiUccdNyLDZUTPZtClIM=;
        b=fYuMeQ/jyRYzCPZSwSv+LxC+ky2mQ+a8Vsojki1W1EUk4o0Qxf8UehggIl0LPruQHk
         bDlJCGe46tinBLb34DAlpGqlxlSfq13oD44hc6tZyJ6oEUEjWE/mGYQs+6VLF46BlfT8
         leZEKJvqcO7ENOVpHQhg+U2Rwv6B+gvs55IV9+JX8AFsp1F0k6p6XBNFhREXxum7WJkQ
         hDjJ+50b3KA9ni2WKyD2hRaeeGs7MOxrJbCJZu8QMZw7fvwDjr2T8YbpzVeSRh6jB4M1
         xLpT2KXx2MZc+tU1Cg6VklfnUd42yPAlVKJJNAhFZFH6sTpjz2XwsyGLXd+NN8Y+I37D
         QUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680702208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91zpGfc1a4L74i5yjY800PRBiUccdNyLDZUTPZtClIM=;
        b=bzkTtm/vt4Dsb8SzdfCWBlMmLURj8gvlM4wpoNIOYzYznzY+A2PttbnWG8wnotha1g
         tsTGYbj7KR7NSZuSi72+/2gwGpH/7IeIBMWjSjIYXgvRlRQNIpeoFpB/f516pftE1NBD
         EUMpUenqkjOLcXwqADzy87vlesWodxYfvsf/CNThXTmL8M/w0pqMGWe4LVSTCDFOOa4Y
         bl8lbc0DRwND48JNmQ1RIPdJ30JuzsXoOYbBL2fvnYam7SKrrwGKeH6HbJ4eHcx9Cd5z
         3Nf7o/zi8mBXWFRNL9IVcCR5/2V7gUhZeP4wopr5xMOlg8ELPFSEEOWvqEt9U3c6Dp0I
         Quww==
X-Gm-Message-State: AAQBX9dqbnK6xFAvZ2vjYZK+Q3zEuBdFuD2aQtpFbgVXJxYAge7Mv0Kg
        Cm3LTfJOwJzBPAikFcvLUze0oOcpNHG04lHbkoo4HQ==
X-Google-Smtp-Source: AKy350ZaLcMHG+5zgfFflSVokVyqata0DNKN7cBymBE0f4C4IzGeqoPndhBChYUnv8Dyl5UEhEkAps+0WiJAzKlYhwo=
X-Received: by 2002:a5d:4572:0:b0:2ce:ad09:4d47 with SMTP id
 a18-20020a5d4572000000b002cead094d47mr1176570wrc.4.1680702208456; Wed, 05 Apr
 2023 06:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230401154725.1059563-1-bhupesh.sharma@linaro.org>
 <20230401154725.1059563-2-bhupesh.sharma@linaro.org> <1403741d-ef51-a9c5-821f-358c8f470dab@linaro.org>
In-Reply-To: <1403741d-ef51-a9c5-821f-358c8f470dab@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 5 Apr 2023 19:13:17 +0530
Message-ID: <CAH=2NtykGGcYHUTTzHMA7ft3eKAbGtrO4tN4dnLdg5cjE-N9Gw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom,qmp-usb: Fix phy subnode
 for SM6115 & QCM2290 USB3 PHY
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 5 Apr 2023 at 15:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/04/2023 17:47, Bhupesh Sharma wrote:
> > The USB3 SS (QMP) PHY found on Qualcomm SM6115 & QCM2290 SoCs is
> > similar to sm8150 QMP PHY in the sense that the phy subnode supports
> > 6 regs, namely TX lane 1, RX lane 1, PCS, TX lane 2, RX lane 2 and
> > PCS_MISC.
> >
> > Update the dt-bindings document to reflect the same.
>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Bhupesh,
>
> Can you use scripts/get_maintainers.pl to get the Cc addresses instead
> of writing them manually or inventing?

Sure Krzysztof, will do.

Thanks,
Bhupesh
