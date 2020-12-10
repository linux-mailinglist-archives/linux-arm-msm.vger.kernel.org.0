Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A862D5258
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 05:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732178AbgLJEAW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 23:00:22 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37377 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732262AbgLJEAR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 23:00:17 -0500
Received: by mail-ot1-f66.google.com with SMTP id o11so3674863ote.4;
        Wed, 09 Dec 2020 20:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8M7aJ5igvgYdIoNgc/SliNnN8/fdWT13ds1iKAqo6cw=;
        b=WyogKliWh6OIr9VA2Jwzel6IziFGql2phLt10JYXgwWDPk/COx+PBIP0Kqj9xyVU+g
         R0sTyxIqP5PX+Ufo7WvW1Hme5sAn5wNxEl+xeUp3brIe/IWVeCBtPxNaW50qfTICV5bC
         /qrWiXHHRha6y22+He7wK1weUaMIX3sTawADDx5/W4C6Cr5wait7dk+VK5SU2d88iM7B
         PnVCE64rP/CMR7a04uqIlCW3pmL1eLR1w2zClAqRGfyfu8BBX45lAVu5kRArB94iVQL3
         +6PTDd2cy3zHj/70ovzVUFHDNszZz/E61R7IyAdKUQZBx3QePz660qqU+dANBQ1kFoKM
         pSnA==
X-Gm-Message-State: AOAM530LLyg8x4e/B5vl06djPp1o+U4Qp6C0A3YmiriaTqMg52KPmrWI
        piyya0qIAppKKd5m2WL4CQ==
X-Google-Smtp-Source: ABdhPJwTag3OSA02ALveC1Jz/T6KMXGEM/UkOQEuG8jiogJfZKvq+BsQn6SiiFmQf/H7imo+3u9/9A==
X-Received: by 2002:a9d:6642:: with SMTP id q2mr4485670otm.172.1607572777091;
        Wed, 09 Dec 2020 19:59:37 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t186sm762178oif.1.2020.12.09.19.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:59:36 -0800 (PST)
Received: (nullmailer pid 1638454 invoked by uid 1000);
        Thu, 10 Dec 2020 03:59:34 -0000
Date:   Wed, 9 Dec 2020 21:59:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add RPMHCC bindings for SM8350
Message-ID: <20201210035934.GA1638408@robh.at.kernel.org>
References: <20201208064702.3654324-1-vkoul@kernel.org>
 <20201208064702.3654324-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208064702.3654324-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 08 Dec 2020 12:16:58 +0530, Vinod Koul wrote:
> Add bindings and update documentation for clock rpmh driver on SM8350.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
