Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AACF25FCC36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 22:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiJLUlx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 16:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiJLUld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 16:41:33 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BED10B796
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:41:07 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q7so19543574ljp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ILeZR9ljvMcxEmzBJ8lBnjRb40h0e073JskMb2uVRm8=;
        b=EN9QBnw0eguaQ/9gUc5AiquFLwyIXTuqIPS8XDeUpFTSFeXE6C32VTtjisslxXR9AK
         CrcDwAkY0IxlESZCmy24Nr9lHS7FKG8J3ZWRqI0PbNOfGVmcHU74bgNPbze+2reT+Fop
         cjTete/txDOD9D9wF8ksmj17gXemdKzub9PTSxP6kmKs7GGF3SfxMBuxBtuvi5i21WWG
         uHr9R0TLYbU6FPWNf8pFAjGahqRwNbeMp0BGUE66v1cB00eTfFnlAEjmMwlsXJ6QaIWJ
         whp7maVDx1S7M6XRf2rGl8M0AX3LN8TIgbC5d8+FmIDGUn+r+5gU8+qkEWvW3J4DRmSY
         9PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ILeZR9ljvMcxEmzBJ8lBnjRb40h0e073JskMb2uVRm8=;
        b=fPrv6YG7VCbVMSelzGJcDWCMidO/zcYB7znejSDSdIvwUrVwcHs/NHjAE55j1OOBpB
         ApqSsXPoBmP3twzEHgiDRnbMO8CAlSUfAogef2w56zpeGKWJesKnsJ3PNSZ1U2IiJtMf
         equnTdm/qtzrcb8vtLGlJ+fUMqCdnCe396PRl99/2VsJq9WbfTYhhN1RylSzpoepziCz
         YeSi6JxUwz93ij7bY6YC5l71kvIecekUaoFIeFHN+Czr9mS8cvpUZqythOradpY7lq9O
         Cv9JHRLv1Ijk0QZTBd0Z16xKb/kR4aUAVGHopZfNPFZI9noV9cxNE/4fjDgw6xnINnnU
         FYMA==
X-Gm-Message-State: ACrzQf1q7/1YMotuPWIfMoh+xSjubhPXR4CZbFveRd13taOwb9rAbhqY
        209kpgTB5vobQdb+3paZsiHKrQ==
X-Google-Smtp-Source: AMsMyM51I5MIZCwSNofahgGPyU2eYU/Mv/2btKXcAyGtnZVbMo/nriT1JKVrNp5R9kGFLiMvLZ5n8w==
X-Received: by 2002:a2e:834b:0:b0:26d:ffb1:dae7 with SMTP id l11-20020a2e834b000000b0026dffb1dae7mr11417964ljh.128.1665607249055;
        Wed, 12 Oct 2022 13:40:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 184-20020a2e09c1000000b0026be1de1500sm107753ljj.79.2022.10.12.13.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 13:40:48 -0700 (PDT)
Message-ID: <a48368ea-7f09-3723-fc60-b735df57c355@linaro.org>
Date:   Wed, 12 Oct 2022 23:40:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 09/14] phy: qcom-qmp-pcie: replace power-down delay
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221012081241.18273-1-johan+linaro@kernel.org>
 <20221012081241.18273-10-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012081241.18273-10-johan+linaro@kernel.org>
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

On 12/10/2022 11:12, Johan Hovold wrote:
> The power-down delay was included in the first version of the QMP driver
> as an optional delay after powering on the PHY (using
> POWER_DOWN_CONTROL) and just before starting it. Later changes modified
> this sequence by powering on before initialising the PHY, but the
> optional delay stayed where it was (i.e. before starting the PHY).
> 
> The vendor driver does not use a delay before starting the PHY and this
> is likely not needed on any platform unless there is a corresponding
> delay in the vendor kernel init sequence tables (i.e. in devicetree).
> 
> But as the vendor kernel do have a 1 ms delay *after* starting the PHY
> and before starting to poll the status it is possible that later
> contributors have simply not noticed that the mainline power-down delay
> is not equivalent.
> 
> As the current delay before even starting the PHY is pretty much
> pointless and likely a mistake, move the delay after starting the PHY
> which avoids a few iterations of polling and speeds up startup by 1 ms
> (the poll loop otherwise takes about 1.8 ms).
> 
> Note that MSM8998 has never used a power-down delay so add a flag to
> skip the delay in case starting the PHY is faster on MSM8998. This can
> be removed after someone takes a measurement.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 33 +++++-------------------
>   1 file changed, 6 insertions(+), 27 deletions(-)
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

