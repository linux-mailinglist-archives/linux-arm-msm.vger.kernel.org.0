Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 046F544FE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 01:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfFMXNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 19:13:41 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:38859 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfFMXNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 19:13:41 -0400
Received: by mail-qk1-f196.google.com with SMTP id a27so523145qkk.5;
        Thu, 13 Jun 2019 16:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ycBe9I5qE6I0844UHWF0cICH9VE+GutrjkLafm0KuQ0=;
        b=jQUhsTd6gbD+KAVYVHdjhg2zUDxs71zM9XNmXVVGzQIWbyRGVSVdgVX0l59RETqoPu
         9NEgpFIdHHnIllgxHlR41C06YwqYUe0k31LgP1koMGJXSjmu1q8wdChThDlLvVztUOnB
         hRPnRFJKPluPI+SOBb0jdWg3KB+95llCtwM8VIzbHgFvabZRXzIwJfUJwmLThYMaVj0S
         IMkuOw57mJILIEX4kfXZMrj7q3GjcjAbO4dXTfHnMMMPtSQzOIGfjL1dLm0WMRLdUffT
         GsOP/JYhg23W18eXfLUwD5qw1GPkMuoRGK6VDcKboEHVDRv/H4JB6LpYmfwoXEDpat2X
         VrdQ==
X-Gm-Message-State: APjAAAXF6u+rTFHBRHMzrQ/I0lEPb4g9pBZqNxSrYru2ZY7l5g+1ONs5
        t9SGW6l5JwIXdTEYNUlIRw==
X-Google-Smtp-Source: APXvYqw7wFVMUzPvVknVlsd9YvZvCuNzLEqnuiZQgeVTZnf5WoP8b9G7izEepEdaqiC5EoHKr9M0/g==
X-Received: by 2002:a05:620a:1206:: with SMTP id u6mr72012736qkj.88.1560467620109;
        Thu, 13 Jun 2019 16:13:40 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id d26sm599727qkl.97.2019.06.13.16.13.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 16:13:39 -0700 (PDT)
Date:   Thu, 13 Jun 2019 17:13:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        niklas.cassel@linaro.org, marc.w.gonzalez@free.fr,
        sibis@codeaurora.org, daniel.lezcano@linaro.org,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/9] Documentation: arm: Link idle-states binding to
 "enable-method" property
Message-ID: <20190613231338.GA23667@bogus>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <9dc4ce06143de48039e841c337fafa7cb9c8d7d2.1558430617.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dc4ce06143de48039e841c337fafa7cb9c8d7d2.1558430617.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 May 2019 15:05:12 +0530, Amit Kucheria wrote:
> The "enable-method" property for cpu nodes needs to be "psci" for CPU
> idle management to be setup correctly.
> 
> Add a note to the binding documentation to this effect to make it
> obvious.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  .../devicetree/bindings/arm/idle-states.txt         | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Applied, thanks.

Rob
