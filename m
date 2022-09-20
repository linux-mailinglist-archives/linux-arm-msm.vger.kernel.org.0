Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA355BE79C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 15:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiITNwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 09:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbiITNvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 09:51:41 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340B243613
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 06:51:36 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id e18so1981276wmq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 06:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=dGNKbaJqnZ0vm4X6p1XFdB7jKff7G25UZ/5yeLIQRl8=;
        b=f3bWpMUNnxjqIhydqPGOFJqITjl9e4Ws9Sd97kNJNs/TG6hz5v7o7+NMmbTCmY1HpA
         H7PWi/qgPuJbOGN4Z9VaxGSskU79Igidmy22BgIzuTSkLKHF/L6/aFcSojS83VKMLzrO
         anxg5xEz9jR21D2gPchS6fAu/6BKxKKE7alNf3KSV6fEkv0GS3xZxdQigBdbr9AOYZQB
         CAKDZDnG4HYO5gSQkcezWk2qAIBx7g3IxSZnslRuDp3PSMWWVU359Qeydl0YvaW6twVl
         XfgQj5jE7QluJlmZTaXGG/EAPcgxQrANtGVnMU59GOG1Mdrg22V/v0EBixN+GJt917hy
         hToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=dGNKbaJqnZ0vm4X6p1XFdB7jKff7G25UZ/5yeLIQRl8=;
        b=rmTzdF17a4/Pv+pT9R2u1TNvcUM0Thif9Rt1gQjsPPXSL9G9HNERJG6psNoqUxiU93
         Wtret/rVKXtd4A1Ms2KDxSAkT+bnaFm8uiS20YZR61hd73Yud2DLYj1WeXs0NJVZKKIP
         +ZcUOmY3R814uyJQJvruWWAHnYaTXL7AquR3fd/VOuYAClVxfXn4v/YULvbnjHTohrKP
         WDHQE9aL4qjmE/zEJe7IEcJX3ekJUPMqkEmgeyZepHgzEUKsWU27ZScSosNm2LLQul4x
         MSX0H9vC3coyc423Q3OVWRGTP9/Tt2hiLQBTlbpynJ1iinEppNSQUEO8pggolm7aliaU
         /UQA==
X-Gm-Message-State: ACrzQf3dtZvYxtLxBI0RmsFUqKZNQQhc6ikHGEjdlzb+2oANb98TefK8
        gKWkurnoslPUsYyVNf4X1Lnq/g==
X-Google-Smtp-Source: AMsMyM4eqBUsZ4WQnGIkvZEjSENoRyiG6clocZdc8mKB4v7UI+hBERpelndNTfjuEewATOlhOBIddg==
X-Received: by 2002:a1c:4c02:0:b0:3b4:9249:3539 with SMTP id z2-20020a1c4c02000000b003b492493539mr2526605wmf.128.1663681894812;
        Tue, 20 Sep 2022 06:51:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e? ([2a01:e0a:982:cbb0:7e10:f0f:43b2:9b5e])
        by smtp.gmail.com with ESMTPSA id n11-20020a05600c304b00b003b341a2cfadsm102666wmh.17.2022.09.20.06.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 06:51:34 -0700 (PDT)
Message-ID: <3e823482-7e82-6928-c280-3c7d0eedf256@linaro.org>
Date:   Tue, 20 Sep 2022 15:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/17] phy: qcom-qmp-pcie-msm8996: drop unused kernel doc
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220920073826.20811-1-johan+linaro@kernel.org>
 <20220920073826.20811-9-johan+linaro@kernel.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro
In-Reply-To: <20220920073826.20811-9-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 09:38, Johan Hovold wrote:
> Drop the removed mode field from the struct qmp_phy kernel doc.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
> index 7e755213e9c5..e261837aee32 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
> @@ -238,7 +238,6 @@ struct qmp_phy_cfg {
>    * @index: lane index
>    * @qmp: QMP phy to which this lane belongs
>    * @lane_rst: lane's reset controller
> - * @mode: current PHY mode
>    */
>   struct qmp_phy {
>   	struct phy *phy;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
