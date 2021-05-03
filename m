Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEC8372030
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 21:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhECTOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 15:14:50 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:41600 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhECTOt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 15:14:49 -0400
Received: by mail-oi1-f182.google.com with SMTP id i11so6410918oig.8;
        Mon, 03 May 2021 12:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2pC98nmoZAn0NHiUY3TgOBJZlyalaE76V2zx7Qd8zcI=;
        b=jCHU/HXSg/E+n3bNQstszZ4cUWMc6NRUuN31pmwGmdAAhRp0ja11V1loOjsRXFSX0P
         iV1KWOx7y3lHxTzLh2zOItykVQbV8OwdAl3OEC3xiZlaKurTGytbS+irQpHXknCzGrH4
         9iQJMEimPvDlFj7PmAdKHR5uyV4mVEy6FLCrEVM3QS7B1yOjiCDEhTqaxnTlOXv1VzC3
         YDKzXNSmIJDxUZqLIhpRQ3ekDhB3P6JAC9Jt+c9obR9bZGXdDUZZJM5zx8hSUojJ+waj
         x7xPiNbnrTWAzunOOy07CINEx6UqIwJov+JQgFx8ohXP33zwkJPK+Ffagz5wINQx9qGv
         enBA==
X-Gm-Message-State: AOAM533Ezh4dDWAdNPCGSrvbt+A1U3XX56hMcDz5jsZgrdjSgLN5/KIN
        /TRuIhx/28Z39mGv2XF0Xkrk5YOm5w==
X-Google-Smtp-Source: ABdhPJzL6n16ivEpUt7Br4PXXDNjcGGnt3HI1ukJQBMW91i+01/eqfYIAG0ZSbjhTUcJx5t9HFzfeQ==
X-Received: by 2002:a05:6808:10c5:: with SMTP id s5mr72026ois.58.1620069235877;
        Mon, 03 May 2021 12:13:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i17sm149116oie.36.2021.05.03.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:13:55 -0700 (PDT)
Received: (nullmailer pid 2218392 invoked by uid 1000);
        Mon, 03 May 2021 19:13:54 -0000
Date:   Mon, 3 May 2021 14:13:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-kernel@vger.kernel.org, vkoul@kernel.org, kishon@ti.com,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp: Add binding for SDX55
 PCIe PHY
Message-ID: <20210503191354.GA2218285@robh.at.kernel.org>
References: <20210427065400.18958-1-manivannan.sadhasivam@linaro.org>
 <20210427065400.18958-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427065400.18958-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Apr 2021 12:23:58 +0530, Manivannan Sadhasivam wrote:
> Add devicetree binding for PCIe PHY found in Qcom SDX55 platform.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
