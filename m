Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F20BE96E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 07:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbfJ3G4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 02:56:38 -0400
Received: from foss.arm.com ([217.140.110.172]:60018 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725855AbfJ3G4i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 02:56:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC1591FB;
        Tue, 29 Oct 2019 23:56:37 -0700 (PDT)
Received: from e107533-lin.cambridge.arm.com (e107533-lin.shanghai.arm.com [10.169.106.34])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 123563F6C4;
        Tue, 29 Oct 2019 23:59:24 -0700 (PDT)
Date:   Wed, 30 Oct 2019 14:56:25 +0800
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        mka@chromium.org, swboyd@chromium.org, evgreen@chromium.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add cpuidle low power states
Message-ID: <20191030065625.GA14823@e107533-lin.cambridge.arm.com>
References: <1572408318-28681-1-git-send-email-mkshah@codeaurora.org>
 <1572408318-28681-2-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572408318-28681-2-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 30, 2019 at 09:35:18AM +0530, Maulik Shah wrote:
> Add device bindings for cpuidle states for cpu devices.
> 

You are not adding bindings, but you are using the existing bindings I
believe. Anyways good to see a platform using PC mode for cpuidle/suspend.
What platforms does this sc7180 cover ? 

--
Regards,
Sudeep
