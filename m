Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D504B27F930
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 07:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgJAF5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 01:57:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:47162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgJAF5v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 01:57:51 -0400
Received: from localhost (unknown [122.167.37.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 962BA221E7;
        Thu,  1 Oct 2020 05:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601531871;
        bh=5A8huyh7mO8Fn8+Q4eHC8D8rJLauCgOZRKgr5RgSKBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cwMK/g+47+vPzMx27wHKXrJ7Yoahweupywk4EhfyS8Cu38iop4tu4H+m0wxoJY9x4
         QzWHkupNrPjc9vHTDS48mdzBJo6+q1CZEWihvTj7iwjOtnX7CI7oXKPd2JRzHe3V25
         z8M2eEmIZutChuNvGxi2FNlVMs+DDgD8+y5zKuwk=
Date:   Thu, 1 Oct 2020 11:27:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: correct compatible for sm8250-mtp
Message-ID: <20201001055747.GR2968@vkoul-mobl>
References: <20200930112133.2091505-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930112133.2091505-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-09-20, 14:21, Dmitry Baryshkov wrote:
> Qualcomm boards should define two compatible strings: one for board,
> anoter one for SoC family. sm8250-mtp.dts lists just the board
> compatible, which makes it incompatible with qcom.yaml schema.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
