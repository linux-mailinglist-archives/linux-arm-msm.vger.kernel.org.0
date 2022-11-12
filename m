Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 218A1626766
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 07:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233542AbiKLGS1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 01:18:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbiKLGS0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 01:18:26 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98F6FFE
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:18:24 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id a29so11256411lfj.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnfzUAs88i86Mx8MvJyKETPrtvIl8xH62MVXOdfgEDM=;
        b=ujRLphb6doSkzYlyhU70mBqozOQZeYOOlnmKT5EOraFSNRDeC3e8fuUPt9BpYL120U
         Jxy5bxDLN7BsU02vEsECIEwpWTCmGtWUf6r8LV0D16j/SsWf4so9TkHkdkd/t+A9nwln
         Y4Jp6pqtC+IBmt+4Dtc3JoOhYnksYnFXW1SjRohvccg0qxXexw92WEbwxpEZ+x7KegD0
         oWKevOcvXuck5PF/kp8Tbcq0QwQNITrfIMNcA0gkcYre2bWPkYcSqNuT1scFTV3vk0ip
         d0v2bUMp/h4NMjHMUWuetAsn6wg2ZW3zMCOgPcQXVyuehk63jtzYXsmqLjk1aTjtYxco
         37/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnfzUAs88i86Mx8MvJyKETPrtvIl8xH62MVXOdfgEDM=;
        b=AvblxkwQVVS1nZwJHhbbNc+g1Z9XL3KpUy47eRXv/fueGATfUEYTsRt7QQApUzIOvY
         jAsOQTJbojtz29J8cXU35bnSZYciKPCL+Y376+wkBpNyVbWA04A3PI++1qRlgqz1S/Pm
         TDQ5CoPPjeDd2IGZPZl56oQljH84q6EK193xCDZ/xJ0BMsMNnnubkIMN/XvHExr+FYSm
         MkLfCJosQyRzwfQzkPXjZP70+hGxx3h9/F9PZxitN8BGql8c3MyNubRj4xBeIdrS/UL6
         SmEW2WzzQSWd483foszjxCFXgqQrwE7uTr2vhs4BQ01pTlGX87kidHf0ZS+qrDzfpfo/
         6ikw==
X-Gm-Message-State: ANoB5pmF3eqtjOlPnE7Yg0dfq0Dp1jkPP/+eMtzLPfAijPIWBto6xOeG
        vG79VcvCQqWAU0qQ5Z7u7K+VFg==
X-Google-Smtp-Source: AA0mqf4J66Bf8He+wVlLo2Ko+2upfofJLXmBCfkAoj1i3U3m6pu7Uiz8J5oRrbIzGfA36scUM2WMZg==
X-Received: by 2002:a05:6512:201c:b0:4a4:6991:71c4 with SMTP id a28-20020a056512201c00b004a4699171c4mr1839436lfb.355.1668233903190;
        Fri, 11 Nov 2022 22:18:23 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512203100b0048a921664e8sm714498lfs.37.2022.11.11.22.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 22:18:22 -0800 (PST)
Message-ID: <1e8f27c7-3848-38d7-e658-5f2578a28137@linaro.org>
Date:   Sat, 12 Nov 2022 09:18:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 6/6] phy: qcom-qmp-combo: clean up common initialisation
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111084255.8963-1-johan+linaro@kernel.org>
 <20221111084255.8963-7-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111084255.8963-7-johan+linaro@kernel.org>
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

On 11/11/2022 11:42, Johan Hovold wrote:
> Commit 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo
> phy") added support for the DisplayPort part of QMP PHYs but
> unfortunately did so by duplicating parts of the shared configuration,
> something which has lead to subtle bugs depending on probe order.
> 
> As the resources have always been requested based on the USB
> configuration, make sure to not rely on fields from the DP configuration
> when using them (e.g. in case they get out of sync) and remove the now
> unused fields from the DP configurations.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 47 ++---------------------
>   1 file changed, 4 insertions(+), 43 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

