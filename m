Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29B9733E9DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 07:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCQGi2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 02:38:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:52280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230292AbhCQGiE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 02:38:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D725D64F96;
        Wed, 17 Mar 2021 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615963083;
        bh=co0ymqB5hV9J0uMm6J1ZO7xfmvHbw01K7yaacLoA+xQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kbjmMQC0B6dCdvML4uCu9D5oJB4Bq4N0ylYyHxT73v3NWsTLJbl6Odib12ABzTFJ4
         MCCwXJ7cshE1jq4qF4LMehU6xbhVn9A1uPH5FFRg9CgUfQrQSkxZ73i1ervtED9qgI
         2R79VgCV3KnodZPOcoEv0Uy3cRRFkzz1JKDz1hiIJY6aVEJf032X5BDfPBq/uWtC38
         DOWM0qkiU/M52XHcQSkc2Cb5SYjejrGqbHgJ2ua4pC/x8JIzq18l2cD3Mk4zyz9YkL
         S4M7qYQ6xepaYVo6EYQP7TPM18JqQ9JsSjTfft1W9GujbCjf4AhHerOLwtSYGL3PTw
         5mtCs8x+PunJQ==
Date:   Wed, 17 Mar 2021 12:07:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: qcom-qmp: add hbr3_hbr2 voltage and premphasis
 swing table
Message-ID: <YFGjxyu0DYkuxxmh@vkoul-mobl.Dlink>
References: <1615914761-12300-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615914761-12300-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-03-21, 10:12, Kuogee Hsieh wrote:
> Add hbr3_hbr2 voltage and premphasis swing table to support
> HBR3 link rate.
> 
> Changes in V2:
> -- replaced upper case with lower case at hbr3_hbr2 table
> 
> Changes in v3:
> -- replace space with tab at hbr3_hbr2 table

This should be after the --- line below
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

No need of blank line here
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

I took the liberty of fixing these two, applying the fixes tag and
applied..


-- 
~Vinod
