Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 412F6777872
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Aug 2023 14:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbjHJMcp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 08:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbjHJMcp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 08:32:45 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C594212F
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 05:32:44 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbea147034so7392815e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691670763; x=1692275563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5O6S5cTT7TzSxKaal4vevEeC0NclQJzrHwGKjOFl6s=;
        b=BfIaee3Lcj8qYJHLQu8XtdrtrkK3iy4IT5y/zneaauAP6nRE4NQ3ljlm5dEgwgM4Cz
         Q69slVoxUeOAIExRX5jtO+kunnNQwf0n11zwaQxbibFC/+eyvS+eTPNES9LON6oJzsOO
         YgNHModAJ45O+eZo5Lwjd9xQK2m1AXxInA8MeCrfU9wgv80pR010odgZANa+uowCRYe0
         a1WGPveqeUHKU9/GRRrOxWj/GQUcXiKhJrpfNJitxgAObCyVVvcX3isPeFbT30VRz2eJ
         cCN/qUrcQywvK++8UWA/Km5sHIBEtl23HdBBEnIBLdyVOikxXiuKYh3ZlZzjkBOLPaF3
         FURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691670763; x=1692275563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j5O6S5cTT7TzSxKaal4vevEeC0NclQJzrHwGKjOFl6s=;
        b=i5rKDqdWFx9YWyoLB8/W12+Yv16/yA/M2RVUtCaRokNwcsDvc6Z2jeq6+LPJp8tM0R
         ppAki8VnQZcUFFcA5kCZbPy4yVySvo7VBaUZLSV3qBuiAaF6BChlqC2rhFKgBcgNrzuK
         xKdI4RNjKU1burHddZ30+F0x4NmDReCkImQXUNS+0Gz5yedIyCFWwv0hCAA5kOlz0+Xj
         Lei8qGi1chI7ApEyNHBv6SnvTnloHZ1HivEwocnTaLzCf4NTteFSzilLVWMs+9QRRQOx
         J+OkXchQTP2WYcoqd2KTfQ99Jawk4e6PLnfoT9jKt3JVgREtzvMnq/TpmC6kcD/Us8js
         pVvg==
X-Gm-Message-State: AOJu0Yz+zRPgx6hD67Wv9/eQRCzSWLNjd2xTeH8HCBKxGCY3yt940WT7
        PzsVwIYjE7NZzrPfTZzPdeWyDQ==
X-Google-Smtp-Source: AGHT+IFuVneGQIDaMr1RkNoAw4cn27A2/NQxJ9hWSiXS8vP+8EUUVB+CTE3oAfBIMeLmNV3l9MA9Hg==
X-Received: by 2002:a1c:6a07:0:b0:3fb:e4ce:cc65 with SMTP id f7-20020a1c6a07000000b003fbe4cecc65mr1776219wmc.25.1691670762723;
        Thu, 10 Aug 2023 05:32:42 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b15-20020a05600c11cf00b003fd2e898aa3sm3827836wmi.0.2023.08.10.05.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 05:32:42 -0700 (PDT)
Message-ID: <a663ea2c-4724-20b3-628e-8831b6989655@linaro.org>
Date:   Thu, 10 Aug 2023 13:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/6] soc: qcom: Add LLCC support for multi channel DDR
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230810061140.15608-1-quic_kbajaj@quicinc.com>
 <20230810061140.15608-5-quic_kbajaj@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230810061140.15608-5-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2023 07:11, Komal Bajaj wrote:
> +	ret = nvmem_cell_read_u8(&pdev->dev, "multi-chan-ddr", cfg_index);
> +	if (ret == -ENOENT || ret == -EOPNOTSUPP) {
> +		if (num_config != DEF_NUM_CFG)
> +			return -EINVAL;

In other words if multi-chan-ddr is not present in the dts and the 
num_config != 1 return -EINVAL

You can just as easily say if (num_config > 1) and drop the define from 
this code.

> +		*cfg_index = DEF_NUM_CFG - 1;
> +		return 0;

*cfg_index = 0;

For example if #define DEF_NUM_CFG 0x20 then taking the last index of it 
would be 100% wrong.

Please kill that define.

---
bod
