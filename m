Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 390F0173B0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 16:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgB1PKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 10:10:50 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35034 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgB1PKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 10:10:50 -0500
Received: by mail-oi1-f193.google.com with SMTP id b18so3174029oie.2;
        Fri, 28 Feb 2020 07:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t0G3mflzMLYfHT/AnRWKVaX1lcvqOhj/G6xuPMWJ9SY=;
        b=I0kO/nEhwgXNjI/WtwGuUpOVPQ6nODVEh3Pp0cRuslLF/p1rctUIzv3uuS2vrhc2GS
         TqaJmxndsQNAfNgW5jYFQMxQ3dj/eNdULAmx303TRfJU4AV9Ny6moR6YeVhc0iN4U3BU
         0jXDuNsgSi3vVWPj4mmvP0xfKITN1xJeC7np1fGbRJtUEtCd2mcOC1K5d7Ea/h84vKOH
         v1Zfx3qFSmHp3AmhycqRFZ83w65EsTM0MQ/7jpLFQwUGIfKYm2PnoQFfHCoNGAZlAV2N
         om5Ozv7DQmVf+6WUDwjp1nRs7cZVSiwvxnknKEdByQRGJzdhFY/El3hmuwQ7ar+KX8tn
         9Rdg==
X-Gm-Message-State: APjAAAUEeHWgyb5BXY1V4H8KjfZyE5KV2WP+gSbA0XkmxSSPLYyIeiz/
        gsr3PSVWCFYR/MIjp6sHxQ==
X-Google-Smtp-Source: APXvYqxtcZ6ZNm10DIZf0YYzfzgPghegW6SU51q8Yb4V2+TcrwQt6aZ/TOLwt19IL07IumO1NVtEqA==
X-Received: by 2002:a05:6808:4d3:: with SMTP id a19mr3271213oie.119.1582902649140;
        Fri, 28 Feb 2020 07:10:49 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z3sm2010618oia.46.2020.02.28.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 07:10:48 -0800 (PST)
Received: (nullmailer pid 347 invoked by uid 1000);
        Fri, 28 Feb 2020 15:10:47 -0000
Date:   Fri, 28 Feb 2020 09:10:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, dianders@google.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V3] dt-bindings: mmc: sdhci-msm: Add CQE reg map
Message-ID: <20200228151047.GA32759@bogus>
References: <1581434955-11087-1-git-send-email-vbadigan@codeaurora.org>
 <1582545470-11530-1-git-send-email-vbadigan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582545470-11530-1-git-send-email-vbadigan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 24 Feb 2020 17:27:50 +0530, Veerabhadrarao Badiganti wrote:
> CQE feature has been enabled on sdhci-msm. Add CQE reg map
> and reg names that need to be supplied for supporting CQE feature.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
> Changes since V2:
> 	- Dropped _mem suffix to reg names.
> 
> Changes since V1:
> 	- Updated description for more clarity & Fixed typos.
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
