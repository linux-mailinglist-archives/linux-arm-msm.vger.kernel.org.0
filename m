Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782511C33C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 09:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgEDHjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 03:39:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:58124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727088AbgEDHjT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 03:39:19 -0400
Received: from localhost (unknown [171.76.84.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C6AF20735;
        Mon,  4 May 2020 07:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588577958;
        bh=oDKCJU2obIh3Cj8bmL05TD+Z+nupQK0pG1qBoRHHc64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RpbDvU/gftGBUe4r7c2p3M87nbI0TDTblYhyaH0GKMl6e+Fkf9dQHjn/7+mRaDjuw
         Wmybhe4YDgFWH26DIEWX4BssYHr8tu96+zByK+bDuh1yCLesZ9kcauVbaA2jz/ALSV
         DlmKDanUlqbhKglqqzLn1/r5zInHnsUQSO0iLleQ=
Date:   Mon, 4 May 2020 13:09:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v7 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
Message-ID: <20200504073914.GQ1375924@vkoul-mobl>
References: <20200503201823.531757-1-robert.marko@sartura.hr>
 <20200503201823.531757-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200503201823.531757-3-robert.marko@sartura.hr>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-05-20, 22:18, Robert Marko wrote:
> From: John Crispin <john@phrozen.org>
> 
> Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

Bjorn, I have picked the phy and dt binding, feel free to apply this one

Thanks
-- 
~Vinod
