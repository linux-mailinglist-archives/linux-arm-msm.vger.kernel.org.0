Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9736B5FCC4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 22:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiJLUpH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 16:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbiJLUoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 16:44:46 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2285EF013
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:44:41 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id r22so20718308ljn.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYJ7SbNTRF9ZgQzs+eDl0D0NQhOGCHroaX28LaC7Rrw=;
        b=mfHh7EJkn1Fyg5NFxVeqIzNCwzLP4uuGIMrlgxMzY3cp9lLzPC1MatM80cB6QfhzRR
         zsN5otD6bN/PMZR6L26u3Xqugl+gJeYot9r9yELMBiftU+kah/cUcrKp8Pwoj8zIufU1
         wakCVtGdsI7k+iaw5rg7pGgzW2PzO2JpF87u1+Aw9Vhr37ekIIKKFGQv5N6h856B2OMy
         Xc8JV9mBbFN0Zr+n17huVs0v+ElAuto4QP8EvlZetXh7BJ6J2ZYpz+Sb4LJwzD2F/Mhr
         U+dv/6NvBuzakVcViL8rgYpmC6/zS7szH/KggVjohpNHp4eqa1N2tWJin7r9vAoiSqcX
         4A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYJ7SbNTRF9ZgQzs+eDl0D0NQhOGCHroaX28LaC7Rrw=;
        b=07JlN/Bi7nEUnnEYa89g7XP2A2JwacSzfBOp0enIGa3YBp/wjHy++2qoN5YHqP8Rr6
         GQkp4zduDKq+5YLXYMquP9RJmjlDMBBVaitxEQDwsOnisJjC1tiGO/jiMIq0RdgsG+jq
         wKT4gWnUc66M+fY875v3+AFM23BihxQ9pD/b29PzVPSksJD0Ptft3F+aUaijSm2Fldmw
         Kb6tBAa4zzEHZvtJLEfK32iyF6Eq3Rjo48ClWVDzhu18YVwUn/fxxLhsqs9PkzJrlOox
         W431nMnuJ360QxQXnJ2g3NMT9/450OIX0LZnvG7CKLNKZZo1qFPi86Fh0aU+YmtICHYd
         Rovw==
X-Gm-Message-State: ACrzQf1IAbeGwFqr+Z5U/mRTaESRpsc63m6Jo50PcwoEK536vrIxYNCE
        bSOSmiTjBtsdo4MMI7oxKgnQBg==
X-Google-Smtp-Source: AMsMyM4v9M1UzdRyfsHY+3aJUBU24HxU99cbgNWk3/Gj+7vMqb1ye5GSpdVNlWBA0QoDA4vzYJi3tg==
X-Received: by 2002:a05:651c:883:b0:26d:d4ce:befa with SMTP id d3-20020a05651c088300b0026dd4cebefamr10998992ljq.180.1665607479440;
        Wed, 12 Oct 2022 13:44:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e11-20020a05651236cb00b00497aae401edsm101270lfs.109.2022.10.12.13.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 13:44:39 -0700 (PDT)
Message-ID: <c0e2d297-2c16-6c61-2e15-a1557d5eba37@linaro.org>
Date:   Wed, 12 Oct 2022 23:44:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 02/20] phy: qcom-qmp-pcie: fix ipq8074-gen3 initialisation
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
 <20221012085002.24099-2-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-2-johan+linaro@kernel.org>
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
> The phy_status mask was never set for IPQ8074 (gen3) which meant that
> the driver would not wait for the PHY to be initialised during power-on
> and would never detect PHY initialisation timeouts.
> 
> Fixes: 334fad185415 ("phy: qcom-qmp-pcie: add IPQ8074 PCIe Gen3 QMP PHY support")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

