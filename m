Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60F21D328B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgENOT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:19:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:34308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgENOTZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:19:25 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC97020671;
        Thu, 14 May 2020 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589465965;
        bh=1QRzCwM83xBzdk3JMEqd9YskjPLsmLHOo5Dg0XBFfUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OyhIIPyuih2c+TzcbNDk738ALiOGAVzvx5UjHkzIQ4106Hgi7mis5P3vXLKi5j4Nt
         SuP71KVWjQgWEARbJRjTdxz6VwhsaWKaG8pRDDXki81+YjeiRTAUUkmj3a2RQSjYeD
         Esdnmv4bVo4udLOhjHRWEtg94rQ/dcTXT9CmvcBs=
Date:   Thu, 14 May 2020 19:49:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: hwlock: qcom: Allow device on mmio bus
Message-ID: <20200514141921.GY14092@vkoul-mobl>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
 <20200513005441.1102586-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513005441.1102586-3-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-05-20, 17:54, Bjorn Andersson wrote:
> In all modern Qualcomm platforms the mutex region of the TCSR is forked
> off into its own block, all with a offset of 0 and stride of 4096.
> Update the binding to allow the hardware block to be described directly
> on the mmio bus, in addition to allowing the existing syscon based
> definition.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
