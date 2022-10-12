Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C30C5FCCFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 23:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbiJLVUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 17:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbiJLVUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 17:20:31 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455F61191D7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:20:27 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b2so27607232lfp.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svHmnwp/lBJXQfjmxrCgtPTSC6GLXx0JOQWMenb2G1c=;
        b=zmcRl90oW6WhKBDEMkFKHSfte3DVUDw2eERLCOBtU/VHE4a/BrKKjZIM8dC3FRrS8u
         Fd9XIJ9Rlij0/peJGTz+wmgoe3OhN+2NV+GOUnUeDFnSPLJ42EkzldGyxkMhnCftSV8c
         ftgYOl+WJ3KUC1EBWC8Bf8kYF5ZU0GFae3F4fU11QRm1xAtaOPdNFO82HSDihruysQBl
         mhqtfnwoQkhxcZvGYTv798Pg8mLe1rzHK72Uqp9mtOgix6sQ9JE3BeybqIE0mD3efs2i
         FpOBGruYRg+nvGVDbFCC+doJy/GkxrCsgmQBAt5z6OdESJZAPV3uyuBgYIK3tsUigrnQ
         cAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svHmnwp/lBJXQfjmxrCgtPTSC6GLXx0JOQWMenb2G1c=;
        b=VmTjX1qvwWld6UdE4a5U/gG9o0Xn5mEDTcBY8/LP3pMCMYDjOGuQdxzLlqJOJv3L/l
         ESjUyA3RvwBRUAsCsJLIFOd311TY9mtx++qSJjyZP0xSwIBMcWgZZs5Dwf1UgJTZx7AS
         LvYx8AOWo8HueDvyQXH2fsh40Rva8Cm47afji7EJGRinZqz+NB52MaNETy+mJqaTRbwu
         mxxmyGpv9CCcmWcngcrvmPpZbNu4myTROPQnaKXmWEiC9hfR6dhTxHV4U7gPB6+SIm9Q
         gocUzwo5Xyp4aFvAjxflb1HMV1QjQLuMZ6NEG3Jba7bLBeiO4GDbbSFiBQoXG9fE3iHF
         PUhg==
X-Gm-Message-State: ACrzQf0v4DcbJs5a58TP5y6KH+PCyJ/k4a+f2rfPsJkLLqlh2RnqpV/9
        8wREu8r9fbSh6gDKeQMJjgzS6A==
X-Google-Smtp-Source: AMsMyM7/9QqBwj34F2NGtv6kWrKVz+vIBg0g+1GZq6HuwJq/qlTB2kWMjEspKXuUqv9v5CFkvh8UfQ==
X-Received: by 2002:a05:6512:1156:b0:4a2:7e51:b3e0 with SMTP id m22-20020a056512115600b004a27e51b3e0mr11408835lfg.118.1665609625195;
        Wed, 12 Oct 2022 14:20:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q66-20020a2e5c45000000b0026b2094f6fcsm122880ljb.73.2022.10.12.14.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 14:20:24 -0700 (PDT)
Message-ID: <289149bb-2620-efd4-8a3b-831215b0a8d8@linaro.org>
Date:   Thu, 13 Oct 2022 00:20:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 17/20] phy: qcom-qmp-pcie: add config sanity checks
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221012084846.24003-1-johan+linaro@kernel.org>
 <20221012085002.24099-1-johan+linaro@kernel.org>
 <20221012085002.24099-17-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-17-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 11:49, Johan Hovold wrote:
> The driver expects every configuration to set the pwrdn_ctrl and
> phy_status masks. Add some probe WARN_ON_ONCE() to probe to catch any
> new driver support that fails to provide them.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

