Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C892C89FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 17:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgK3Qym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 11:54:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbgK3Qym (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 11:54:42 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB01C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:54:01 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id o25so14879425oie.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sv1SKckcJv3B5DgQbB2Tk+aXvCrbP4vplhN5EODrXhM=;
        b=yM6DQbA70Db5lqgpT159je8vwpOeW0EPWeFsMm7rAsjq5N9TMjcCqHNnI7KKlaV0tG
         lDD7vZXARA6h53tBdq3/ipCe2w7PnsM7ss97YWxeQ66wUVD7NqqdN37SOkQdmbmvJ+/J
         57r9lxvgYwhreOqoeSps6lVrX3Ov8FTxIyzbOckz/b7cve8ajKjuiPL9sFkOMjkndo75
         Ih5GxrJbfwdWFJ4k/SuG5UjnshwYkBXoyO3RB7FqGJDMcqsgRhyX8KDthphVPs3sbRcB
         o+cN3kpv/WqrXJ0USmnSVLh7/aCbn19ef9/fzmXcXTsmefUsp64mWURpdNkCQcBJL8TJ
         rhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sv1SKckcJv3B5DgQbB2Tk+aXvCrbP4vplhN5EODrXhM=;
        b=Cxymxc2EWaaeLjNUie1Q863H+JdQE6g6wUDPClbDe1zztnpcFJBYos2VuWU6RHvJuc
         nEjS8ErsyRNnwyph60ZRQefIHmjVnf3b41Qu/g4IQwPbRuXGpbV+BLHmtZVuyQBYelF2
         GLORwJT9ku5YR/fdqg+jkMciT+MERUK229eKrPuFBYTnqEcU1Aep9LzOHNDvrx1JDrrd
         9C0KwQe/1SMBRKfXUQxv/XNKVMhsohIRrqAtSSJo+SfzZzV/A2lev1UWix4mmWiyYzmf
         Cfre6tL7pUKnr51ng6ZKdGEi7ot6PpdKBy7caz4dONZIIAvBySmGJpQtFTCKh4PSWSiz
         SlXw==
X-Gm-Message-State: AOAM531RI1wqM6/7nSuNS6dK5xix3zuJweLDVvyv5uPQiL3O1DRR7cLs
        Yd/1oR+Kr62sMYW8iw4AM2RP6g==
X-Google-Smtp-Source: ABdhPJx21PdPq1O4ig7ZXTyS8AkkQsMLXFyHSEPENeZFPBU9H6PQsRWWBeRtgJiMT+Xzo8HToEr1MQ==
X-Received: by 2002:aca:4fc7:: with SMTP id d190mr15717264oib.13.1606755241025;
        Mon, 30 Nov 2020 08:54:01 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h8sm9809119oom.41.2020.11.30.08.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 08:54:00 -0800 (PST)
Date:   Mon, 30 Nov 2020 10:53:58 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v3 0/2] Qualcomm's lpass device tree changes
Message-ID: <X8UjpqeolZpVeg8J@builder.lan>
References: <1601448168-18396-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601448168-18396-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 30 Sep 01:42 CDT 2020, Srinivasa Rao Mandadapu wrote:

> These patches are device tree changes to support audio over DP.
> It includes changes of HDMI reg, interrupt and iommu and 
> hdmi dai link.
> These patches depends on the lpass I2S patch series
> and DP dts node patch series:
>   -- https://patchwork.kernel.org/patch/11785073/

I've merged this one.

>   -- https://patchwork.kernel.org/patch/11785235/
>   -- https://patchwork.kernel.org/patch/11719511/

But please advice on what I should do with these two.

Regards,
Bjorn

> 
> Changes Since v2:
>   -- Removed obsolete hdmi-jack property.
>   -- Updated sound dai cells property
> Changes Since v1:
>   -- hdmi dai is added in lpass-cpu node.
> 
> V Sujith Kumar Reddy (2):
>   arm64: dts: qcom: sc7180: Update lpass cpu node for audio over dp
>   arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for HDMI
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 15 +++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 17 ++++++++++-------
>  2 files changed, 25 insertions(+), 7 deletions(-)
> 
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
