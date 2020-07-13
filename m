Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDCB21E375
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 01:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgGMXGg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 19:06:36 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:37549 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgGMXGf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 19:06:35 -0400
Received: by mail-il1-f196.google.com with SMTP id r12so12699004ilh.4;
        Mon, 13 Jul 2020 16:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kli/ERNjChHPAj39/TtpIETaZE6bm/hF+PLW7AJe0iM=;
        b=AACDXrBZtUA+AL82tytbscN1NUvuBo/h+DTAePsLW56xWkOM3QHXDtaojjjeqXBILu
         5B4yeMeRdqx352wW3f5zwk8Pk9Bvz08YFax299EK3CxOUs2U0W0cDXl4AJV+rOwmD+Gn
         C9BcHQlfZe0jf5iypFWNfb8msvqOpKmawDBT3mkq4iN+lM1rYKrQ469sQ8gYoJaNJiPI
         lMZ0Xf7CPe8u88mrqLBWNPi1VDEyK8/5vmO8YqO2HXctjDjdKm/vbpB6NxlaLd9a9h30
         gMr9g95PUMYOZAnxlVePzFtjHuZWXQ8VygnlPfyKvqrC5tSKgA7mzLa/t+VAi6uPKJpL
         q+HQ==
X-Gm-Message-State: AOAM532g5ZkKPpRgGqRYRXnZ3QueXIudT6qQhnff1NrkRN7e7/D4dTys
        9NtobdotYlaw2ka3uaWpHg==
X-Google-Smtp-Source: ABdhPJw6Tyw7LqZOCGy2V6k2TA6bmv7SMhqebB6kbj7uS544zJ58gv9zfsamtdIrmmU5ogHaHvCkAw==
X-Received: by 2002:a92:cc50:: with SMTP id t16mr2142111ilq.180.1594681594672;
        Mon, 13 Jul 2020 16:06:34 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r11sm8936009ilm.2.2020.07.13.16.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 16:06:34 -0700 (PDT)
Received: (nullmailer pid 890427 invoked by uid 1000);
        Mon, 13 Jul 2020 23:06:33 -0000
Date:   Mon, 13 Jul 2020 17:06:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 07/14] dt-bindings: clock: add SM8150 QCOM Graphics
 clock bindings
Message-ID: <20200713230633.GA890380@bogus>
References: <20200709135251.643-1-jonathan@marek.ca>
 <20200709135251.643-8-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709135251.643-8-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 09 Jul 2020 09:52:38 -0400, Jonathan Marek wrote:
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SM8150 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.yaml |  4 ++-
>  include/dt-bindings/clock/qcom,gpucc-sm8150.h | 33 +++++++++++++++++++
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8150.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
