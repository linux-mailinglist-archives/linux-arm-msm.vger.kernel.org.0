Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA7CF17313C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 07:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgB1GpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 01:45:23 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39627 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgB1GpW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 01:45:22 -0500
Received: by mail-pf1-f195.google.com with SMTP id l7so1215486pff.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 22:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XbwCgyzVBr1Eex7C4dZmk+lP7N9qyM1bwXDkPQVNSxc=;
        b=JZWWWXPQlwpFMM+AmL6fMEUoHrxuhqLoDilpUgmvmVAKEqhhSePTAMQ0slt9Lf5vZo
         iF+l3WGS3z/TWp1qwOj9Y5Erx2EscBNgXkxVBbHaAMkr43nhTaK3z1dIEP3JvH4uQ0cd
         Jw/I5bKUULhGu7gue52JYD7uwP+zoMV1UE2OFwxi1II9q0QEfOWd4xrgBdDzmoy3BKHu
         JPeQRnH1EI+M6Xvs+CSnnSqHAMAAr644hSU4Vg0TF8dxceiw0rA3MrUGiracAi71k2MI
         RmDW3uM6RVjhir88gnl+P0vD5jj83Wa4cCg3MOrGfMBL6l+1QaB7saiu8yMmw30wZkFZ
         mzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XbwCgyzVBr1Eex7C4dZmk+lP7N9qyM1bwXDkPQVNSxc=;
        b=cugc1VLdKsDEnjQp9cYjqAg0NeiOUY6CLfevplSpADk3QKNYlyZ/aQVWs5yPGKd3AG
         c/Xx1LhOnZIavkqoNT4v1q0cJXMOStRNeW1fINC2K/HU7cMxRCJdAftTG5KLfU45Iz9j
         vAUmI1JfjB8pYGRU7UjzAJCrKiit9yKi5jeoWnHW+WVjLhPL9Uc+sR7iN9KtrG9vxmGF
         Imo0EmPw78NBSLAvyOhEq8Ueg7vaeEyPZJeIa19vaQ2XUqPpTX+WBnBZS25i8QFkcPnA
         JXXl22j5atoB3eVkU+gpvVRi8TkDqczw16cQ3M9RovQvrREJQnuGcA3iXKe4H43TZql4
         7qIQ==
X-Gm-Message-State: APjAAAVLOo+APXaN8ebyy84YeG44TspujV463+uJHlU2m9jiyP4WAToy
        H5fJ+8yp+KKsY1oVH6HGViqEmw==
X-Google-Smtp-Source: APXvYqzF8ji+gn0dQ8v39z9gCg4DrDb6BT+aNjn8AKK6duXJ7WHZBsqH1TJg6ktNWWvBpX27Ce2TWw==
X-Received: by 2002:aa7:8e9e:: with SMTP id a30mr3031533pfr.158.1582872321548;
        Thu, 27 Feb 2020 22:45:21 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g10sm9711018pfo.166.2020.02.27.22.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 22:45:20 -0800 (PST)
Date:   Thu, 27 Feb 2020 22:45:18 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Cleanup dtbs_check warnings for tsens
Message-ID: <20200228064518.GD857139@builder>
References: <cover.1582871139.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1582871139.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 27 Feb 22:32 PST 2020, Amit Kucheria wrote:

> Make dtbs_check pass for tsens bits. I'm working on another series to
> cleanup other DT warnings for QC platforms.
> 

Thanks for the fast respin, patch 2 and 3 applied.

> Changes since v3:
> - Fixed up subject prefix
> - Added acks.
> 
> Amit Kucheria (3):
>   dt-bindings: thermal: tsens: Add entry for sc7180 tsens to binding
>   arm64: dts: qcom: msm8916:: Add qcom,tsens-v0_1 to msm8916.dtsi
>     compatible
>   arm64: dts: qcom: msm8996:: Add qcom,tsens-v2 to msm8996.dtsi
>     compatible
> 
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  arch/arm64/boot/dts/qcom/msm8916.dtsi                     | 2 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi                     | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> -- 
> 2.20.1
> 
