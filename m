Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A30A018488A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 14:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgCMNyd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 09:54:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:51986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgCMNyc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 09:54:32 -0400
Received: from localhost (unknown [171.76.107.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9047220724;
        Fri, 13 Mar 2020 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584107672;
        bh=Vy6RDvDAHhiF89jng1JrM9aN+xuh/MC9vb5mxH/R8kg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ML94wijhQZlAyOivQY7vnkRLHgsGgO7iAMbUNdPrg/Rq+NgXO2Z48detpU70N6gwF
         EKNZOpVBzJtbJEFqfQLxajKWc5DGo1luT4JNNWSzL+pCHb/TRpEpaWFwBdNTpVo2mq
         knfGt1Nlc5KvtUheIVtpMFH2L91cRfD6neHHHKtM=
Date:   Fri, 13 Mar 2020 19:24:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: sdm845: add audio support
Message-ID: <20200313135427.GN4885@vkoul-mobl>
References: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-03-20, 14:30, Srinivas Kandagatla wrote:
> This patchset adds analog audio support for sdm845 based boards.
> 

Thanks Srini, I was able to test analog audio (PCM) as well as
compressed audio with these patches. Apart from nits, the series looks
fine to me.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
