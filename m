Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2212860AEA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 17:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiJXPMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 11:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232322AbiJXPMR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 11:12:17 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FEC41D10
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:48:50 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id v27so9201265eda.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2LVAZTR3gKv5UKkCqDmH6P5cO3ySMAKj9waWhKCx8qQ=;
        b=APEOKhiRVN5yB7YFsQhWY1pTv7G4nWR5Y7JgWzlVXKY7nmp7tLsCDsMlMEB3wOvaSA
         fPVZ9CKJyridRXGCaAV0D0Za1YSmgUJVYTd82jCvsDIk6JuuklhEj5qWjVv+PYX5b5l5
         Y+l2TbOnKbkgwxlsKKV6em293P6Rrbt1m129ORQjF19JrRLjM0zcwTsYa09DY2RFCQiW
         zFPnxeSB1CsyPl1TFNr78j4ijshLx+9qag1tPlSiN3R6Bbei3ko1J7QKoLsOdRglTaYt
         RjkuPxGjkTLK7cnyts0qwEdwV2EGNeRkj39Y9Fh+S8ipZCv4ZH8GZR4Ejl2tlrLnS0No
         zlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2LVAZTR3gKv5UKkCqDmH6P5cO3ySMAKj9waWhKCx8qQ=;
        b=gIrsqCKZkvaQmN1+tN3H1Q0lVE+3rERr+CUDAzITho994ZROsj+5II5bWYPgnJcgmZ
         14j/mUzkF+RkPYq93jRb5ipTFI7FFuZlEh0ZP0SsB1C1gTxiLTHMvkEerCpBm8S/7l4h
         aBDoFMvZtPGCm+K5qZSc6aIYMEh0rtsRcRhpUoPaeGATZunm4H3iaQzifTHuzOYDqay6
         A5G6UJTjXEjCwjK3rbtKB4KCqMkqNRbrH/PVHzB7QRpdBiZ5Ftnp2NgDdC6/fsxsjmGh
         JKpih90JT15F1WwUgcdM4Onv+dX8cyrnZdVD3bYM3we8qAzPFyrnAS3/uk8ZQOYdqylh
         4BxA==
X-Gm-Message-State: ACrzQf1mfx3HWlJllgWp2cCBMSNXLKPThIVwMIIadkGO9IkDDJ5wEVKr
        cZRFK2CbdS3y/3rx3U4r788si8Y8QwlFCfE2
X-Google-Smtp-Source: AMsMyM7hjfF63ZAFI01LYKQIk/OiGQ6GljqVWZGUIA/jFtHkSYOClq8uet0aeQllEgjAGRavATMU7Q==
X-Received: by 2002:a05:6512:66:b0:4a2:3c33:7aae with SMTP id i6-20020a056512006600b004a23c337aaemr12728524lfo.194.1666618526866;
        Mon, 24 Oct 2022 06:35:26 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b004946e72711bsm4521906lfr.76.2022.10.24.06.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:35:26 -0700 (PDT)
Message-ID: <2f758573-c901-25a5-c4fb-8dc2f72b42bf@linaro.org>
Date:   Mon, 24 Oct 2022 16:35:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 13/13] phy: qcom-qmp-usb: add support for updated sc8280xp
 binding
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024100632.20549-1-johan+linaro@kernel.org>
 <20221024100632.20549-14-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024100632.20549-14-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 13:06, Johan Hovold wrote:
> Add support for the new SC8280XP binding.
> 
> Note that the binding does not try to describe every register subregion
> and instead the driver holds the corresponding offsets. This includes
> the PCS_USB region which was initially overlooked.
> 
> Note that the driver will no longer accept the old binding due to the
> fixed "phy_phy" reset name.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 82 ++++++++++++++++++++-----
>   1 file changed, 67 insertions(+), 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

