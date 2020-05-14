Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88FF1D3173
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 15:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgENNim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 09:38:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:40876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgENNim (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 09:38:42 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF8D620727;
        Thu, 14 May 2020 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589463521;
        bh=oCiyfAOblzHW0ytZG2MkNHwN6/2lh218Rc+LQNbFmcE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i+PLqwwPI4ktAfo1L3d6+2uUeznHKOl7cteuuYpQhHKSDUSJLZ+xTAZUdhxN9Yize
         htkAg4iJ35zls2Dg8jIyn64i9JIh5NvvqTRYtI+R4CX4jytInuHjxUBDldS5jRT70J
         LcEtR/xJqeXv5oDWvUat2FHO40246Q01eSijY38U=
Date:   Thu, 14 May 2020 19:08:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: db820c: Fix invalid pm8994 supplies
Message-ID: <20200514133837.GR14092@vkoul-mobl>
References: <20200417070712.1376355-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417070712.1376355-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-04-20, 00:07, Bjorn Andersson wrote:
> It's uncertain where the "vreg_s8a_l3a_input" comes from, but the supply
> for VDD_L3_L11 on PM8994 should be VREG_S3A_1P3, so correct this - and
> drop the vreg_s8a_l3a_input.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
