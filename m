Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAA91B18C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 23:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgDTVuB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 17:50:01 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35795 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgDTVuB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 17:50:01 -0400
Received: by mail-ot1-f67.google.com with SMTP id e20so9567902otl.2;
        Mon, 20 Apr 2020 14:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vYmwwzqG7uqx9g2ELxFVG14owXz8xo4qOPYfFDEaBnk=;
        b=gedjbVZE0RQ/kZpc1eNrGRNc9pMsnx0nNGWd5xRtMB4JI8RH8gu1zdE+C+AYeWYmcF
         pNi1rNcYB8tMxVVyo0aUHXjAdJcD4bvOwKT2zmI7ikZ763EAf4OohhHkb1q2uX/ZBO+O
         0INMGWVyl3s9ffJt1fc8dM6GMnAg/khX1N16x6PURcba8JCmGgWZPK2LBxODQbHpXXPL
         QX7/ukn+lxKISBu+xnCWHcZ7exHVLu8HwyglTfde/PHfz4D58cGlx5ZkD/BsD5UR39SK
         yCZU/a5R8DUFkf1Jw0tc1Iy1pdUdMHWbn1TsdEpbjN+6Pi8gtWR3iGmcpImBWz4em0B8
         2tOg==
X-Gm-Message-State: AGi0PuZRBmBLXMjSNxwI8dBKai/5fjqPh0yd8IDR/7q+zgSR9L82ij1h
        jXosoTCGpWLsIYmiisuoLkjqTQk=
X-Google-Smtp-Source: APiQypLo5amH2CJMms+WGoIdXKyJV3V9lJJ2mR1Um33qIA/Ag0+OPAipS7fQufoA90Fhx/wSicrR3w==
X-Received: by 2002:a05:6830:1483:: with SMTP id s3mr11058611otq.176.1587419400257;
        Mon, 20 Apr 2020 14:50:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i2sm188842oon.0.2020.04.20.14.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:49:59 -0700 (PDT)
Received: (nullmailer pid 23817 invoked by uid 1000);
        Mon, 20 Apr 2020 21:49:58 -0000
Date:   Mon, 20 Apr 2020 16:49:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: qmp: Add SM8250 UFS PHY
Message-ID: <20200420214958.GA23753@bogus>
References: <20200415060745.740193-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415060745.740193-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Apr 2020 23:07:45 -0700, Bjorn Andersson wrote:
> The SM8250 UFS PHY can run off the same initialization sequence as
> SM8150, but add the compatible to allow future changes.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 5 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp.c                    | 3 +++
>  2 files changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
