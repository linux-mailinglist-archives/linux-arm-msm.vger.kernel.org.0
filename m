Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED291B18C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 23:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgDTVur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 17:50:47 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:45090 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgDTVur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 17:50:47 -0400
Received: by mail-oo1-f65.google.com with SMTP id 190so2477101ooa.12;
        Mon, 20 Apr 2020 14:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7xwngnSK8jmnAaejETa55CBwGjsk6/73FAqW38IllgE=;
        b=Rin9IecO8JGnaays3m+wYsoTpYD1UQvsavlAXXxwjKli9SyK1kGYZVhYszcR6kfTGk
         M9ohTQZ8Jh9HUvZofFjz1qWbVmqeA+IpzBpFAkC7bCW4K7YV+cF0fSKM/nUbuLFhh/fp
         ACfhgsy0nGqJmgMF4sdHDtwYByd0BDsm4ATRGyltX8gfkHSR+4Zww0ct5dgmsxZvN5ni
         B+oQRo+31v3lBXVaBlOIj75shybHJGluDkYkt+qDVmF6UAoY+zIO/lKcDtgP3u1/SQ74
         eZuImJ1Nx5Z5NDXqETjO6QbljGDVWfq3yhvYaiHVgk1EgaNbMSgawZ4Y8L6E4oQaBaum
         r6yw==
X-Gm-Message-State: AGi0PuYysfkzPKKKkMu6+UGE1t9VsKmcRvEFtFgMdha2ZwukoC8sRljt
        SxG5ldFtVldBUX6mWBxPK7nMvgY=
X-Google-Smtp-Source: APiQypJhyooTQnBIqCxkrUYA7KEn8ivtsUF56mCc5Ma81d4iZ1WrQcXl9dcA1hU4Gy29XIJF5PRJQQ==
X-Received: by 2002:a4a:9c93:: with SMTP id z19mr14484786ooj.3.1587419446616;
        Mon, 20 Apr 2020 14:50:46 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h137sm178626oib.33.2020.04.20.14.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:50:45 -0700 (PDT)
Received: (nullmailer pid 24997 invoked by uid 1000);
        Mon, 20 Apr 2020 21:50:44 -0000
Date:   Mon, 20 Apr 2020 16:50:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Add SM8250 power domains
Message-ID: <20200420215044.GA24921@bogus>
References: <20200415062154.741179-1-bjorn.andersson@linaro.org>
 <20200415062154.741179-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415062154.741179-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Apr 2020 23:21:53 -0700, Bjorn Andersson wrote:
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/soc/qcom/rpmhpd.c                     | 19 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        | 12 ++++++++++++
>  3 files changed, 32 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
