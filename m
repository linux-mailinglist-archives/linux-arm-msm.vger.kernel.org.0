Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3427F5FB3E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 15:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJKNxF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 09:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiJKNxE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 09:53:04 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9B65A2E9
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:53:03 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id f9so16884424ljk.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeJIpnHuqT129UsEC084ejKumQorqInuIo3PdB1cQ4E=;
        b=B38SpvG+vI3qG1WbA7n5ojiI0t6BHplUC279lwIK7JbCAJXHr90JGCMM12jnkvciX8
         AUiqM4oagksi8REQLU2xFGIqTLwFQsKbpn3kyOY8SluxCoxO07zE3Oi9yYmLO5E1FeSM
         Tk7pqA5LXil3jSvvAo3lLmgGvb51hV2uLlfdVZ3Wj3acRmOY/kGfWaVvYuEWHwiUB88U
         tm4ontIhf4HJa4uJr8RJz3QGomBz+tuDZ3kwtKAQsodOYqdo+0oyVS6fCsuICumYJeDA
         HZfrTzqprOo7LhAjUibOJUyGuGNnpZsKYc9MwzcrZynMYb91ZFSbHIwvmq0Vz1ClHVEH
         voRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeJIpnHuqT129UsEC084ejKumQorqInuIo3PdB1cQ4E=;
        b=oRvqRrNpE57xsmUOSHEdhzaDadaafly9X+0cZFl/ZHZROmYVBEHDGM/YtOnVLkzPdN
         y7KeauBNYHueOzgnrSwfPyhtkcpK00AtTBKo29NACjyBsIMLkXhoSf5OtzAzKUH5qvpq
         P+nRPynyUDWcTiEcl4nVJOVaK/WzpHXY2UwlIMlvb5n+w34AnxZtU6iwUtU/GRNJhk6w
         S+hUd3S9ZhpU6wRK+eqv0qHqE/RyF9kdN8ah+r0ygQl5qop4NLTdpXwEdRFOseyGuqyO
         wsFC/9F7ji9CKSzJnWwwma9EU1IGTlGaS5BfUJW5nghLzqbfChV0B7vRoXz3VFe8Hm6z
         FfQQ==
X-Gm-Message-State: ACrzQf0uZFS7SkWNLzz0u8rWZVFxTkik09uJfEIK4VjYJnh75KNfU8az
        CkEFO7LfQ/6fj/qlCQZMVW6yLg==
X-Google-Smtp-Source: AMsMyM5f6WKeMMlHSrgriFzb4+2IqOFR3ZYlw6vcLtjqjUlMBxCxmPKIRPTWctbJPR0q4E39MUAakg==
X-Received: by 2002:a2e:a889:0:b0:25e:3d55:b092 with SMTP id m9-20020a2ea889000000b0025e3d55b092mr9315557ljq.402.1665496381822;
        Tue, 11 Oct 2022 06:53:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e18-20020a195012000000b004a25bb4494fsm1873583lfb.178.2022.10.11.06.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 06:53:01 -0700 (PDT)
Message-ID: <b5112119-d04c-7fba-0a06-74de058bf3ed@linaro.org>
Date:   Tue, 11 Oct 2022 16:53:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 05/13] phy: qcom-qmp-pcie-msm8996: drop unused in-layout
 configuration
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221011131416.2478-1-johan+linaro@kernel.org>
 <20221011131416.2478-6-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221011131416.2478-6-johan+linaro@kernel.org>
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

On 11/10/2022 16:14, Johan Hovold wrote:
> The MSM8996 QMP PCIe PHY driver no longer uses the "in-layout"
> configuration macro to configure registers that are typically accessed
> using "regs_layout" arrays (e.g. QPHY_START_CTRL) so drop this unused
> feature.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 34 ++++---------------
>   1 file changed, 6 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

