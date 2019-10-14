Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 081ABD67B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2019 18:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388239AbfJNQue (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Oct 2019 12:50:34 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37676 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730192AbfJNQud (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Oct 2019 12:50:33 -0400
Received: by mail-ot1-f67.google.com with SMTP id k32so14372927otc.4;
        Mon, 14 Oct 2019 09:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u73GdQ2NeXgwoifIBxxjF/dVKgD9qkpO8Mhoo1TliII=;
        b=nFSiqPUfAENj+PMgjl/CFLLcP4cprfswuxulDU3mC+OxEjpQli9X4mo4VUrJvcmA7/
         CbhvjxeYaZqcn3GVB9gPfKKRgAFEffmfvA8eC9D26tYehtI/qoC2+bW5whcbt/6j0LWH
         Kzp6qJF2HT6sWuc2f/CIgZmnxmmU5lIHKD0hLnLEmoDyBnu/Hdeu9kupBQOEjzi4foUG
         7uqNCGnf+XJyB5ryvIDvMdfR1IoncpS7gYASzHFncwE6wxy9NgW4m+UkNCOjjV3D1aDW
         PyeCP/M+JK/yGGrrO39zsD5t5rgxBAH+g0tT8pu7Wr2CVZcb/jOum74YlVqAoNN//kxh
         u/eA==
X-Gm-Message-State: APjAAAVKyNJjMxxrhpLKGpLjS/P+Lp0YXcudLwTC9AptgvrvzROo3ffh
        gv9uNO8DrWRt/zwqxgEpDA==
X-Google-Smtp-Source: APXvYqxvRt58KnjLizEjrt5U3N72GR4Jk1juC+HoJ6underOBPtaEVHnJGDwXyIWm+a6vNM/NaOCpA==
X-Received: by 2002:a05:6830:1693:: with SMTP id k19mr2225402otr.233.1571071831337;
        Mon, 14 Oct 2019 09:50:31 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h5sm5847055oth.29.2019.10.14.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 09:50:30 -0700 (PDT)
Date:   Mon, 14 Oct 2019 11:50:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: clock: Introduce QCOM GCC clock
 bindings
Message-ID: <20191014165030.GA22526@bogus>
References: <20191014102308.27441-1-tdas@codeaurora.org>
 <20191014102308.27441-5-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014102308.27441-5-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Oct 2019 15:53:07 +0530, Taniya Das wrote:
> Add device tree bindings for Global clock subsystem clock
> controller for Qualcomm Technology Inc's SC7180 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |  14 ++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h   | 155 ++++++++++++++++++
>  2 files changed, 169 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sc7180.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
