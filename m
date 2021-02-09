Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF49314670
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 03:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhBICfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 21:35:33 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:38470 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhBICfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 21:35:32 -0500
Received: by mail-oo1-f49.google.com with SMTP id f26so1633893oog.5;
        Mon, 08 Feb 2021 18:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F2Ye6uNgCoQ8O0PKZU6N1hNtpHnVIiBUypfNgjug/Cw=;
        b=pXLX0w9EneEl0jKDwG+nQe+Ho0AHUZGJXgBxY7GYV4AdNf1FJyN5GC4WIyEisz9esi
         k1e8vnFlkmFnLosULou33o50iDLotjVeXhT9AZhskC7ch3OID5rdfHzFy9wY38X0nkJI
         7boe3H9tADYHoJsr/4u4WIZVLqRL9fQq2fDpDtTDcKRepN39a8JhPmsiS9iqVBovOiNw
         McQ7wOxlj8wMAc/DMqKIFiI9VkYV3B071G42mqC2HqcNGeu0v8bOEQ4mvy+N5NOMjE/S
         29RxDj5Qh6lR5x4p4+Sr00BzCtDtIFx1cuwZ7zANKK7sG+I8CPfT7t0EG6s6w6JQCh71
         0pEw==
X-Gm-Message-State: AOAM5320oFSZ2MyOKTWEmNpY94LeK7slQ8IYY5P0M44Kue67OBdg+j/f
        QA0vrlbPHUQqdUXk/fgQXw==
X-Google-Smtp-Source: ABdhPJyTvld0x0Z8yX/z9hAFkVrC6lTTYgqw7wfFAtDFha0itFsg/4/5YAnl+ldOcIPpebBW9+ssRw==
X-Received: by 2002:a4a:dc99:: with SMTP id g25mr9112836oou.14.1612838088789;
        Mon, 08 Feb 2021 18:34:48 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a28sm3958203ook.24.2021.02.08.18.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 18:34:48 -0800 (PST)
Received: (nullmailer pid 2565043 invoked by uid 1000);
        Tue, 09 Feb 2021 02:34:46 -0000
Date:   Mon, 8 Feb 2021 20:34:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Add SC8180X to rpmpd
 binding
Message-ID: <20210209023446.GA2564984@robh.at.kernel.org>
References: <20210120225037.1611353-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120225037.1611353-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 Jan 2021 14:50:36 -0800, Bjorn Andersson wrote:
> Add compatible and constants for the power domains exposed by the RPMH
> in the Qualcomm SC8180X platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml       |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h              | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
