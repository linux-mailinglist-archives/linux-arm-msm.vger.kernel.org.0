Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB37B41EAE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 12:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhJAKXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 06:23:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:56330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230008AbhJAKXT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 06:23:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50CB360EBB;
        Fri,  1 Oct 2021 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633083695;
        bh=d2B3aqMqCeg19jkk4r/VHqci8GXUvcnxdV2Hf+/w4Og=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tcwP5be5+nwV5FseSUBzoToVNqRxZS26bxIJy6ygu28A2exECohriqIpdwE92FL9b
         Dacj0A3wbRfFUnV8+GrXIX4p8pddwFiTPzDFI/zoQj+RRWOO1/+OCfH03VNPykWfLA
         kfjX8Qhnb4WDqawnpGhCsIGVKuu2qQoEuCR5hL1hK1hLqkSw9G2Y8STACVEudtdl4Y
         eIGd7FKAlv6Rwrl2u+OMDd2LmyTP2zvEVgNgz2enCBO3Wq5bQsivGyjkkT1NlN7t9z
         efBPuZXli3/8CI8s9uDAprvhiC16eKZTzc8vz1UFZELE7qOjDMAJQBapiyr4tAwcAn
         trrUof2Es48Bw==
Date:   Fri, 1 Oct 2021 15:51:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp: Make use of the helper function
 devm_add_action_or_reset()
Message-ID: <YVbhKluONs9NKCoh@matsya>
References: <20210922130017.692-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922130017.692-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-09-21, 21:00, Cai Huoqing wrote:
> The helper function devm_add_action_or_reset() will internally
> call devm_add_action(), and gif devm_add_action() fails then it will
> execute the action mentioned and return the error code. So
> use devm_add_action_or_reset() instead of devm_add_action()
> to simplify the error handling, reduce the code.

Applied, thanks

-- 
~Vinod
