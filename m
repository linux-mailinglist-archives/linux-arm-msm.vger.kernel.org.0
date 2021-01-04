Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3561D2E9040
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 06:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbhADF5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 00:57:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:45276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbhADF5H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 00:57:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 696EA20DD4;
        Mon,  4 Jan 2021 05:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609739786;
        bh=0ASJg6Br42gLGBYekXD5R7giFhiGZU1ERYZr313ZMoc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aDGgdpPTEEzVblXmYplX6Xah3V5mhfj9d2qstw2rAht6/i8zPA+38ARIJBxbxYk9w
         WxYzlu1XyoSzDsxswOSGbJKl0LMxzffn2Bdi02bicwHDUDc12+g8lmfTHJf5pUn8NY
         cq8qOtdpaxm7GMZTUJfRiboesfo9cZe1tLrGepHbX1XNUTy0UnivOlaouoxykZKkc3
         c843cJeDw3ER9B0QRRwG2vXorgE6jVDfLwg2zkoxQt1a8uAiVeoKkKMBDJ0wEAneH4
         10e6AG9OirxuJX3hhlNLN7eN+NgQOn3iaUzXGDDqWS4o9uxvF49t286vkYuURpjfwh
         i5Fym3hsazoLg==
Date:   Mon, 4 Jan 2021 11:26:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: fix pm8009 bindings on sm8250
Message-ID: <20210104055621.GD120946@vkoul-mobl>
References: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31-12-20, 15:23, Dmitry Baryshkov wrote:
> 
> PM8009 has special revision (P=1), which is to be used for sm8250
> platform. The major difference is the S2 regulator which supplies 0.95 V
> instead of 2.848V. Declare regulators data to be used for this chip
> revision. The datasheet calls the chip just pm8009-1, so use the same
> name.

Thanks, this looks sane to me:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
