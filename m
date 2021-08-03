Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADE13DF5D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 21:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240071AbhHCTib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Aug 2021 15:38:31 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:45028 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239894AbhHCTib (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Aug 2021 15:38:31 -0400
Received: by mail-io1-f41.google.com with SMTP id d22so2228191ioy.11;
        Tue, 03 Aug 2021 12:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eb1jPGD0/E2nznm2NqtSynRzUeg03kyj4b+oSommWdA=;
        b=L2JVydAgLutbWJ4UyLHCRYBIV65wXJKjKHvEq8aHeuFC1fxal614qOfowafANSzaSI
         gdZ1341N93G1rb10DJXFov6tLqQtvrAe2ekHCZJnl7BebFXscMcp4mBzw8wbtja3UA0e
         CKc3L+1LSEweQb6cv3GentU+2hsP/kxr/Ii4edBngInQVQ3f5usSmq0fP/cr6b5zE/cA
         SY1R9bddKmSCN0ort7IJRe+cD1UDCkr9DgsShemyAhIzn9Cac09UXWZELhuoCxLaDyFI
         ngQy8iAntwg1glY4UOnCdxUwjhXjAODJPII+3i/3/McL30dsFm+1o/XIhj/Dzztmw5UA
         fFOA==
X-Gm-Message-State: AOAM532uMdbSlmjXCsk47OBH2kJQ1OGk72PR8ijrvmFAssniNyivUuZy
        BfpKsSoKnmgzycKNw9pG0Q==
X-Google-Smtp-Source: ABdhPJxKujOHBMl4ZpSqCe+EHHagEeGuUCKbktBFDSPChxHeapzR7oXQVrMCwPuQ5UjQGw7HDxRlDg==
X-Received: by 2002:a5d:91c2:: with SMTP id k2mr1101438ior.117.1628019498579;
        Tue, 03 Aug 2021 12:38:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q1sm6573ioi.42.2021.08.03.12.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 12:38:17 -0700 (PDT)
Received: (nullmailer pid 3614169 invoked by uid 1000);
        Tue, 03 Aug 2021 19:38:16 -0000
Date:   Tue, 3 Aug 2021 13:38:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh+dt@kernel.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        srinivas.kandagatla@linaro.org, rbokka@codeaurora.org
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: qfprom: Add optional
 power-domains property
Message-ID: <YQmbKMq4p7OmfbHw@robh.at.kernel.org>
References: <1627627573-32454-1-git-send-email-rnayak@codeaurora.org>
 <1627627573-32454-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627627573-32454-2-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 30 Jul 2021 12:16:10 +0530, Rajendra Nayak wrote:
> qfprom devices on some SoCs need to vote on the performance state
> of a power-domain, so add the power-domains optional property to the
> bindings
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
