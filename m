Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEDA7D8873
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 20:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJZSjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 14:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZSjr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 14:39:47 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22A510A
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:39:45 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so861709f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 11:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698345584; x=1698950384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cB3WogQP9E/Yo/vPH/w87eDiej54ju5fgOVr2+Kfho=;
        b=WIvXU7sqhfbH3YDpHN7jSJzOb+bDD4WyXYZ70rOiO151jKA9v69yR8ZfcUqSdjIUJ8
         QpWPg0NWq+xkY/o2hVHvNvusCQAM+kosPNkUxY9mzZMvbHQaWkUnTbOy7DZnrpYm6wy4
         YOTGGrfeQt2wCEhHKisPZRruoCTSpSQ35/PG6qOF3bCDDbW1i8fLA/Qc/ZpixOHRxwTH
         U5qfzv3MKipJEAQxUfjSK0E0ZKwrar3FzpuoFVAONRwRo4ZSVOaHJpb5cWSRCWuvxUsc
         uzQUTTKpNPqiVD/vScQHVR1duVvZ9kPWRP5NrEZrlAO1PuLzOr4Ch7unTg3icTr5B5fX
         KR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698345584; x=1698950384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cB3WogQP9E/Yo/vPH/w87eDiej54ju5fgOVr2+Kfho=;
        b=fH6TAQe6vwolKqV6njtCXs4uShhPTNXvttE/ZWdmCeM8jFiMWLfJVR83hOl0oIPswK
         DY7owT+jZ8pqd/J6Kow5NHgRgBQl/d3ROZ1dQnkoA3Oe2zQRRm9vI+bSpvpSBu6QNUd6
         RbwLGOsUJBxZSj512ypuQbbI7tzcLOHWjTlLGGp9d0uX9gETmTTnbQTkhLAV/lIBuCCQ
         B5AlMOFxPa/tC+pUfXMnxACEvGb7sqt9L7Ms7e4fUDnKg/Av1XjqtcfT45h1EyYHec8L
         TSlC/vl6XCcvzhvV9d63COTYUsMjz93Vgg5WTnigYO384W1v5rlDf1kRskY59cafL8Za
         OwwQ==
X-Gm-Message-State: AOJu0YyaEy8l7Z+aEnUpFL7RrXELkLPvUHzhVnWzEyaBPtvgBxXcm/Ch
        RkynhEqHn4awXk27bBDIiaLqZA==
X-Google-Smtp-Source: AGHT+IHp3j6FbSt0YlnznWf5C/IaEfvtRmV8renKJJWRPyNjtbsvjH55uId5HEXYhiTGnM8WeYJBtg==
X-Received: by 2002:adf:f391:0:b0:32d:92fd:9f73 with SMTP id m17-20020adff391000000b0032d92fd9f73mr369098wro.10.1698345584085;
        Thu, 26 Oct 2023 11:39:44 -0700 (PDT)
Received: from [172.30.204.255] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x11-20020adfffcb000000b003258934a4bcsm34968wrs.42.2023.10.26.11.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:39:43 -0700 (PDT)
Message-ID: <b0fa21f7-252f-47b7-abe2-23f96767983e@linaro.org>
Date:   Thu, 26 Oct 2023 20:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 3/4] clk: qcom: camcc-sc8280xp: Add sc8280xp
 CAMCC
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        andersson@kernel.org, agross@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231026105345.3376-1-bryan.odonoghue@linaro.org>
 <20231026105345.3376-4-bryan.odonoghue@linaro.org>
 <20e2801d-df4f-436e-a677-2c81d43e3273@linaro.org>
 <6d44b972-9337-472a-9010-71ebaa0d45cf@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6d44b972-9337-472a-9010-71ebaa0d45cf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/26/23 13:34, Bryan O'Donoghue wrote:
> On 26/10/2023 12:21, Konrad Dybcio wrote:
>>> +    .flags = HW_CTRL | RETAIN_FF_ENABLE,
>> This should really be HW_CTRL_TRIGGER from [1]
>>
>> and then downstream uses cam_bps_transfer_gdsc_control and
>> cam_bps_get_gdsc_control to control hw (fast) or sw (normal) mode
>>
>> similarly in drivers/cam_icp/icp_hw/ipe_hw/ipe_soc.c for IPE
> 
> I'm happy to do such a conversion if said patch hits -next, qcom-next or clk-next before this patch, otherwise I'd rather not gate this driver on stuff that's not queued anywhere.
> 
> There's alot of CAMSS stuff driver/compat/dtsi that is gated on having the CAMCC upstream, effectively all of the CAMSS stuff for sc8280xp.
> 
> Fair ?
Fair

Konrad
