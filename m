Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C12155314AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 18:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237749AbiEWPRY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 11:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237743AbiEWPRY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 11:17:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E911241609
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 08:17:22 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w14so26097375lfl.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EuWB8Y7Ah/qV5CnmOJ2acPAV109TTRYKTj1R5AVapBA=;
        b=Oa/4Hu/NUIM/rsUznqpT2KUk9IBeQFNRqlo2EEH1+xbutUJ/6jU24YHyZ9YCvVgcdG
         uBvXZJGqt/Ru/mntP0l5k16ANL+XeXDjKl5rwJYQ7cL+LeP7Gc1vTfpi4IUl/hPtfang
         QZCPzSgWrR2BQtV5O3IPiT/8gkfIoFM/88FUFXs6IICU4CeIp16jXLDgforbuDM8ibeH
         TILW+AdHRq7V5ktxr783LHt10DhglCf8OTGpNkmAScBkYROWB3dE+5KMQihG3vtAhCHb
         8WlyurpyZgW82UDIOGgEI7coYhpxmncp5VW4DCfIFKQ2qfqUxAfulF9YbHpHF1zFXCuq
         7rsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EuWB8Y7Ah/qV5CnmOJ2acPAV109TTRYKTj1R5AVapBA=;
        b=m+/r2GnjTknstUdNohvlI4T6F5mU26IP+maRL3ZpjFCs9zPcbepmkiZl2+wQdX+XII
         d/1aC/0LsKXq/miJfGp81ZHxahAxFj353RE1dTELN5FC/2oDycdENy37dA61ov2X7dDI
         5vp66/KyryI9PgNFO9GTxahxqp4ejZeRyE8itP0iZ2aubxeGxWXqA/ujGWL70IpvKe6d
         1AVuO5QDkLGZQARzmWE1I8YaZUlQUd8E/4kBvLsPfyI7ckNp9jvfIlm0Gija8Dcj3Zj4
         JHHLNWAODs1HxU+Wb6YmldNjKhjBH3YNnZa6cIfCH9QmyTG0yGlQK2ojzvkd5tPXo+Im
         SkVg==
X-Gm-Message-State: AOAM530DkMjzyLyfni8Yjqp1yvQzYo3OeNLOl8JRihXGDslQbNjrYuhI
        pVwzpafnMWByScHDZsbrwjwXjw==
X-Google-Smtp-Source: ABdhPJxvfeSkeIlilth/ORM3dyOXG/fXDgX4p/j2ME7Poz6LhSKvE0gTPzOzkZLRdvxfjCRzvSX76w==
X-Received: by 2002:a05:6512:b8a:b0:477:a934:3e76 with SMTP id b10-20020a0565120b8a00b00477a9343e76mr16684091lfv.275.1653319041200;
        Mon, 23 May 2022 08:17:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x19-20020a056512131300b00478628920e1sm1064017lfu.103.2022.05.23.08.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 08:17:20 -0700 (PDT)
Message-ID: <0bc58862-75be-aaa0-9983-6ed2fa2079ec@linaro.org>
Date:   Mon, 23 May 2022 18:17:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v11 3/7] PCI: dwc: Handle MSIs routed to multiple GIC
 interrupts
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
References: <20220520183114.1356599-1-dmitry.baryshkov@linaro.org>
 <20220520183114.1356599-4-dmitry.baryshkov@linaro.org>
 <Yos9fkgxAN1jJ4jO@hovoldconsulting.com>
 <8ce50a9f-241d-c37a-15e9-1a97d410f61e@linaro.org>
 <YouUCuzjo5u+OEXS@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YouUCuzjo5u+OEXS@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2022 17:02, Johan Hovold wrote:
> On Mon, May 23, 2022 at 04:39:56PM +0300, Dmitry Baryshkov wrote:
>> On 23/05/2022 10:53, Johan Hovold wrote:
>>> On Fri, May 20, 2022 at 09:31:10PM +0300, Dmitry Baryshkov wrote:
> 
>>>> +static int dw_pcie_parse_split_msi_irq(struct pcie_port *pp)
>>>> +{
>>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>>> +	struct device *dev = pci->dev;
>>>> +	struct platform_device *pdev = to_platform_device(dev);
>>>> +	int irq;
>>>> +	u32 ctrl;
>>>> +
>>>> +	irq = platform_get_irq_byname_optional(pdev, split_msi_names[0]);
>>>> +	if (irq == -ENXIO)
>>>> +		return -ENXIO;
>>>
>>> You still need to check for other errors and -EPROBE_DEFER here.
>>
>> I think even the if (irq < 0) return irq; will work here.
> 
> No need to print errors unless -EPROBEDEFER as you do below?

There is no separate print for the dw_pcie_parse_split_msi_irq() errors.

> 
>>>> +
>>>> +	pp->msi_irq[0] = irq;
>>>> +
>>>> +	/* Parse as many IRQs as described in the DTS. */
>>>
>>> s/DTS/devicetree/
>>>
>>>> +	for (ctrl = 1; ctrl < MAX_MSI_CTRLS; ctrl++) {
>>>> +		irq = platform_get_irq_byname_optional(pdev, split_msi_names[ctrl]);
>>>> +		if (irq == -ENXIO)
>>>> +			break;
>>>> +		if (irq < 0)
>>>> +			return dev_err_probe(dev, irq,
>>>> +					     "Failed to parse MSI IRQ '%s'\n",
>>>> +					     split_msi_names[ctrl]);
>>>> +
>>>> +		pp->msi_irq[ctrl] = irq;
>>>> +	}
>>>> +
>>>> +	pp->num_vectors = ctrl * MAX_MSI_IRQS_PER_CTRL;
>>>> +
>>>> +	return 0;
>>>> +}
> 
> Johan


-- 
With best wishes
Dmitry
