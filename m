Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98FA8111B2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 22:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfLCVyv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 16:54:51 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39230 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727416AbfLCVyv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 16:54:51 -0500
Received: by mail-oi1-f196.google.com with SMTP id a67so4860706oib.6;
        Tue, 03 Dec 2019 13:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uBWInSjgDLZJRKb8+BbY/MJXxzaCg875gyj4fj9+3QY=;
        b=QB/UYZTuyHdHSWPJN9N0xHJtmrz7nFlM8O6UdbHxJjnHRzbamTTBQpqTD5G513kAU3
         ezIckVcVyMq0qBp+ACB8IB394rHJhxtNN5qBKa6XIBSEOjmgrWIxAVNplDH4sAWAFdHU
         ES5x1TYb1/Yp0P3DWJPkzvGmeTQXzOLOHmH9qCgC2F50yyXCqprRFC+0VYgb7fak2192
         46gjzhwYa6GMsMCGTjeTWm4SPLjndxVPoaV7yFARndfe07NOZ3UC6E6mhTVBRmwSLCUo
         PmN30mFtvw1XsXGpFuq3WnQzQV9vx+YqliEqGLmwHbsso+lKiEDsvYL39/36ObHNPLVs
         beog==
X-Gm-Message-State: APjAAAXGtJ+nihTISKfiAEe2D5sDn8LRdtWqF1QCRS2Ue5po3sSvFMKI
        AcwoX3qORhuTPtKm8xRv+gwSDd0=
X-Google-Smtp-Source: APXvYqyGNB1jJvtSyInr8oFZ+gCcUC8Cdu8ulnjPaAvTEZnfr3xbOJnmXVzxqRPkeYwbGSFkgPzrhw==
X-Received: by 2002:a05:6808:9a1:: with SMTP id e1mr97747oig.175.1575410090248;
        Tue, 03 Dec 2019 13:54:50 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b20sm1581653oib.1.2019.12.03.13.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 13:54:49 -0800 (PST)
Date:   Tue, 3 Dec 2019 15:54:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, rnayak@codeaurora.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        swboyd@chromium.org, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 2/6] dt-bindings: power: Add rpmh power-domain bindings
 for SM8150
Message-ID: <20191203215449.GA11793@bogus>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99a91d-6632f420-b2f2-4b71-9c97-a3974fcb8fa9-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7f99a91d-6632f420-b2f2-4b71-9c97-a3974fcb8fa9-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Nov 2019 17:40:07 +0000, Sibi Sankar wrote:
> Add RPMH power-domain bindings for the SM8150 family of SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.txt       |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h             | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
