Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2A3024CEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 12:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfEUKiU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 06:38:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbfEUKiU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 06:38:20 -0400
Received: from localhost (unknown [223.186.130.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD8242173E;
        Tue, 21 May 2019 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558435100;
        bh=XpX2oJnFw+EZYoPkaT+QFi18DqFIhJEW+2R1fjzroBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ibcfNKIdJ1MYpZ28qpR2nr44MKxk73RGf3/MjtXPt4QbpWl6JYK9ysQdiDNQb4gOw
         wzSCKt5IIcWpobUz3Ow9Z0zrX2CIMPhfiHRJ0Keq5IolVE7oLqdksqdjOZfu1rntlC
         4mRltpt+pThuphgv8ckrqemXMROpv6je5reRUcEU=
Date:   Tue, 21 May 2019 16:08:13 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Stop using legacy clock names
Message-ID: <20190521103147.GE15118@vkoul-mobl>
References: <20190503232442.1530-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503232442.1530-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-05-19, 16:24, Bjorn Andersson wrote:
> MDSS and its friends complain about the DTS is using legacy clock names,
> update these to silence the warnings.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
