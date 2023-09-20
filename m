Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF74B7A8686
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 16:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbjITO2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 10:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbjITO2r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 10:28:47 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CE9C6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 07:28:41 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c022ce8114so36760211fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Sep 2023 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695220120; x=1695824920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtxCq9Na6rpCtPYQhYFE+hYkNtnlIQOOpKV463CAC6I=;
        b=fx3mtXeOQDHaBTQqDb8QNb5zG9AA0ZRMUjibtAtPb8eIW47Rg8uPulz6+FPRi/yEQU
         T7nZjwO5DcDXFv9DRXh4MVFjvSBqE8xjoxuHOdn3uRq3BvaqgJfvLwIB1Lt3g5zsO2J2
         bA+7ifQ9dGnWwYQEvm87fDeC2VhZA54P5Y3SYwszQwamig6B4CgbiF1GEucv2cJQOAg0
         6aJFHn2IxXypSw9y4l0UV87vemzYPgKjOz6WAaQmaOBG2NTWfmtAaDkc3rMEDH1OZmkn
         DLYVuQEqEZ3hXmPO/O80mCBpRF3IIaej1VvoOJrMifY/AhdLNB/oOnzJ0lbjQZG/ZlbC
         FFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695220120; x=1695824920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtxCq9Na6rpCtPYQhYFE+hYkNtnlIQOOpKV463CAC6I=;
        b=YbEs9Gd0uzZ9f9PpNqWUKDkTWQlQphwM/A6DQ2WPPc3VCcdc+wNf2dcv0PdFpw/RiR
         3HE4e3Joy7VGu2uBrMhuokwYZRUSp8uvqKJ9i0qQXvo1GykLQRbNSaBgjmzugCfZqKoQ
         mhrjdZIiDRhXdB24FZ4qemf6X6X7QSC+L0gMIojfY7xlhKN5QJz4mEtxfT65a43C2XW7
         gYyKDo96tfdqSKAQLdS0/NQqnoF58ERKVM8jZ6jMMSzIRYn0BjWzElllbl1tal42UFaV
         CC90QcSrEjuTDYmOnxv531+JRuXX9n2fPhXwX1swVNnVW6nmJKxkWYPIVvsIG60j9hO3
         TtMw==
X-Gm-Message-State: AOJu0Yz6bqwXZmdh+mEkSSn8O0dqReCyLcUvzv0QT4TKDTqFm40LKy8G
        Trm1Jn7BqaDvPOspecjxaq83dA==
X-Google-Smtp-Source: AGHT+IHy7BqgLDFZs6UQbHtu2/7vJypH4EJX8MKjk8ev1/EHp8Jj55x1ob7FX8sqs1VAb0K4W9HOQA==
X-Received: by 2002:a2e:884e:0:b0:2bc:39f5:ecb4 with SMTP id z14-20020a2e884e000000b002bc39f5ecb4mr2411051ljj.25.1695220119763;
        Wed, 20 Sep 2023 07:28:39 -0700 (PDT)
Received: from [172.20.86.172] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906390d00b00982a92a849asm9418489eje.91.2023.09.20.07.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 07:28:39 -0700 (PDT)
Message-ID: <911fd752-d5dc-79e2-91b7-74c70e5d8632@linaro.org>
Date:   Wed, 20 Sep 2023 16:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 4/5] PCI: epf-mhi: Add support for SA8775P
Content-Language: en-US
To:     Mrinmay Sarkar <quic_msarkar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mani@kernel.org
Cc:     quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
        quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
        quic_parass@quicinc.com, Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-phy@lists.infradead.org
References: <1695218113-31198-1-git-send-email-quic_msarkar@quicinc.com>
 <1695218113-31198-5-git-send-email-quic_msarkar@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1695218113-31198-5-git-send-email-quic_msarkar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/20/23 15:55, Mrinmay Sarkar wrote:
> Add support for Qualcomm Snapdragon SA8775P SoC to the EPF driver.
> SA8775P has the PID (0x0306) and supports HDMA. Currently, it has
> no fixed PCI class, so it is being advertised as "PCI_CLASS_OTHERS".
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>   drivers/pci/endpoint/functions/pci-epf-mhi.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index b7b9d3e..4b349fd 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -114,6 +114,23 @@ static const struct pci_epf_mhi_ep_info sm8450_info = {
>   	.flags = MHI_EPF_USE_DMA,
>   };
>   
> +static struct pci_epf_header sa8775p_header = {
const?

Konrad
