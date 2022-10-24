Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 105FB60AE75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 17:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbiJXPBU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 11:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbiJXPAx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 11:00:53 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E30B13588D
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:37:52 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id bn35so4097668ljb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OccXvrVFPSdcIBEbMx4c26n9Pf99eO9A16XUUuZhuS8=;
        b=xGHR8U9ExEcHmssSxgKskB3JbHr72wsekwdOEpuYkrGjwe8nSuiiK9vogyhh/KENCz
         VAnaFMf2/Tw1UmRC8T7XZ7uOqx4lw9CPLRqfhaF/21tt1A8MkMmMmoySSaL0LhVEqcyb
         NWFkEqPhInWC+gQIZ7xBFGfiqALA+cVLSKjCHwPmqVRSy0QvgN5w2UbtAFSTcHwgvvgK
         nHsF0b6kE9abbC1FfwKAICbAHA9JQTqNZhTYhD8X8GhJX7I/T+d90GQIMnw+YlOTDzni
         nM7Z/014IT9o9FzUrjOvPNbh3hnvzHHtuVWwCSXfCSMBKStw/0sNBirM3jhEPYwNuLx7
         0Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OccXvrVFPSdcIBEbMx4c26n9Pf99eO9A16XUUuZhuS8=;
        b=SQ70+E3YZtH/iWr8S31tZkyUEl6sqg7YiXccZEXFUN4Kr4ghdMogMBoJq59ASyu+mI
         nnqbDBSjqr2M3ZR3sGeMpH+9WnJ8KKc9lMwcTlZObPxd6ZHsOoesnAacaHPO4tob8n92
         J9TqH33B78zk4DVCFtZfizlvKovqKSL4Oi+68i+PCbuvK1sy8AZkyNDpUWMU6WBv3UDY
         yZdLuyU3k5/61CA1B4XPEh5Y+JF4xJfVouEr5T+/SD58JyHUyX2vQgBXGd2rnAkYdWZY
         huKrn3P7q7sgFyq2bkjaD8LKEqAYEmrnnoJU7oP2MR5Ud+BeAHQFqL/rCEtanWxkfRXa
         K5zQ==
X-Gm-Message-State: ACrzQf1R9TdNtdyz5gYnSOwl6ykvTGJhQcYLkl8wF377eX+dMt3ZSJvq
        ka13sDmcP9pPxo5VSmmp1/bMpw==
X-Google-Smtp-Source: AMsMyM4GVB2gyMzEwr7DXV7QkBWicvLrN8nkwr0PZVkKWxNJmxv36lEuSDbONmjQQTcTuRUaEwvdww==
X-Received: by 2002:a2e:9181:0:b0:26e:91d8:5796 with SMTP id f1-20020a2e9181000000b0026e91d85796mr12231780ljg.398.1666618490966;
        Mon, 24 Oct 2022 06:34:50 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k11-20020a05651210cb00b0048b003c4bf7sm4544630lfg.169.2022.10.24.06.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:34:50 -0700 (PDT)
Message-ID: <7ede9df3-f333-96a4-5b88-aa157d4b8847@linaro.org>
Date:   Mon, 24 Oct 2022 16:34:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 09/13] phy: qcom-qmp-usb: clean up PHY init
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
 <20221024100632.20549-10-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024100632.20549-10-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 13:06, Johan Hovold wrote:
> Clean up the PHY initialisation somewhat by programming both tx and rx
> for the second lane after the first lane.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

