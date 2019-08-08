Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3955885982
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 06:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfHHExb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 00:53:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:46586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbfHHExb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 00:53:31 -0400
Received: from localhost (unknown [122.178.245.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FBC52186A;
        Thu,  8 Aug 2019 04:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565240010;
        bh=PRvc48A7Aow9SPbrhyzZ7nJ749QLyc6oKL133j+p+9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RjXk7STASRJwJLZNAbEQDTEKmpzWHham9jmjmBQIs6GUirI0VTro0hFI6XdVtQKOy
         Fj/uYfMVJoKiDPyYpSFoht4lOVp6AfHDNiEX4xDTbciLCzSO5SnKCzocePi4y+RK2M
         b3dSQJMFqM7OQ6NlaKwkuXm6pDWYqfXMBWcPKWa4=
Date:   Thu, 8 Aug 2019 10:22:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        aneela@codeaurora.org, mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org
Subject: Re: [PATCH v2 0/7] Add support for Qualcomm SM8150 and SC7180 SoCs
Message-ID: <20190808045217.GJ12733@vkoul-mobl.Dlink>
References: <20190807070957.30655-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807070957.30655-1-sibis@codeaurora.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07-08-19, 12:39, Sibi Sankar wrote:
> This patch series adds SCM, APSS shared mailbox and QMP AOSS PD/clock
> support on SM8150 and SC7180 SoCs.
> 
> v2:
>  * re-arrange the compatible lists in sort order

i checked these lgtm and tested on SM8150

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
