Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E896C680159
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jan 2023 21:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjA2Uf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Jan 2023 15:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbjA2Ufz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Jan 2023 15:35:55 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9245D18B30
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jan 2023 12:35:51 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id bk16so9329191wrb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jan 2023 12:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8aqki5CcPtcLzfCY7Wo7lQT4J4ibEQGFMyeTxDiGAQ=;
        b=OZbq6tnzL8TeplhGciC1YL9kquoVfH5YeTYjfDIHV2BoCrfBcqQ1q/vIXUwCcoMDjJ
         pqDgytiooxv2G1ZkM02XtHEAQ0oshsEFq6ZK6JmzfORnilUVjG4H1cIWStj2wn/xBFqP
         S/2gIwfobAtjdt44Wb6Dyo6OhcWj8NjoxLr3ZbH5MLvjNbye3Sbvf6+UrRsBDGitvBp0
         Ajp895PriLJw8dkJ37MTZR1Yep6rFPnDjEol2N98R9Lo/OGvu2SMd5O6zzpbW6jhr6e6
         gs1nvbeWF9FotGztoyXUR3XZ3HHWq56h85mokLqeii/pJpJVzai9+9oGFr0d6vL3dbI8
         ildg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8aqki5CcPtcLzfCY7Wo7lQT4J4ibEQGFMyeTxDiGAQ=;
        b=oWU+Mqh14lsgIVmgyzH+s1aDO2v+pNU4RXJC+dF7yvPJrJ1ofVkAmT7IqdcoSjWXr7
         htRLTIUR+kELmiiuxPDZxzF8f/WNYOs/CNzOtFICEBZzf4Rijt9g2S31CLTirsk5W/xN
         VBuE5tgFrWNY7NUPneKZX54yzIu/0bG02B6TFdJCu7diknfcWZsUg2p+4tX2YZTf9JLw
         AwVIUgMz3fAGz4Llp+AFjFkX/k1pBOvZSfz6oS1od7Gz9uT+ViXT/tagv8TOpehvaHUo
         gmVZtVWItX/hvVijA5IM7WHU1seSBv2941lCeclkFGr5toL1nMbs8TSroJUSmVrElSkO
         3WEg==
X-Gm-Message-State: AO0yUKUjRAU6k8BJt5pT4Nxmeh4j1QUr3te5LSluFwjYlsErx/c+qmlm
        qt/kmCCE/5Uq7+NB8ubWly9G+w==
X-Google-Smtp-Source: AK7set8mh4lwRHVWgzw9plGkhTC0LxGuzA2btm4FE97PRWONLb5ri8GZ01gKo2/yhwB4ocF497kPxw==
X-Received: by 2002:adf:f409:0:b0:2bf:bb71:dc55 with SMTP id g9-20020adff409000000b002bfbb71dc55mr16253917wro.52.1675024549902;
        Sun, 29 Jan 2023 12:35:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f28-20020a5d58fc000000b002be5401ef5fsm10204173wrd.39.2023.01.29.12.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 12:35:49 -0800 (PST)
Message-ID: <47ee24cd-4239-772b-6dc6-d0741e813f15@linaro.org>
Date:   Sun, 29 Jan 2023 21:35:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/2] power: supply: add Qualcomm PMI8998 SMB2 Charger
 driver
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230127230506.3140297-1-caleb.connolly@linaro.org>
 <20230129202043.w6mylxeccz2fyxl2@mercury.elektranox.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230129202043.w6mylxeccz2fyxl2@mercury.elektranox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/01/2023 21:20, Sebastian Reichel wrote:
> Hi,
> 
> I tried applying this, but it generates a compiler warning:
> 
> On Fri, Jan 27, 2023 at 11:05:05PM +0000, Caleb Connolly wrote:
>> [...]
>> +static int smb2_probe(struct platform_device *pdev)
>> +{
>> [...]
>> +	desc->name = devm_kasprintf(chip->dev, GFP_KERNEL, "%s-charger",
>> +				    device_get_match_data(chip->dev));
> 
> drivers/power/supply/qcom_pmi8998_charger.c: In function ‘smb2_probe’:
> drivers/power/supply/qcom_pmi8998_charger.c:979:62: warning: format ‘%s’ expects argument of type ‘char *’, but argument 4 has type ‘const void *’ [-Wformat=]
>   979 |         desc->name = devm_kasprintf(chip->dev, GFP_KERNEL, "%s-charger",
>       |                                                             ~^
>       |                                                              |
>       |                                                              char *
>       |                                                             %p
>   980 |                                     device_get_match_data(chip->dev));
>       |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                     |
>       |                                     const void *

This was also reported now by kernel test robot. I wonder why there were
no earlier reports...

Best regards,
Krzysztof

