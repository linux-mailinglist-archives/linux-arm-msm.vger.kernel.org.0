Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E04C1F3356
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 07:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgFIF0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 01:26:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:57642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgFIF0X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 01:26:23 -0400
Received: from localhost (unknown [122.171.156.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6476F207ED;
        Tue,  9 Jun 2020 05:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591680383;
        bh=oraUJGU/LS+UpJaybh4JymhynyUitP+Vtl8eSzPahaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cY+q7KGjWEDdP+aVkF7LUcJ6AC7zUPdcIbTzMjSf2gQAOV6ip2Ne8qEoVrCAqxb/s
         avyfkHivaafBH4ZV+Jsyb9pUSdu1Bwzvlt3JWLfZV7maM9znpa5Zvh+DHOvldr3zYG
         bdAOEry1ENaIW+odwNrJ6XbCf0EKtuVN2AJMvANs=
Date:   Tue, 9 Jun 2020 10:56:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     alsa-devel@alsa-project.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] soundwire: qcom: add v1.5.1 compatible
Message-ID: <20200609052619.GB1084979@vkoul-mobl>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608204347.19685-4-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-06-20, 16:43, Jonathan Marek wrote:
> Add a compatible string for HW version v1.5.1 on sm8250 SoCs.

Please document this new compatible

-- 
~Vinod
