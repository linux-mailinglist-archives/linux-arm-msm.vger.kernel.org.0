Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53A1339D83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 11:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbhCMKQ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 05:16:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:38076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229615AbhCMKPz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 05:15:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7010B64F18;
        Sat, 13 Mar 2021 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615630555;
        bh=A0qa/L9YHE7V007jysJb4oVoNJg2IRqxEePL69W9c/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BlvU/zzTyB3ZBbiKNxB4QOZ6UdbDtaEDa+AhBoNFwZQMWDsVlNVi4BPMalOjrDNch
         yKtPXRPq8wO0z8c4yprjdQ8NjgibLnNou9lajpEW3Gcz8eiWHZfCR9Ah1H6X1VKDUC
         5CozKTf39DB9wObBFxNDx884r4s3nkJPcSreLKiPcPwG42qZgaPmIa00v1b0txdiQW
         np1PM47P62Xd1ns61JNhzUOkw+RmAd51ufidIWZDlMzcVDYmpv1fqppkwSGuQ3IRds
         nP/TXdi613/tUEtQBiH0d7Jk9Wk8t8gxW7du/ue/sd54lcgs05coG4X9IENYrVkvqY
         UAT0dJRvOtXxQ==
Date:   Sat, 13 Mar 2021 15:45:51 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: pm8150: Enable RTC
Message-ID: <YEyQ15oBj4rXa1y9@vkoul-mobl>
References: <20210106001004.4081508-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106001004.4081508-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 16:10, Bjorn Andersson wrote:
> The PM8150 comes with everything the RTC needs, so let's just leave it
> enabled instead of having to explicitly enable it for all boards.
> In effect this patch enables the RTC on the SM8150 MTP and the SM8250
> HDK.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
