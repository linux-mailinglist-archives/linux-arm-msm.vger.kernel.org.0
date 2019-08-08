Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42A1385996
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 07:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730857AbfHHFEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 01:04:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfHHFEi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 01:04:38 -0400
Received: from localhost (unknown [122.178.245.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D17982186A;
        Thu,  8 Aug 2019 05:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565240677;
        bh=ozcIJbl+NWkSQr0Fv1kCsDUIi7/9awTwtLTElkNIRlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ozQWwcEXnyq1hWSSBdDL6gWznalmQbwjTXnU57v6jCX+AoyvT4Grsit2LxXe5JGgi
         k428QzpJzeF6hH8UB3uKydPxry9FiwNJGQiqk9Ax855pM/jb1Ce9tWNtk4Q1tECjBj
         s4jZjGHsUvZI8PwHv+Cp2bZ8DPxLEUsiIrEIIsW8=
Date:   Thu, 8 Aug 2019 10:33:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v1 1/2] clk: qcom: Add DT bindings for SC7180 gcc clock
 controller
Message-ID: <20190808050326.GK12733@vkoul-mobl.Dlink>
References: <20190807181301.15326-1-tdas@codeaurora.org>
 <20190807181301.15326-2-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807181301.15326-2-tdas@codeaurora.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07-08-19, 23:43, Taniya Das wrote:
> Add compatible string and the include file for gcc clock
> controller for SC7180.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt    |   1 +
>  include/dt-bindings/clock/qcom,gcc-sc7180.h   | 155 ++++++++++++++++++
>  2 files changed, 156 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sc7180.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> index 8661c3cd3ccf..18d95467cb36 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -23,6 +23,7 @@ Required properties :
>  			"qcom,gcc-sdm630"
>  			"qcom,gcc-sdm660"
>  			"qcom,gcc-sdm845"
> +			"qcom,gcc-sc7180"

I don't see parent clocks listed here please add them as well

-- 
~Vinod
