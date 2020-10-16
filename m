Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BDC290AA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 19:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390222AbgJPRZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 13:25:57 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41952 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732379AbgJPRZ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 13:25:57 -0400
Received: by mail-ot1-f66.google.com with SMTP id n15so3074669otl.8;
        Fri, 16 Oct 2020 10:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DA94m8kt2TR3VyrgchuAUU6rzY+KQtZ6JM68Rr3FVA0=;
        b=Kh2bCuLGSi/oQ5VKFlUtFPjmc9KdX+dIHS1N9jyk03SwcKx1E9jSj5Bo/P2WOUIKJ2
         Wh3C95ohPQXub9Tnx9U9bOA4prnPL/QoOyYgamszyD5hHMrTHwjkcSV3mG+E1PwVLAyx
         2kGK0UrpPcuaCS5on8WfnYm9kCnz58F0pq7zKRusfvSw8n4e41PkldpiJkHBshHYHufb
         PhlJD0M7uDDVv5918uqw5+fDFcKRub+kMoABpiVGd6QTcAJgKgjTn9SYap4sxcISet97
         xtgW7nAVjQvIfp1EMR3c02lEPrHZNf3dy3Oc/Hc8Kwb350EAu+lKPt3VZftGTO3NKMhW
         mKnA==
X-Gm-Message-State: AOAM533jksdB65ngtfsuzU4qkfX9okn1iN+j9z0/PCGSxIJQcd4isyhv
        r3URa5KSSBVAku2DZEYjlA==
X-Google-Smtp-Source: ABdhPJxO8CIfscEM6KLD9vmTBZG8pb+ZgU8lhRYrLMMyjjsl3Pl6OiFzFRDl09ih+v6CMRGMnVqAVg==
X-Received: by 2002:a9d:2f69:: with SMTP id h96mr3262305otb.62.1602869154478;
        Fri, 16 Oct 2020 10:25:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 105sm1134203otf.52.2020.10.16.10.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 10:25:53 -0700 (PDT)
Received: (nullmailer pid 1608974 invoked by uid 1000);
        Fri, 16 Oct 2020 17:25:52 -0000
Date:   Fri, 16 Oct 2020 12:25:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     robh+dt@kernel.org, Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: Add YAML schemas for the QCOM
 Camera clock bindings.
Message-ID: <20201016172552.GA1608922@bogus>
References: <1602609110-11504-1-git-send-email-tdas@codeaurora.org>
 <1602609110-11504-3-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602609110-11504-3-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 13 Oct 2020 22:41:49 +0530, Taniya Das wrote:
> The Camera Subsystem clock provider have a bunch of generic properties
> that are needed in a device tree. Add a YAML schemas for those.
> 
> Add clock ids for camera clocks which are required to bring the camera
> subsystem out of reset.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7180-camcc.yaml          |  73 +++++++++++++
>  include/dt-bindings/clock/qcom,camcc-sc7180.h      | 121 +++++++++++++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,camcc-sc7180.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
