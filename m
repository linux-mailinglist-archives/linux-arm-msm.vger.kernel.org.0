Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6077EF34FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 17:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729595AbfKGQvD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 11:51:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:49466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbfKGQvD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 11:51:03 -0500
Received: from localhost (unknown [106.51.111.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2ABD72085B;
        Thu,  7 Nov 2019 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573145463;
        bh=vhtukU2oNC7F9Y1HZ3CqDAbYwg3qJkSQKGQ29ol4x9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FDTQzL5NOSTc7jRISFLiIvMs5drUHQ+k39Otyc2CdSWaahz0yjBr8r8S1HOpFGGSl
         FgCsaYpvxRqXN/9hogGZGnHjUHFjyOlbnUu/0pP8BnHlnjjJX074mbdUjeyQpgnWuE
         ITt2n9Wi/0PSK04aF56cQWkC0lnkE+Y25wWso6jY=
Date:   Thu, 7 Nov 2019 22:20:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] firmware: qcom_scm: Order functions, definitions
 by service/command
Message-ID: <20191107165058.GP952516@vkoul-mobl>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
 <1572917256-24205-4-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572917256-24205-4-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-11-19, 17:27, Elliot Berman wrote:
> Definitions throughout qcom_scm are loosely grouped and loosely ordered.
> Sort all the functions/definitions by service ID/command ID to improve
> sanity when needing to add new functionality to this driver.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
