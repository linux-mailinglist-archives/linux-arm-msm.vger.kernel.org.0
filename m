Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC163FCE1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 22:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239983AbhHaUEe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 16:04:34 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:34458 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbhHaUEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 16:04:34 -0400
Received: by mail-oi1-f173.google.com with SMTP id p2so749897oif.1;
        Tue, 31 Aug 2021 13:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K/gOc3F91rtVhTYdor0Wlk0nHlisr/+Ju2+e3kwXKlE=;
        b=a4BJ03WLkKRSSrxH06ZVIeW4jGgfnAs/iBvKvZ/N07N9fr4gh53ThIdR+tkbuLDSof
         UM4uT7fi6Xt7CVLQwESqYL10yheNg7QyTz2zTmrJonQTfssdOqC489RwUpATGZTKUq5T
         8ohM4qZC10k6lCabJqPxJXXYaFJSVkXJwY+noSJshW7gqUDsEeX3qkang+LIYvVf7wZG
         1/COvugT0hlrKWpPoTYxYn0fLueKp34tWkHWG9faQ3Trr7kNfcxIIWckvfBw+7nlhsbN
         gafhu6dye/8baXl8d8ypAv/aavj12t4xTpOxnwdhjGJhwXEmam63UF3I+d1GyQ2ICeuk
         SYmw==
X-Gm-Message-State: AOAM533r8b6t7D90yXhi623LUOcrBnLvrlo2Z4tkp5YbM4Vy4EIN+6u3
        7uRV9vCUeuoNeiwj+39jTKiCX9/riA==
X-Google-Smtp-Source: ABdhPJxyvw6A3WpkwYyp4mS6wewpbG9OYOakEjOkRTiDliPXaYPSP6vAkgtnCYV4KBQxM5ZFRhQ8nQ==
X-Received: by 2002:a05:6808:208b:: with SMTP id s11mr4501275oiw.95.1630440218135;
        Tue, 31 Aug 2021 13:03:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r13sm4110438oti.80.2021.08.31.13.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 13:03:37 -0700 (PDT)
Received: (nullmailer pid 565288 invoked by uid 1000);
        Tue, 31 Aug 2021 20:03:36 -0000
Date:   Tue, 31 Aug 2021 15:03:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Adam Skladowski <a_skl39@protonmail.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: power: rpmpd: Add MSM8953 to rpmpd
 binding
Message-ID: <YS6LGLcKbo/+95gZ@robh.at.kernel.org>
References: <20210825165251.18358-1-sireeshkodali1@gmail.com>
 <20210825170233.19859-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825170233.19859-1-sireeshkodali1@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Aug 2021 22:32:32 +0530, Sireesh Kodali wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add compatible and constants for the power domains exposed by the RPM
> in the Qualcomm MSM8953 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
