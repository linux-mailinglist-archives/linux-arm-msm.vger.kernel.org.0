Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5254D365BCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 17:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhDTPE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 11:04:58 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:38513 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbhDTPE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 11:04:57 -0400
Received: by mail-oi1-f171.google.com with SMTP id d25so1738283oij.5;
        Tue, 20 Apr 2021 08:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KTU5eNMioB8Axnpx0R9JWXvrUF5wC4hLHjEKa3PS8eY=;
        b=ftgMETcEq1NuhlQIdOSrHGg8/zXYg0nk9kMk66wURJUM4oBdeS0eqn88Fzr2vARdfy
         J5Iq/l/uhVUWRyxdP3/8iRdDo+9CR+ZGVZtPqqn7Boyd4DtJIB8kEct8/KcaZUVUwmy8
         QYu9Cb91JipIPmha35QselpVQdAfOQT5hMv8aoAYUXgkG5UY06uQ3COV5ySLRNn32CkB
         CDdwFdBvaBa8AUzeezpr75udPJTwUQtu2meclypXHt7HdDBUoqFJaozV9zwxdpajf5iq
         q7c1kOJz7Koi+bfFJVJL02qfCf8ekrGEtlgnZsF1iMiwnhUI6Rua/235AQ71Ck28+uSA
         jdPA==
X-Gm-Message-State: AOAM532v2diCgB39fW/bmlcBWSsvkPe4rqDNGA452bvyVvtgROZR7PDv
        DnfII2J9caU0HJuUz8utcjLZ9LuD3w==
X-Google-Smtp-Source: ABdhPJwcjWG0pgwrG/g5YFKkrT8YS/I+SE5MK3pBgxf4DE7MXsD8WLNm40ZahAOrKGP+dWbQyKadcg==
X-Received: by 2002:aca:5e55:: with SMTP id s82mr3419978oib.9.1618931064420;
        Tue, 20 Apr 2021 08:04:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l4sm3861609oic.26.2021.04.20.08.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 08:04:23 -0700 (PDT)
Received: (nullmailer pid 3325349 invoked by uid 1000);
        Tue, 20 Apr 2021 15:04:22 -0000
Date:   Tue, 20 Apr 2021 10:04:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: qcom: Add MSM8226 GCC clock
 bindings
Message-ID: <20210420150422.GA3323717@robh.at.kernel.org>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
 <20210418122909.71434-2-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418122909.71434-2-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Apr 18, 2021 at 02:29:05PM +0200, Bartosz Dudziak wrote:
> Add compatible device strings and the include files for the MSM8226 GCC.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
