Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1B9314680
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 03:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhBICgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 21:36:10 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:40014 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhBICgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 21:36:00 -0500
Received: by mail-ot1-f49.google.com with SMTP id i20so16189784otl.7;
        Mon, 08 Feb 2021 18:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EALNFE9LN7zo2Rn3BjpWWJz8qbTpAXtg1uE+et7bGKY=;
        b=ccPcrq7m7fRWLUTz6zM7eHdJLcDyVWoTylFa0K8VrSZhmpIqJcXHS5IdTvybY76eUm
         /+zEZCV8gl+P9C8/newRS7hDMFHaU6TJ3vvCvz75qLz3CBmLaBi9cQ9IDPNVAQEaxXlO
         OY/Y2oyqP0drFFvjmcKqpQADuMAWcamSpfIOmZLxWUFpwsu+4dUmMcfOSNEnK3gEMSVR
         nwEIVI/Yb0Dtcmnl0yFjjNyG8f8x5quRv3tsUaskrKbfwzI6Vpp7PkdlyyDtCtMfm7mA
         EwNx16Dm38fLBHLO96OO62lpcQXCKpqDlne2PnuWZPIQo6nweSPF4Adsi1xhhU1JrwGJ
         v07w==
X-Gm-Message-State: AOAM532YXQ7f36eYBYRt4fkhU1/Z3EbBGBXZgyvRamjQ8iH7v9HLo6PP
        LhFBDE8pT7Ms1O2eTtPLTA==
X-Google-Smtp-Source: ABdhPJw65qnfX9fA9xSh6g5FC2J57n8p6U1CV48mjQZL1Iqv6msSYdZZmXpa5M0srFFY6eFpswiyUA==
X-Received: by 2002:a05:6830:4b1:: with SMTP id l17mr13980444otd.119.1612838118854;
        Mon, 08 Feb 2021 18:35:18 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a10sm407629oie.39.2021.02.08.18.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 18:35:18 -0800 (PST)
Received: (nullmailer pid 2566149 invoked by uid 1000);
        Tue, 09 Feb 2021 02:35:17 -0000
Date:   Mon, 8 Feb 2021 20:35:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: aoss: Add SC8180X compatible
Message-ID: <20210209023517.GA2566097@robh.at.kernel.org>
References: <20210121014606.1612668-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121014606.1612668-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 Jan 2021 17:46:05 -0800, Bjorn Andersson wrote:
> Add compatible for the Qualcomm SC8180x platform to the AOSS QMP
> binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
