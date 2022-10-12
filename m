Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0447E5FCC4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 22:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiJLUol (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 16:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiJLUo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 16:44:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B27ECBFDE
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:44:22 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b1so22476354lfs.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+C0Mxv2tX523uCK05eKZPxUZ5oE4e3IyCVHLYGN5SI=;
        b=uvNDbWbG5eSo8weiIPDDLGWl8An4BMkTYO8SF7yC+yGjExdt81T37ieOfK+IDhI76d
         FqreDaEtg524sTKjC5lkpsWNNx0IlE+xv9xOZ0RkZx1FKjpP+4I15YgSZXadvR+/ryQk
         wCL3N1EI28kqJ6qJS+diwz1RwBORJrMX/EuWvdSnn/5kRs/BrxOgwN8l6h+486bpZTNz
         u0a2eZNigxL+OtWtlWMvQR6oIGMZuGwCuW4tZciVSsYskj1CQ8ywvoT2mA+EF8yaN8lm
         UIze/0FoQ+jh5NuSBrsDXDC4EOUcc3PiCtgH2Ycd5qy574j4mVE+UBMqJkYowJglYOhY
         d8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+C0Mxv2tX523uCK05eKZPxUZ5oE4e3IyCVHLYGN5SI=;
        b=GJIcItm4SLM7CxmP1KF2v8yq5xpy3G1y3+WdVpeET/eDMiu90pq1IMNzWXhW+rc8uY
         F01Wi1WkrfRzncYI4RJxciDl273GliPMMdBPquLyxg0Gwwx9dC7PrL+z0XP/H3NhxBTF
         /HOGUsfwIzLQP7BO+ujhrgcDae1hnKn+Eppg/mlxrW3QZ8xn5HUZNSFss2RINvRFPzaP
         A8PLvImJ8zPYyMesUNqbdElICMhGK6rSD+NIUaWg/YlWhd1WhTHTR3xyX3bZivmz6J5W
         T5mykUV2fTfWVCo3TLB9PLQTJ+znqt+9b15qH9YPNdtQiQ0dUEQPM2nQqllJkE8Shz6b
         qLrw==
X-Gm-Message-State: ACrzQf1c4I8gYkxGwyChaqbffwJwzI61FxxPlRxkBDn8T04wty7CN7Mj
        7+TupbH3oZQ7J28MHpseq7xu9w==
X-Google-Smtp-Source: AMsMyM6hBJPbIlXaMhcnTghNSdmHcOfNis3jxOSvhveulPVBL8W/p5rpNKObX5xbxRTdurBq5KrwmQ==
X-Received: by 2002:a05:6512:2392:b0:4a2:550a:e21d with SMTP id c18-20020a056512239200b004a2550ae21dmr11490183lfv.550.1665607460721;
        Wed, 12 Oct 2022 13:44:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d23-20020a056512369700b0049fbf5facf4sm103561lfs.75.2022.10.12.13.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 13:44:20 -0700 (PDT)
Message-ID: <996cf5ca-fb54-a69b-f107-13571b6530e7@linaro.org>
Date:   Wed, 12 Oct 2022 23:44:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 01/20] phy: qcom-qmp-pcie: fix sc8180x initialisation
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-1-johan+linaro@kernel.org>
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
> The phy_status mask was never set for SC8180X which meant that the
> driver would not wait for the PHY to be initialised during power-on and
> would never detect PHY initialisation timeouts.
> 
> Fixes: f839f14e24f2 ("phy: qcom-qmp: Add sc8180x PCIe support")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

