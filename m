Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C377462B67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2019 00:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbfGHWWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 18:22:40 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44459 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfGHWWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 18:22:40 -0400
Received: by mail-io1-f65.google.com with SMTP id s7so38854552iob.11;
        Mon, 08 Jul 2019 15:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j+TKZB9O7k+DtANgHGBfHBHuGR2fL+XIDhYBGfnpm5c=;
        b=a8+AIXAQifBduWrllVxwxQPlXuIh1jF1Rj1PS+jkXmAACQ72pFPNG7SaQH4TYXdW/c
         ZxpmDWbqFW/5Rwmz5DJZb2Zwq26EPZ8iMWTkY6K4Y69skgrRDNOAihLQIoePD4Fo9dYZ
         Z0nwi0DkaCEPT1WpG6XVLeo/Ow84UoJNa+Aq2DHQh3gKEASU994K1jBw4Ukhr5lJpsJI
         HoBGxerWBzEOOjg4WrNeh2OR5AW7c3F93PuKPsGAfWOniaffO3L1pIF81EhYafcNbKTD
         psVlESlvNf3mzeJwub0dqSGXEXiurfka4aRamcS9CGuW6MPuTlNA46kHc8dpUeG9C+nm
         bTjw==
X-Gm-Message-State: APjAAAWdaX89LLWb4pwepS73r5Y2CPmak0gu8gBH7nCaxQI7Uel5wgmF
        ImzPa0k/szDxuVMQ1JlBat6qebU=
X-Google-Smtp-Source: APXvYqzFDsbgQ7fCs+NRybe+k3ZWI7EOwEOe9pO2Lrk17Q9cymxTA8kXF6V9k6yESGcyJ8+BjKOEZQ==
X-Received: by 2002:a6b:b985:: with SMTP id j127mr21421472iof.186.1562624559280;
        Mon, 08 Jul 2019 15:22:39 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t133sm21552866iof.21.2019.07.08.15.22.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 15:22:38 -0700 (PDT)
Date:   Mon, 8 Jul 2019 16:22:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3 v2] dt-bindings: power: reset: qcom: Add
 qcom,pm8998-pon compatability line
Message-ID: <20190708222237.GA30944@bogus>
References: <20190603222319.62842-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603222319.62842-1-john.stultz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  3 Jun 2019 22:23:17 +0000, John Stultz wrote:
> Update bindings to support for qcom,pm8998-pon which uses gen2 pon
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  Documentation/devicetree/bindings/power/reset/qcom,pon.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
