Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607D64670AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 04:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237724AbhLCDYI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 22:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242627AbhLCDYF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 22:24:05 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D59C061758
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 19:20:42 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id g11-20020a4a754b000000b002c679a02b18so641033oof.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 19:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p1KqMTIDK34u/s7OHluEijECIwpyXBcpEptp4/UAdcE=;
        b=rgegV1K3bKauCiyWSyVRzkUcZIeckduinQHC8OZI+oIzETuCpApTDXZm5dL2MEdZQw
         OUpR0uiaUuBPtjXPtI9obIqnMSJ2n8TlXy3FMMNH8nh0ZfoT9+R4J1UxTIcAPUdBXrgQ
         3t7/aaqcgUnEKhNvxhyazOrhSSnycaLhVM4TOvblw1vTlC59nZTDFDNsvm3d+vZKdnsY
         nPxuvqEo0ox6CeChIyNBnDvFSSPOfo0vpRKjLm+GDkQ38Z/mb+EH63465uA5VxBywUHG
         Bvs9+Z1sp6+DYO8XmKXmkq46XFpkz9Uhnq0aTaz+vnuRcgZS0DFuPJWQzyt0MGX0R5n3
         YeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p1KqMTIDK34u/s7OHluEijECIwpyXBcpEptp4/UAdcE=;
        b=X+hOKnJ3RTkzn7FPwc1RHcLojA7eYwN+zrz0/JwHWByEffeEiIhAYYdo+Qo/pgqENt
         7DDv1geoof4usqLEZ4fB8MPzvRrzvKuE66SJiD4+TAdov5DrNIJhjzdVUz0i9YYGZnMT
         Rdq/EYRF+2jvVDvb2Q1dqhv6OUphaV8OViiAHwUU1xGLYtn3PEaC1QbeccAIHIH9hcRn
         ervIwk6hQDFRR6AXJcgDN8rMgLzYQQ36OFqF3n1QCwPluUXtLRqFjNNJgYjtH5kpT7j0
         PIwLJ0YIg2ibXLqVbJDOnE4DMWZWDtKkHJyfog48cFLVb5FvsUsIfpS6CB60/tQahBXD
         dtsg==
X-Gm-Message-State: AOAM531/vInj57HGv5xaaWL+e8HZEGrXY+W2y4/u4IhS1lPOAzGyT42f
        K4angV6AnRwP7myxjDV4tGbmC9BJlNQGQA==
X-Google-Smtp-Source: ABdhPJxrvjChCy+lAG1t0/VU6ZajZW+6BESeDdkQHOzsLwKOYhFlZLknk0dsq38rb9jVYfi3fsPZoQ==
X-Received: by 2002:a05:6830:2693:: with SMTP id l19mr14745277otu.338.1638501641452;
        Thu, 02 Dec 2021 19:20:41 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r37sm434687otv.54.2021.12.02.19.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 19:20:41 -0800 (PST)
Date:   Thu, 2 Dec 2021 21:20:36 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] scsi: ufs: dt-bindings: Add SM8450 compatible strings
Message-ID: <YamNBFRsLFCxRQ1P@yoga>
References: <20211201074456.3969849-1-vkoul@kernel.org>
 <20211201074456.3969849-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201074456.3969849-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 01 Dec 01:44 CST 2021, Vinod Koul wrote:

> Document "qcom,sm8450-ufshc" compatible string. "qcom,sm8450-ufshc" is
> for UFS HC found in SM8450 SoC.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> index d8fd4df81743..d0fee78e6203 100644
> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> @@ -16,6 +16,7 @@ Required properties:
>  			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  			    "qcom,sm8250-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  			    "qcom,sm8350-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
> +			    "qcom,sm8450-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
>  - interrupts        : <interrupt mapping for UFS host controller IRQ>
>  - reg               : <registers mapping>
>  
> -- 
> 2.31.1
> 
