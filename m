Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582121CD1BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 08:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgEKGPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 02:15:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgEKGPw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 02:15:52 -0400
Received: from localhost (unknown [122.167.117.121])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7122B20708;
        Mon, 11 May 2020 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589177752;
        bh=YmpQqO+voOin9Eh8PZUZNka6aTn/VjZ8uHlXHkUb+QU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KTb3jHj7c+P9BCBcaBUICxIuo2mSN1YH2hwV2iRlIlo13WQbJ2Vhe0uLpiuVOQnpm
         mXAJvVrP6oBmeg4OcXEqo4N9/qECck8o+t+LDGAFZPwI8x0AxXQ2kcsQCn5sr+eqFs
         2nTKox51G6EWKiHRs33ENWPWggZ6pPLWfEAvK6+g=
Date:   Mon, 11 May 2020 11:45:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Samuel Zou <zou_wei@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] soundwire: qcom: Use IRQF_ONESHOT
Message-ID: <20200511061546.GQ1375924@vkoul-mobl>
References: <1588735553-34219-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588735553-34219-1-git-send-email-zou_wei@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06-05-20, 11:25, Samuel Zou wrote:
> Fixes coccicheck error:
> 
> drivers/soundwire/qcom.c:815:7-32: ERROR: Threaded IRQ with
> no primary handler requested without IRQF_ONESHOT

Applied, thanks

-- 
~Vinod
