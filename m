Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E3C1D31A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 15:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgENNpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 09:45:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgENNpq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 09:45:46 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8203920727;
        Thu, 14 May 2020 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589463946;
        bh=dgB3erlnMsKKlBRi9JYD4MLepXgCEwkoJfddRxExqm8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CCrwM8o+t+1VFNrNGslEuyxYPgw6MKPdEw2P9i2L2bMAOidiIHVdvu3oYI2pvB2og
         MJ7ruoZRZClacV0/dkL/GgSKq6H7ICU+tTQR8nG8ORhlSO9jNUOyJ0VdErGTZasSV3
         zHMzP3JiQ3OXypQiecxZ9WHyh2/UXCtmM0chEF5w=
Date:   Thu, 14 May 2020 19:15:42 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add SM8250 PAS remoteprocs
Message-ID: <20200514134542.GV14092@vkoul-mobl>
References: <20200430180051.3795305-1-bjorn.andersson@linaro.org>
 <20200430180051.3795305-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430180051.3795305-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-20, 11:00, Bjorn Andersson wrote:
> Add audio, compute and sensor DSP compatibles to the Qualcomm PAS
> binding and driver.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
