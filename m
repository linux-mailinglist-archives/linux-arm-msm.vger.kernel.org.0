Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D51479B2E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 01:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242013AbjIKVKe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236604AbjIKLD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 07:03:56 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082CACEB
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 04:03:51 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so567525066b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 04:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430229; x=1695035029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ILX0tdLmqj9AVpuvBKgqDyqNcCHFP+tGWFAoPYPQ4w=;
        b=RozUUQafs9a/6wYc+MEj3hh8Qlu9Qi0huT+x5jj8qiem8SojZs6YSnzGsIlufp6W4f
         O+q2jQwFJMzLDcvvPfbm1yYwt3VnOZTcT6PI5WvntCMRR7L4MbYpIETWbzixWXEP/awv
         ZygszUnTxWHLoqIwkilI4+g2BKnSPgq8Y7ayil/xIUQ8JyHOZuJLlhEQaPqkOJF7OS9x
         tH61SPtsO3qIvOk1UCbGa1vNoWR88obWLHl8VvE8WbVoa5MLL1sR3DD+o/7Y7HN9Sj+z
         36oQ3cBFacIDqpvURI+laKCXFUppmRp7RWguEFYkWcy41wQQpvCBK0S/R0lDMsFv3Gt1
         Ufmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430229; x=1695035029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ILX0tdLmqj9AVpuvBKgqDyqNcCHFP+tGWFAoPYPQ4w=;
        b=kVoXTAWIJpG4CL1d2HzHXGNTSyWd3i+azBZpNpOlXDlqP6Y1HjlbfwU2zCWizQuXeo
         W8HawekYh6wViR/pBRp/RYDiA70zS2KvcrWExKXBERJ+cffKlSqVKbTKgBhI3Gb4EttA
         9/kP22HE9VNqyTsg69uEYHaz6ARwxY7Npj8D2jtS9oSAq0zyEVQxtQtWHl45ort0Nt97
         iId0MHDT/3/bnr0UptP+pKbsfN/Y6qLiGJgy8Gk9MFkiusEKgtsqpnnBdAlnU21FThXB
         lUqzyBBZiXADonW0a/ftnrD8kPCozz0bhatE361zSSYMsVjUGuvcMZHdYGP3MAA/twpe
         D4YQ==
X-Gm-Message-State: AOJu0YzGtjCmejMB3jz00D1cDxm6QlTy8PxKRCncxr+5pYhpDNhxqsV0
        ep9HAZrYVfacJdbBc00m2A0jiQ==
X-Google-Smtp-Source: AGHT+IHrCuHXPW5iCbHOgDTuxr0+rEQqZq3NfeZFsduvBFV7Iz1nZShwqgZZlcUjSeB2syGYDhOFVA==
X-Received: by 2002:a17:906:8251:b0:9a5:eedb:ee2e with SMTP id f17-20020a170906825100b009a5eedbee2emr7821770ejx.19.1694430229508;
        Mon, 11 Sep 2023 04:03:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ov27-20020a170906fc1b00b00992c92af6f4sm5183284ejb.144.2023.09.11.04.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:03:48 -0700 (PDT)
Message-ID: <f3bd88f5-7dff-871c-28d6-a7dbb1104989@linaro.org>
Date:   Mon, 11 Sep 2023 13:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [REBASE PATCH v5 06/17] soc: qcom: Add Qualcomm APSS minidump
 kernel driver
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, mathieu.poirier@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, vigneshr@ti.com, nm@ti.com,
        matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
        bmasney@redhat.com, quic_tsoni@quicinc.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-7-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694429639-21484-7-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/09/2023 12:53, Mukesh Ojha wrote:

...

> +module_platform_driver(qcom_minidump_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm APSS minidump driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:qcom-minidump-smem");

Nothing improved here and in other places. To avoid review being spread
all over, I will just NAK this one.

NAK

Best regards,
Krzysztof

