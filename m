Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E031D3706
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 18:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbgENQxu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 12:53:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:59264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgENQxu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 12:53:50 -0400
Received: from localhost (unknown [122.182.193.86])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA9FE2065F;
        Thu, 14 May 2020 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589475229;
        bh=uLsNhapwCHDABTtF2A6EH6XG/RphfBmrqkR3vk1nbHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=snFrfeWHib9cVGp/q9/42I5b4Qz43/1+9jJSArgjjz0VOLBE4BXbd1tSgo36qBgTl
         TXlZF83pc90U+H0Rm126mgQz+LraJe46hpGQnwd0lkJWCos9PC9quXHb+1jd4fgaXZ
         vVPvnjGuHV7qMyWQz4/OWmwNCx7BzQsXtdAsVRy4=
Date:   Thu, 14 May 2020 22:23:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] remoteproc: qcom: PIL info support
Message-ID: <20200514165338.GA14092@vkoul-mobl>
References: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-05-20, 22:56, Bjorn Andersson wrote:
> Introduce support for filling out the relocation information in IMEM, to aid
> post mortem debug tools to locate the various remoteprocs.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
