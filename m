Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323C721E37A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 01:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgGMXGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 19:06:50 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36014 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgGMXGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 19:06:50 -0400
Received: by mail-io1-f65.google.com with SMTP id y2so15355341ioy.3;
        Mon, 13 Jul 2020 16:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Va+ZlTBy4NaES7hnZbyB0oId1/dEyB05Y7FSIQHACeA=;
        b=UBaAgcTjpngBbr6NuE80nlzznsoOye3wi6JMbHBUoe2M9/v8bWL4Amin3Xg8+8UK3C
         t0M3I9Us5PN3Idl78YraScvG0Xtt5uT26aBPb0tLgSnGK2V0RW1eHTrFdEY4we+MukNq
         h95FP/G34qpVP+KxQjc1fPhjDkdoKqqPN/o4uhAyhFdE5mlXyO7QMYu07x40Mm4i/1xS
         ctuLxNiWNvnYF5qN1jHuQxW5A84Fh4T3Lr83lXkTIfbmQhLmk92C5CGPw9zLorOOnmiG
         x3qxY66+uSLCf4VbShvPHBZo7GFavwM0h0xFAWFsJHXhfnz4U7NLqdKoYGZDUu/AXR0+
         +eow==
X-Gm-Message-State: AOAM531n4s74hneD9Jzxgb+s4kvR3A3v1Q6T4LUSnbESxidrCFoUAvEw
        t89f/UZ806nvHEQ7UNZSxWXSuF/Cjw==
X-Google-Smtp-Source: ABdhPJx65Nt7T7vwms3NZzxevOnmEr4AJl4CJB2QXdK6RatnZGsHBnnqfDAmqLi/7Gx6KXwzxW2Nkg==
X-Received: by 2002:a5d:8f04:: with SMTP id f4mr2129218iof.33.1594681609475;
        Mon, 13 Jul 2020 16:06:49 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w82sm9346931ili.42.2020.07.13.16.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 16:06:49 -0700 (PDT)
Received: (nullmailer pid 890897 invoked by uid 1000);
        Mon, 13 Jul 2020 23:06:47 -0000
Date:   Mon, 13 Jul 2020 17:06:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 08/14] dt-bindings: clock: add SM8250 QCOM Graphics
 clock bindings
Message-ID: <20200713230647.GA890821@bogus>
References: <20200709135251.643-1-jonathan@marek.ca>
 <20200709135251.643-9-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709135251.643-9-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 09 Jul 2020 09:52:39 -0400, Jonathan Marek wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SM8250 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.yaml |  4 ++-
>  include/dt-bindings/clock/qcom,gpucc-sm8250.h | 34 +++++++++++++++++++
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8250.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
