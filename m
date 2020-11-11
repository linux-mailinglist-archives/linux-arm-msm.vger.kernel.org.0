Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFFC2AE77B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 05:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgKKEhY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 23:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgKKEhY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 23:37:24 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB14CC0613D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:37:23 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id j7so726099oie.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vq44ljmw99Z+vxoyleZFvg1Copias7KXRy4H8KP+HQo=;
        b=wGulWlnIEq3o/KCgEakKDsvH2cDYMyyuMj4NyUFTuJX5yAdqX1dxg4TAfo3xTFL38u
         hLo3rFmCMjdKyGo4RwoDhvRAfNHM9lF7QD02F0zB/vWGsZNnF+k+6qjn05bIjVsU70Ba
         uNWpQXshZrEDjiYtQmx+wRW3Yiq3pWHcmXgQ8HBH9bKp6SFLy42rwY8FzFfZXm1/BPew
         1L9M5RUXE/J+22pHmyumFxm4glxdWsv9xPWwduZGzqPkyqyiKXky3+XSs0VKSve0Ssz+
         4QGk8YAhwVX3JoX7MXohNiHsEgW494GvRqgeORierDnsPyOd32vL2QiU0NQVs58JiEga
         vLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vq44ljmw99Z+vxoyleZFvg1Copias7KXRy4H8KP+HQo=;
        b=NyAgcRse9RTZuf31e46395IphFunow3WGXapYqyf3RDaGZiHhKFTPpJ+jUH0vk31Je
         SECrXqNAEUg9w1+IPeLPUw2paxaigu5gL4T9YQDw84DuX9ga4vpep8KDyRe5zONhs7i5
         ToaOdK3uxh77g4ezFnODRCffZZbT8HYg3pFmActxTDkWcZ3s/HJpzOh1wgmTzolZ0sl8
         Ls2PwJiBvPnGfzsyUSx+xh0TWlTmwOfNw7+miOiVbF9i55nCUqBEP+M9a1qdPfqODfH6
         u+MENBcIiSdxFAgHBgnltcOchBOnirrNFFZK28uLfyRGL6iyjFabjQDPObz/0TwizrLg
         7CRQ==
X-Gm-Message-State: AOAM533PZZxDmu1oWbZjI0HlTmpk6JMFCtjc+JWuGckUfWXf7ufAezpN
        Ltv2Quzmh4kTBfHUtVK4Vq++qQ==
X-Google-Smtp-Source: ABdhPJwRoQIUMNBMcS3WdGKPiJDma/tyFlDsORvKcE5FdiWffs1+Ga925ZSK9oIUe8IkBqqLoKX2Bw==
X-Received: by 2002:aca:f407:: with SMTP id s7mr1039694oih.23.1605069443315;
        Tue, 10 Nov 2020 20:37:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 66sm277848otp.33.2020.11.10.20.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 20:37:22 -0800 (PST)
Date:   Tue, 10 Nov 2020 22:37:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, mdtipton@codeaurora.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        akashast@codeaurora.org
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: sdm845: Add IDs for the
 QUP ports
Message-ID: <20201111043720.GB173948@builder.lan>
References: <20201105135211.7160-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105135211.7160-1-georgi.djakov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 05 Nov 07:52 CST 2020, Georgi Djakov wrote:

> The QUP ports exist in the topology, but are not exposed as an
> endpoints in DT. Fix this by creating IDs and attach them to their
> NoCs, so that the various QUP drivers (i2c/spi/uart etc.) are able
> to request their interconnect paths and scale their bandwidth.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  include/dt-bindings/interconnect/qcom,sdm845.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/interconnect/qcom,sdm845.h b/include/dt-bindings/interconnect/qcom,sdm845.h
> index 290be38f40e6..67b500e24915 100644
> --- a/include/dt-bindings/interconnect/qcom,sdm845.h
> +++ b/include/dt-bindings/interconnect/qcom,sdm845.h
> @@ -19,6 +19,7 @@
>  #define SLAVE_A1NOC_SNOC		7
>  #define SLAVE_SERVICE_A1NOC		8
>  #define SLAVE_ANOC_PCIE_A1NOC_SNOC	9
> +#define MASTER_QUP_1			10
>  
>  #define MASTER_A2NOC_CFG		0
>  #define MASTER_QDSS_BAM			1
> @@ -32,6 +33,7 @@
>  #define SLAVE_A2NOC_SNOC		9
>  #define SLAVE_ANOC_PCIE_SNOC		10
>  #define SLAVE_SERVICE_A2NOC		11
> +#define MASTER_QUP_2			12
>  
>  #define MASTER_SPDM			0
>  #define MASTER_TIC			1
