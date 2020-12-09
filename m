Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB2E2D4EC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 00:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388692AbgLIX1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 18:27:14 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40105 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388667AbgLIX1C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 18:27:02 -0500
Received: by mail-oi1-f196.google.com with SMTP id p126so3660886oif.7;
        Wed, 09 Dec 2020 15:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uLFlJs2FE+ocrw9Dv6BSFdWGIuj2Br5zAsfaAYHbwbA=;
        b=cYuLnRwVc+HzkJlRn+AC8FRIiFO+x76mQMmoKwsnJ+vQQEKgTw36eSKV6aeXQbHytR
         BpMCvZmP/9YrQBOkotmWdnApkljq9p50hyd6gzaebJqI8jRY8Wpc1sTTXxRuyEQF4vQz
         RvTAEy+SRkGnNJff9J3fqIbST9kCPJP6vnT5OYxK2SUvIEdL18h/xBo+DTJ+tAxDWmei
         sg1JjHpruWRcMqQg2XdlsxdCQTjoUNsZ/1YE9sEnYm4knxrU31bBGoSrtgGQz6cpo3Z6
         cWsxaq6AkhwgeXHn6/EY3Mdig6m2LviaoB10PMlVj8+LVBpC56MZtps7RcdRl9jQeBg6
         c2UA==
X-Gm-Message-State: AOAM531nURwedyti4GUscme3RLvh6yoN7i+6v4b20s0CuzjxuO95YFBU
        DTSf8AJFKa24Om8c4eQQ/g==
X-Google-Smtp-Source: ABdhPJwLUrO8MIRaROO7pYAHqmAL/npwl2rFlHtvRo9943n3TSSdApe8LYoJBOTgxoNm/CLfrILQew==
X-Received: by 2002:aca:3987:: with SMTP id g129mr3445967oia.76.1607556379813;
        Wed, 09 Dec 2020 15:26:19 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a18sm612327oia.29.2020.12.09.15.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 15:26:18 -0800 (PST)
Received: (nullmailer pid 1275839 invoked by uid 1000);
        Wed, 09 Dec 2020 23:26:17 -0000
Date:   Wed, 9 Dec 2020 17:26:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: qcom: aoss: Add SM8350 compatible
Message-ID: <20201209232617.GA1275791@robh.at.kernel.org>
References: <20201204054347.2877857-1-vkoul@kernel.org>
 <20201204054347.2877857-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204054347.2877857-3-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 04 Dec 2020 11:13:45 +0530, Vinod Koul wrote:
> Add SM8350 compatible to the qcom_aoss binding and driver.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 1 +
>  drivers/soc/qcom/qcom_aoss.c                                 | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
