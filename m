Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0F43B3846
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 23:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbhFXVEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 17:04:06 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:38646 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbhFXVEG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 17:04:06 -0400
Received: by mail-io1-f44.google.com with SMTP id k11so10002288ioa.5;
        Thu, 24 Jun 2021 14:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zLPAxrJ6RkehSfZPtwHFNxzvyHIjmWbZlSrq5z/leJA=;
        b=Ccj5tlhZOLja1lN8OXo7eU4j0XTL3q2blYPunOs2jGxVig2DwLw75PxrSkziRxJZNV
         1j018zwaZhuEYSpWuDRlr9lbBlXi8vh0xbwcQt2jAFfI65vx9kgX144djJnxcTUAMmz3
         5e+x5ROn+Vv0fE/b7NqfeUQiROeIpc6wHuadLA/fibjKo/NO8udKvL6bmFFBJLMUdxhZ
         mExYG7V8BuDKMdp3NuG6esQS/KpYSHJsEYctvqWrdheS5WznoHqKeRGKuxr0kMjBQCtq
         t0WOXFin5I/qGb8oFeakTY5IstJT7eIgkagGYtCmgl0w9D3D+UI4jJrZIX/g9SovyJ+8
         k1IA==
X-Gm-Message-State: AOAM531Y2zF1GbFOXaHwvDXfjr4s93zAlhS10dCRo1qRr9c3ObUIWuq0
        44Dt3E4vtC4eJFWMBjfkAw==
X-Google-Smtp-Source: ABdhPJwZrvS5iBs8ya+J8L6kRmTQN4cU8jGVvbWIoEJFGic7RHsWnlNmYuZqhGMWwiuORBWV/15zzQ==
X-Received: by 2002:a05:6602:21d2:: with SMTP id c18mr5808517ioc.7.1624568506571;
        Thu, 24 Jun 2021 14:01:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z19sm1908511ioc.29.2021.06.24.14.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:01:45 -0700 (PDT)
Received: (nullmailer pid 1980879 invoked by uid 1000);
        Thu, 24 Jun 2021 21:01:42 -0000
Date:   Thu, 24 Jun 2021 15:01:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     linux-mmc@vger.kernel.org, pragalla@codeaurora.org,
        linux-arm-msm@vger.kernel.org, djakov@kernel.org,
        rnayak@codeaurora.org, rampraka@codeaurora.org,
        asutoshd@codeaurora.org, nitirawa@codeaurora.org,
        ulf.hansson@linaro.org, sartgarg@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, bjorn.andersson@linaro.org,
        okukatla@codeaurora.org, vbadigan@codeaurora.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        sayalil@codeaurora.org, robh+dt@kernel.org, cang@codeaurora.org,
        sibis@codeaurora.org, adrian.hunter@intel.com,
        stummala@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2] dt-bindings: mmc: sdhci-msm: Add compatible string
 for sc7280
Message-ID: <20210624210142.GA1980830@robh.at.kernel.org>
References: <1623835207-29462-1-git-send-email-sbhanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623835207-29462-1-git-send-email-sbhanu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Jun 2021 14:50:07 +0530, Shaik Sajida Bhanu wrote:
> Add sc7280 SoC specific compatible strings for qcom-sdhci controller.
> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
> 
> Changes since V1:
>         - Modified commit subject line.
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
