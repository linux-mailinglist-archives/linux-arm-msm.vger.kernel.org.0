Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41D65ADFBC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 08:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbiIFG1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 02:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbiIFG1d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 02:27:33 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8215351A03
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Sep 2022 23:27:31 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z20so11207888ljq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Sep 2022 23:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nshJb49fHZlYHMXX+yyxoc1qZlMUxPF5Tzv9ojAyrhs=;
        b=HjV8/yKABv7pJsvYPg7nvYkjSgOre3Vy6ct1vdbcHV0havfZumj633CUjvYXUezDIl
         TGSFScMjJ2CVengVr+xTJyVRSVjN8+pAmvE7YOh9lBvVaOcShqQJnlH28zdKpdcqFSF8
         28UKB8FSvAF6O9cMlItzyltJzbmGfbGgUAYTMUij2HSHNd5EFP7obnbN/YOaVmyuLd2L
         ghzxzNSFbrvqz8PP/b3Q9j+W32f0qQkI8J77b9RWfVuEby/yqFtuLzB6bHek6SOjBcHQ
         IrF0zRMtrHhqwE9zWTiFlCWZpgT+rfrBwcbyTItV+lYFzBbf/asIOwm0f/rbfALGiDnO
         yqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nshJb49fHZlYHMXX+yyxoc1qZlMUxPF5Tzv9ojAyrhs=;
        b=GFcsUL5pFcvaEGHAqMqUVWDUbNUoScWWTpVy/eyxaXhmmSiHfSujtJskBKoqBKQy8G
         tBnJ0RGCz4aNxh/jvcYm75wN/THlZODjNC+bZDbNuZin+Dc8SQoM8MLDgJnoLryyMBLA
         ZM5OnFynVVWjLvux58X1T8xQjUJrd8DrIiWo2HWx3mMcVFKQdU2LkKu4fdLH9ZwIiyfQ
         3y1eDtK7Nb0fvjXcNfqrd+n5yNWTc4HB5ARlUx3xQXxbDU8Ja9dXIK2n9c4DTo1lTM8l
         XSG1T/tUeD1d0+fxBDC/ctNsyip6pkoHMI52+aszcXsgcbXC/orsn+Prw7pevrCYb5/7
         6I/A==
X-Gm-Message-State: ACgBeo2eNj9f87MNJtL3plBRZzWd5TMEck1uYMvujtXOjLWQansV0JVM
        Kcq7+murvx4Ys8/VGLsAeQryGA==
X-Google-Smtp-Source: AA6agR53uyXvGjzX0rBn86Qvf9VJ7HUtTZcms2muO8WiDwzXtmLrNX3JsNpYLO0jS+O/cpbXzictyQ==
X-Received: by 2002:a2e:155d:0:b0:26a:a1b3:e6e6 with SMTP id 29-20020a2e155d000000b0026aa1b3e6e6mr630665ljv.399.1662445649673;
        Mon, 05 Sep 2022 23:27:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id dt26-20020a0565122a9a00b0049668ebacdcsm414280lfb.99.2022.09.05.23.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 23:27:28 -0700 (PDT)
Message-ID: <fdc52cc7-c353-8696-f432-2b3ff40c79b7@linaro.org>
Date:   Tue, 6 Sep 2022 08:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v7 2/2] MAINTAINERS: Update fastrpc documentation file
 from txt to yaml
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220905144554.1772073-1-abel.vesa@linaro.org>
 <20220905144554.1772073-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220905144554.1772073-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2022 16:45, Abel Vesa wrote:
> The documentation for fastrpc bingings is now YAML. So update the
> MAINTAINERS file.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> 
> Changes since v6:
>  * no change
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96f47a7865d6..ad697195fc59 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16863,7 +16863,7 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>  M:	Amol Maheshwari <amahesh@qti.qualcomm.com>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> +F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml

Your patchset is still not bisectable...

Best regards,
Krzysztof
