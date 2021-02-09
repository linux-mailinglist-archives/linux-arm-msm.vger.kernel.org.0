Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C4C3157F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 21:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhBIUrj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 15:47:39 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:33357 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbhBIUkG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 15:40:06 -0500
Received: by mail-oi1-f175.google.com with SMTP id g84so7084464oib.0;
        Tue, 09 Feb 2021 12:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pQrcr7qodVD4dFMqYIjjfo+nDgak3hQS5PmI2pXPFsU=;
        b=HvC8K356tSnNRPr2/XjSJqNX7I1WiGPOQuY3JCejxqZ+n1WMMW2wDvjWTDGTIXHuB/
         EoadAU66O+jIpg+F2akFhxKYa7JMiZs6KE8gUsPgS4Lq7x2/XU6sEvQCgGNINDVzz7Hb
         am9kh1x/X7RVLwyEhej6x1fqpIF620+T7zHwbilOLl6TM7iLhhPGFHJkS8kMYCNoX9Yu
         c4F5zfafvPhX5sg2vgbOwpmI/l6X9FqMioEdg/hb7XD8TV22qCTU/+/wM9JLDbtTNqF5
         6DWF2jydFMGE7Iz5IWTKVudiSfZfGBP7x6zSndR6VwXoh4QAjkqpeKrcnv4zS25Ja6Qm
         I6IA==
X-Gm-Message-State: AOAM533oL66RUIIx4gIfPA+JD8l7R+uestZTBLdktnC4/v4SzPIzhotf
        WHkdp4ijXHG7Ps3XVcdZog==
X-Google-Smtp-Source: ABdhPJyyV0uETGRfszmy2JoR1ifofA1BkCnLQcxp0SYCDLuFpGm9pxBDDqA1OGSQtyy0USq/IgOprQ==
X-Received: by 2002:a54:4106:: with SMTP id l6mr3828124oic.110.1612903164902;
        Tue, 09 Feb 2021 12:39:24 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i13sm2862667oth.52.2021.02.09.12.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 12:39:23 -0800 (PST)
Received: (nullmailer pid 134304 invoked by uid 1000);
        Tue, 09 Feb 2021 20:39:21 -0000
Date:   Tue, 9 Feb 2021 14:39:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: rpmpd: Add MDM9607 RPM Power Domains
Message-ID: <20210209203921.GA134215@robh.at.kernel.org>
References: <20210131013233.54666-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210131013233.54666-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 31 Jan 2021 02:32:32 +0100, Konrad Dybcio wrote:
> This SoC while being from 8916 era, makes use of the
> newer-style, floor-level management, instead of the older
> floor-corner.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/soc/qcom/rpmpd.c                      | 22 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        |  8 +++++++
>  3 files changed, 31 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
