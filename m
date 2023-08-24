Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51431786B4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 11:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjHXJP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 05:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbjHXJPh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 05:15:37 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699F2E67
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 02:15:35 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fed6c2a5cfso55229825e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692868534; x=1693473334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSNrypysIUyjhflg0pjRFYp9Ry192UTXWv/38Id2IQ8=;
        b=G+RL1cOiFx1ZNXgOtfW0tnCv3d/y7lh5b4upmjgkNKZJWPQKWiOiEaE8nq7UtnKZM3
         iJAQyBuwCCXIITLUaWc3mW2weqDeVzu+m3dw7E3OF+/s3o2fIct+v/JligOuKlsVqJ1+
         qekvMO6m85EFu+HSL1T1u11kw1X9DxksYHeE1WDu8Gp8Zn6TA5mcWn735aLXycPezfKu
         yNG99EWtOK/CsrIphjGAEVoAXlUzx5BnB3ZETSqXbBbMaamtcDBEy1u3LgXtgf4U22R2
         +UHnWGA0YliYXDYLMk0w5TF1s39JsmR5zzRgobuvfGRM1xTuqD0iLVXjJbg8yMIK7cl5
         VB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692868534; x=1693473334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSNrypysIUyjhflg0pjRFYp9Ry192UTXWv/38Id2IQ8=;
        b=OowBYZLpDpdN9JSMzeOxsJMsuSFYFXY8zaj1OvM8hb/wZWfY1VwYKpGGCctLLTwa8E
         GHs+N9R9ACUJUZ79XD/SbqP/1fB0EvJ7g09e+lcNRppSyK0hzQ+Ea7j+7uq1wQZr8xPr
         ycivHgtqnMk6gdBSe66dxAI1s1mntkS0imVzMe3jGxW6oVtJ+iEV/g14rCqTvqCAv+L4
         ry5XFtiBU9RoTfpNIlCmXBPUuyHurqyClRSQWWSbdG6YAM95YI6/hc2qNwn8JxDpMOMP
         2/0slOAbwEygF1kw+FMK87gl5CrgL9rDx61tExCwJ6GxdbESeqKvkmKNgp27Z3JlUcgU
         oxuA==
X-Gm-Message-State: AOJu0YyVq3+7wAmi2sHzo3jEfDmYEZqH4MrY37z+Nn4HtVamw244SF5z
        E1v84eQq3kNOiE/TKbhfDOOyKg==
X-Google-Smtp-Source: AGHT+IFUjl6BZrl/d+NjXw3KBR3w0TJiRQYHAefmOEMmLB1LuEVL0FTlBvorJBHiJH2XS9qFRF3p8A==
X-Received: by 2002:a1c:f204:0:b0:3fe:d1e9:e6b8 with SMTP id s4-20020a1cf204000000b003fed1e9e6b8mr11228419wmc.12.1692868533742;
        Thu, 24 Aug 2023 02:15:33 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c044a00b003fbe791a0e8sm2156285wmb.0.2023.08.24.02.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 02:15:33 -0700 (PDT)
Message-ID: <bd0c9cba-41e2-b449-f383-9970d00cb723@linaro.org>
Date:   Thu, 24 Aug 2023 10:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/2] phy: qcom-qmp-usb: fix initialization of PCS_USB
Content-Language: en-US
To:     Adrien Thierry <athierry@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230823171208.18382-1-athierry@redhat.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230823171208.18382-1-athierry@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/08/2023 18:12, Adrien Thierry wrote:
> This series attempts at making sure PCS_USB registers are properly
> initialized. Please note I don't have access to the qmp phy datasheet and
> only reasoned from the code, so I appreciate a double check to make sure
> I'm not messing with the registers.
> 
> Adrien Thierry (2):
>    phy: qcom-qmp-usb: initialize PCS_USB registers
>    phy: qcom-qmp-usb: split PCS_USB init table for sc8280xp and sa8775p
> 
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 

How is this series tested ? What are the before/after results/effects ?

---
bod
