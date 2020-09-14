Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C17269755
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 23:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgINVDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 17:03:05 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:32795 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgINVDB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 17:03:01 -0400
Received: by mail-io1-f68.google.com with SMTP id r25so1734861ioj.0;
        Mon, 14 Sep 2020 14:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nVVvTYFE+La7kMkXOKY+IQJW6cjOKJQVHJqDw09seYs=;
        b=gbJO2tFWFBIPnaC5onPqn7MUZ1A7OhzBtdSMuy/sk21w1tdGRuVflRrFMmsXi9NjAH
         Nw7QEOifjoOrDeC15V8jDwHVgJNvABL8bgnjDzDWc7VNh9qpKcYA61ICJD7jVnRxEMtV
         OANxKevpHxvgCV+OlTP89ohph4KcZWo3pHFkGeX6IRZ2SOOP6keAvqYxuNJ/WO+0x9UP
         ao4aLBQ/7W+BsUSajcRZ8fxYpO5DOdqg1kKO0sncLCx0wxGNKUuEqMHphlrEZWIsnw9O
         jEajhPwpfPDzTB5VITUP9q3PA7RZnyjqP67XiTdQIQpEgn++zKe3Zcu1di3URAc/9XZY
         fWSA==
X-Gm-Message-State: AOAM531lV/9NzgwPzThuYliWpfDh+H/9VQgggS4uU8CpByq5NrNP384M
        2bxd/cwn+HzBCg8asDwg7WdnLlteY3Hv
X-Google-Smtp-Source: ABdhPJy8Y34oCjguPgqD2iCf+02caDBnmUDxQlcxXrhwjgKrTU3dChrL/Z2JBz1VL/AsQbo2HBsPTg==
X-Received: by 2002:a02:9086:: with SMTP id x6mr15497408jaf.126.1600117380716;
        Mon, 14 Sep 2020 14:03:00 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id u89sm7927149ili.63.2020.09.14.14.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 14:03:00 -0700 (PDT)
Received: (nullmailer pid 243108 invoked by uid 1000);
        Mon, 14 Sep 2020 21:02:59 -0000
Date:   Mon, 14 Sep 2020 15:02:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: add SM8150 QCOM video clock
 bindings
Message-ID: <20200914210259.GA243048@bogus>
References: <20200904030958.13325-1-jonathan@marek.ca>
 <20200904030958.13325-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904030958.13325-3-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 03 Sep 2020 23:09:51 -0400, Jonathan Marek wrote:
> Add device tree bindings for video clock controller for SM8150 SoCs.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,videocc.yaml          |  4 ++-
>  .../dt-bindings/clock/qcom,videocc-sm8150.h   | 25 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8150.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
