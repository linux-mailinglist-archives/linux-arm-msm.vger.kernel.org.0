Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1024314673
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 03:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhBICfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 21:35:42 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:39999 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhBICfk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 21:35:40 -0500
Received: by mail-ot1-f54.google.com with SMTP id i20so16189237otl.7;
        Mon, 08 Feb 2021 18:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vNaLlBvMn/WCDuhteaeoBhuXLIaRQZYJYbwh1i/VJMw=;
        b=Y2FLU1dGZskXqOkEZyTK1m88QGdiTq8wLAniv5UeLUtshQesGGacRwwSrPy93oWVry
         OPd9y9wwCo1y9eM2U0aJBNtwET9s4VacVAk0nMvGWcaHjmyZvwGtwkl6UZe89PkKk9WT
         2DNKXVlEFdYp+BWfDXnpOCJCTMUZuWtUU26sXVjcu2QmDhs8i3sbCNNR5/mpLcbXhbji
         Rg77VymxIq6co8QJc631Q28jhrWEcLz1pfMCbWdiMjs8O6m72gQvpsdwwaPbDt0vlPEG
         5NbSeAiqp8aKnSYRRQtIZxF0aEqSCMZ5/SlStJQYoZZJyz2ht1m9nEnj6jbnhjnIqyIa
         vPcw==
X-Gm-Message-State: AOAM532YtsDjdVTFiExxoee9gDgdnOnL0CEa6Agt1udq6+qTAYVPSFgX
        uq7JIQOczi8De9eoUYQT+A==
X-Google-Smtp-Source: ABdhPJz7H6kaMKXkAPZPu85HpJeuzL9SEdFw+HoRwXitaTvpmbFQO0YOzRwJz1DXm9qaEN9fD6v+Tw==
X-Received: by 2002:a9d:2948:: with SMTP id d66mr14533477otb.94.1612838097776;
        Mon, 08 Feb 2021 18:34:57 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j20sm1861615oor.35.2021.02.08.18.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 18:34:57 -0800 (PST)
Received: (nullmailer pid 2565387 invoked by uid 1000);
        Tue, 09 Feb 2021 02:34:56 -0000
Date:   Mon, 8 Feb 2021 20:34:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Add SC8180X APCS
 compatible
Message-ID: <20210209023456.GA2565337@robh.at.kernel.org>
References: <20210121014130.1612454-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121014130.1612454-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 Jan 2021 17:41:29 -0800, Bjorn Andersson wrote:
> Add compatible for the Qualcomm SC8180x APCS block to the Qualcomm APCS
> binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
