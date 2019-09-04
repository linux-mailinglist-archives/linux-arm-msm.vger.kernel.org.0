Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6CAAA920A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387771AbfIDStH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 14:49:07 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40235 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387737AbfIDStH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 14:49:07 -0400
Received: by mail-pl1-f194.google.com with SMTP id y10so4054992pll.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 11:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4HfkEeQk6I+D7BmR6a2frxKQaAhSKWflYGopMu8Mlwc=;
        b=dkR3B3MFFv52z1dcgS9nVth+FYdUnIpV50tp+MSiTsu3juQyvVpvv9qbJyLpBC6NWu
         Omr0qBpDm6LSMDUgkS9hfYz0ABJH+zIc2ro6xd+ySTfotVQvw01Iw9GPLgnOyMV5BNe+
         YragKuWslI/BMXjrvnfwgpy4idWkdfonkbsQEzxw0YyKHmMAq3r8ZQvPKAo1OcTuCHRz
         Ikok6wgO1s0S0385KTjMWGHRyVrwoqn+CVmk+bKxOqaZGBMKVXE87/Ke8rffE/HVi7hm
         /sJDxtZxcI/JO9d9BwRaf3lByKxK5DS5e45xAfFjE/qjQR6LKxqp4g2jZWgM7Kt8Pjwc
         DyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4HfkEeQk6I+D7BmR6a2frxKQaAhSKWflYGopMu8Mlwc=;
        b=ZMJwFwgTvv3s+EpvZ/RS2i/UPh9/lqN02vngxX01oNd8+D6vJlgFRx6sYyAfs3U9OT
         uKlAFqLu6XN0N47f63uiAk0TRKRkZOMUfUX/MrDnLCSZWsMPmJp8KHn7qQ1nuICNIqg+
         LfTbHn2sieopzsGsHoDE/CeAEulCITtJeOFNKJzEHkv8FwC4NzYWzUqholx3pbogaCO1
         Ph5akEyJVVxwz0f/uXqHhRlv6AEuguYecehRiRLedATPsEfL8Iagfs0n3k5JhCmoLxJr
         evpxRCpEQPOVfKg/v/TNhLjmjT6sTJUchAD5Wmn/t61WdqA0zcWO2Df6Pd2jL74b1BT/
         AFEg==
X-Gm-Message-State: APjAAAUrKMET7CQH7gE+4XiCrLOm/OUNbv2sxEFFOnj1np/prOaGdVc2
        VI4VfZnGOnlcbIiki4j8jQD+aw==
X-Google-Smtp-Source: APXvYqyY9dqgp6RiwU1DtONDAbn1FYQoy2MOEogTOM025b5l2Pl8aexINaf1twTLwuBXzUdXFNeXtg==
X-Received: by 2002:a17:902:a983:: with SMTP id bh3mr2004318plb.311.1567622946187;
        Wed, 04 Sep 2019 11:49:06 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d14sm2920384pfh.36.2019.09.04.11.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 11:49:05 -0700 (PDT)
Date:   Wed, 4 Sep 2019 11:49:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Evan Green <evgreen@chromium.org>,
        Can Guo <cang@codeaurora.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] dt-bindings: ufs: Add sm8150 compatible string
Message-ID: <20190904184902.GF574@tuxbook-pro>
References: <20190904100835.6099-1-vkoul@kernel.org>
 <20190904100835.6099-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904100835.6099-2-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 Sep 03:08 PDT 2019, Vinod Koul wrote:

> Document "qcom,sm8150-ufshc" compatible string for UFS HC found on
> SM8150.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> index a74720486ee2..7529e2c26127 100644
> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -13,6 +13,7 @@ Required properties:
>  			    "qcom,msm8996-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  			    "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  			    "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> +			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  - interrupts        : <interrupt mapping for UFS host controller IRQ>
>  - reg               : <registers mapping>
>  
> -- 
> 2.20.1
> 
