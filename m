Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755383CA210
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 18:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhGOQRX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 12:17:23 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:37579 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhGOQRW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 12:17:22 -0400
Received: by mail-il1-f176.google.com with SMTP id o8so5476591ilf.4;
        Thu, 15 Jul 2021 09:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sFT7/O+3B1FPon3DUFKMchkKuK6mHyAvPQCnis4464M=;
        b=pA1QCoAhPY+iDgrme5fvJhUHxsMdCG+6s4rF9Wxp5VdDWWYhMypm224Utjr6vct9Vl
         Pbfuy9qjbGh55E2QD1jujJF+FCTa0JHfK4UqUk3g616jC9lLPNbCGdur+MNvPrqmiG74
         y/u759MeRUGnLJLmR+w66Myu1yHrO6kCdftlXtEf8W/NFYHX3vlOi632FTN+rZ1WmB/6
         VGf3ZETR7MOx8xY/rux2GBt1yQ2G3FMddPy6sKi1jxumZTQVhd++Di/GKqX96mV9Exm+
         ZQi8LDbqvNjjbl+W+lQsAVwgZ2QDhy/sstqqde37ABlDCna26AuJGJxdKvnrrAF1tLd+
         NYXA==
X-Gm-Message-State: AOAM5307m6TbMY5gkOIlzRMMRJi7yJkXzLbcdAF8KJIBOZR6AKnNjl+v
        4CBYT8FtpjvbRYTH7lgE6g==
X-Google-Smtp-Source: ABdhPJzxtDx/aOBuBKa621RgzouiIUTWbzBQu7yRxIN1Nc2nchMD2+H/72DE1YUiAIoNdCCneWdR0g==
X-Received: by 2002:a05:6e02:20eb:: with SMTP id q11mr3263273ilv.272.1626365669171;
        Thu, 15 Jul 2021 09:14:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k10sm3411507ion.38.2021.07.15.09.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 09:14:28 -0700 (PDT)
Received: (nullmailer pid 1174150 invoked by uid 1000);
        Thu, 15 Jul 2021 16:14:27 -0000
Date:   Thu, 15 Jul 2021 10:14:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     bjorn.andersson@linaro.org, manivannan.sadhasivam@linaro.org,
        linus.walleij@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document SDX65 platform and
 boards
Message-ID: <20210715161427.GA1174093@robh.at.kernel.org>
References: <20210709200506.20046-1-quic_vamslank@quicinc.com>
 <20210709200506.20046-2-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200506.20046-2-quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 09 Jul 2021 13:05:05 -0700, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Document the SDX65 platform binding and also the boards using it.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
