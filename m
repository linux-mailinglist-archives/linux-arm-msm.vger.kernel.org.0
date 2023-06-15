Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E7073125C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 10:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239220AbjFOIiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 04:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237380AbjFOIiK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 04:38:10 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042E21FFF
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:38:08 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51a270e4d57so519200a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686818286; x=1689410286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTnONamiWI78G9kUPlocf8m4LdwDUY7gVx5tClnqFK4=;
        b=MREZxTbfuV54pYz1RaDjFOtGb+ttRwS1Syl6YbhS8vPvKWa9fivV4OGflJSiaN4vAe
         iq+BJttG+xGc3Yssj0IusaIIJ3MMog0KRJoJ8fXzF0g/pSzq5kaHFqwau0Lygbz8rUB4
         QqF+UhYI+G8SwsxUJEe3wd2AKcj8FmF67yCtQOQ+hr8FlXAGEHb85+Xos2UaLon1o8NQ
         uRO/YQzyonRZKOTERBd+PsDCk3XXelwOufQNoCoj51y7OqSrz1wGAZe7p6eAt16WjJZo
         4Ln/hCI78DkSG2q2fqRIsVovFR8T8hMIr6keXD9B9XzO+LemdX3EEZSeoHdsvgj4bij3
         IiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818286; x=1689410286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTnONamiWI78G9kUPlocf8m4LdwDUY7gVx5tClnqFK4=;
        b=g4N/b71HTGIpxJZB4wrNJUJ4tRlOPC7t9joaHusJS6U8DvsNA3X5II85wuVpUy25cx
         BvYN2yhA/aHJUHyBDnOpXlrgLKh+n523w8Q8hLxh3qMj0h9OAZoH5LoWYEZg3TxGyPUb
         /g/CZm7gfThxG0rAEdv5FkUP8LXxQwoBvHrgBRReISnUOOCtzf2+gdURL5brr5YFKla3
         NVVSkQIvsjfUAo122VPkRBcxuwSnagBO/tTkASGJ53G2qqP+jx+yXYpVGM1mPuw9cflk
         //IbWYMgSNLERJklLxdV29H1x55E382YYVm8gxO5xhG7EwVDPLpJs0n9lKlJ+S8Nzmh+
         4o3g==
X-Gm-Message-State: AC+VfDyj/focPmWUO8U33tvCbB67ni8HFDpML/Jj5L8A73/ElaoFuUEa
        MoUvb1nwKxnQm58jVE8FZONfKQ==
X-Google-Smtp-Source: ACHHUZ46W2BILCCTozrhqHTaCBXCLZyuSFXyw+aYUXP6Q2C3uhcA+0fx3GAwzBzhVK41U14a0WogqQ==
X-Received: by 2002:a05:6402:1518:b0:51a:263c:ae54 with SMTP id f24-20020a056402151800b0051a263cae54mr849701edw.33.1686818286530;
        Thu, 15 Jun 2023 01:38:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b20-20020a05640202d400b005182df57885sm6383999edx.19.2023.06.15.01.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 01:38:06 -0700 (PDT)
Message-ID: <d35e2f57-f3b1-415a-f74b-84c928c38fb7@linaro.org>
Date:   Thu, 15 Jun 2023 10:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/3] dt-bindings: PCI: qcom: ep: Add interconnects path
Content-Language: en-US
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        manivannan.sadhasivam@linaro.org
Cc:     quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:PCIE ENDPOINT DRIVER FOR QUALCOMM" 
        <linux-pci@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1686752666-13426-1-git-send-email-quic_krichai@quicinc.com>
 <1686752666-13426-2-git-send-email-quic_krichai@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1686752666-13426-2-git-send-email-quic_krichai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/06/2023 16:24, Krishna chaitanya chundru wrote:
> Some platforms may not boot if a device driver doesn't
> initialize the interconnect path. Mostly it is handled
> by the bootloader but we have starting to see cases
> where bootloader simply ignores them.
> 
> Add the "pcie-mem" interconnect path as a required property
> to the bindings.
> 

I did not receive third patch in the series, so I hope you corrected all
DTS in the linux-next (sdx55, sdx65).


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

