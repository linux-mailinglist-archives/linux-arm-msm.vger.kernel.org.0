Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADDC5700D8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 19:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237733AbjELRBa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 13:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237688AbjELRB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 13:01:29 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6F9358A
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 10:01:28 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so91489166a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683910887; x=1686502887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WgyCZc0+du4N+dTZkKE4PbFdEgp5xlJtk0+36+OFtLs=;
        b=aq1mpL/CYYPyVxxuT1synoTadOINqfKrW4ajIyM2WqaRyGAkJGBxsYYe/2Y2cQ97Yh
         UWUYdRoH2SuCArWPH8YMFDrus8laLXbW3HNV/AAO/tdION23+5QleTt9IsGGvVHYkAlJ
         beTwgJ5WwjCdlCb4/warYmKtSammHAffCzLoEVeFj57dvbn1PZ5p21FxSKiBTTUGeIvu
         V+Z+/4/o6lotQ6wygwrus+wbKRQFc2xnD5hx46LWCiVHYkcSQbgkvkS8VV6dWZuXMa1j
         rg0/SZJvig9ulJ9NP5vM78uqaQizjpCrBC0ku4t2rM4YwS+JGOMAlH0LjyEDJDfh/3TO
         aFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683910887; x=1686502887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgyCZc0+du4N+dTZkKE4PbFdEgp5xlJtk0+36+OFtLs=;
        b=cv8r7z74ZgKGD4INBpfwvHhGMV6GDomHR0q5kqpYqIUyHEhH1zfSD64FwDPKy/e9Fu
         S3sX0pZTyascm5KOZyzhc7IWVvPPHnEPTorrjUlcNt8DReLwBY9IbH0qE3qS+xyIL1GC
         9o+M1qzRZr4ruxq83TclI+exvX5hWTp3oPnbhmERD5vyKpLe+vibSXbrYUy2Y/8DwzkC
         n8mvxHuogYvTCM4uLY67FnlDiwrH/ATvpUp0T/IXBlV/CkpLgd0Lh/DYjBK0rGarj8T5
         F2DEcnyAa+Rm4FwivGXvJN4M9Flu6XJtPBfYNc0immkjZ6lIyeO3EBrgm/4WpzN0KByi
         fADw==
X-Gm-Message-State: AC+VfDws3xC6woKNGGAFL5JEG8+bLBxXiy/tHMO7BeRAbReh8MkYjbkU
        +tJWBIpHdNNyWoF8AddbZGt4pA==
X-Google-Smtp-Source: ACHHUZ5uUqEBoBhIS5B1WUsaCYWCtvoNEX8tDn3L5tF8EV6C9KWlEcA+qH+cE9OxMmohcdB6Kr5Ifw==
X-Received: by 2002:a17:906:db04:b0:960:175a:3af7 with SMTP id xj4-20020a170906db0400b00960175a3af7mr20987144ejb.19.1683910886814;
        Fri, 12 May 2023 10:01:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id hy25-20020a1709068a7900b0096607baaf19sm5635497ejc.101.2023.05.12.10.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 10:01:26 -0700 (PDT)
Message-ID: <68f9bee2-5a5b-2962-6c3d-e73ade371545@linaro.org>
Date:   Fri, 12 May 2023 19:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 04/10] nvmem: qfprom: Add support for secure reading on
 QDU1000/QRU1000
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230512122134.24339-1-quic_kbajaj@quicinc.com>
 <20230512122134.24339-5-quic_kbajaj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512122134.24339-5-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2023 14:21, Komal Bajaj wrote:
> Add qfprom driver support for QDU1000/QRU1000 SOCs.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  drivers/nvmem/qfprom.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 20662e2d3732..12a7981a8a71 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -109,6 +109,10 @@ struct qfprom_soc_compatible_data {
>  	bool secure;
>  };
> 
> +static const struct qfprom_soc_compatible_data qdu1000_qfprom = {
> +	.secure = true
> +};
> +
>  static const struct nvmem_keepout sc7180_qfprom_keepout[] = {
>  	{.start = 0x128, .end = 0x148},
>  	{.start = 0x220, .end = 0x228}
> @@ -490,6 +494,7 @@ static int qfprom_probe(struct platform_device *pdev)
> 
>  static const struct of_device_id qfprom_of_match[] = {
>  	{ .compatible = "qcom,qfprom",},
> +	{ .compatible = "qcom,qdu1000-qfprom", .data = &qdu1000_qfprom},
>  	{ .compatible = "qcom,sc7180-qfprom", .data = &sc7180_qfprom},

I have doubts that this is still compatible with qcom,qfprom. It uses
entirely different read method. That's why generic fallbacks are bad,
one more case to my growing list of awesome examples. :)

Best regards,
Krzysztof

