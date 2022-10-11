Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0391B5FB3E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 15:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiJKNwR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 09:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbiJKNwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 09:52:12 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B3C79616
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:52:09 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bs14so3992806ljb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxR0v/ndmgcsuPzjbLqOmbbrMc5VOEhwcb79QANVAz4=;
        b=WGNbpXLjvtsfc6Vl/bpIgYFr7RbCrUSyueqiIkBrdO4N13nbo7UgKj8f7cm4SLA0H5
         +5j6MxF9UVldncMF4puCTaGJc7HNrDwhAQaHYL/PtOsOad8+BF0ottFg23+ckx+ZjFKu
         KutT5bjxxLPFeos9GSXNTfCGuTDB2ohVEMGHlCq7dz1NG25KzGzZ5+kSgq2BqikIpQlv
         xaXgF8O5ZYdLMjT6hDSsjUJDMUN12Fd9NcnFNzVB5aUlAx87v1K/fS3faIi8TCiu3RQP
         w+Q4FKbfxlSDLvtrxI6TwcON9CCLVY7DjcAE/mCNPLbAMBc89+SDcYvKp3Ct0lfmML+u
         GN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxR0v/ndmgcsuPzjbLqOmbbrMc5VOEhwcb79QANVAz4=;
        b=i7+khesX/xSdULhLUx6SJJ22t6nsgF6X9ietlZNUud4ucNZ2X5k8pgFsjOEVisbwBk
         JovTAa2Qdi//DAYDsKRAgoF0ckPjxCWVOD7xkJb2ZtPVA0YQOdqIbn7MWiuSAGjF141d
         88Ol0/24wBrRpXZBc0WbKclxwqiAUw2j4k5xXeylFaZGe5EOpM/4XyXc7Qp6akRSQ37g
         Ws0W6Q/ccBNLimJ+yf0t53k66gw/vT0go45SjihlhvTOuGlLuITytrt8PnJpPkvXePFQ
         kYXKdvt//14Mun19vkFw28WUaaSO/oOnVAYorar3/R4cTxjAogiTyv24TUGmiR23KHDY
         MVzA==
X-Gm-Message-State: ACrzQf0MxbdONr14VXkbfC3YHQxXk06x7wmcdZZV0RgT6e/jA5IHaIuQ
        XCBjB4L89DF41JbiMLhv6HohJA==
X-Google-Smtp-Source: AMsMyM4/nklHTLz3p+xybaJMzzzkzXVdaYKrMfraaF3FGyJLTenKKTwePcIZcpcEqfuOYsZHIydRug==
X-Received: by 2002:a2e:95d2:0:b0:26f:b14a:d639 with SMTP id y18-20020a2e95d2000000b0026fb14ad639mr2680183ljh.57.1665496326864;
        Tue, 11 Oct 2022 06:52:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p10-20020a2eb98a000000b0026c47426cd0sm422510ljp.140.2022.10.11.06.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 06:52:06 -0700 (PDT)
Message-ID: <44f43f88-508c-d2d0-197f-f0e37d3bdd1e@linaro.org>
Date:   Tue, 11 Oct 2022 16:52:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 01/13] phy: qcom-qmp: drop regulator error message
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
 <20221011131416.2478-2-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221011131416.2478-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2022 16:14, Johan Hovold wrote:
> Regulator core already logs an error message in case requesting a
> regulator fails so drop the mostly redundant error message from probe.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 3 +--
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 3 +--
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 3 +--
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          | 3 +--
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 3 +--
>   5 files changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

