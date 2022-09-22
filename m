Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5600B5E6A59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 20:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiIVSFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 14:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbiIVSFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 14:05:45 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469032C64B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:05:43 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j16so16020851lfg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=O46UPXCIh6xeUVI7w8DMXEAehKpkJIvnLoZUqTHUtqk=;
        b=bQ2Kg5JmadYfkLGFdppZYQAiPloTisImfMCyytjqNncjrTKzkgfccljYQkDoaa86KZ
         tAEn8+4bcFywqjTSU42yWbpsFeglla+UTePOgMHqRH142Uun8y9OAnimSDUzrNBEwQqz
         DCjuz8Q+UnJ8VNQDW066TcUyMS4SotdGs1j3vxyzS0uLYOX1L7dnCxaGi5B/gWp8QIQJ
         EE15tyzXI5VpoGEKBVrr28erLToz5TRC2y4xciLo2yo0r+ZbKUsAfF1sm7P6B43UhUf1
         4Vka8J+vr2uaoKHOsveiQYycaaUGff14j3NeenEAMmWaTQb2Gx2/S6zNGW65EZ65h9sz
         9gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=O46UPXCIh6xeUVI7w8DMXEAehKpkJIvnLoZUqTHUtqk=;
        b=FZALPvvIMVVEV/+SdUYVZkQgWaj3uMmeECtf21QTc4cfNCvqejJs5qqWRZUCA9ljWM
         UBwXacbfsk8HRXnCTBKOOj6lVhifFoP3yKCdHv+Yim0sEuGpfH1S1cehAcQLKhpwHUh7
         lp1mOCWrlxp6w3rod90SaOzWY/0wjcof6smJi+gg5oDJMB3h7X0AytDLDWsXW/OKjE0E
         1zywzw3qej8lXJHE+HdC1qaiaZ3OuIQRc9SumZS7if9VD33bqWpTjIXewbqM/GOTndtf
         uG807pQSMnDwbMBpN68ceTHVxd+40lWifGRSMbQjEAeSpWixjUBUqWK3Mm0na4CIDEUZ
         1gWA==
X-Gm-Message-State: ACrzQf3oPyZSJmllf8z2WZtqkI0H2cW5LYldmrHVy/rbRn/1g2zr57Rv
        Lx3059UaTzTeVFzrWrUpnw3akA==
X-Google-Smtp-Source: AMsMyM4+MkUezedxxh/gkjwpbHDAyw4WUriLTChGSflindRV0/x7SG/HxOetgXVwHPiZs/mJOG9iyQ==
X-Received: by 2002:a05:6512:c19:b0:499:29e:5e4f with SMTP id z25-20020a0565120c1900b00499029e5e4fmr1763665lfu.578.1663869941658;
        Thu, 22 Sep 2022 11:05:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t12-20020a056512068c00b00496d3e6b131sm1036307lfe.234.2022.09.22.11.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:05:41 -0700 (PDT)
Message-ID: <878a616d-dbe8-a6aa-835a-3124729234e9@linaro.org>
Date:   Thu, 22 Sep 2022 21:05:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 7/7] phy: qcom-snps: Use dev_err_probe() to simplify code
Content-Language: en-GB
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-8-yuancan@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220922111228.36355-8-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 14:12, Yuan Can wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

