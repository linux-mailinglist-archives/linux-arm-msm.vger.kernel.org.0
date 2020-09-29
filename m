Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C714927D680
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 21:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgI2TKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 15:10:44 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45623 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbgI2TKo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 15:10:44 -0400
Received: by mail-oi1-f196.google.com with SMTP id z26so6669404oih.12;
        Tue, 29 Sep 2020 12:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P1/m9QiSdgyvfStAgxDXDni/v1l7JjRuH6ifGD4UeHc=;
        b=LaBatGsoEP8zmPUICLctBZGWpXYHpFNsAT9mpr36bfedAJF79Na4Bhoq7a8FZIxK57
         GffQzZTDQ7lwD1QYfJPHzunFwpEVOyoJbhgWfj3ivsBIhKcv1QqoxU6R8RkH2SKQXCFm
         IL1aqYnCDeARiLsGu7VSqKe4mRON2P9t1egoFXbDjmd6n2WgyK0JvjXsOUK4GMDmNdjI
         eqtk2zf5eqf0jB2fHsJ9hnEQWYZXab1K4V3Dq5Lw/3hwxzeihN3fCQxRxstOYvJVoU37
         v4z9ObSU8ejZJJ4oqAAlEqCFJBRu6DU9x99WZtUr1yrjUwr/3sz20N3RxuPu1Df42Vt/
         upzQ==
X-Gm-Message-State: AOAM530PMj/kHBmk0rKHd2lrFf7Dbsjmcn+zVxyuX4GQxjX5udfeFAvd
        TXrBi4sHHhj/hGi5RycKjQ==
X-Google-Smtp-Source: ABdhPJz0K1uHXOBWLKt6w53u6b3plRVlmc4EKrzlCakv2bqgabB1h7AD2jsOtPmUue1WdEZ0fLAoPw==
X-Received: by 2002:a05:6808:44:: with SMTP id v4mr3606541oic.45.1601406643543;
        Tue, 29 Sep 2020 12:10:43 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a75sm1191029oii.55.2020.09.29.12.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 12:10:42 -0700 (PDT)
Received: (nullmailer pid 984216 invoked by uid 1000);
        Tue, 29 Sep 2020 19:10:42 -0000
Date:   Tue, 29 Sep 2020 14:10:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     will@kernel.org, marijns95@gmail.com, martin.botka1@gmail.com,
        konradybcio@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, joro@8bytes.org,
        robin.murphy@arm.com, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: arm-smmu: add binding for SMMUv2 on
 Qualcomm SDM660
Message-ID: <20200929191042.GA984165@bogus>
References: <20200926130004.13528-1-kholk11@gmail.com>
 <20200926130004.13528-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926130004.13528-4-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 26 Sep 2020 14:59:59 +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add the binding for the SMMUv2 found on Qualcomm SDM660.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
