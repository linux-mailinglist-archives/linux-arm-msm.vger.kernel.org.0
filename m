Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8EA3142ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 23:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhBHW0o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 17:26:44 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:33775 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbhBHW0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 17:26:33 -0500
Received: by mail-ot1-f41.google.com with SMTP id 63so15762514oty.0;
        Mon, 08 Feb 2021 14:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kh9RGgZ45b5kiJaR4z4rS3mlYOuamXJhOp4ZL8uAS+A=;
        b=EVJhTwlSzwyWFKBQeZVj8xuxoGiD67kwP1V8ZhikZUzo72LUaBuJH72eMenF1FDxQL
         aSEeGTns5iYuOAoXgtUZlI7B+bIB4gV2gJO7/tqNQH/s4gc/gHPnNmoo/GXjBiPDh4f8
         LjO4TDcTc3OMfa8LkwOADWuNT/qXkZ5fyFZZUZHfACBMN3HaSz27VrEAEotmLUvZ0fkX
         W8ptmIBfsyqryaLGoX96YMQkrW5QHrLyGciGVVafAG1aeaIiVVEtrkXNG+RtMJH/E5oh
         XGUbBfzJPJGyBJVUdvE5e5MgShidRnd9u1v3y2rbyRp3lsT6rgSeBaW43rV5HKuIn0eb
         ExWw==
X-Gm-Message-State: AOAM531NHftjTBOteV2NY1OV+Z19gbukP2usSKDQxQtABvfMMzt35mQg
        ZhscRjUZsLZog6vnQEeh9A==
X-Google-Smtp-Source: ABdhPJxiRJLkH/WYHuQA35T5qfrGYv/IC7laaYtUp4bAkP7Flq5n7+3M1iNuLrGn/ZDO9vQqK9XaTg==
X-Received: by 2002:a9d:7cc4:: with SMTP id r4mr4514424otn.307.1612823152040;
        Mon, 08 Feb 2021 14:25:52 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x31sm3964810otb.4.2021.02.08.14.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 14:25:51 -0800 (PST)
Received: (nullmailer pid 2142532 invoked by uid 1000);
        Mon, 08 Feb 2021 22:25:50 -0000
Date:   Mon, 8 Feb 2021 16:25:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mturquette@baylibre.com, agross@kernel.org,
        bjorn.andersson@linaro.org, viresh.kumar@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-clk@vger.kernel.org,
        sboyd@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: mailbox: Add binding for SDX55 APCS
Message-ID: <20210208222549.GA2142379@robh.at.kernel.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
 <20210118041156.50016-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118041156.50016-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Jan 2021 09:41:52 +0530, Manivannan Sadhasivam wrote:
> Add devicetree YAML binding for SDX55 APCS GCC block. The APCS block
> acts as the mailbox controller and also provides a clock output and
> takes 3 clock sources (pll, aux, ref) as input.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../mailbox/qcom,apcs-kpss-global.yaml        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
