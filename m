Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF5B5FCCDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 23:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiJLVOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 17:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiJLVOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 17:14:49 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061012677
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:14:41 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id m23so61533lji.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZyBNqSnvYMphKf3R14IEtoGMj+mpBrmqZfyga1bqsw=;
        b=VhMak40WlTljj0imeT8iGYU7G7/1WjAWnDS/DMVdrvBjsXX31m9R84HCdbfC1wrU48
         ELeeYCTf/YSdM4Di7aHLVj0oqD1Z7rIkGSDSC2Xd5q9A1yBuPhmIfanxNNGa87G5l5f3
         YEHxo9IAnA7MwOQrTnInMxGEnmNsAX9SWPA+lnKZyEVL47+YgHZ2awAwK0aEx3hDCPg4
         6P18UQVpr0Kbx1CF03mAe64Fp0+BEZqfbKy1NWQ6jQRl9PIg0v7AyzoLiL6uZNPpTLJl
         fNaSh2alT4mfh241jqGOaqc3dgB81AEr4VEA5zF2obCuCafi0sWSSDIYzPrhwsZoC8oJ
         xRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZyBNqSnvYMphKf3R14IEtoGMj+mpBrmqZfyga1bqsw=;
        b=pmJ0knMC1aEMf8DNrBg78CCnMgm7MNkHX9hmp6bVytsOvxlDZXVYlL830VTl6fCSfp
         PwrUrERbHe2GrWchlVswrEqcm2LysfsDMbU39FL33vQGVvkXDLW2p9gg8+IeDwAShn/n
         +Q4LyoncNrRrY6gpQp9jaAh0KSGMTogLA9FU4j9OCiCGC+FdeM9jQCrdsMhzdSdOnUUl
         i78onbPLUGUbMSWX7Q4kaqfdfPfQYpW5J6wdoEZJfwDki/sbc4vdgJ7rvWzB0e/4kGCr
         ScM+VGVGzZTBBE6x53oTGYnz8pAPoBiDxYxHlTXZYnfaAJYww/BtPgqnm/vx0fmDZnqL
         l98Q==
X-Gm-Message-State: ACrzQf0PCORhhScTxLIR7HTYdW8GOyyxX78YQLsgu4gFhj7gOAiUtlsA
        YmyvIj5bQLHANfZGtr+7/xt9Tw==
X-Google-Smtp-Source: AMsMyM7W9fcKv5hoMaeiG57NqvIo+vlchll+kekxhky2K8C66dGlelY28KhA7csxWFX1UvFQaTn0Zw==
X-Received: by 2002:a05:651c:1950:b0:26f:a406:6f6d with SMTP id bs16-20020a05651c195000b0026fa4066f6dmr7354742ljb.240.1665609279521;
        Wed, 12 Oct 2022 14:14:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f15-20020a05651c02cf00b0026ab2a04055sm112848ljo.130.2022.10.12.14.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 14:14:39 -0700 (PDT)
Message-ID: <e1d03a86-4369-763e-2559-68ff044cbad1@linaro.org>
Date:   Thu, 13 Oct 2022 00:14:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 10/20] phy: qcom-qmp-ufs: drop unused phy-status config
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
 <20221012085002.24099-10-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-10-johan+linaro@kernel.org>
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
> Drop the unused phy-status configuration mask which has never been used
> for UFS PHYs.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 9 ---------
>   1 file changed, 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

