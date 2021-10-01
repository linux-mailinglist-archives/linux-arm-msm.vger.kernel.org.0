Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686AF41E8E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 10:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241603AbhJAITG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 04:19:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:34188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231161AbhJAITF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 04:19:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0785361A57;
        Fri,  1 Oct 2021 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633076242;
        bh=b47P8z/W2i1bDRrOsD/Ji/gwBq3k4b2HBXMWS7tzHHg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TZ94LUBtNi1J3Z3D5NGdHA3FC3szbke8YAnGq+3WAzG5r3VmW00Jr9rQTeZz4/5PE
         QCzy5MIYHxj2257fGcuNsigrGml0xL1+9rYrx3wUR0UwvYTJPSgpHKcjsdxBNn4rhh
         rVmHEaXWMpPc0uDG5YBNOM1P+01sruApPJrDtTtL1D80LE5MkhYi1xznbSvbJ7j+S8
         NLVUS3R51+rDWWiK9Fd8pzHHT+e2bfwrBh9SX5yj6lrFz6EdKTw0kxdf7xkCGNXmHP
         L/+OfmDPjl6l1KIRZkb3vkEWVjCnP8f6cz8sxF4CU6AOGoLdYPa2abxk9o4W6uV314
         iubZqr0N2KOqA==
Date:   Fri, 1 Oct 2021 13:47:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,qmp: Update maintainer email
Message-ID: <YVbEDnMHx+vte1oh@matsya>
References: <20210927071639.6225-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927071639.6225-1-shawnguo@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-09-21, 15:16, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo@linaro.org>
> 
> Manu's codeaurora.org email address bounces.  Before he comes
> back with his new email, fill Vinod's address in there.

Sure if he is back, will add. Thanks applied now

-- 
~Vinod
