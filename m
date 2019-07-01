Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1E75B3B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 06:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfGAEvx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 00:51:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:49130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726869AbfGAEvx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 00:51:53 -0400
Received: from localhost (unknown [122.167.76.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 733B7208C4;
        Mon,  1 Jul 2019 04:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561956712;
        bh=4qYmvxymduxWR/PQGIROhr12RIo2szXi4uFclExfwFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nV2VunIAbwWpbkA61wBepFjx84PhADcwpEG+DdKsRWkzOHPMSAPht9WoI0aWTKUHB
         0opKS73PW3U2a8BvgKXJzIRj2dT3351qc3IW4qrW8ucoOTlpS+d6gdOiqe0aTfqIdA
         H2b1skBoDoPQ68kksmzdNJDHwC7Op4OV7pF1wZlc=
Date:   Mon, 1 Jul 2019 10:18:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v4 2/4] usb: xhci: Use register defined and field names
Message-ID: <20190701044843.GH2911@vkoul-mobl>
References: <20190626075509.20445-1-vkoul@kernel.org>
 <20190626075509.20445-3-vkoul@kernel.org>
 <39d63d20-0fa9-9e66-a7b6-37a0f16f5925@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39d63d20-0fa9-9e66-a7b6-37a0f16f5925@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-06-19, 00:42, Mathias Nyman wrote:

> 
> Most of this patch should probably be squashed together with the previous patch

Will do

-- 
~Vinod
