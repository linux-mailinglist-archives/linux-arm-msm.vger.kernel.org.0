Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5042524DB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 13:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfEULNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 07:13:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:60252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbfEULNs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 07:13:48 -0400
Received: from localhost (unknown [223.186.130.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E5C12081C;
        Tue, 21 May 2019 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558437227;
        bh=fWZoPKYue8BBN1duz6eRREdVn+XwdEXbZlMLzcuBKJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=orkF+2Sngfbe7ujeRPWzeg0s6kCcCXbycdPWWaLV09payM2vkhzDxRGbg3KUEkEoz
         F7wYx9U/8/KKdgAkq4VTSm1tYMuZwPp3T8Ksf96fFrxVS/6zRFzHpdj5F2CgCAZOKN
         CgoaJzIeYkZnEoCKnT0pIwgMkVRL1TDYgYk5hefA=
Date:   Tue, 21 May 2019 16:43:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Message-ID: <20190521111340.GI15118@vkoul-mobl>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-5-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501043734.26706-5-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-19, 21:37, Bjorn Andersson wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
> 
> This patch adds Q6V5 MSS remoteproc node for SDM845 SoCs.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
