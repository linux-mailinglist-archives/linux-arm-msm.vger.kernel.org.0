Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42DF8663D99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 11:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbjAJKLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 05:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbjAJKLj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 05:11:39 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6ACFAD0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:11:37 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o15so8374453wmr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90c4IutVMrPH3xZfU2Owktal2tGfWs9Ef1fXW6dU0fc=;
        b=pdFXCAiX9PeTb8yXdF+VaZSGEV+G15KtLpt6qyQKe4fqk8ghcdVxhdJjj863HBj/zB
         30khLZnpS+0G3R7D40kRXU4CzJPsAZlwnf/RiN7VxviSVCqPkL1H+/TScYDMMF6Qreus
         2l5plvqU3ybNYCz+vlNC9SN5VJhyQjQrB0O9zDGt5h2CEb7HkqwRsJPnvyE5Y8nFLu6p
         R5nInedZIJmNZMZV+GuXCh+3vGTF63q8M3n1i1NVutSaqcZiZWZPJFzrsbMcmSKOS7JX
         4XZLDFnNXZrQwktzvW0INfM8fJh3Fc/RHvCunqzGwKPHZDLonKuWcwORYBTlVJOTMRJj
         5rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90c4IutVMrPH3xZfU2Owktal2tGfWs9Ef1fXW6dU0fc=;
        b=IXTyIsQYT6oQZQfox/n8hB8iKYFKDU+l+m2vlH32+7AkbSE12XKydvUCVOs75Lizh2
         9nEemfmih6MvuuSAhowkO90Fu+i78/rauGJ79RDRr/qYuOPD94y7mBBlUiDdPtf8lrUW
         XWt4splM7TE3uZEsSII0mxB+ezw4rfBT4FI9uyBKOhqLWRP+WA4QeNujBPz+pPhOqCf4
         WxkyCeV7Jy+fEj+AB7gvu3mN5Nz3109YCw9Pu9zQwZvWvCI8awkVCkESGOiY+aXpwGwp
         IFZuahIonQGnmbg9D/C8PBIqfMvP4iYX0sUeWKt9/6+R0Mkk2b6Udp0A/pF1RtZoVJcr
         yGvw==
X-Gm-Message-State: AFqh2kpjBbd1rgLyysi3FN3s1Ho1mRAHq2hUoHFZvBkeqp6Tk5IjiRMR
        b80rqqxWjFh12wUqQoob109A1g==
X-Google-Smtp-Source: AMrXdXtsAe6/mu53bMiWHYCG8WgWUcPSknwvZbflX+GSc+Sj6OI2OCFks/xzoF7zbfSYmDSnkGKcbg==
X-Received: by 2002:a05:600c:34ce:b0:3cf:614e:b587 with SMTP id d14-20020a05600c34ce00b003cf614eb587mr52154840wmq.26.1673345496333;
        Tue, 10 Jan 2023 02:11:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fc14-20020a05600c524e00b003a3442f1229sm21462579wmb.29.2023.01.10.02.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:11:35 -0800 (PST)
Message-ID: <ab9bbf2e-e8df-6ed5-a65b-76ad37bd6e30@linaro.org>
Date:   Tue, 10 Jan 2023 11:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/3] dt-bindings: reserved-memory: rmtfs: Make
 qcom,vmid an array
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230109130523.298971-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109130523.298971-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 14:05, Konrad Dybcio wrote:
> Some SoCs mandate that the RMTFS is also assigned to the NAV VM, while
> others really don't want that. Since it has to be conditional, turn
> qcom,vmid into an u32 array so that we can handle the NAV case, as
> well as other similar ones if they pop up in the future.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

