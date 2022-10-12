Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88AF75FCCDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 23:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiJLVPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 17:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiJLVPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 17:15:04 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB1817E3E
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:14:58 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id r22so22728ljn.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uieyqLCDpOucubx9r5cYMTeUx9aYigU2t/tMa1KkfyQ=;
        b=fmbdXe91hMXZMN5EfJ94KhwONxi2dZtPaaTf0foUCp/ovWy0ZDqipIrD2TBtez4rZp
         BQxHVqv2J2oaxP+kTZ5HqcPGzYA3eDuKtPPHVAZg1+tf0AgDVflRqBYPEhml8qNxp86z
         kT89JF73g/Y/PoCgcOmbaOadp8MD2MM5T2B+LFaPs97S5M3MbSu7dQmyLTCTqpLsHgWL
         8vaETvW7JNqJBPgntWkacNVS+hFgwsit03C2ypUul7rHxLdPCEg/nfflEHByLPwsMwVs
         +MYTux5vSNi3NMomLOjzEp50KOa/fAZ8UHC4grYJrQa5YMYykIyPgbDfofDJ+R2633aZ
         6jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uieyqLCDpOucubx9r5cYMTeUx9aYigU2t/tMa1KkfyQ=;
        b=o6Wr7/UsDgL91QFtU5OycmawLeHKi/7wpBa4ZnFmAOJG6J8vp6TfxnbWa/yMmpj8gQ
         649fEoOZASGLQrwoySg7wBRtwuiZGLqNK5oMVhdEuZqTzWBH7lckv/8bKDDT7VEivNyc
         y4+P/y1G4ZdutWjvQu95hY2IQ3wlCHvecHPM7VufmJrkBD5iJcbLidunpNqbAsNLCQ4q
         mABH53TZGtoSqFRVeu1r417FXo0U6HwCNSbNoUnjSLrVN4enFHeydGBmccqv5y/bnzPC
         2VTo40UrxJVBRs06RqhRBn8KTnMdmD6jIT4tF3Neyt9k6cgXEeUZZojez3TA8GWUsXNr
         1wXQ==
X-Gm-Message-State: ACrzQf3uM2sFzrsVpXpcyz5VL/GgN/e+fA0wpiWPXW6EBw6iwSfhjRSi
        C9qQgB+if0qqbLFdM5v33uWEPw==
X-Google-Smtp-Source: AMsMyM790rUgzg/cSHIcS3cHtmXSk/OgaixrsnsRxMdVtBQ/oX2B1rwAoCFcOjWbLvN3MoipZj9Czg==
X-Received: by 2002:a05:651c:14a:b0:26e:9a10:6b90 with SMTP id c10-20020a05651c014a00b0026e9a106b90mr7238274ljd.306.1665609296268;
        Wed, 12 Oct 2022 14:14:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t15-20020a2e9d0f000000b0026e8b82eba6sm125872lji.34.2022.10.12.14.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 14:14:55 -0700 (PDT)
Message-ID: <6e9786b2-6aee-addb-7ee3-a5194a159c01@linaro.org>
Date:   Thu, 13 Oct 2022 00:14:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 11/20] phy: qcom-qmp-ufs: clean up ready polling
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
 <20221012085002.24099-11-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-11-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 11:49, Johan Hovold wrote:
> Clean up the PHY ready polling by dropping the mask variables which are
> no longer needed since the QMP driver split.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

