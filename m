Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C90E06125A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 23:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJ2Vvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 17:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiJ2Vvk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 17:51:40 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE7F20BDE
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:51:38 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id j14so12455000ljh.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfWRj6q8gtwExuU6xtlGX9JVKuZNXAjKxYdaU4R5p6o=;
        b=Urs78GnGtsyNOWOiR2t+pEDSq2Z8yNcr3WamFfOLGkgYRvPEg9oQwLK0jyxe/FMDJo
         s0JyfD22DW/aGQGfs09wLfnoUDenoO1Eu2W4ztQgXBI3RBJh7WJrmYDDizIUbahEU/mq
         qeaHYkUvaiSQXb1NG3Rmej1NSQcVadMrv84HJfcy7sG/esimdesMcx52tFoXAmOpH7QI
         5yAoElrSH9W0xv5x+X7jID6OnEh1jZlgHwq4hfl9WrvlXO+o6EU1PuZ/GATtqFre0gFv
         4U2BGfCYDim5AWL6Xwn4obdsyRlgKfVMOPJkE4ohlaS++Y/v6pfZfMlGeDvwFsW8Y542
         ELew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfWRj6q8gtwExuU6xtlGX9JVKuZNXAjKxYdaU4R5p6o=;
        b=clTOVGeoiDWoek3q+eZHx17BC0S+IkrdjeAI7cmH86BBqS49kYZx0vgub1tJuR/eua
         +6tFjRK3ofxNfRNXg/TWbjiXs/YrlCJ51wqMydSZQEC6RIVMjL0//5+LX+GbFnJdCiat
         qKlyIjfJOmBFd3Os2ByMPNiVvscwmFjAvnF7xrAUSPX9/TD5ShXH0uT8YQ3E3i7b2PON
         0gk7lDKtZirV+sfWwfmduNIkBuKGLITffFSL/YMyRcOwmUF8D2T+Wc6PhWCFLbefBCwf
         x/DpsG5uRuNOgRdNr2LAaU2DU6rQGYEMVbs9l5hqLTxBfFQawGZXbl9qwF1Vuemd/zV9
         Mimg==
X-Gm-Message-State: ACrzQf3DN2KAmRnsq1FtEhWonFXVHk9o1EseWpwcLRZQfZyPRV2pQNDD
        n+D04rGnwx54oaOyoNBOJT7KUA==
X-Google-Smtp-Source: AMsMyM6EIQfgG7R9j2+qWL5llQjlUrUy7Cw1VNT2F+skyNf47ti2pq4NwjqNhmv6eK0NYAtNjd3lZQ==
X-Received: by 2002:a2e:a602:0:b0:26f:ce8d:30cc with SMTP id v2-20020a2ea602000000b0026fce8d30ccmr2438231ljp.310.1667080296971;
        Sat, 29 Oct 2022 14:51:36 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id m2-20020a056512358200b004acff58a951sm453375lfr.133.2022.10.29.14.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 14:51:36 -0700 (PDT)
Message-ID: <c9562004-e519-1ba4-8fff-5ca586a8fca7@linaro.org>
Date:   Sun, 30 Oct 2022 00:51:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 02/15] phy: qcom-qmp-ufs: Add support for configuring PHY
 in HS Series B mode
Content-Language: en-GB
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org
References: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
 <20221029141633.295650-3-manivannan.sadhasivam@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221029141633.295650-3-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/10/2022 17:16, Manivannan Sadhasivam wrote:
> Add separate tables_hs_b instance to allow the PHY driver to configure the
> PHY in HS Series B mode. The individual SoC configs need to supply the
> serdes register setting in tables_hs_b and the UFS driver can request the
> Series B mode by calling phy_set_mode() with mode set to PHY_MODE_UFS_HS_B.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> -- 
With best wishes
Dmitry

