Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9DF975A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 11:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfHUJHC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 05:07:02 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44316 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfHUJHB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 05:07:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id e24so1397156ljg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2019 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l1PSwAxURmvRpKju1nSZAkhT1kqhpgoMPnKulqMvgaU=;
        b=ldPZ7n1YKnH6urIqEpjgNnB9Yz6A9hu7oUFsROK9+okfYJw31JxfVGrlYrO5EEIfCa
         UohvmNFqTTgOLenwL/KxMl7/Zkm/+uZ0ss3xAZ1mzFZ5idRlcs8PF1Qr6pzRg3CD9q4+
         l46lL0b/b1pbZ0jbxHflmKmNI0MMX0qMkfLrLMxBsk6M/7ofuixSCG/PFt7ypxfXC9nj
         FkTGzf2aPo1ZSbBa4MmUkRTkRRMQJHl0kTiF2QbKQJcNlzvxx2EqKkjBzJwz6oWRJAOt
         /yTUYrTgFGrn1tQ4+9dsq6A0UwFDdkHe97QTPZTdeyNhtrS4o+QWZqKZprCNEsOVodPd
         5Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l1PSwAxURmvRpKju1nSZAkhT1kqhpgoMPnKulqMvgaU=;
        b=HiM0LXCsUbRD1mQaIgn3o2vPcv8wuU9ULPQDp8l3glVBZ1vDIFG5f0E8PJco8uzKPT
         XO1gwK8qoziGOdbutIo0bPeKnjSVUOoojrbojwo95rkIFdOU11Qt+STFTRtgEDlQ6pkH
         yITBiopGQf+YC7Z1RuOkQ1kdTXvs4o9w4qpNAgUDARZvwvlJlQkHD9retX6V3bcotTxl
         yabMi+3xruu60UU3yoXCv+r8J4XUEE9uYIcl7lI3x5gxikYwRIoA9mTJL+mcZ7zd2uIB
         K2ntLr6B7eyIHDc36YpvN30O5owTVKCTIxRTvr0qJ/GVCP1EhBzEey21tiHp4qpRO2LH
         XCDg==
X-Gm-Message-State: APjAAAW4hmZP8x9gzSBWR6WL7RSUdfHpTpOq0bJr3r7IPV02VeaLEvvG
        WrTONCeA/+aGiC2O88xnn21/GQ==
X-Google-Smtp-Source: APXvYqzG9CVLKmNl0LbqKy5+pIULi7I5nAFbvEiaeMSL2RErmaHBoXceiFNSGmwFYhOr2oazUpYPEA==
X-Received: by 2002:a2e:b00b:: with SMTP id y11mr18017045ljk.159.1566378419968;
        Wed, 21 Aug 2019 02:06:59 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id 202sm3182448ljf.102.2019.08.21.02.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 02:06:59 -0700 (PDT)
Date:   Wed, 21 Aug 2019 11:06:57 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] arm64: dts: qcom: sm8150: Add SM8150 DTS
Message-ID: <20190821090657.GA560@centauri>
References: <20190820172351.24145-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820172351.24145-1-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 20, 2019 at 10:53:42PM +0530, Vinod Koul wrote:
> This series adds DTS for SM8150, PMIC PM8150, PM8150B, PM8150L and
> the MTP for SM8150.
> 
> Changes in v3:
>  - Fix copyright comment style to Linux kernel style
>  - Make property values all hex or decimal
>  - Fix patch titles and logs and make them consistent
>  - Fix line breaks
> 
> Changes in v2:
>  - Squash patches
>  - Fix comments given by Stephen namely, lowercase for hext numbers,
>    making rpmhcc have xo_board as parent, rename pon controller to
>    power-on controller, make pmic nodes as disabled etc.
>  - removed the dependency on clk defines and use raw numbers
> 
> 
> Vinod Koul (8):
>   arm64: dts: qcom: sm8150: Add base dts file
>   arm64: dts: qcom: pm8150: Add base dts file
>   arm64: dts: qcom: pm8150b: Add base dts file
>   arm64: dts: qcom: pm8150l: Add base dts file
>   arm64: dts: qcom: sm8150-mtp: Add base dts file
>   arm64: dts: qcom: sm8150-mtp: Add regulators
>   arm64: dts: qcom: sm8150: Add reserved-memory regions
>   arm64: dts: qcom: sm8150: Add apps shared nodes
> 
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/pm8150.dtsi    |  97 +++++
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi   |  86 +++++
>  arch/arm64/boot/dts/qcom/pm8150l.dtsi   |  80 ++++
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 378 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 481 ++++++++++++++++++++++++
>  6 files changed, 1123 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150b.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150l.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150.dtsi
> 
> -- 
> 2.20.1
> 

Whole series is:

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
