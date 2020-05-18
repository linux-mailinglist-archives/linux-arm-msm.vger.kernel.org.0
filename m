Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6439E1D7B2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 16:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgEROZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 10:25:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40979 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgEROZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 10:25:28 -0400
Received: by mail-io1-f67.google.com with SMTP id o5so10726187iow.8;
        Mon, 18 May 2020 07:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SZe4KkbwE56KDTMKfhIY8zuuqSvnZMQNRzwLYA4Q1D8=;
        b=IHluULF2U3tbPUVHWVz+g1iIY5h90IKnUbay/RXRajnTCsWp+FHuKwdPmgO50LlBcb
         PPAYKu8Pr+kqoBQ1Mdnj7qHf3zBLfe0KCr4D8j8xzqyd7xB5sttmWcA1wxFgqv5G9bga
         lAaniaAck8pAK9AmnrktpKtvWMWrMVm3G6gcKXiRIybUnCcf6CfYwGKuAD7kGKqQBB/h
         ID6fFZAm4UmEg5PwdoDwa27P28VnWtenlySISRjQlH6k5Cm3BzFZCivZENlJjHqAlU/k
         0COllF7Qbcsd2VcfUAkj22Az3mDIZg6vI1Wk4qMWqeC+ksBf+KWm9t1C4M8akC2nme3h
         5awQ==
X-Gm-Message-State: AOAM531JCwgdPSWTscoRfrQxKmpR8Dxw7HxpBY9WuJP5FrqmcD3PJcsH
        EbUnfhYuVQWDpqmSWl3A+Gy8YVI=
X-Google-Smtp-Source: ABdhPJyKv1wlOzsUmKiSN/1DWeAReVlpAMVDXgnN2mAfLRgIhbynvN1AQFddzQKeqdfbxgYbQj8RhA==
X-Received: by 2002:a05:6638:2144:: with SMTP id z4mr12789399jaj.35.1589811926731;
        Mon, 18 May 2020 07:25:26 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c13sm4894758ilu.81.2020.05.18.07.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:25:26 -0700 (PDT)
Received: (nullmailer pid 16096 invoked by uid 1000);
        Mon, 18 May 2020 14:25:25 -0000
Date:   Mon, 18 May 2020 08:25:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        shawn.guo@linaro.org, konradybcio@gmail.com,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        sboyd@kernel.org, devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, vincent.knecht@mailoo.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/2] clk: qcom: Add DT bindings for MSM8939 GCC
Message-ID: <20200518142525.GA15759@bogus>
References: <20200517131348.688405-1-bryan.odonoghue@linaro.org>
 <20200517131348.688405-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517131348.688405-2-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 17 May 2020 14:13:47 +0100, Bryan O'Donoghue wrote:
> Add compatible strings and the include files for the MSM8939 GCC.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Vincent Knecht <vincent.knecht@mailoo.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |   3 +
>  include/dt-bindings/clock/qcom,gcc-msm8939.h  | 206 ++++++++++++++++++
>  include/dt-bindings/reset/qcom,gcc-msm8939.h  | 110 ++++++++++
>  3 files changed, 319 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8939.h
>  create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8939.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
