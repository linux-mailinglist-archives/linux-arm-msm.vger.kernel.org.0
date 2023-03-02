Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9076A8644
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 17:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjCBQXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 11:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjCBQXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 11:23:50 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC7E34F72
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 08:23:48 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id e82so4095070ybh.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 08:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jAXUc+7igsVtJKU/EXqB4y9E7c4M7owmalEpng7fGGs=;
        b=t6gIv8PG8O2JCb4Pja+OY1bAmy+QfmXrfFtERdyeosrITN34js2EPockt2g180hHYL
         pWe1W6HXqOiwIu3072C5tKjIbRE/MQ1j7xJ4TsJHFq1YK0c/PGV8NNn2Gdb8F/kPyiKB
         DZPNzj0Hy2QWF9GyHk814k/ytH4LbE+co0vOT3J8Aywg0nPGBBqJTU62HPyJmSQbwyGH
         d0IfJXkkx/0sg4YTUmf3FaAYlryUzM+3+GqTUBgISA5CljcZCwHVbDNbJ2/pdkGjb/94
         UVsGjY2qnEbneGUKY/ru2PhJ7HCHT0cbF61rjlWtfTDEbd6FobedpulmtiwrsvBjVhPf
         PcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAXUc+7igsVtJKU/EXqB4y9E7c4M7owmalEpng7fGGs=;
        b=hKnZhJDIB0PLp8F+QLaw4lrN3O/rjc8dQKH4n66QjkNYlBcO6OozE4eHWQuJ/u1coo
         hyMJYQepDsvcr3SqfkL8o/2WaMLaF2o+bGQJ2kshWmUT5y/W2rUFIxAjJHvnqQJB/6rV
         GeEgArjazARI50TNfNH2GyfmPcZZdyS1+K6fWyvk4Oflshu7R+2hPjDMHIrSuwEm0Rju
         1wZw33rI3M8QInm9n20zhbYMmg4PkXP61UerCPhvMaeg/Xgus7SbM9mEM4QYDxnHtGem
         4coS2lcGSYY0KABF+W91LS1Bv3u0hqMIolV0dwu/olI+2RIOuQtS9ai2UQaPPSdk5kiL
         bT1w==
X-Gm-Message-State: AO0yUKWhQQH8fuGwWgU6pBGNWxIDJi0k7eZEhHzv8jxigo7UPkdv1i0G
        Znplhgh9yYS0weBXo2qWVhUrCFaEpNkpXA9quGkyWA==
X-Google-Smtp-Source: AK7set+RUYz2RLJUmCKAuN80E5C6LRyBdQu+UgKzzLI5prKcrosXVpbyJaqYOEnoLm71zPuAGfkUyepJH8UuFtbQ+Cg=
X-Received: by 2002:a25:9983:0:b0:9f2:a18c:90ed with SMTP id
 p3-20020a259983000000b009f2a18c90edmr4846033ybo.10.1677774227956; Thu, 02 Mar
 2023 08:23:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677749625.git.quic_varada@quicinc.com> <70beab86eb21d1130e61f52753f514cfb433a4f2.1677749625.git.quic_varada@quicinc.com>
In-Reply-To: <70beab86eb21d1130e61f52753f514cfb433a4f2.1677749625.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Mar 2023 18:23:37 +0200
Message-ID: <CAA8EJpq_B_f90W6ULk1q+ot8ACj68U0M8Yc8yXL-BGuF906xGA@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: phy: qcom,qusb2: Document IPQ9574 compatible
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Mar 2023 at 11:56, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Document the compatible string used for the qusb2 phy in IPQ9574.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 7f403e7..c426f78 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -25,6 +25,7 @@ properties:
>                - qcom,qcm2290-qusb2-phy
>                - qcom,sdm660-qusb2-phy
>                - qcom,ipq6018-qusb2-phy

Please movef ipq6018 to the proper place and then put ipq9574 next to it.

> +              - qcom,ipq9574-qusb2-phy
>                - qcom,sm4250-qusb2-phy
>                - qcom,sm6115-qusb2-phy
>        - items:
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
