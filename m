Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FA21A71A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2019 09:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbfEKHlH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 May 2019 03:41:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:35686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728320AbfEKHlH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 May 2019 03:41:07 -0400
Received: from localhost (unknown [106.200.210.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BC492146F;
        Sat, 11 May 2019 07:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557560466;
        bh=yUGn3nBDM+NUhCYRMjsuGMOSaVf0lUwnCgp8qA04/Ak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s/2Is2q9J+dk6006Os9qa64aZFmAa6gMh0CcEvhm/gCaiNVU0G3bBZMLhZzGRx0LL
         5Ti+SkX6cdZR7FRN1GGCcTw62Y2p6S/Zi/yaQl6DtWpBgZ2ZJ5utHfZn2aJwSMepIn
         551VGmt0LsHtS3108/EUa0UyP/QlxT7We620IHzM=
Date:   Sat, 11 May 2019 13:11:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Update memory map to v3
Message-ID: <20190511074103.GH16052@vkoul-mobl>
References: <20190306175120.22544-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190306175120.22544-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06-03-19, 09:51, Bjorn Andersson wrote:
> Update the reserved-memory map to version 3, to adjust to changes in the
> remoteprocs.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
