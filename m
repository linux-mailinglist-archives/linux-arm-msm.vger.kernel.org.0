Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3675ACBD12
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 16:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731037AbfJDO1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 10:27:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43646 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730814AbfJDO1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 10:27:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id j18so6669347wrq.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2019 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=b61PcMZEVDOm8tIA7MbZpGsykf5AeertHX4kL1a8ijQ=;
        b=dA5BEoZ1dCBR0SOirfbTB3fXk/gvVC8YFHLtV2H/nofFEJU4vxqWBzv7D93tm1QCXo
         Qr1JG30EcYS4NYLyKtEjCQrCqdeQh4/QRT2qADnpIAGniYsAaag3zmQTZ3vZXbj9tgUE
         bTOl/sYZ7JPOAGVj11EcmLbgYSzU1pXbFDZ3Jx/6ROOUJF0jNSbQK6SBf1EJacOFdrta
         uerUp3j+J8fQABBCmdmVprIlJ1JNI6/05z8pk9pJGLcWPNJs6UTRT+YdyRz6+PK1UitT
         rQ5WSXGEVZMYH02xYyYAjrguymSbyXGzuz/KLnj6Qq6jrTYE/dX8+9oSNUFZdR7teKB3
         VmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=b61PcMZEVDOm8tIA7MbZpGsykf5AeertHX4kL1a8ijQ=;
        b=Jn58qf9DOipG2YBxyTrm+ka42Qlf5EBJMAd8JsQwUuas8cp9W+NrPNY3qwgc2WVVZx
         kHJkOdMK25+1syjATsZl08u4JQbZkmq+H19N9PQBntfnrIHOhSUPTaYsKrt7nJbBLELr
         kqGxT1MB+GKLhKNfv2Ai8w7lnE10DPAcTcXpArrjvLXN4Qu4PYSIe/j1VV2hv/cSKNQM
         T/4mvUjXnzG1eoNakLVYk5Z8ZQxU9Mgyv9E3TE7AvXsO+ZCVoH/mh5pes7umpdIE0gQv
         /CQVTAl1bTI2R8dk+CK6boCzxMtFybe6oGiQb8U2xss243sKROFu8NTe93iEyQD35o9H
         ylPw==
X-Gm-Message-State: APjAAAXTP2MVeKopX4k6FCwoCWKoNCjSn4eBssHxNEzaGYp6ZryYhScT
        +R/NDEFVQc27FGuAedRcfWbcxQ==
X-Google-Smtp-Source: APXvYqy+wMbKVzqRffL0WeTZpbxqsr4CdsjHLw2n+4M8djvCjPjG2dtdw5QolVs8uL5ku1lnlDi9MQ==
X-Received: by 2002:adf:fa90:: with SMTP id h16mr11533516wrr.52.1570199250006;
        Fri, 04 Oct 2019 07:27:30 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id j1sm14448308wrg.24.2019.10.04.07.27.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 07:27:29 -0700 (PDT)
Date:   Fri, 4 Oct 2019 15:27:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        broonie@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com,
        robh+dt@kernel.org, agross@kernel.org
Subject: Re: [PATCH 4/5] mfd: qcom-spmi-pmic: Add support for PM/PMI8950
Message-ID: <20191004142727.GI18429@dell>
References: <20190921095043.62593-1-kholk11@gmail.com>
 <20190921095043.62593-5-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190921095043.62593-5-kholk11@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 Sep 2019, kholk11@gmail.com wrote:

> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> 
> Add the subtype and compatible strings for PM8950 and PMI8950,
> found in various SoCs, including MSM8953, MSM8956, MSM8976 and
> APQ variants.
> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 2 ++
>  drivers/mfd/qcom-spmi-pmic.c                             | 4 ++++
>  2 files changed, 6 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
