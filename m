Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 271B8578565
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 16:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbiGRO34 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 10:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbiGRO3z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 10:29:55 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7E612D37
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 07:29:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a9so19617495lfk.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SdZehk1n210f9GCoo82W/BVMyzaROr2Bk7Vfpvw3H0E=;
        b=ZWTdX5+Xj99i0kA8aKH+lNbTrQyErYnNjwPptJZx3s2pNcc5ujAO8+ymVPt2x4sn94
         HMKBteBSlfoRNvG8Z5rmCxll9ApdrommFssEoaVkhpF0IyBZt7GKJx/G/J7iohhzzKI5
         xXYuUllSg8oecZ1RCOfwGI8O//nDW4HvR43CGGNFEVQUiXrntRO/eoYMCQU2XyOsOidJ
         EHUVUl17uWhOmVjdngUPQnHiFYV1dKlv55fKXVcyLkIyvAZ3nlatqPDYoWARYCo1XkvI
         gXSpcLB07Ut4v0IRkHZIS+Vxo9N9zGEdDalaVdxrESZh5/6ri25KCPx2JUstmeefPaNg
         S2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SdZehk1n210f9GCoo82W/BVMyzaROr2Bk7Vfpvw3H0E=;
        b=0i4Gr+D2pwIgPdIDQYU1Kcq7cac9/R7mZEUyIVSlr38Z2EMo10Nztc09bFfcZNf0Tw
         N9PfnGR5p+u0B+cEpBUpxP++ZAcGjH9MwwOLP/M6NqtN/DxqmoAcxT2P2j3RdEpgB/nM
         A45LPMMIlgdNi33TiZIVSg3rqQXawOFhTVEZSu2Go6FMMyteGBPvTrlXrr+UE5FfzpEv
         M04ACE7T9QyoaDUcOWp2oNXluMUjfe595Lq7O3pikqun2lZaopjiVzepRgSb24hFbFvN
         QdGdYKnHPOFN9IqO+SPYrayRXjSemN+/AxjDGdh8Zs6oBfdbeCee3SBzBCBqu/CKlxaz
         nJmA==
X-Gm-Message-State: AJIora/FnyqR5THzZyfjzaGf+0VVtTFqYklaasZMAzscfO1pfPt7RRQi
        Js8ZzKqVxuhPYvzCivilRmmRzg==
X-Google-Smtp-Source: AGRyM1tnxT7Ovv7LRi1KIvF32ujsCio4cKwCpCdExcZ9yvypn5JB1oPrP+lU2Va9mOxYbVCc9qK0Dg==
X-Received: by 2002:a05:6512:2606:b0:48a:27ab:cc10 with SMTP id bt6-20020a056512260600b0048a27abcc10mr8588957lfb.198.1658154592731;
        Mon, 18 Jul 2022 07:29:52 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id w8-20020a05651234c800b00489dedf1dcfsm2621269lfr.289.2022.07.18.07.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 07:29:52 -0700 (PDT)
Message-ID: <53d57eb3-c859-6f56-c104-4c05ebe737b8@linaro.org>
Date:   Mon, 18 Jul 2022 16:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] dt-bindings: firmware: scm: Add compatible for SM6375
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220716193257.456023-1-konrad.dybcio@somainline.org>
 <20220716193257.456023-2-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220716193257.456023-2-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/07/2022 21:32, Konrad Dybcio wrote:
> Add a SCM compatible for SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> index b3f702cbed87..de7bb8b8d85e 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
> @@ -35,6 +35,7 @@ Required properties:
>   * "qcom,scm-sm8250"
>   * "qcom,scm-sm8350"
>   * "qcom,scm-sm8450"
> + * "qcom,sm6375-scm"

Uh, I think we wanted to keep it consistent with existing ones, didn't we?


Best regards,
Krzysztof
