Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57C2550FB93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344991AbiDZK70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349520AbiDZK7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:59:06 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54F023BD1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:55:57 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id d12so13016248ybc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 03:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lh5N6ri51DwailKzgb/YH7eZd1DrCqE9K7kDsBRnCI8=;
        b=MosuzLtso6KHR9pDz87Eixe6qoHv4im/6cc42kO/SRJWqs9F9epFnC2MC48Pm2G5AW
         8kAsaxmVVjIPkKGGnWIjZTrh5HdB3rSNmGEs3sgXa8piAnXQFKBIEa06SY6nKTakMdXw
         pTvSadqvQs9lC2sjz/VQaa4BLE59sFjeAcc25ShL1RkHfxVPMk+/dqYtAKc5hwIAqaAB
         Hnw2tV8ss+8gHN73H5SIDnHQSPPu8OC7/+rpyO60wG7GHL3o87iCcAVKisvav+PRWQGu
         3mft9wL8oYf6xmGv2l+bXfnY8W7ySGTR2HkhVfdrtdgtVUQN7ytKKTCCNKX62zSlHyuT
         S0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lh5N6ri51DwailKzgb/YH7eZd1DrCqE9K7kDsBRnCI8=;
        b=QfjmYqE6ew3U1g1YWO8EamQn+knbQedn/tNE5VbabDijVe9TR3bGKP2UGdLbeWPNpC
         dW4OxW/7raG2MEaZGmBW15C7OAk6AuSEFsNQgRpK26PK4AoshZ76IhIcbPo/C9rWcHRt
         nw+tflqpVpMclZ2PpelQelJVUcfCHibKyxKiR+JXxDu3mczWMvjhyHYE20OgfE0Hmnu+
         CYM0X81z11JMomecWxw7ii7b2QAxgKwOOMRrt3i3EwLqEoJRNAUKQwgmn2jjG2ZqnTlI
         A23Y/o8S5ht63booFIkHLyPoE436sVNrfGE+BRAsBcHNWjye20vIw0/SRS5+EMXxR3ZH
         XFXg==
X-Gm-Message-State: AOAM5332G7dsCLolwXq/tQRy16wfREkIAr9mBip4gTG6IyqRQ8FIjUTm
        a2FEg0Y+Ba+0bwrKDncRHiAo1jFTav81M5XjOgq3ig==
X-Google-Smtp-Source: ABdhPJzDXVR59f9aiyGdxgYUxXv/+cLIiJGepw6UdhCQNJNbQvyGUEBaQY1Mzw3p2w7ydHt+/xavSIrqAInjliqkC5A=
X-Received: by 2002:a05:6902:1547:b0:641:fb0b:4830 with SMTP id
 r7-20020a056902154700b00641fb0b4830mr21286407ybu.175.1650970557008; Tue, 26
 Apr 2022 03:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220426101837.16201-1-david@ixit.cz>
In-Reply-To: <20220426101837.16201-1-david@ixit.cz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Apr 2022 13:55:46 +0300
Message-ID: <CAA8EJppPg9nQVSV-STyz6TWmX-R45xZqp=UDgsWnyMa6VsdCzw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mailbox: qcom-ipcc: add missing
 compatible for SM8450
To:     David Heidelberg <david@ixit.cz>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Apr 2022 at 13:34, David Heidelberg <david@ixit.cz> wrote:
>
> Fill missing compatible already used in SM8450 DTS.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 866efb278813..c57dd423e98c 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,sm6350-ipcc
>            - qcom,sm8250-ipcc
>            - qcom,sm8350-ipcc
> +          - qcom,sm8450-ipcc
>            - qcom,sc7280-ipcc
>        - const: qcom,ipcc
>
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
