Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B741C3EF40D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 22:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235084AbhHQU2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 16:28:48 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:39598 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbhHQU2p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 16:28:45 -0400
Received: by mail-oi1-f173.google.com with SMTP id bj40so979215oib.6;
        Tue, 17 Aug 2021 13:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iNBJenjNfkGjgauPUMY3aMWIFhR7Jyck3V3Kf0gF3O0=;
        b=Qzhs9C0by1bzkQtQKQQOwQWh0ruHUQ2QntL+p6l1H4G/OcTk9Yq3i/sX5Yzugh91eB
         bRxDJ/Ajt+qKKiP7gJDzGLZdF3WYCNGQ9yJAO7FfMjTA9YlkPKcML/Q6VMmJI4MlCvRg
         xyTJvX3LjJKNl3kWU5Q6G+w/lTTEh4p0TemZU9F5g5aGE1XD0QYbmkiENCk4+rxmcGvl
         +/eBKvy+HQEqtQfx2Cv0Zn43s3Hnro0D5IyR3B6fC8K7DSaQc3pCqdPaC8/lKmbrC0Cc
         qOqIbZe/IdT/9Bb7YOLOSpYehJIXAqPvuYoTHuvUulzqx/LCvBp3hk5Os8uoAsQk4U6/
         C/tw==
X-Gm-Message-State: AOAM5314vSDgvpBwVe308b0gjDX/1yZec/kXKLTZ0ioM0hz5ORPM/dGb
        WzeOEP/kzz92Hl71eG47lw==
X-Google-Smtp-Source: ABdhPJznZ3RXEycKyF8zhd5KIlVHWaOqC1wHeqEsg/KDDEW0ngxavVqnkZ45/KtwxY8erwcYS/LqPQ==
X-Received: by 2002:aca:de54:: with SMTP id v81mr4133311oig.40.1629232090248;
        Tue, 17 Aug 2021 13:28:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n42sm624644ooi.26.2021.08.17.13.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:28:09 -0700 (PDT)
Received: (nullmailer pid 784424 invoked by uid 1000);
        Tue, 17 Aug 2021 20:28:08 -0000
Date:   Tue, 17 Aug 2021 15:28:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     bjorn.andersson@linaro.org, Vladimir Lypak <junak.pub@gmail.com>,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, jassisinghbrar@gmail.com,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: Add compatible for the MSM8953
Message-ID: <YRwb2HdqJ1YmPBWA@robh.at.kernel.org>
References: <20210810164347.45578-1-sireeshkodali@protonmail.com>
 <20210810164347.45578-2-sireeshkodali@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810164347.45578-2-sireeshkodali@protonmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 Aug 2021 16:44:26 +0000, Sireesh Kodali wrote:
> From: Vladimir Lypak <junak.pub@gmail.com>
> 
> Add the mailbox compatible for the MSM8953 SoC.
> 
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali@protonmail.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
