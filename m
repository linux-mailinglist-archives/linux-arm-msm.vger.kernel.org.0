Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE33628380
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 16:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbiKNPHe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 10:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235795AbiKNPHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 10:07:33 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBBD1F9D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 07:07:32 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p8so19723673lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 07:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULzF3p3L8oeTaQhvXffg+8XN5ZeIieb8W7hDny3blHE=;
        b=EIYzol6rNEK4IblHJWChN1Zv9nIa45kXVtlbW7+frCM/IHuRXbM5rBBThXv689sbHz
         EsfkoilCGeYJhJj8M+94v2mp2MpR/oxGu0fs3jVF8dNG8hODo2Gf9Y52Eb65e3bDy+eH
         KtlW/9wd0f90k0tuX7Gxd9GOEFavhZOCGBOa0TV0OufauJOERiffrWYiPGmHzJwXBakj
         FEkBhrsQZFuJHj9GBH8Ht6P8bzzMW3wx5IbtMm4cl86uJ1mJQvurtDTzlNNC4M+TVMFE
         4boicbnmAW7xD47h6lZfQLpXyR4F0/goHIRtrsV0MhDZhOX1/gA9N31itM0D46SW1kgs
         fCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULzF3p3L8oeTaQhvXffg+8XN5ZeIieb8W7hDny3blHE=;
        b=mcD/9uJoXMkHUjMJhi4jAbHrIrOZtSAkR3XcRW/8IEQ8GITkiriItNHhrOveftbsv+
         UVgxnIGHZB967yBrEawZN/bPwxHmwh4BraW9X3cIJgq8d/mV/3vdlG/YkO88WiDpKDpB
         dtc9+etwdQZBGl+qF3gBoDZQpnHTcOaLEF9M/BPYHvL44Am2g7EmGRmo3kJoCk7Pyo5B
         dKpKx2BO4oxJg9m6Ryg5Gnz2uh/gYP3dI7fmMBdeKFcTUloGW3OBGkiSl/nY0Kb6hmY8
         4tZ8Vn6NTLteZk+42dhVH4WhmkgDsAhhkyRZHYcuNBSBMCotpoSO6LMFd9BQykPXfNVR
         rDvg==
X-Gm-Message-State: ANoB5plAZMiDTHCe8iETedLkGXTh5UsxiCyRS2mAntdhWVUvr+1cNhWT
        FbprY5SNEcn8CI6CI8BkbXClnMndETPZuA==
X-Google-Smtp-Source: AA0mqf5XBicCBoB4vSCpkSphHF/48SBezZ1w3GLHz+YbYHdSbavWvaHmS8Y8p5y2gVmokZ9rb+T/uA==
X-Received: by 2002:a05:6512:32a6:b0:4b1:4933:d0de with SMTP id q6-20020a05651232a600b004b14933d0demr3974642lfe.10.1668438450553;
        Mon, 14 Nov 2022 07:07:30 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b6-20020a196706000000b004a4754c5db5sm1841388lfc.244.2022.11.14.07.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 07:07:30 -0800 (PST)
Message-ID: <44973b9e-d1d2-b7e1-74aa-0b72505f2552@linaro.org>
Date:   Mon, 14 Nov 2022 18:07:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 17/22] phy: qcom-qmp-combo: drop lanes config parameter
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221114110621.4639-1-johan+linaro@kernel.org>
 <20221114110621.4639-18-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221114110621.4639-18-johan+linaro@kernel.org>
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

On 14/11/2022 14:06, Johan Hovold wrote:
> Since the QMP driver split there is really no need for the 'lanes'
> configuration parameter as all of these USB-C PHYs support dual-lane
> SuperSpeed USB and quad-lane (uni-directional) DP (even if the driver
> still only supports CC1 orientation using lanes 2 and 3).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 62 ++++++++---------------
>   1 file changed, 20 insertions(+), 42 deletions(-)
-- 
With best wishes
Dmitry

