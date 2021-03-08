Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A16331824
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 21:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhCHUJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 15:09:28 -0500
Received: from mail-io1-f42.google.com ([209.85.166.42]:44136 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbhCHUJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 15:09:12 -0500
Received: by mail-io1-f42.google.com with SMTP id 81so11322606iou.11;
        Mon, 08 Mar 2021 12:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ptwI/1/c53nyotk+pbKQGECBYh7OexR+9dDajvWsfZ0=;
        b=X4ux3vPvLlAo19WwHoKaPoUr/BfuAES164OvfQ6tW32qoOPZypc/EEjM27PruKPvAn
         k0rtCXZRziD8fYeL55YO/r8RpLHHMw/1+jD3XIN4T10TS+ws0tBP3vdS2S4clDHnpuF7
         5Q7XF0OdsSP9prs9GtTeWZHEJbX1qoMxvlQU+3wqWL1ayCNd2v6kf4If0GtzbX8As4O5
         Veiyty12PP7GcxDz/G8LRj757R+dApco5cxHb0YyvfePrqjH0IH5Z4BTMQ3iCOlxgHs4
         zttcCZXnUoi0u/xdztu8LHUs4PcppfumPICAvw5pyhJzlYn22TIgVenxX/fitnr/XvYe
         YBrA==
X-Gm-Message-State: AOAM530RlqZSH+H321bPrD3/iBlRErl5JjJ9cRJ1cCrivzqC/RhiNdsG
        RlNE9takIH7mQKWSzTQv+w==
X-Google-Smtp-Source: ABdhPJylflcBzA4Zn9arxcgFiZ0zj+LfI5/OQQC1eU3Tl5w3rfpAsk30G9VjrMRSq836NkMBMdBAmA==
X-Received: by 2002:a6b:ed08:: with SMTP id n8mr19792099iog.197.1615234151829;
        Mon, 08 Mar 2021 12:09:11 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q14sm6404521ilv.63.2021.03.08.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 12:09:11 -0800 (PST)
Received: (nullmailer pid 2879991 invoked by uid 1000);
        Mon, 08 Mar 2021 20:09:09 -0000
Date:   Mon, 8 Mar 2021 13:09:09 -0700
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        swboyd@chromium.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v2 01/14] dt-bindings: arm: qcom: Document sc7280 SoC and
 board
Message-ID: <20210308200909.GA2879953@robh.at.kernel.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
 <1614773878-8058-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614773878-8058-2-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 03 Mar 2021 17:47:45 +0530, Rajendra Nayak wrote:
> Document the sc7280 SoC and the IDP board bindings
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
