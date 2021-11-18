Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECC64553DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 05:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243004AbhKREmy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 23:42:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243000AbhKREmv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 23:42:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25E4961AA3;
        Thu, 18 Nov 2021 04:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637210391;
        bh=LioqCQ0xKHYXHuZv5+1MHZ/IRhPtARPLj7yuDc0eejo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mrqd8Ca4S56g946fTwukJREremblWMdKxSLbSLjUdOuziltXDKWuYACyK+vjxEeDe
         qx1GQg0Ymfoc/aILSoWP96w5L1UDq3gjwWfkyWNA3+4jMJHJLC2Cmho0H7ZhRLPynA
         iphc0OJaRZe/8pstlUWzQUnupEJI8y7xDp8FhCxasYUU7bOszRIQ294Z3Tvj1Se5Gu
         ZuZdJqjN1evNMfSfV+Nqtzk9J1u8RkDnocaYCRqx51ZDZCg2ddEDGsXX1NOdo/ePrA
         UYttz03ipIgsubskvVyDvvqX4lgC9qLLEuLcla26bHw4woCBQA9BSByBNWMuK5pTkX
         wSmFGBQ07KjWw==
Date:   Thu, 18 Nov 2021 10:09:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/6] clk: qcom: Add SDX65 GCC support
Message-ID: <YZXZEhV6Jp3LOjmH@matsya>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
 <b61d16ad890bcf07057f8fbd83dfffaf9812cda6.1637047731.git.quic_vamslank@quicinc.com>
 <YZNsvjwp0/AX0Hdo@matsya>
 <20211118015117.GA18984@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118015117.GA18984@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-11-21, 17:51, Vamsi Krishna Lanka wrote:
> On Tue, Nov 16, 2021 at 02:03:02PM +0530, Vinod Koul wrote:
> > On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> > > From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > > 
> > > Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.
> > > 
> > > Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > Missing support reported ??
> 
> Not mising support but it reported to delete unused varaibles and after
> the fix mentioned to add the reported tag.

I think it does not make sense here, you may add a note in changelog
that you fixed issues reported by kbot

-- 
~Vinod
