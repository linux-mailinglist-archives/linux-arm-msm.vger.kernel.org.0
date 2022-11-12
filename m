Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F8062676E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 07:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbiKLGTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 01:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234727AbiKLGTa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 01:19:30 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E236DCD3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:19:28 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j16so11231069lfe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJ6LdJsOhTJRCW93h81snVRkQ+sO3833vOdvbhT9QHM=;
        b=GuJElm0VAFQY0SzvVEwn/uTjWnku5CHQm4KnlaGH2kGCdHaHWPq4xJBqCwJmQrFzEF
         G197+oQBr3byIknwx5OiDUVC+VyVWtg3FIhz+Xk54v9iKTVxl2bF7JhSBelxxxkrxPxH
         HR8olsV209Rk/Bw7Tj6nANLxU6RTzeJFu9aE5hCSyxVRMtWjQaiCW5eyDEiPKe+fJ6je
         6fulbQBm+uyq6czENEHvobE1bMRXMOkni8Uoh/0yr7rbmyrDTXJyEAQTXm/IZW/gIEjQ
         vCzUlOoaU0ZNS9FiaU2Goc9eyvkUHq+yqVB1jcB7c79Rp0EXR2lXICkvcjk7U6Soq1Z5
         7XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ6LdJsOhTJRCW93h81snVRkQ+sO3833vOdvbhT9QHM=;
        b=Fl094eqUJFj5V06M2ur5qmrGcObCG8Gv4AwtDNdy9vGd4V+VNwNO6H8fIVPXAT8QFq
         D7Jneij4/wnzdGFCMd90zbm6gC+bK6vpDJnxvDrBNu5mNgXwM6lDdHwTFqqWKxizXkBD
         9k3CxSc011MUjFojhulMpJ2hIZPFdMm/ZukJDZIcDAHiRgzt5AKxDOlGPDD4EQ2C+NhO
         0QTJq3msLQXT3bmKF4D33lxgYi+fHUHzFJL/TFINmT0B0mpq1XHuOT2Nb7xgsl6+1otS
         ime7jWoWubnheH3W5FrrEad8ldNwqUAN00KOxlLzc5AfxUw0v46J8XtQi3oqat+rwuKE
         hfGQ==
X-Gm-Message-State: ANoB5pm2EMwBkJw6E0RFq3DTTaJg64PRcHVQ7AqwheKr8yFNfYOEBzYI
        BbrNAswSMVkdGc/RqAubvIC+n2bJSYI+Og7P
X-Google-Smtp-Source: AA0mqf7HSP+kh6Fn8FOnbPeKTWNtxiy/N8Ew1wBVjyShFBfmdSrV6sUoKs6+c3coQJ2ZU0zM4b0mBQ==
X-Received: by 2002:a05:6512:79a:b0:4b0:efed:e3a7 with SMTP id x26-20020a056512079a00b004b0efede3a7mr1739026lfr.323.1668233967179;
        Fri, 11 Nov 2022 22:19:27 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f21-20020ac25cd5000000b004a01105eea2sm706319lfq.150.2022.11.11.22.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 22:19:26 -0800 (PST)
Message-ID: <64e17d18-9681-59a9-bfc7-a32544f4ac4d@linaro.org>
Date:   Sat, 12 Nov 2022 09:19:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 04/22] phy: qcom-qmp-combo: rename PHY ops structures
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-5-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-5-johan+linaro@kernel.org>
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

On 11/11/2022 11:56, Johan Hovold wrote:
> Rename the PHY operation structures so that they have a "phy_ops" suffix
> and move them next to the implementation.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 40 +++++++++++------------
>   1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

