Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8546B292F3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbgJSURx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:17:53 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:34360 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgJSURw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:17:52 -0400
Received: by mail-oo1-f66.google.com with SMTP id f1so242440oov.1;
        Mon, 19 Oct 2020 13:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uChIWQxjMYXmjvNvbHaoJDeBI0DP85aT+vfNSzhRd3U=;
        b=Gc8yw79d6Ie8c7WjkrEpwJ7zWBydyzStJz3kqKq7LUSDb681PPSeap6EXs7O4VgPcL
         fntO87XNZ1yv5n5F2Z+o8Sve8DPnPkBCWInPpubCCF1kB3YlRRYlBqbkH3kznBjPQ+gk
         2mS8nfVfNXLxogniVkK+btNqMHBPqsFFlaeZdyk7astm/9Ka9VR71yR049oafkSS7lOB
         vXFs3E9SLoxyNpMLBhfc5UFnWB76UXz3vO8RGsPQpCFCOIBr1riPNQ3UJ1iO7E71k3m5
         5NiPQTCjDTaCGYE2zuwKtZ7KbA8HCtHNSwSPZIeR9ffA3jG6ahP4W44EjjM2pzrcoWMp
         iwYQ==
X-Gm-Message-State: AOAM533Ew2vw/J69jDK/nomJBbCK5Yt7QlukSEeI0SV62Xqujrm/Mn9i
        BngiBdbpQJpRTX6Wnu2Lrw==
X-Google-Smtp-Source: ABdhPJyxpNT6cyYEfEkVnYbMj7VoQITTsIHA4p2FMo9vrnSTYCCGDn9wXtELjXyX+YbAoLSPDay+wA==
X-Received: by 2002:a4a:890c:: with SMTP id f12mr1203831ooi.48.1603138671715;
        Mon, 19 Oct 2020 13:17:51 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 105sm187496otf.52.2020.10.19.13.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:17:50 -0700 (PDT)
Received: (nullmailer pid 3536422 invoked by uid 1000);
        Mon, 19 Oct 2020 20:17:50 -0000
Date:   Mon, 19 Oct 2020 15:17:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org,
        David Brown <david.brown@linaro.org>,
        linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: clock: Add YAML schemas for the QCOM
 Camera clock bindings.
Message-ID: <20201019201750.GA3536237@bogus>
References: <1602873815-1677-1-git-send-email-tdas@codeaurora.org>
 <1602873815-1677-4-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602873815-1677-4-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 17 Oct 2020 00:13:34 +0530, Taniya Das wrote:
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
