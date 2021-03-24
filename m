Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D943347EE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 18:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236446AbhCXRKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 13:10:10 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:37492 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237244AbhCXRJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 13:09:00 -0400
Received: by mail-il1-f179.google.com with SMTP id z9so22028638ilb.4;
        Wed, 24 Mar 2021 10:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t5QlIofBT3IA5excy3udA7XEAyczBGmnESa+x6UIryc=;
        b=elcYo2WtqJYSBzKYx+WUFOhUVLDogT+kqsAXlM6/KTZtBOahE3FMvN0eGFAdLMLfpd
         +bxM4T0y/jdOGSWu8vDcxPVIdG4BsmJPEC5fhOYaPLCmtzFTOKGkZoVIAS/7O6GOD8B2
         DuKJ3R5oThXCPBRfpGNAXOMkWZKaKNBNP6bTPpWlrcUkxw7eflS91y1dTbX0OOJupIhw
         7w2hDuk9FnTl4L91Aq5vOOKcb0CVLNP7NXyJJ5dHz/ttcQt6qvXFFlxK7ijiwnBEQP09
         hbnvdh3sy7gPH9fsGymyvVBiUa3ykRfeZXDgDKCpKnJLpFe8rMnkA8hO7/RGqifggQKP
         Q+cA==
X-Gm-Message-State: AOAM531mZWh8a4VadfBeEMuCJrFcmJHiMMMXUDuAm15LUJVS9vI/rE03
        wB6UwhUmp9FTolPpwynwffusHfEAGQ==
X-Google-Smtp-Source: ABdhPJwp4OYrDLyBQl+w9gceAyQdazHzh08A0HI5YhhfcX99A1SCgubvR3ehOHGKr4bhxf7vMkCMXQ==
X-Received: by 2002:a92:cd8b:: with SMTP id r11mr3410755ilb.186.1616605739907;
        Wed, 24 Mar 2021 10:08:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j17sm1346015iok.37.2021.03.24.10.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:08:58 -0700 (PDT)
Received: (nullmailer pid 3258475 invoked by uid 1000);
        Wed, 24 Mar 2021 17:08:55 -0000
Date:   Wed, 24 Mar 2021 11:08:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.botka@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        angelogioacchino.delregno@somainline.org,
        Taniya Das <tdas@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        marijn.suijten@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add MDM9607 GCC clock bindings
Message-ID: <20210324170855.GA3258412@robh.at.kernel.org>
References: <20210313020310.386152-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313020310.386152-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 13 Mar 2021 03:03:07 +0100, Konrad Dybcio wrote:
> Add device tree bindings for global clock controller on MDM9607 SoC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |   2 +
>  include/dt-bindings/clock/qcom,gcc-mdm9607.h  | 104 ++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-mdm9607.h
> 

Acked-by: Rob Herring <robh@kernel.org>
