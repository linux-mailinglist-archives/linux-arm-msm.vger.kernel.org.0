Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E7833E128
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 23:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhCPWJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 18:09:14 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:34108 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbhCPWIm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 18:08:42 -0400
Received: by mail-il1-f169.google.com with SMTP id z9so14196643iln.1;
        Tue, 16 Mar 2021 15:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OyfZrUno05sdhTmhJYxMXEGlfR9d3VqAhGdXNquBwgg=;
        b=F3Sz4nYOZ2RgUN/LXm+xX0D3JfG9xB0YrL17Jnjz7MJVZ4o905VEPCV3HFCTw5hkbr
         9jah9s2nVeRbxi5Yq7KHrXd4xwNWxRodrxhirCi/sVT+EnBA40ZfaxYV3e7E9IX/vyAu
         WJFq1xuqqGuzB9EhhxjsjwB6z6+PxY7qG4DgH46/vLt6NpYxw8aapA2IXW54yuwcBifn
         BAg+/3FOb8WpuYfR9GY5pRqm6sx1vcbmhfCCScQrDfPopmSyYpvjMVeaF0cHRN3joeG/
         Qah+AJhPXN4OBRdNvN46Htx+x4vWqV8WJ6sNu0LSykTmKGu2oik3nWOukhDNyNqj9iUg
         pPVw==
X-Gm-Message-State: AOAM533jyNqJeby9d2Y3Tu68SOV4pj4098e5Rq6gO0JQLDSlih/6oBJD
        BZWNOnNNXsceqoskMIlmkQ==
X-Google-Smtp-Source: ABdhPJzafeXw8WEynwYom7PsA/6BSK0QV/lq85ylYaqMtntisPCJQfbSS5ylsetY3K5xQG3vyjEEDw==
X-Received: by 2002:a92:c942:: with SMTP id i2mr80945ilq.241.1615932511486;
        Tue, 16 Mar 2021 15:08:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h193sm9488765iof.9.2021.03.16.15.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 15:08:30 -0700 (PDT)
Received: (nullmailer pid 3766900 invoked by uid 1000);
        Tue, 16 Mar 2021 22:08:28 -0000
Date:   Tue, 16 Mar 2021 16:08:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, p.zabel@pengutronix.de,
        mani@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org, agross@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: reset: pdc: Add PDC Global bindings
Message-ID: <20210316220828.GA3766844@robh.at.kernel.org>
References: <1615269111-25559-1-git-send-email-sibis@codeaurora.org>
 <1615269111-25559-5-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615269111-25559-5-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 09 Mar 2021 11:21:49 +0530, Sibi Sankar wrote:
> Add PDC Global reset controller bindings for SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml | 4 ++++
>  include/dt-bindings/reset/qcom,sdm845-pdc.h                  | 2 ++
>  2 files changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
