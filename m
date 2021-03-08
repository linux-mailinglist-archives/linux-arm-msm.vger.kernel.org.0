Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05748331827
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 21:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhCHUKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 15:10:00 -0500
Received: from mail-io1-f54.google.com ([209.85.166.54]:33460 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbhCHUJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 15:09:31 -0500
Received: by mail-io1-f54.google.com with SMTP id n132so11386337iod.0;
        Mon, 08 Mar 2021 12:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U4OWsAUkli1SFY3ySDutg2LgcctGwQeGpRSM20OhGso=;
        b=Y6eOf4YUU+KdgVVqL8i2snQS4ZhqncTTXcmooL62D3tmmDYzUEBKRJpJzJdgs72wFf
         OraG+zvVDsEX67JCWqnafQg5XpcOr7CEPiUsZOc7WB8SPtcPZARWVMBaZV1zaIK6vG6i
         3wAbTcWqywEog/AY6MNSsYeMXWrFEN4PJAVToEcWaG+qwARLk+1ADe+z/S6Vzfy2PJrI
         pV2ymO/pHYJvLNw1Kl3ZVFt3e1fIq/xQ1EkqSPRT3AICP2/qojU8WVAxT44MQcsXc4OQ
         sDT+DLfPD4tajpbKzt/cojcBkgSvMYcBdNjqNr+tqNnMqnjEUTfqnlsatNg/uaW+xleO
         pavg==
X-Gm-Message-State: AOAM531km9bejcrbRLJjheAFZlYDEaV0zIosLaDqe8sk3op7tJWIN4P6
        3xJ3xuQ4egPcK1nci0v4vvNBZ5C+Vw==
X-Google-Smtp-Source: ABdhPJxG6rxAZnG+Gcd7kEloIFR4MCwITj6D+2xjuTkgCtsxwzVw6rho86OjD/WWHoXN+g7rYlY6Ew==
X-Received: by 2002:a5e:9513:: with SMTP id r19mr20699554ioj.35.1615234170780;
        Mon, 08 Mar 2021 12:09:30 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k3sm6428895ioj.35.2021.03.08.12.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 12:09:29 -0800 (PST)
Received: (nullmailer pid 2880488 invoked by uid 1000);
        Mon, 08 Mar 2021 20:09:26 -0000
Date:   Mon, 8 Mar 2021 13:09:26 -0700
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org
Subject: Re: [PATCH v2 02/14] dt-bindings: firmware: scm: Add sc7280 support
Message-ID: <20210308200926.GA2880436@robh.at.kernel.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
 <1614773878-8058-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614773878-8058-3-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 03 Mar 2021 17:47:46 +0530, Rajendra Nayak wrote:
> Add compatible for sc7280 SoC
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
