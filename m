Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F047B37A31A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 11:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhEKJMo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 05:12:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:35356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230474AbhEKJMn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 05:12:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F6AE60FEE;
        Tue, 11 May 2021 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620724297;
        bh=Mliva7/hWnItcLklU3LLXAl7KEIbcNge8rx4xSvriNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bKyIZr+eP/u6R+viK8byDpHjOf806q829VwYvtsfFz3tcXgEg9hHjwQPvpNXRnqfA
         ZDVaYEltt8XGp+goNg+hcQGNTom8tTBSR7pfwh2GTtNFFGhJHxiHq67mLVnlkZ+J1I
         PwARhou1vk4v1utGjj0SSLknPo8U+0yX0mXxRw/JW+FKGbXmv9U7qD/+vm3oEwGIJ4
         Y4m1K7pM6lu9XY5f1U2H/vWxuoos/6776kcT+T+J5woQVfYTK3TUvprS3xtCuawEOm
         k7zKRx1mAvgxEGU0ysvuOZgXm9tGCxQNZdqJHYDVemcKXWPD/bEKyiNKzQ9RdR/ug8
         xCjzg3k5AjivQ==
Date:   Tue, 11 May 2021 14:41:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Add SC8180X to rpmpd
 binding
Message-ID: <YJpKRXIIAV+JG/1f@vkoul-mobl.Dlink>
References: <20210120225037.1611353-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120225037.1611353-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-01-21, 14:50, Bjorn Andersson wrote:
> Add compatible and constants for the power domains exposed by the RPMH
> in the Qualcomm SC8180X platform.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
