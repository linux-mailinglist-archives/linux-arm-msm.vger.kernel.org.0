Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983C86F91A2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 13:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbjEFLoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 07:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbjEFLoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 07:44:01 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805968A5E
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 04:44:00 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ac770a99e2so30528081fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 04:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683373439; x=1685965439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXnVhbkITsZMb6O7jTvj7y5cUYSeICU9j0KWRJueFW0=;
        b=Ohlfs/y70BkHhNgLYwSaIL9tgD/tRK5vPrItQJP4FbKtpfMISkb4mD0JUJzwL88qSp
         MraBwNqT06c8t20AH9pvaiZlcx11Mh5LIQV1U6CVxO5po2pTGhu5Y4wQkh1S12HSfaFK
         fy8SnrdPYv2m4O1+8bQYi2bdAwV4BtDKTXErYgy78pkArWLyv7CzdszdBlu4X8gH8kkl
         tcvRFmepJ5RA3n6kWr2sjSXx2g/dce4oCxoDTPG2NAuKujSxn34MMp8gI2xqzHyjkuBE
         640/RGNE32g6Awswn/+JXxELPcujC7kHkkvYBXwKGq/xTp/3z5BQQHcxfzXuQtM3gjl2
         H7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683373439; x=1685965439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXnVhbkITsZMb6O7jTvj7y5cUYSeICU9j0KWRJueFW0=;
        b=DhIpIhiP/M8SujVbHbjiEibLx/Gq1l2YJ84DFXpKfLl2GbWu+b4jKDtvt8CcW8Bxaz
         jmlMaQlGdfGqfDXcKgF9cPEJe35ynM1xZdAV2tKZbe173MIGsT+LVzMvwZoRnf94mduu
         LhSTgfOlOQpbZHo/h9OPDHUA+hm33AGlPiCp0GPgsm68Mvg95i+ueHNkKUXUs2AumxoS
         3VfgtMqSOt+HJhb8Y02ZVb3LYN3hMqQK+9moTPrvpRfFaV+8nwg0BCZNfsSOqa3BvNt7
         TsWEn5JGaNvVW6G3SCr+5kxChDwBM+g/OQmAsARSUI3zRsOItv+WIa71kSw/F8gUVoSN
         PLMg==
X-Gm-Message-State: AC+VfDxl7EhOpv5bljUjy3oqJQyBq18FRpZcPF02IGtQivBBe+Y5NgRn
        zJUhBv/fThvzIqnvkz5VteNJGQ==
X-Google-Smtp-Source: ACHHUZ5/5EDYUJUkzfsme9SuHBYWYzGPiK1u0Djh6K+SKx0nBfzlDz30DyoWVqickjbLfHIDrtmQzA==
X-Received: by 2002:a2e:8815:0:b0:2a8:bf35:3b7 with SMTP id x21-20020a2e8815000000b002a8bf3503b7mr1167358ljh.32.1683373438740;
        Sat, 06 May 2023 04:43:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e924a000000b002a8e48761aesm346518ljg.106.2023.05.06.04.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 04:43:58 -0700 (PDT)
Message-ID: <81d5643b-3aec-a987-eaf4-e89b0887ce64@linaro.org>
Date:   Sat, 6 May 2023 14:43:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/8] PCI: qcom: Use DWC helpers for modifying the
 read-only DBI registers
Content-Language: en-GB
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com
References: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
 <20230506073139.8789-2-manivannan.sadhasivam@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230506073139.8789-2-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/05/2023 10:31, Manivannan Sadhasivam wrote:
> DWC core already exposes dw_pcie_dbi_ro_wr_{en/dis} helper APIs for
> enabling and disabling the write access to read only DBI registers. So
> let's use them instead of doing it manually.
> 
> Also, the existing code doesn't disable the write access when it's done.
> This is also fixed now.
> 
> Fixes: 5d76117f070d ("PCI: qcom: Add support for IPQ8074 PCIe controller")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/pci/controller/dwc/pcie-qcom.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@gmail.com>

-- 
With best wishes
Dmitry

