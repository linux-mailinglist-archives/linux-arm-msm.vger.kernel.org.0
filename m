Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF2C95F0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 14:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfHTMkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 08:40:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:40634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbfHTMkx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 08:40:53 -0400
Received: from localhost (unknown [106.201.62.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D12E422DA7;
        Tue, 20 Aug 2019 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566304852;
        bh=rZovJs9M4Z11CnFSJu7eJdEiKkqqrPzHlgsZrGhB4TU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2R1qDq1XybNp8OvdvTkmE4pFXbBdn81r8xa0dUtkzBrEdLZTAH2bG4J1pTh8cKeW7
         7ilXyHOzBo9XKTvQWrdBtAgoh834eVYj71+gKgjSg7WEDXcOVlr21RNSzrUUdbNxHE
         kVI+yn43709eR68aCvLtihbyuB3yFaLuukTBfDVM=
Date:   Tue, 20 Aug 2019 18:09:41 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: sm8150: Add SM8150 DTS
Message-ID: <20190820123941.GE12733@vkoul-mobl.Dlink>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820122809.GF31261@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820122809.GF31261@centauri>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-08-19, 14:28, Niklas Cassel wrote:
> On Tue, Aug 20, 2019 at 12:12:08PM +0530, Vinod Koul wrote:
> > This series adds DTS for SM8150, PMIC PM8150, PM8150B, PM8150L and
> > the MTP for SM8150.
> > 
> > Changes in v2:
> >  - Squash patches
> >  - Fix comments given by Stephen namely, lowercase for hext numbers,
> >    making rpmhcc have xo_board as parent, rename pon controller to
> >    power-on controller, make pmic nodes as disabled etc.
> >  - removed the dependency on clk defines and use raw numbers
> > 
> > Vinod Koul (8):
> >   arm64: dts: qcom: sm8150: add base dts file
> >   arm64: dts: qcom: pm8150: Add Base DTS file
> >   arm64: dts: qcom: pm8150b: Add Base DTS file
> >   arm64: dts: qcom: pm8150l: Add Base DTS file
> >   arm64: dts: qcom: sm8150-mtp: add base dts file
> 
> Use consistent naming.

Will do :)

Thanks for the review Niklas

-- 
~Vinod
