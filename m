Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB1435A630
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 20:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhDISwA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 14:52:00 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:43749 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDISwA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 14:52:00 -0400
Received: by mail-ot1-f54.google.com with SMTP id s16-20020a0568301490b02901b83efc84a0so6601954otq.10;
        Fri, 09 Apr 2021 11:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=goXyba68Vq2ZcPnNdvCAyK2pXvjfWkY1wv3QLuidgZY=;
        b=AtKWDy8sZd+Ft2dcc6eh3x+qKMjw1o6e8Po6RHg3BRBKp8v6Up2+o0WMlDkKeNeXS3
         IYZ6Mv2YMbCiv9Zy16llrapaoNoY9Bgbq+d9FDO6QwndVu3gqRBwGmKczjLNUT7gmebH
         3F0vMS9YmDyGTt75eZHKs8bs+MwPR13U9qSlLDgotfpb9+JD9PXc8f38iw8bDket56O4
         Ng2QAY4kgk6XUWzv93S4URW5GxGGuDhHnIKJytRMF5eVvx+671/UNbjVSLNrydbkMyOO
         WScN+hwW/sz9RetznBlGZ0gbknsauT+K+QQec+o+J97JTveYx8GbwoLTsH24tT7wMdq+
         gvaA==
X-Gm-Message-State: AOAM5308yMUv/QWEtDRptVYIVFXGyTvWD3yXsZ7a7cG7fPvHmrEE12JC
        ibQhCBua8Y/18KOBoff/STNKnvmpag==
X-Google-Smtp-Source: ABdhPJyptwoMjzrW0yFqTMlNFcyfZ+neI+EvoGA89Pkg+e3yVlVKSAjalGhlRDLZsfJdn1bfCbGwhw==
X-Received: by 2002:a05:6830:164e:: with SMTP id h14mr13986993otr.200.1617994305459;
        Fri, 09 Apr 2021 11:51:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y11sm650098oiv.19.2021.04.09.11.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:51:44 -0700 (PDT)
Received: (nullmailer pid 3951380 invoked by uid 1000);
        Fri, 09 Apr 2021 18:51:43 -0000
Date:   Fri, 9 Apr 2021 13:51:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        phone-devel@vger.kernel.org,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 3/3] dt-bindings: qcom: geni-se: document iommus
Message-ID: <20210409185143.GA3951334@robh.at.kernel.org>
References: <20210408161953.26298-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408161953.26298-4-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 08 Apr 2021 16:21:14 +0000, Caleb Connolly wrote:
> Document the iommus property for QCOM Geni SE.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
