Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580D77C018B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 18:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjJJQZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 12:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbjJJQZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 12:25:40 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3694699
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:25:39 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c27d653856so94831fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696955137; x=1697559937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYpu7WmJTYMPsrwJtEmCK7st+BFZo4gJs4bCDxTrOlY=;
        b=sHBSEejk4bRr6YlRnhtf6G03QbAVqCQ5Ne10Q+fcQhInSp84t4nEaksw1p9AsxOZ+2
         OoJsl2K/8KZdh1tNpPEu4a2QdRyCXPwITqfpVSljtdIMtKYFZoD8m9nixUyuXSOluMDg
         cb7LfFLYg3CPxqxiBLeBgSXx5KbjIhhmB5Cs2ELz/fHsGx1eiIdYcZSbylZfr8kkypTv
         XmzQ7Nmh/ierCgT2wcd1gI0UiUeH0rfE9XFzhABqsq/vLhR7r0D1tMrFjihxBckbRhO9
         rE6PD408yKX+mJuB/A93ONUZyKw+2IgtLEqLj9/JvAboz17TdcgqKOodzZWSp0q1LRpP
         CA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696955137; x=1697559937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYpu7WmJTYMPsrwJtEmCK7st+BFZo4gJs4bCDxTrOlY=;
        b=KEGxHYpeFecyOipNENGyCm66S9mJnHs5G7xUv43Cf3u41NkJHFnq7DWPHum3uvOCim
         /U6I2lxBqU42hSjdijDHDh6u01C9PJhntJxpmOJhsFqtMVX5YOU5crADAvjtSDvcwEDI
         Utq5+ye/ZAG2KsK9RKva3eB51LEADlkxguBWaFx4Q95fbqKRX4Ve0/E9TfoBD3VZ0JBr
         vme+rm3gMX7dcZ/qty7UG8pNcn8E9zji0S8N9Puf0yqrNnG3MrVBwiPZMJH1WoIO4bxn
         6qItzKKTIn+FdKjRv9fvtDoQFj6bL//EFXgTjwZvxokV6aNSYiKzDg6bDYBMKb81ncsR
         qDHQ==
X-Gm-Message-State: AOJu0Yyb/OVtJb6cG0+4LtekJ42mBWzLsVXfOQx6XD3cFpqaQfBZ8PWP
        n7fWp6NsNXf+MeARTIB5yddzaA==
X-Google-Smtp-Source: AGHT+IGILstfH1n9xtnahht/Q4quKgIwuDkjpk3L8fbHv4Am3weXHJDhvA19iKb5tpe5uWAv9X0r5Q==
X-Received: by 2002:ac2:4da3:0:b0:4ff:9a91:6b73 with SMTP id h3-20020ac24da3000000b004ff9a916b73mr11251453lfe.17.1696955137376;
        Tue, 10 Oct 2023 09:25:37 -0700 (PDT)
Received: from [172.30.204.182] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v19-20020ac25593000000b005032907710asm1877533lfg.237.2023.10.10.09.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 09:25:36 -0700 (PDT)
Message-ID: <5fab045d-3b09-496d-af30-b7355495694b@linaro.org>
Date:   Tue, 10 Oct 2023 18:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] PCI: qcom: Enable ASPM on host bridge and devices
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, gustavo.pimentel@synopsys.com,
        jingoohan1@gmail.com, andersson@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20231010155914.9516-1-manivannan.sadhasivam@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231010155914.9516-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/10/23 17:59, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series enables ASPM by default on the host bridge and devices of selected
> Qcom platforms.
> 
> The motivation behind enabling ASPM in the controller driver is provided in the
> commit message of patch 2/2.
> 
> This series has been tested on SC8280-CRD and Lenovo Thinkpad X13s laptop
> and it helped save ~0.6W of power during runtime.
That's a lot of power, thanks for looking into this!

Konrad
