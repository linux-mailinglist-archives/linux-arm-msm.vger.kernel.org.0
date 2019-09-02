Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA48AA5A07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2019 17:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731525AbfIBPBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Sep 2019 11:01:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41239 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730234AbfIBPBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Sep 2019 11:01:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id j16so14338872wrr.8;
        Mon, 02 Sep 2019 08:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a3oWhnhg13aJExvjQfF8EoIHkTAHlX+PBj9hz38tCtY=;
        b=tPGVA8Ay0dShBlRnxkrSWejchr1FHf6gU7v0KWRctsaEPR8xHk/o9xz0n/1QoSMLLy
         CxVF3X2C7J63T32m22pRF9b/Kn3meFk0TvnpDEZBdTbebNThrEYO03Fala1IfCuXTpRs
         ztLwvwxTFcNKb1y0WrHBsLPc82e48WgHk9hAOkLEawQKjR8qsLxZbI1ewOsy3v8xoWCe
         HwtcFAsueXB6ZNEYFnANVnVTvBQWPpRHZnt1XPL8gIuZiyQDXJlqcnGVB0OQqZ/Kixqz
         Gil/YY1FfASwcpVyh+n0smKcXa9PjruFMzK5PCo9EnTi6cXgCiKXHj1kDhVtn6LDNQXM
         7q/w==
X-Gm-Message-State: APjAAAWCw6qsK9Hxt2Nd/PiHK3sn4FZPKlns6SYrm8Eoza2IGzoMIeIo
        3V99ALPyQHPPia6ZE0OPFkhNfoLneQ==
X-Google-Smtp-Source: APXvYqyHCLpuFYf/DuF5rPmKMo1G2lITnST9aS3nNHF5oBnRZQWtnRxqV3jH0WevnpRW3xJO1d3/zg==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr18589959wrm.327.1567436499227;
        Mon, 02 Sep 2019 08:01:39 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id c1sm11768541wmk.20.2019.09.02.08.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 08:01:38 -0700 (PDT)
Date:   Mon, 2 Sep 2019 16:01:38 +0100
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: reset: pdc: Convert PDC Global
 bindings to yaml
Message-ID: <20190902150138.GA29400@bogus>
References: <20190901174407.30756-1-sibis@codeaurora.org>
 <20190901174407.30756-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190901174407.30756-3-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun,  1 Sep 2019 23:14:07 +0530, Sibi Sankar wrote:
> Convert PDC Global bindings to yaml and add SC7180 PDC global to the list
> of possible bindings.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/reset/qcom,pdc-global.txt        | 52 -------------------
>  .../bindings/reset/qcom,pdc-global.yaml       | 47 +++++++++++++++++
>  2 files changed, 47 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
>  create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
