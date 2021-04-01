Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4530351EB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236689AbhDASpf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 14:45:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:35186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235833AbhDASnC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 14:43:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31BAD61057;
        Thu,  1 Apr 2021 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617276368;
        bh=DZtpyvHXpVi2pt1q3rpX2KIo1DlsUqHd9cfU9ju5aLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TJgol6xDOp2kWukcJVNgzdNy02Mb1me3Q9AoQw0zipbkoJHAgbmD83E5kZDievNIW
         DaTvsh9AL9MomMkT57oq6/rAjhIatkozsoD0GIdrFcw5t6Vu0cp+DrRoWK6OXDNadR
         I4ji7WthBV4JaWR1LxTsLu8QQN1q0ntcv0rzqVGJXV22ra65rPwy3o4FlFX03FaeZJ
         D+4sTL8i7wRKMhKRs+asZT7aDe2VTL6fA1kamIh5S7aU1H2POuQh75MquqRerP4ZJ0
         CwgqwCkg3d9ShEzj5AFtMWDIhDRI4EJDR86cYYfVZlcUeamgHji1pKLUJAMvIFiQXW
         4Qgu9O6A4xOJA==
Date:   Thu, 1 Apr 2021 16:56:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8350: Add support for PRNG EE
Message-ID: <YGWty2mTY2dNyIMD@vkoul-mobl.Dlink>
References: <20210401101536.1014560-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401101536.1014560-1-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-04-21, 12:15, Robert Foss wrote:
> RNG (Random Number Generator) in SM8350 features PRNG EE (Execution
> Environment), hence add devicetree support for it.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
