Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A30B067D1BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 17:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbjAZQf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 11:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbjAZQfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 11:35:55 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963D053549
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 08:35:53 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v10so2370718edi.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 08:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afez1nsKlZmE+ENEERE7Oo/V5VhLLIWK6OgZUW8xIho=;
        b=cvhnX0fWR5gLtPdV8uzCMk0K87aF0P1NkjL7UbHZZwQwDjKaLGLKdJuiGcE9pO3Ne6
         jYpCr4xptwHNwgB4Yw3ba8yohEdlfpwPyGGZy4LX4u5vay/33iWUpx4O3LrATSGkQw/b
         jhXV/KJ8SKTr0pM8z4X1BiZb2FM0fMKE2r3fe8WbyjmdBHvpRwE6BS39v0n8izjR0vfW
         1LmFvibAgrN2OD1nE7VoUj6oImoD7PgLaDYWIfo8AwPcR2lgcIdeSHFBgwk8JcU7crQh
         cObk+cmzFvq+LxN1f7JfrRfdvhktdkNgH8dYTnxNRo97I5IT17Y1cbjQjHpb0MGWmG41
         dcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afez1nsKlZmE+ENEERE7Oo/V5VhLLIWK6OgZUW8xIho=;
        b=A8SLUfmvR3zf2/nHskEwE/pBeKBJhnEjh3X3W9rHfHhsr8eIv+bUoysNuzLsKilH2S
         SXRTnA/8mrPJNlChOPwUnDDmWl9SaMynKJdt2Jd4iaRfs/T2FCZL0FfzdHmKTUCWKJ3M
         xwXZdUJIDTELv9WanDJlrgvUHhOo7q2Z+MVFavzzh26jkU9z0RtoZMzStTLEeSLOd4U3
         dyxLVwkY6qED4iUyhNLHSkQ3AKJjV4MJQE8hzx4s8HCV1mfDb2pQP7eKbxO+ftiTCJ+r
         R8Zr2kL68P5dptqjIksf+aZlUscSV9fUYcpUlobXiLxmAW5ULS++WUNUtgqK+eP86dsE
         bmww==
X-Gm-Message-State: AFqh2krvq15xA4z5/+CLuzf8v9OPP1l4YQ49yvC2m12Q5p9NAxAVgMVS
        bIf3wKry7XLmGPeJCsa71qVajQ==
X-Google-Smtp-Source: AMrXdXu/trqwU0wO6hcbTWNdvL7JmToL9lOSDZ0+tnzXlz5ZWkKoQjyYDauMEG0SU0okMmsikNA/Jw==
X-Received: by 2002:aa7:de95:0:b0:49d:be2b:b9b1 with SMTP id j21-20020aa7de95000000b0049dbe2bb9b1mr37564501edv.36.1674750952116;
        Thu, 26 Jan 2023 08:35:52 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id w25-20020aa7d299000000b0048789661fa2sm952239edq.66.2023.01.26.08.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 08:35:51 -0800 (PST)
Message-ID: <e1291152-2c74-514c-00a5-526564d7d827@linaro.org>
Date:   Thu, 26 Jan 2023 16:35:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 11/22] ASoC: qcom: Add USB backend ASoC driver for
 Q6
To:     Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
        perex@perex.cz, lgirdwood@gmail.com, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        Thinh.Nguyen@synopsys.com, broonie@kernel.org,
        bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
        agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-12-quic_wcheng@quicinc.com>
Content-Language: en-US
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230126031424.14582-12-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26/01/2023 03:14, Wesley Cheng wrote:
> +}
> +
> +static int q6usb_dai_dev_probe(struct platform_device *pdev)
> +{
...
> +	data->priv.domain = iommu_domain_alloc(pdev->dev.bus);
> +	if (!data->priv.domain) {
> +		dev_err(&pdev->dev, "failed to allocate iommu domain\n");
> +		return -ENODEV;
> +	}
> +
> +	/* attach to external processor iommu */
> +	ret = iommu_attach_device(data->priv.domain, &pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to attach device ret = %d\n", ret);
> +		goto free_domain;
> +	}
> +
Why are we doing this manually here? device core should take care of 
attaching iommu to the device instance.

...


> +detach_device:
> +	iommu_detach_device(data->priv.domain, &pdev->dev);
> +free_domain:
> +	iommu_domain_free(data->priv.domain);
> +
> +	return ret;
> +}
> +
> +static int q6usb_dai_dev_remove(struct platform_device *pdev)
> +{
> +	struct q6usb_port_data *data = platform_get_drvdata(pdev);
> +
> +	iommu_detach_device(data->priv.domain, &pdev->dev);
> +	iommu_domain_free(data->priv.domain);
> +
