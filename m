Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83B81D37AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 19:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgENRMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 13:12:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726032AbgENRMv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 13:12:51 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CE0C2065D;
        Thu, 14 May 2020 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589476371;
        bh=Z3p3h1N/BubQRakbv/vf4PelC3tt6O0uXYZd9qIxMfs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xvoGBh7goOKjA/rgK81u0Yc2kSS6wRzDSZBFBvbTSFllxpAFOxOeYKYzafmHbLDvA
         5iGCRN8kzkfwHwPlGWGzCfeoI8skn5OJ5rDDol+HZ8Qc2AhWrfecjTX6APIeZ/zKin
         ihYn9i9saWcHm5azBprEL8m6xfsLhcOiJ9S0Nbo4=
Date:   Thu, 14 May 2020 22:42:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: c630: Specify UFS device reset
Message-ID: <20200514171240.GC14092@vkoul-mobl>
References: <20200406060049.227029-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406060049.227029-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-04-20, 23:00, Bjorn Andersson wrote:
> On some device the reset line for the UFS memory needs to be tickled in
> order for UFS to initialize properly, add this to the ufs_mem_hc node.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
