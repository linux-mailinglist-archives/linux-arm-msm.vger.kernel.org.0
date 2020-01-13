Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1296A139CE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 23:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgAMWvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 17:51:24 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41490 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728967AbgAMWvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 17:51:22 -0500
Received: by mail-oi1-f193.google.com with SMTP id i1so9963163oie.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 14:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+TjdMcFXIkLDz7Ope3oNQdtKGj6YfaXsPTt/MuhULpU=;
        b=dMxMkjTwZflovNSbRrdGGl0RpRRZdn28u+7WzpFpE8c6zb+Tn4Nt65Ca9XiPUfI1W0
         CfZft4twCb8T7MpC9bWw5y2GUlMqjoKA6PeHA8eMAEw14ZI2jk3w4AaADf3bKO/h32JX
         D29mDuk6twHCQ9I59BSMh/Hzek4vEY7sIMI8wHYBf1hkvVfNpASeXVrRVNz1te64hZNa
         3CFC3w3SsnUYMSycasA6iX8YFQu2QjVmrrPZk+jxYFdNur3E43IsHRXoSuP7Z/LmHjAN
         QHNCo4Uqn/HIysnKOCkkA0zdiCDsMxOlxRON+c/33fOvj5Vfmyd03tv4tboI3mb+wNoX
         /vTg==
X-Gm-Message-State: APjAAAXuD4df3zY+PpWjt1WWmODDOQk3eRrooFth/7G1rq0X6mwDkeIX
        nmiAp1WaRQuHSfIl1dF9/qD6NJs=
X-Google-Smtp-Source: APXvYqz4iwaR05Zpbj3+6kN3ehD3F/KZOePYr55TOGfjKI+g3yBzWrWRlJhQtAk+jL+yoeAn+xJxvg==
X-Received: by 2002:aca:2b0a:: with SMTP id i10mr14815278oik.137.1578955881914;
        Mon, 13 Jan 2020 14:51:21 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i20sm4665507otp.14.2020.01.13.14.51.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:51:20 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:51:19 -0600
Date:   Mon, 13 Jan 2020 16:51:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: interconnect: Add OSM L3 DT bindings
Message-ID: <20200113225119.GA15922@bogus>
References: <20200109211215.18930-1-sibis@codeaurora.org>
 <20200109211215.18930-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109211215.18930-2-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 10 Jan 2020 02:42:12 +0530, Sibi Sankar wrote:
> Add bindings for Operating State Manager (OSM) L3 interconnect provider
> on SDM845 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,osm-l3.yaml    | 61 +++++++++++++++++++
>  .../dt-bindings/interconnect/qcom,osm-l3.h    | 12 ++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
