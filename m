Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7C21276CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 08:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfLTHzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 02:55:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:44154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbfLTHzN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 02:55:13 -0500
Received: from localhost (unknown [106.201.107.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18CF220716;
        Fri, 20 Dec 2019 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576828513;
        bh=WEznJzQ/gPiJpGoHAe3YXLarHioHP84JLNHZ4BtJZ9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o3AT6lGeEtZ4ew0/+7ssWOSzeeVaCGtBhVM/ux32hm9jD3lVyc2trqwh6lgsXyhEh
         3afsQB2+bWUbjTg06hucbb+yYJKkeWQbp9i00EKMehMXw5MC0trRxztCjP8MOfchST
         duf/oCbnZCUm66krCsP2gk8cnKmTrs2RJWnuk/KA=
Date:   Fri, 20 Dec 2019 13:25:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] phy: qcom-qmp: Add MSM8996 UFS QMP support
Message-ID: <20191220075507.GH2536@vkoul-mobl>
References: <20191220060304.1867795-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220060304.1867795-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-12-19, 22:03, Bjorn Andersson wrote:
> This adds support for the 14nm UFS PHY found in MSM8996 to the common QMP PHY
> driver and migrates the msm8996 dts to the new binding, which will allow us to
> remove the old driver (and the broken 20nm driver).

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
