Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6A524DB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 13:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfEULNC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 07:13:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbfEULNC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 07:13:02 -0400
Received: from localhost (unknown [223.186.130.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF6B32081C;
        Tue, 21 May 2019 11:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558437182;
        bh=72bk1ttlqjF2V4Xip22AI8rFxXCaNDipiXFKNRlNwhY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LEc0YPgUssTdD/zKgJRPKigqpsldLhTf5Sk8sOZOcMJYWse7z4FeAAkWzTKLPvR6a
         kW0tSLc1bj+BtglXCUxwdcwx62P2+UOAbi3k6eBKUHX8PE9tpAvpJ2OCMLdbfVr1+j
         Zk/AA4IRZBPFn/wDqWbexPp6GL97RVHAv9nMQquQ=
Date:   Tue, 21 May 2019 16:42:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] arm64: dts: qcom: Add AOSS QMP node
Message-ID: <20190521111255.GH15118@vkoul-mobl>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501043734.26706-4-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-19, 21:37, Bjorn Andersson wrote:
> The AOSS QMP provides a number of power domains, used for QDSS and
> PIL, add the node for this.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
