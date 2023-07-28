Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25E9766717
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 10:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233580AbjG1I2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 04:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234848AbjG1I1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 04:27:23 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E205D3A8B
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 01:27:21 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe1a35a135so2420984e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 01:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690532840; x=1691137640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjknMk9xDOdfH8tlcXEgST094q3tv+7K3A03BMiS3S8=;
        b=yAWwa/GRLkDZZ4Rykif2uAUtYp20wQlJjIM/2pHOafKd8dC7tf2fAwuqDhVoCgwlQL
         vFjNP8uv2Wp38EdfqcTxdkfiKmsLid5aBHt+ivLuJH7nkWcx3a/m8eLq7YGwtBcYgb6D
         xPEYuwkxCtT8dKNQhFuyLGx576ny357Frkunl/FF2VY8p2FUO1ziVgp4sVVNgzzQHXJM
         Q3U/qs0yM4pSB2soclGhm6Qt1KbVhfDj/eFtWUEdKKkJsnolCHV2XjflaTQr3lynn5f9
         E8tD7Iflhv3cw3iKswUXQtpGqB+2jC2zEXHBGy+EnCs3PVowXfTMuzMvjq+JZ0oTYS5I
         u+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690532840; x=1691137640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjknMk9xDOdfH8tlcXEgST094q3tv+7K3A03BMiS3S8=;
        b=RRPnYa9hg1wtqtB7uVbf2xIFbInBwxdXICmd2E5H762AEJZuU2PEBknPuSZqIZcKaT
         FFexvWxcZo12/9uXcVGpb5gpYMr9zlwF7XZmXX3e0kZQ4/TJTbmxsWL5jZNcWDGRxh3V
         XQmvbpzfHWHF8zJHJD3GQBxUe/HL/clxIw0MbVkvdu4o3/axg+VNW3NjqaccXLP/D+pW
         4fmdmYfFrPGTv2PUlki8s/jZoCKLcH5nUFolK1+4CVomVCP0Lfdjt2/qODHngIKqCNZy
         1xre/EnGPauI0DFo2bh4M+fJNafkBXKCrS1y2TgyoJpqN4DaGt18g0KkGrEMUttGfygj
         Y+eQ==
X-Gm-Message-State: ABy/qLa7tr/2S4iAKYFPqfzcZTEsLs6BCm5L5p3qcLtgvkLQxx/+UPTp
        RJr7K3kpNrX2v60GOC1cb4ZLhw==
X-Google-Smtp-Source: APBJJlF3I5wf7RWZJLYXn4nrVP+lvIHaqAMcKZc3ypHI+/2MRCVd46QbfOZh+nv/toPn/5epDiSLMg==
X-Received: by 2002:ac2:5f4c:0:b0:4fb:a990:bb28 with SMTP id 12-20020ac25f4c000000b004fba990bb28mr1052611lfz.18.1690532840066;
        Fri, 28 Jul 2023 01:27:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w6-20020aa7dcc6000000b005223ad8d7d7sm1520005edu.30.2023.07.28.01.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 01:27:19 -0700 (PDT)
Message-ID: <117f6341-55d7-601b-203f-8a09dd4bb22f@linaro.org>
Date:   Fri, 28 Jul 2023 10:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 09/11] remoteproc: qcom: Add Hexagon based multipd
 rproc driver
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_eberman@quicinc.com, kvalo@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_varada@quicinc.com
References: <20230728063412.1641856-1-quic_mmanikan@quicinc.com>
 <20230728063412.1641856-10-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728063412.1641856-10-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/07/2023 08:34, Manikanta Mylavarapu wrote:
> +
> +static int q6_get_inbound_irq(struct qcom_q6v5 *q6,
> +			      struct platform_device *pdev,
> +			      const char *int_name,
> +			      int index, int *pirq,
> +			      irqreturn_t (*handler)(int irq, void *data))
> +{
> +	int ret, irq;
> +	char *interrupt, *tmp = (char *)int_name;
> +	struct q6_wcss *wcss = q6->rproc->priv;
> +
> +	irq = platform_get_irq(pdev, index);
> +	if (irq < 0) {
> +		if (irq != -EPROBE_DEFER)

Still not good... I think I am saying this the third time: drop this
eprobe defer dance. It is not needed. Just open the definition of
dev_err_probe().

> +			return dev_err_probe(&pdev->dev, irq,
> +					     "failed to retrieve %s IRQ: %d\n",
> +					     int_name, irq);
> +	}
> +



Best regards,
Krzysztof

