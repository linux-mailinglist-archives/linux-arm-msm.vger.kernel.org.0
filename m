Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E9E20E5BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403867AbgF2VlL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:41:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:60646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728203AbgF2SkV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:21 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F08F23426;
        Mon, 29 Jun 2020 09:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593423710;
        bh=tRlveph9G4srSUhl8kbZjZWwYteyQQJDjVlX8+51Nas=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=da31OB2fclESJ/3Uy+IxgNzwly0JaI5EWAwrapM0fB7nM115WVgXoBtgvMb3+sm2l
         TrpwN61lWG84NaNse/o8TaSKRa51B3nZvlxdkNzhzD6R+5HeLNbOTEYHN/tnYw75uF
         MrAr3FT0h4V/Q/7SG+goaomz3HiGFHe47noZjIO4=
Date:   Mon, 29 Jun 2020 15:11:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "open list:GENERIC PHY FRAMEWORK" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] phy: qcom-qmp: add V4 USB PHYs
Message-ID: <20200629094146.GC2599@vkoul-mobl>
References: <20200524021416.17049-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200524021416.17049-1-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-05-20, 22:14, Jonathan Marek wrote:
> Add support for sm8150 secondary USB PHY and both sm8250 USB PHYs.

Applied all, thanks

-- 
~Vinod
