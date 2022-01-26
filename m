Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD1249C2AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 05:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbiAZE3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 23:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbiAZE3o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 23:29:44 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6446AC061748
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 20:29:44 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id s185so18485219oie.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 20:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7v2oDPkGNjub727hVb9njMlapI5nO+ePG8FQt3JN5PI=;
        b=RzEGF1WaVLCnmVohbiH0Sup+Ub0jOj6eQafrzUSnzub/kjdLWecb8j/UXx9k9vQElr
         bOBmajmUppuXPAYU9lBOT3p3GUAGdVlsxB2NhfKoUitrIufE/uJDWvOmhEtHv5hN4/Sk
         S8Dx+xX9FGODfH38DOOcdXOW2PmKNsqR6KNl0qMZZaXiDMZ+q8w55BMY3VUbrFAHFucU
         W+DA3ywZzMQ0/zUR2jxnw5T/vY11nk4pIvTx4j2Ks9Ya/u88DtFscdAi1w3wb+gnHPqQ
         x23Pzr0OogKkQ5iAuQUzCXFGopiUnfWD4Kh75rZiyDUyMpFUMS4PFcu4W4ZJyduV7MVR
         DMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7v2oDPkGNjub727hVb9njMlapI5nO+ePG8FQt3JN5PI=;
        b=ePTsflZct4YY9oztWuPYR9KSt4AgcQQSJ1ylVlNw0kHRniz8FJF4GmpXKWbIua+gcM
         XlYQ1/gnyFNCO0cioFoDvFlB4T9mLFVuQcpgkAyIo/d1qCR983twBEEJrqSfengJTI81
         zGMKRFgi7kNd1fF6hsJiFOuGG3/x3wYBDo8E6aLaE5id5GuIF1rquL5x1rOKuj63ftK5
         W2dSdUD5Fo3FhPcQaFFaK7RSEAP4GMKd/Uv3mgggkvwuMjRMNcyWte8hn4CPEMK9Z5Wb
         6qAPzqBR/GGRS+DJtb6eZNPjiOY3FBQIVksVEErtPcl0OTzdsUMNgoGF4146GlyRDN5u
         ppKw==
X-Gm-Message-State: AOAM533mHcFIRcrUr0lVO5tWb4vyeOamDmXQ73TEBPQI5NJX7ATKS/9C
        v96alVV2/Eoo62Ssvl9ustiHMg==
X-Google-Smtp-Source: ABdhPJxR4sV9tM55YnZd6a5rFdZD4OfDT2CQ8qp+YbDbLftS/UClItLm8rKBUp2Q+sw/cjJuDiIhTA==
X-Received: by 2002:a05:6808:15aa:: with SMTP id t42mr2630343oiw.223.1643171383790;
        Tue, 25 Jan 2022 20:29:43 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id q11sm7825230otl.8.2022.01.25.20.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 20:29:43 -0800 (PST)
Date:   Tue, 25 Jan 2022 22:29:41 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        greg@kroah.com, robh@kernel.org, linux-kernel@vger.kernel.org,
        quic_tsoni@quicinc.com, quic_psodagud@quicinc.com,
        quic_satyap@quicinc.com, quic_pheragu@quicinc.com,
        quic_rjendra@quicinc.com, quic_sibis@quicinc.com,
        quic_saipraka@quicinc.com
Subject: Re: [PATCH V4 6/6] MAINTAINERS: Add maintainer entry for EUD
Message-ID: <YfDONZXRJ3j/3x+J@builder.lan>
References: <cover.1642768837.git.quic_schowdhu@quicinc.com>
 <d8079cb1001675cd876f1e051647a65a7733b81c.1642768837.git.quic_schowdhu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8079cb1001675cd876f1e051647a65a7733b81c.1642768837.git.quic_schowdhu@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 Jan 07:53 CST 2022, Souradeep Chowdhury wrote:

> Add the entry for maintainer for EUD driver
> and other associated files.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b84e2d5..0fa9d54 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7227,6 +7227,14 @@ F:	include/uapi/linux/mdio.h
>  F:	include/uapi/linux/mii.h
>  F:	net/core/of_net.c
>  
> +QCOM EMBEDDED USB DEBUGGER(EUD)
> +M:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-eud
> +F:	Documentation/devicetree/bindings/arm/msm/qcom,eud.yaml
> +F:	drivers/usb/common/qcom_eud.c
> +
>  EXEC & BINFMT API
>  R:	Eric Biederman <ebiederm@xmission.com>
>  R:	Kees Cook <keescook@chromium.org>
> -- 
> 2.7.4
> 
