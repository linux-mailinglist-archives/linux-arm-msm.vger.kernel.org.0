Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616CF3AD3E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 22:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234170AbhFRUw0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 16:52:26 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:42918 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234095AbhFRUw0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 16:52:26 -0400
Received: by mail-oi1-f171.google.com with SMTP id s23so11916014oiw.9;
        Fri, 18 Jun 2021 13:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L4LtPggW7wvPnjUlNRBXXdn1hi2ZE+tMVWYTEK9xv38=;
        b=DJ3VLXMvDhsCaguYPRg7XJjnweDhuoD6R+3DHjALYSm/D3Md3ZQ0lJxxP83cwrWmT9
         DTXlU1PWlVF4UTp81Xt1uWCSv8V+PeL3hcKwMlIq6FwuR+l2fPXetJhSosmvtl8JUh4U
         QTt/u74UWtux+kbVs9n0ONb17XNcu/HPC6CqyGHlsuI+zCNUmUPlN9wxdqlxgb/1j3NE
         EZX60CvK3IQUsHga0+iwdUUK03oHhXmGTlSxzmupamIKz2UEmGsKRzZefHTeNwhHbZeN
         56zO1/D5mtkUaR1YvmK72pog+/3uaeOdRQUsI9g+WIMmds1dYCLqPhQoGA9ZiJJFwSvu
         fsZg==
X-Gm-Message-State: AOAM532gNBR/b9bpipp5FEFcTrNQJHnRrBHIU2YDTaUEp1Qf7kQt2E1r
        SBm+IN84ACuojGJb/LqTAw==
X-Google-Smtp-Source: ABdhPJwCOlKuuRdR95kemB3u4Pg0nnwc98yxBEAvptV6v0cIeDEJeZgovpBvppTduCWTCRcJMHui2w==
X-Received: by 2002:aca:d603:: with SMTP id n3mr8740640oig.17.1624049414979;
        Fri, 18 Jun 2021 13:50:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o20sm2187997otl.2.2021.06.18.13.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:50:14 -0700 (PDT)
Received: (nullmailer pid 2851931 invoked by uid 1000);
        Fri, 18 Jun 2021 20:50:11 -0000
Date:   Fri, 18 Jun 2021 14:50:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: pas: Add SC8180X
 adsp, cdsp and mpss
Message-ID: <20210618205011.GA2851898@robh.at.kernel.org>
References: <20210608174944.2045215-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608174944.2045215-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 08 Jun 2021 10:49:43 -0700, Bjorn Andersson wrote:
> Add compatibles for the Audio DSP, Compute DSP and Modem subsystem found
> in the Qualcomm SC8180x to the Peripheral Authentication Service
> remoteproc binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - "Rebased" on yaml conversion
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
