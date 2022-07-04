Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DD656503C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 11:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233362AbiGDJCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 05:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbiGDJC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 05:02:27 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B532C262D
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 02:02:26 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j21so14700100lfe.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TE+ycpZatBFbweoIjNfWEpsJggku8ipnnIiNJ3if1YA=;
        b=pXrsn6yXNU3xlSXyfD47CblSCEmnCsNJ/CZhN64v/dLBD9Q03ZnJ23dUskMPrPuVNQ
         ZSNa3DD5JbnSbAUOiyaOKYsbvOF7v5Vbo9nuYjBnb5846ZLeHJ9WKaycq9YSMYBoNemH
         5bEbTl21fqVuCwMsPjbJAgrXmTl53SUiutMpFubRZhuQKYo8zzOPnh6aeBAHNJESfZY2
         JcB1Zi6BNgLrrrlsZJxgmS/hELT5HNpeTirCjUSxYpspBzE7CE3mY/YR189B/3dN6V7C
         GRuUdf444MGa41t/HP3GZqzBQ7JE/J2JJ5MHo4B7JdFkSyvHfqqjEgSOf0YUVO6G7B/k
         dlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TE+ycpZatBFbweoIjNfWEpsJggku8ipnnIiNJ3if1YA=;
        b=I3Jx4pHHIZYdte9TSVmpKnBkrXr+yBC7b1XRo8V6yzKPBf15PxOeIl1WCye8yBR4O1
         oN6m4A7Fk/n9ItQlspWDmdQrJgsaL4oA17NaOuDRSHjykz2ruSlKCqcJ6clRaS9N/ntG
         PkOY9ol91Jio7GAyFIHOwHaUfxfEysReh8VYbJvAtRmUAPR5XROTf/7W8Y1bkNg5A1HA
         CK1wacdicrVj9LD2/wjjFPbcmMALPzEqR3uix+bHuCemVSewpxOuGRTfkmlRH9wsoZyq
         ANv3HzGtj5mPr2eRDB9eqml475FUplKJalMGW2EuLTTROZBJfquzx/pxp60aQD0thl5D
         3XXw==
X-Gm-Message-State: AJIora8TyJdjnhWCrGj1XhhcH3TIGYV3R9ZTZUviSnhYSQVgLSsRRlXm
        YymBoucGUBXPUqRhyK4NvqJQXg==
X-Google-Smtp-Source: AGRyM1vMeTX1VnBB4A1NJl15aVHHrYdt5/PbK+w+fNs8BCHMkMOspdzIOUNOpcDj09zzGRKjzy8xrw==
X-Received: by 2002:a05:6512:7b:b0:47f:6568:a143 with SMTP id i27-20020a056512007b00b0047f6568a143mr18809321lfo.485.1656925344932;
        Mon, 04 Jul 2022 02:02:24 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u22-20020a197916000000b0047f86b503absm5044142lfc.16.2022.07.04.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 02:02:24 -0700 (PDT)
Message-ID: <cfc2c27a-444d-8bd8-84a7-b6b1f99258f9@linaro.org>
Date:   Mon, 4 Jul 2022 11:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] [V1,1/2] arm64: dts: qcom: Add LTE SKUs for
 sc7280-villager family
Content-Language: en-US
To:     Jimmy Chen <jinghung.chen3@hotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alan Huang <alan-huang@quanta.corp-partner.google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <SG2PR03MB50068F2314F65CAE43A9594ECCBE9@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR03MB50068F2314F65CAE43A9594ECCBE9@SG2PR03MB5006.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/07/2022 09:09, Jimmy Chen wrote:
> This adds yaml file for new a LTE skus for villager device.
> 
> Signed-off-by: Jimmy Chen <jinghung.chen3@hotmail.com>
> ---
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 4dd18fbf20b68..a136b1389c2ac 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -529,11 +529,26 @@ properties:
>            - const: google,herobrine
>            - const: qcom,sc7280
>  
> +      - description: Google Villager (rev0)
> +        items:
> +          - const: google,villager-rev0
> +          - const: qcom,sc7280
> +
>        - description: Google Villager (newest rev)
>          items:
>            - const: google,villager
>            - const: qcom,sc7280
>  
> +      - description: Google Villager with LTE (rev0)
> +        items:
> +          - const: google,villager-rev0-sku0
> +          - const: qcom,sc7280
> +
> +      - description: Google Villager with LTE (newest rev)
> +        items:
> +          - const: google,villager-sku0
> +          - const: qcom,sc7280
> +

All these should be one entry - one enum. If you really need some
descriptive text, add a comment.

Best regards,
Krzysztof
