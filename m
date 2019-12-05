Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 315CF11488A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 22:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729739AbfLEVPW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 16:15:22 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42314 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729450AbfLEVPW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 16:15:22 -0500
Received: by mail-ot1-f67.google.com with SMTP id 66so3911410otd.9;
        Thu, 05 Dec 2019 13:15:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YJ9zindtieuDhe+7MeY3HR+ZIrhEnTYORFnF43Fjuuo=;
        b=H8FjBmCGpKJ12wybDVkmrbxMQtMFXJnBNXpQu+uP8Bz+UET1zkLgd0Q4DSYX+K4lqs
         R+xgMm3YJptsTUZMSWQsR5M4heft+hOXqhNLpUIQJaP0VXUjTxkju2wgpjUXR5U/lcwP
         xatmqD6UYO+CDHy7qPT44ntLXzsu9FHi/fT625rP2MWeBUxaTTuJuEzIIcOw/YMHVbeh
         Nap/78Zfq7KqNjbk/IuBi54arNETu7ZdQVTTLJWPLrx+Ay+Hv9Yka5irqYUiQ3tY78nX
         gR/+3iGYyIveGWAdpKKnvZYka/N4nqg76aDUMcLua+q4cUK1uErDLG6mWXob2rrUwBgu
         XH8Q==
X-Gm-Message-State: APjAAAUm4GCX9FzepGahoB43GDh77p2X0lTPes0nv1xj7bnzVm8fdF7z
        xA4jPz7euZzcG6PhEmgzsA==
X-Google-Smtp-Source: APXvYqxZcyLjEEXrywjejvo3Fovq/Vj1ZK2rPKMOypHYm8vTPRNz4P37AyKMhs/HcKqGxOLJBudH/Q==
X-Received: by 2002:a9d:58c9:: with SMTP id s9mr8001069oth.121.1575580520010;
        Thu, 05 Dec 2019 13:15:20 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f62sm3800001otf.23.2019.12.05.13.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 13:15:19 -0800 (PST)
Date:   Thu, 5 Dec 2019 15:15:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V1 1/2] dt-bindings: mmc: sdhci-msm: Add compatible
 string for sc7180
Message-ID: <20191205211518.GA30447@bogus>
References: <0101016eacb255af-3985262d-9b7e-4813-88c2-61838406e12c-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016eacb255af-3985262d-9b7e-4813-88c2-61838406e12c-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Nov 2019 11:49:59 +0000, Veerabhadrarao Badiganti wrote:
> Add sc7180 SoC specific compatible strings for qcom-sdhci controller.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
