Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 529B05E65A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 16:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbiIVObz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 10:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbiIVObr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 10:31:47 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BABF6871
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:31:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u18so14979175lfo.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 07:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lWxYsKHunzTLgP+6yLWJNKwWAFjPCUjcE8E10qG99PY=;
        b=Odm792L6nD2rKtq+NN9HM2Io7lJc277RtK+cNXOOe4J8MNwznd+yulBBWvLzsYRaTL
         8d1MAfRO7Cc8WwEQFCtYnkMBFZaw1K4Yu07h2GPSpHDZ+pqO3mQt1knl5KSg9UD0OcRj
         rZxmwFPql7hYebCtYsvsw8sCyvlp70DqtfpfLsyPJomHN6gJkeO5VrMcLg/ujfH3rbTF
         CBYEyM0Hcg2q4o3zOChaJ2lSMxNi6EogGPB48O5aR1IUIrCTTB6wfSKOEBjkVJVN4s3g
         VKeKIoyrzy8pLMvMMo00Mgxt2pqLsVJFmqjzvapGjsNav+/lFVDjM1VJwCSmI/Q0pgwd
         R1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lWxYsKHunzTLgP+6yLWJNKwWAFjPCUjcE8E10qG99PY=;
        b=ZYgaCEIo5XvtaLhUvIl45PiMW/oApV6mHaddFe26w7aDq1U4yS8g5xKwV1sFHw7+Z+
         E0VZusHlv7xaNBUcNywoWCDwg2G8Akp1DCnCPHeC2U/Ev35WsmLnz0e8UHWaF9fvxwon
         XK5k5Fs37z+GIpyE//a4OUgCAUQRZX1qYc6F1SmWr9fcvgOeGdWdLCDu30H+BfhUMVJ5
         WO4YjkmZF1tspQNvddUfyXpTbjv6aGj+QN1NSlvvaHzdYxHWfarzT8vkGyV7vNfb2SoM
         sqGcgAKd7kvMm0Jad/5pQXLLBFG71KYU2lriEst9HQoEM6Bpgan6VbiRoWtZx5h0NjP/
         tzug==
X-Gm-Message-State: ACrzQf2ckecNkEN2j71xH1ov+/cF3ZnJIIhN/EEbLAWhjhuPPi9dZepA
        HejjGYR2dwBGd7P5TWaoxq504DnZEMKJtQ==
X-Google-Smtp-Source: AMsMyM6fumXbvTNcAX8qg9kGyIM6pmClMHydCp1AtDlObTKqMNVpLsIRB943A5Jw6UOZ30Af4dYByg==
X-Received: by 2002:a05:6512:3e26:b0:497:3a4f:d1f with SMTP id i38-20020a0565123e2600b004973a4f0d1fmr1513807lfv.31.1663857099045;
        Thu, 22 Sep 2022 07:31:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x10-20020a2e7c0a000000b0026c2d2a9b92sm908884ljc.101.2022.09.22.07.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:31:38 -0700 (PDT)
Message-ID: <8709d913-79c4-be12-ed75-b46eef155cc6@linaro.org>
Date:   Thu, 22 Sep 2022 17:31:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 07/17] phy: qcom-qmp: drop unused forward declarations
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220920073826.20811-1-johan+linaro@kernel.org>
 <20220920073826.20811-8-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220920073826.20811-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 10:38, Johan Hovold wrote:
> Only the combo QMP driver needs a forward declaration of struct qmp_phy.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 2 --
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 2 --
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          | 2 --
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 2 --
>   4 files changed, 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

