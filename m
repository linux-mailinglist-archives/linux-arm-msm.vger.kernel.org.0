Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAEB5501F9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 02:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347990AbiDOA3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 20:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236366AbiDOA3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 20:29:43 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D53EAA014
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:27:17 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 12so7099874oix.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ecB85TjFOoEdrDWJrtTUF1PXXrdqEfK4sDFcXt5+qKE=;
        b=fku3Xt7rwGqcME8HQ8VBrzznxzqSzK+Co60fZXeiAWXkBsYOwM7X/xn8XvhXV+/HzQ
         nJ9iZKbdRH0YNkXvmuGCb1z8/BFIEFV82+I865XdI0m/vWU5DEoVKEDGKVFSzxKL8zW6
         vJnvB9ZsrOpTTM5X2mSxgQCMT/8fs79gmJ4DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ecB85TjFOoEdrDWJrtTUF1PXXrdqEfK4sDFcXt5+qKE=;
        b=mjKNrZGATWFyloyVgC0wOtcF2bh+i39XJRp+P3YCpav0ILXtkiP+LqUVEXp0NYi3jJ
         snn/SgWkuXi5G5mZP7V2owSSovNxyPH8b+zoC+6R4I3gDNIXJOECRUtn3lWi4wpuK/os
         AAq+XA9+AxcQhJd+dE41PzWy2YLflSm0EiGpqfoS+FEa+jhhgrnf8vLWhAG6GTSc9QYN
         q5iCli0JYPkKW7nspRbpBvUaKzf/vmTxOSSPuTKw2OF+/i7pluJ1jhtmfs0BEIwLU470
         vyDV2jPAtI5rvqWTPE22aTuYDT+YQxPBoXnf7FWvLPK2+B+1NDnb3ZrEJLE7NiKEOYc/
         YAXg==
X-Gm-Message-State: AOAM5302E/GA2hRE4Zu4bRqZMIHz9PkDQ9C9jwVzxg8zFA99U1v2XlMi
        pZngMxtPHxyEZPTz+TSRSVHhMQdUFDsqQEiILMziTQ==
X-Google-Smtp-Source: ABdhPJzGWdLsFqdMc54YYDdUNKDcK7Tu1YScfUrnt8SX0agXNParLR9WPPtoOVbZlG+k3nsRAjJgtEdjRVT5HhXLpeM=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr540883oif.63.1649982436634; Thu, 14 Apr
 2022 17:27:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 17:27:16 -0700
MIME-Version: 1.0
In-Reply-To: <1649939418-19861-9-git-send-email-quic_c_skakit@quicinc.com>
References: <1649939418-19861-1-git-send-email-quic_c_skakit@quicinc.com> <1649939418-19861-9-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 14 Apr 2022 17:27:16 -0700
Message-ID: <CAE-0n51o8a7vwZ_XFwx+RxQUnvZsgxOpopgm+Yg7kQSFm6q21g@mail.gmail.com>
Subject: Re: [PATCH V10 8/9] arm64: dts: qcom: pm8008: Add base dts file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-04-14 05:30:17)
> diff --git a/arch/arm64/boot/dts/qcom/pm8008.dtsi b/arch/arm64/boot/dts/qcom/pm8008.dtsi
> new file mode 100644
> index 0000000..7b4fe68
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8008.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +// Copyright (c) 2022, The Linux Foundation. All rights reserved.
> +
> +&pm8008_bus {
> +       pm8008: pmic@8 {
> +               compatible = "qcom,pm8008";
> +               reg = <0x8>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #interrupt-cells = <2>;
> +
> +               pm8008_regulators: regulators {

Container nodes without a compatible string are frowned upon. How about
we add

			compatible = "qcom,pm8008-regulators"

and then this can populated by the driver in the
devm_of_platform_populate() call that's already there.


> +                       pm8008_l1: ldo1 {
> +                               regulator-name = "pm8008_l1";
> +                       };
> +
