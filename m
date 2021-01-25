Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C1D3049D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 21:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbhAZFXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729946AbhAYRKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 12:10:54 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02315C06178B
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 09:10:13 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id v1so13423889ott.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 09:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p6x+b/pCRR97Ua9t+6F9O8WSMZLZ1SJ+8PbUwDeO5rM=;
        b=Htcc25pfJemhXqtLk7cK1EDnNpd9zKO7mOV6+qAMwwzNjUECeRPxPEzn2TyvIZ3sxZ
         P/N93aGKRv+ZFJ+QWlFencU9Xadd1ru8MzjdOmjAT5+fPMmgBNfcU4/3rK6qNEzPICvv
         0+Rt93qiDOldZvFAkDwpQcmLvehXcZxxrznP2iz4KTw9Ltl83i0PnmyaZh2DIEH/FRBf
         8SnOskZ4ceeXjjBsqt93UD2KSeLsbnODzpIHDNIEGS8UlIv/BiCsxoWdMZvcLO0hADIU
         MuYtwpQ/ogWB8M38SxluJnXOtSRvoC0UjJOMF+cVu63zjvAZKiZqIlew2zAvpryJPm+E
         ZwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p6x+b/pCRR97Ua9t+6F9O8WSMZLZ1SJ+8PbUwDeO5rM=;
        b=AoST6ADHQ6oh9MGqVMUyrzbHlVhNQgkqjjChMiMg1aF93yCZLL5hagsr+4xrqmzCle
         Nrh00qV3NHO7MR8veNL4xhD+CLdOc5an4m9tih+oqiSJFZV8ynX9mH2TpdL8hHDlG9VR
         XrNpgfSFJ/W8eCXcIxijyzLxpiMNuySwGeH7xI7AMX30TROwRYa+4908JBdBaLNGYNE4
         ZCrQoFTtcdGLuVb/t1ubTyKD9wrRj1g98fXrIUrucd7VWm/yqn5NVXiwiMmkMHwBzj/W
         JaH6O0AfmDO1TVho32or5ngw+MVVdYkBbvMiphYZfyqBA5k8ZEY2pum7/xP8/rh3dEyY
         bdPQ==
X-Gm-Message-State: AOAM532KI7yJ+y7kPgmsN8VemMAfV4LQCJAnEfO3rssPyrsHNralIA2J
        RIMM7WUNxtl4YgzJvZustnI9ZXttf/pKkA==
X-Google-Smtp-Source: ABdhPJwQS7DUPItFDLC8PHt2Xni4buKOYi4dNg8jXZRiiHe9vrcI8BKKydXZiCse7K3mriq8lo5IeA==
X-Received: by 2002:a9d:4706:: with SMTP id a6mr1091622otf.301.1611594613299;
        Mon, 25 Jan 2021 09:10:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c18sm2127768oov.20.2021.01.25.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 09:10:12 -0800 (PST)
Date:   Mon, 25 Jan 2021 11:10:10 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] scsi: dt-bindings: ufs: Add sm8250, sm8350
 compatible strings
Message-ID: <YA77ch3jB1TCgmNz@builder.lan>
References: <20210125100906.4004908-1-vkoul@kernel.org>
 <20210125100906.4004908-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125100906.4004908-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Jan 04:09 CST 2021, Vinod Koul wrote:

> Document "qcom,sm8250-ufshc" and "qcom,sm8350-ufshc" compatible string.
> Use of "qcom,sm8250-ufshc" is already present upstream, so add misiing
> documentation. "qcom,sm8350-ufshc" is for UFS HC found in SM8350 SoC.
> 

This can/should be picked up independently of the other patches, so
would have been better sent solo.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> index 415ccdd7442d..d8fd4df81743 100644
> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -14,6 +14,8 @@ Required properties:
>  			    "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  			    "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> +			    "qcom,sm8250-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> +			    "qcom,sm8350-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  - interrupts        : <interrupt mapping for UFS host controller IRQ>
>  - reg               : <registers mapping>
>  
> -- 
> 2.26.2
> 
