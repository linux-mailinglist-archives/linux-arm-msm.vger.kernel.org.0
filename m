Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB671257E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 00:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfLRXmx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 18:42:53 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38604 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLRXmx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 18:42:53 -0500
Received: by mail-oi1-f196.google.com with SMTP id b8so2146162oiy.5;
        Wed, 18 Dec 2019 15:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TdBF77lLKHR1KmeH3phx4WFNbPMkcGwAiRzD6dJUrrY=;
        b=tKD0p7sasUpTMSAzAV4tw1i5Ilbdeho8mxWYGbQjZuIuj7PNdE7R040nhB7RLeK+v9
         k4X1Cj46Yp1rgOc6MjaKpIWZg/k9kVunbW4w37c7Udn9cAa/rI6ZxydFXaX0eLFSIyUU
         +16X/eGKCpVSdKWHuBFWAoOpVF4IoI5Q8TE+TTMUxczX1+K8Yzz2oKDWVGF2VYLuXjWi
         5IOi7HRhcAPx0D069n+LqguG/8t7ZJXznGEuub/E8Ts14x42uwyksm8lawM/ReA7Fsim
         f9qJ54ikAeq+t/DvH/KVNQDYzZEMBCxBPLzQ5juvKgdrqFQiMkQTazUypICSoKNZ6m2r
         LsAw==
X-Gm-Message-State: APjAAAVdArJrNPHD6yG4B395j3wkVfEULkcrqztNEFGKy1g5hW8GmW2l
        7o44zO/gLJWECBV+bf3qjtp8oH1I6Q==
X-Google-Smtp-Source: APXvYqyD7aG3GgXlP0JdazmFnPE0UPUpVe3o6mplOud1TiZL1/tGRqFeNFIuuIA9T2O/EbSZ4Cm2fg==
X-Received: by 2002:a05:6808:356:: with SMTP id j22mr1723375oie.130.1576712572477;
        Wed, 18 Dec 2019 15:42:52 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j20sm1394532otl.5.2019.12.18.15.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 15:42:51 -0800 (PST)
Date:   Wed, 18 Dec 2019 17:42:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org
Subject: Re: [PATCH 1/2] phy: qcom-qmp: Add MSM8996 UFS QMP support
Message-ID: <20191218234251.GA17292@bogus>
References: <20191207202147.2314248-1-bjorn.andersson@linaro.org>
 <20191207202147.2314248-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191207202147.2314248-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat,  7 Dec 2019 12:21:46 -0800, Bjorn Andersson wrote:
> The support for the 14nm MSM8996 UFS PHY is currently handled by the
> UFS-specific 14nm QMP driver, due to the earlier need for additional
> operations beyond the standard PHY API.
> 
> Add support for this PHY to the common QMP driver, to allow us to remove
> the old driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt  |   5 +
>  drivers/phy/qualcomm/phy-qcom-qmp.c           | 106 ++++++++++++++++++
>  2 files changed, 111 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
