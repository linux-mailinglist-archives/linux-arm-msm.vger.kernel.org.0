Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF8BC198AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 09:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfEJHCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 03:02:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40687 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfEJHCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 03:02:32 -0400
Received: by mail-wm1-f67.google.com with SMTP id h11so6065462wmb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2019 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=JRWdWoewTocU8nrk2Hz18h3BUdlM7HWn5LtcY0LdbcI=;
        b=gtxeRFAUwu8fb+cBGQ/DnmXucUFlEOy68GizZHQW/AQTTHdo4E0h05hckutZ0mGg9x
         JqiRMXZjpRrEml0i6G63qnCKDl0A6d18flfT9zogkcrv0TpJaScuFje4+9VfyumCehQ0
         eRBU04ZBb1bP2v83OjOoSi3PkTqwg8z9pVr8fAaShlU1Qevy+QjiwPciiaV0BLIm29HP
         hTquskbaz3trJBO9+BUnMVbSyl4MYdwXAsqag1+JBF/Th+Q1BO7RbMfV8eLdSpOPp/BQ
         VyS4JW60ZOVe+yBblwHccZlnrnl2oABhZPJat8wqfSZZocz0r4tC/MOeGSnIfdFmtBNC
         SiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=JRWdWoewTocU8nrk2Hz18h3BUdlM7HWn5LtcY0LdbcI=;
        b=LlZB/ZBjRM0zZ6M6+l1QNdKq7ADyRHdTNd4fPpUbHnB/4dh56HQ//BSN9xORrJfDDr
         gMBRCWACh888vNBaFsrImP7kc6sYQygwVPo59Kv4TPXvFOsSlVwxpHDrR4braDuUiOCy
         ZnahXcyJZ67nQhaaQ1pQDgLjv9oXGmGXAa54bKpfZGI50tEIlW/JNtN9QFcrN8pTNqab
         V7fDsCd6qmSMe/e6zsdyNya6+Eubpd9kCJJzvsoBSPo8f6hv0HRFMLaPtLI7Oe7J/7wc
         ouakzImqIVTVl/5TQ2sdR4CxmQn8XTvaCGU/hOoIt8Nd/cC4DSSurfQNeHDDhj/ymUxo
         6EVw==
X-Gm-Message-State: APjAAAUMEqreTumHHbXb/Wcv1S24ALisnhwd4cONsVArvOvKTNF13tS4
        +PaQs1aJJoFYLEET2hqtXjR8sg==
X-Google-Smtp-Source: APXvYqxy5RbQWyQHmMAGJH4mhe6fz63p/mLoUwUpk3w2k2NVGrRrH3Be8C8LG2kd7wumX0JTvZTpsw==
X-Received: by 2002:a1c:ca01:: with SMTP id a1mr6085358wmg.30.1557471751173;
        Fri, 10 May 2019 00:02:31 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id n4sm3912417wmk.24.2019.05.10.00.02.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 00:02:30 -0700 (PDT)
Date:   Fri, 10 May 2019 08:02:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH next v3] mfd: Use dev_get_drvdata()
Message-ID: <20190510070228.GA7321@dell>
References: <20190509061443.GU31645@dell>
 <20190509142339.96276-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190509142339.96276-1-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 09 May 2019, Kefeng Wang wrote:

> Using dev_get_drvdata directly.
> 
> Cc: David Brown <david.brown@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v3:
> - fix build issue('dev' undeclared) in tc6393xb_nand_enable()
> v2:
> -use dev_get_drvdata() instead of to_ssbi()
> 
>  drivers/mfd/ssbi.c     |  6 ++----
>  drivers/mfd/t7l66xb.c  | 12 ++++--------
>  drivers/mfd/tc6387xb.c | 12 ++++--------
>  drivers/mfd/tc6393xb.c | 23 ++++++++---------------
>  4 files changed, 18 insertions(+), 35 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
