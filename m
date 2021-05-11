Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E3837A321
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 11:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhEKJNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 05:13:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230474AbhEKJNl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 05:13:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE2376143C;
        Tue, 11 May 2021 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620724355;
        bh=wo20SJ4U8b5/sbiANtr7GXh8VIKHL+yZvYxj5AOAFZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X+c4KY7NSw11Rdt9toHggzQmZu5wv0luav73QkA3SrORrQJJrWvhSW9yYwo0sW99B
         YKiYPmfNx7Uq8MKXcxl1qALlMeHRnbES4BZPBla/LK5TsWEB29zShY1V6FtpY+gBPB
         ULOtFjQO7hpXWB3lV/ZfuSUp6mtGUQpVSB81UX07LU5MsngHAipUvoMur/6JyIuR+4
         uUFgXeTXmSk6sHMNYAf/pIwkSmIrornn6QTDf7qoIkzVDZxQwBXwOPU5xuSOBXpEFj
         YDZt2aUdlEGXQk0Yl7a4T1Sq8Db80jkZ67YfPzDMs/uKGLivoiYnWe9+mRo7z7XVWW
         B0djlMFgztGlQ==
Date:   Tue, 11 May 2021 14:42:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: rpmhpd: Add SC8180X
Message-ID: <YJpKf7x619zQvQeH@vkoul-mobl.Dlink>
References: <20210120225037.1611353-1-bjorn.andersson@linaro.org>
 <20210120225037.1611353-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120225037.1611353-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-01-21, 14:50, Bjorn Andersson wrote:
> Add the power domains exposed by RPMH in the Qualcomm SC8180X platform.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
