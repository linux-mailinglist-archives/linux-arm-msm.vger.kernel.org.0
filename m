Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252382F423D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 04:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbhAMDEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 22:04:53 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:38275 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728722AbhAMDEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 22:04:53 -0500
Received: by mail-oi1-f176.google.com with SMTP id x13so644328oic.5;
        Tue, 12 Jan 2021 19:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cpiu9m+TCpQtSztTuCtXfLfCd/yaMGYzPysLOSNolt8=;
        b=eap0R17hifdSw7lsvliLVoWVLO4YAK6AhgKeBUjc5c1gzIFfaOL8ZiBkzTfcivYIfz
         418FIZSP8TUx7z5DdjVPepj4ViV/8or0vKay06LTL2+oeXt2Ma4peQhyFDNsLSTbUrTl
         WT57VPcLE08XJzU4Iy8nwCNRwJP8mgj2NKGJNEjvNgmKbgAzZWBYVt/lMZhx3Flh5h9J
         TSeUCKGqowNOoJK/YyhnoW42jSdsxsRjpQeuiYQ0grjGElJeKCVNIjr4VyUeLouWYpXG
         l3OmeO+b1YST4SIUa20flcHON7d1O20r6Kp+XfjFXrN2O4hfRPS5NL52inRKAdS1v3Bo
         h7aQ==
X-Gm-Message-State: AOAM532WEXJ5Csf3PiWRN8GE1xGrEawEdUQ3fdqHcpMlJUI3zQecYBkv
        JbLhuIg2+g3FCED2WEEMzA==
X-Google-Smtp-Source: ABdhPJzpdekEcJU1YI4ImheDxEdc0Sl/eS68G0A6S2+Xtc2sC7L8KRd/lYjqVMZqw4+h0+RlwJMYow==
X-Received: by 2002:aca:bac3:: with SMTP id k186mr75699oif.93.1610507052892;
        Tue, 12 Jan 2021 19:04:12 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g200sm164542oib.19.2021.01.12.19.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 19:04:12 -0800 (PST)
Received: (nullmailer pid 1442971 invoked by uid 1000);
        Wed, 13 Jan 2021 03:04:10 -0000
Date:   Tue, 12 Jan 2021 21:04:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        phone-devel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: qcom,wcnss-pil: Add
 qcom,wcn3660b compatible
Message-ID: <20210113030410.GA1442924@robh.at.kernel.org>
References: <20210106102134.59801-1-stephan@gerhold.net>
 <20210106102134.59801-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106102134.59801-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 06 Jan 2021 11:21:32 +0100, Stephan Gerhold wrote:
> WCN3660B is a variant of WCN3660, but with the same regulator
> requirements as WCN3620/WCN3680. Add a new qcom,wcn3660b compatible
> to describe it from device trees.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
