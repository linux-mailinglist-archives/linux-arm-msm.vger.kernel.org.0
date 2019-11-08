Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0561F3EF5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 05:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfKHEgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 23:36:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:56054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726281AbfKHEgh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 23:36:37 -0500
Received: from localhost (unknown [106.200.194.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 505D4214DB;
        Fri,  8 Nov 2019 04:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573187797;
        bh=ZZ4hCyTEqq28pLs9fJNg1dTOCNqcVyiTq7elto8mWfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CI8Zof4D+L2iB0WzUrf1UINzJIFfGJWalB8QPYRDQpXFPVw0gqho2NWOw3FNLOinU
         i95KwQOTyIsDqzRKta1giMPPFC7hNRKg46PEHkc/HKyfa8wmkDvs3kjfBfr0vO4zRA
         1GXFeU22iY0+c0Vc9f/mZkJygqsCoFK9uNFcV814=
Date:   Fri, 8 Nov 2019 10:06:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/17] firmware: qcom_scm: Remove unused
 qcom_scm_get_version
Message-ID: <20191108043632.GY952516@vkoul-mobl>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
 <1572917256-24205-5-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572917256-24205-5-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-11-19, 17:27, Elliot Berman wrote:
> Remove unused qcom_scm_get_version.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
