Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875E8302EDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 23:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731913AbhAYWU6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 17:20:58 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:33590 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbhAYWUx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 17:20:53 -0500
Received: by mail-ot1-f53.google.com with SMTP id 63so14398577oty.0;
        Mon, 25 Jan 2021 14:20:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uplWkfnTam5OjJvdb2HcCcJMQEJoRuwpDiPnhTpP3sc=;
        b=kHvebegCzUjniiX0Bj7dvOb7hdP9+chXAT6JAwPlq3SeVc5PdkSiM5FO7pjZxgad6o
         qDNFyIi/sTV7PAK034j5ECY2I/4MB81SKWashh/yYChtqO0C2M6FnMLvnUmzVOUD5iae
         gVhKWMFG87KyyeJqW9a42HPmSMIayZRRS2L4f5agI4FTSQd+RiMfPHakc8tIbRgEaQSV
         ELZPixr8MNyknUALuCTRoPOryqcDiItnD+Gvc8zdjO7pxDm/sez9GH+dvUT1PGrHmXhl
         pKYvD8W3vZaJgBhlz/gE5D6fWvcMt+YWVSW2rt322u3bPvr4xBIfXgScEv2il4qEAnBT
         9jSQ==
X-Gm-Message-State: AOAM530DJd+S2uwCGzDmz53kFi4WDJGi2pRsHOnr02ZvEuZK32zr9kjc
        0ELjwOdkiAyw04BY+KV1fQ==
X-Google-Smtp-Source: ABdhPJzdBYWX1WT5eudyfoV1HkpOtgHptjKRGwvL023nL0USYfcDpqQifwz8MHbTG1kxWVIyCVy02w==
X-Received: by 2002:a9d:66c1:: with SMTP id t1mr1915367otm.106.1611613212890;
        Mon, 25 Jan 2021 14:20:12 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h127sm3779037oia.28.2021.01.25.14.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:20:11 -0800 (PST)
Received: (nullmailer pid 1124770 invoked by uid 1000);
        Mon, 25 Jan 2021 22:20:10 -0000
Date:   Mon, 25 Jan 2021 16:20:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: qcom,pdc: Add compatible for SM8350
Message-ID: <20210125222010.GA1124707@robh.at.kernel.org>
References: <20210115090941.2289416-1-vkoul@kernel.org>
 <20210115090941.2289416-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115090941.2289416-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 15 Jan 2021 14:39:41 +0530, Vinod Koul wrote:
> Add the compatible string for SM8350 SoC from Qualcomm.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
