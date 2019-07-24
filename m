Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F37D72691
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 06:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfGXE17 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 00:27:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:53890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfGXE17 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 00:27:59 -0400
Received: from localhost (unknown [171.76.105.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C0F9220644;
        Wed, 24 Jul 2019 04:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563942478;
        bh=KcvumDtHGTAbiC6t0H1WAMDH8xJ/VH7jZAdfG7AAQBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zoNNtjDUONcY4Sphlyp61Nj2+brqPte/LV2VGgFeHpA/TupP81vg3kPtI9IM+8gQi
         8JH7vV1bs5JzIUrc5unHgNDU/HtA3Js6WtkJG5nKlZ8mKQdoziHeQ14p+o2fFpQ052
         Kt3RBikdV57DUYj747KQ+ZOmqaNpEL4PE3wxBINU=
Date:   Wed, 24 Jul 2019 09:56:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vaishali Thakkar <vaishali.thakkar@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rafael@kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v6 1/5] base: soc: Add serial_number attribute to soc
Message-ID: <20190724042646.GC12733@vkoul-mobl.Dlink>
References: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
 <20190723223515.27839-2-vaishali.thakkar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723223515.27839-2-vaishali.thakkar@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-07-19, 04:05, Vaishali Thakkar wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add new attribute named "serial_number" as a standard interface for
> user space to acquire the serial number of the device.
> 
> For ST-Ericsson SoCs this is exposed by the cryptically named "soc_id"
> attribute, but this provides a human readable standardized name for this
> property.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
