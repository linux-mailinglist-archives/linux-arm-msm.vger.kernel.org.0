Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB6B154D44
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 21:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgBFUqN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 15:46:13 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43541 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgBFUqM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 15:46:12 -0500
Received: by mail-pg1-f196.google.com with SMTP id u131so3333318pgc.10;
        Thu, 06 Feb 2020 12:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zUJVXEe9nmb8lzTi4rWGnunn6uT7SLbqo7l18w5TMkM=;
        b=WuqzAx4IQ2bRl4/nWYyFkvAiATskqse55LaTeb1APvx+wWXd8kE6Ib3cdOEjXujLfR
         b28yo6DDN2s5zYUWqLbTrn1UEiqiwNrQfukIPMqNOGfoOK2xyHhTly2MXGs+Bs4i9MtR
         i3Fq1BhDz347+78R7RdW9gDseZLKa/180qz9vREqVtbDNYoOgF5BbWHeHHMloOAu9HCY
         HbqKS2dHeoUzw1n2CLDru3A/XfDbgXHzfF+d52Xj5K0ZH3qX2iWTxGJb/CYjLRRrygi8
         crC93/AXpEgcZUrFyNe4MeE0w0nVEWwqbrfyGEMwAgdcNWsO19lrAbHEmSuA6S9jNYXW
         ++5A==
X-Gm-Message-State: APjAAAVHduqLx+BoVuSJaTqGC0dUGMSKeR+WV4MwuwvCBs9VsFEh7fe5
        6FNjZDWrfRmT+QKGFQqcNw==
X-Google-Smtp-Source: APXvYqwPyQbSQo7BMvabDsbXOSck7ihIN04c3RRAFzLU27liOcRjuh4U6Ul11wxJFT9owm46O1L3Mw==
X-Received: by 2002:a63:e04a:: with SMTP id n10mr5591161pgj.341.1581021970134;
        Thu, 06 Feb 2020 12:46:10 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id v10sm292858pgk.24.2020.02.06.12.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:46:09 -0800 (PST)
Received: (nullmailer pid 11196 invoked by uid 1000);
        Thu, 06 Feb 2020 18:39:05 -0000
Date:   Thu, 6 Feb 2020 18:39:05 +0000
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 1/2] dt-bindings: watchdog: Convert QCOM watchdog timer
 bindings to YAML
Message-ID: <20200206183905.GA11134@bogus>
References: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org>
 <2edca4b54ee6b33493e0427c17de983d3ce3012f.1580570160.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2edca4b54ee6b33493e0427c17de983d3ce3012f.1580570160.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat,  1 Feb 2020 20:59:48 +0530, Sai Prakash Ranjan wrote:
> Convert QCOM watchdog timer bindings to DT schema format using
> json-schema.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 ------------
>  .../bindings/watchdog/qcom-wdt.yaml           | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
