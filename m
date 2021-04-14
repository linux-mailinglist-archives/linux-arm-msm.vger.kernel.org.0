Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755F335EFE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 10:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350170AbhDNIkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 04:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350233AbhDNIj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 04:39:29 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0037CC06134A
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 01:38:23 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id r12so30168805ejr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vhZ72Xg0BjOB8Y+YSTZaT0YeKtDJ45/09IKX2ejXKzU=;
        b=gaiStzZagd8zAkEqqAKTFG81x7D+nyIHgzl6IOJE8VyQCaPv9Iae8hpRTB6pt71rd0
         rrF5QicWAEIMxLCAvXR88QdOcT6rQW+MogInjgTXdHt5a7WRU7Tt0IlKCMWuknUDo2iB
         Cz6jvWZtpXex64fuEPfnwok8HyphGmagniPMJ9VXLuT2Kq5Ify8+RFJn6OBPvwWBsKKG
         K7JAXvVIkrMbcVjibJ2Qwb3WcvdLQ2oalcuerPyLwS55SQ98W/4JAxUA5pG5eT56EgvF
         ogDa+291qqrpmn4kfvIB5djabdzsH2ynqYEWNYpZ4y/4O3/AW1HfmZ+QRUbshgjFL6sZ
         /36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vhZ72Xg0BjOB8Y+YSTZaT0YeKtDJ45/09IKX2ejXKzU=;
        b=dM71QZnupi4vK6OoNFMykzx1nd0SzqAxGPf0xZwySTSLSCkFtLJNxy9MIJgVanOcOR
         IaZIXAadRDdCZ6z4pphQ/rFsIxHDsfwtK3n5F7utg0ztzxcMFq6AUdrJ3V4XDj8i5UZJ
         S8Rtc6WoPK5xO5PThA0CdsGQV4C/RPhd/I1LL3YS8i5CfvXJzhuh7hxZhDzKQEeyN9x8
         TCOLuUpqxEUcJh+l2WS8fM2NRGBQ7W8z6hxt0dkzP/nGY/L24pKpw3wJt9dk1aw4uAMD
         3gQpfE70Mqrt5C+93EVqucWAz8eEjwHi5k7OR8OQOS8cgZdgccY+KK8xGPNchQoCk0CD
         Fx0A==
X-Gm-Message-State: AOAM5329Tx3IbkwhSo+2//U97+Q8KAzbdG+Oh59IoyqJ9NzGzd8AZ4Ln
        4Kx6aJrOLvJg13qESp0pZtewLw==
X-Google-Smtp-Source: ABdhPJzQiYHdbxLZKSHPErRc+GwkdWizSUBzC7Y3CpNNw0NP18kwZPRTExKYXq+MLBKbjHipA6b0/A==
X-Received: by 2002:a17:906:34da:: with SMTP id h26mr27108722ejb.496.1618389502585;
        Wed, 14 Apr 2021 01:38:22 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id q25sm476360ejd.9.2021.04.14.01.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:38:22 -0700 (PDT)
Date:   Wed, 14 Apr 2021 09:38:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-rtc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org
Subject: Re: [PATCH V2 3/4] dt-bindings: mfd: Convert pm8xxx bindings to yaml
Message-ID: <20210414083820.GH4869@dell>
References: <1617976766-7852-1-git-send-email-skakit@codeaurora.org>
 <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1617976766-7852-4-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 09 Apr 2021, satya priya wrote:

> Convert pm8xxx bindings from .txt to .yaml format. Also,
> split this binding into two: parent binding(qcom-pm8xxx.yaml)
> and child node RTC binding(qcom-pm8xxx-rtc.yaml).
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comments, I've split this into two, one parent binding
>    and one child node rtc binding.
>  - Fixed bot errors and changed maintainer name.
> 
>  .../devicetree/bindings/mfd/qcom-pm8xxx.txt        | 100 ---------------------
>  .../devicetree/bindings/mfd/qcom-pm8xxx.yaml       |  54 +++++++++++
>  2 files changed, 54 insertions(+), 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
