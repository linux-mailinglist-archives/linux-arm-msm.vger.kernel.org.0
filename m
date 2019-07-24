Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9497272698
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 06:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfGXE2u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 00:28:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbfGXE2u (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 00:28:50 -0400
Received: from localhost (unknown [171.76.105.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A68820644;
        Wed, 24 Jul 2019 04:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563942529;
        bh=/Olz21iKY9WQNEyBo88iz/dYidmQtQLql3Enwsbfnhw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=17E2aoY3Our8RI6Mh4AAdb03jv8fXakWcnMtJr406e/QS42PSn52slK5uR2Af0mAP
         M8eKAWZWYxtOwZSwGw4/1LFZdr8xmbpIvC5kTUijH35xJrjnIAO92lRTWTtIOa13uA
         ZL8IDtQcPytSfsUFzSfvhkyHRNRSljpTd9Xe3/ww=
Date:   Wed, 24 Jul 2019 09:57:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vaishali Thakkar <vaishali.thakkar@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rafael@kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v6 5/5] soc: qcom: socinfo: Expose image information
Message-ID: <20190724042737.GF12733@vkoul-mobl.Dlink>
References: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
 <20190723223515.27839-6-vaishali.thakkar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723223515.27839-6-vaishali.thakkar@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-07-19, 04:05, Vaishali Thakkar wrote:
> The socinfo driver provides information about version of the various
> images loaded in the system. Expose this to user space for debugging
> purpose.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
