Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADBB348A27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 08:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCYH0a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 03:26:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:36532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229853AbhCYHZ7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 03:25:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BAFE619FC;
        Thu, 25 Mar 2021 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616657159;
        bh=wpYnuZAV4B40clRZe6keD3ih6uMr+/+KYuGkr6YNpMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S3WE/lKCnbk2/nJD4vweOxlgvKjoAjliy8J/MfXYc4sRjV4NwwbGMf0rDmsEJFdY8
         sOLlBNrSelX8J5EgsJDrmgC3oygtSlatyy7GblIkH2+He5Sxt7a83xb4tUJyCFospx
         262WdeS0qmMUfUAkdoa8CF/0Uc0Fs1cTn2a4mSbuTuQxZhRBTFOXTH5sUeeRnLAYsn
         XyIjB/ABjtApC90Uvfc79rq1ki6WFrQ1PhT9FwaiGXpySc+4A678OHQ755KrTugYcu
         /kcCiWtEK1xuNc70kmJ3uFpXX+dRzPTBTlau0itNgBDCll8k+XW+o9XurQfMrS8oHT
         KCklyOrd7AWXA==
Date:   Thu, 25 Mar 2021 12:55:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     menglong8.dong@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhang Yunkai <zhang.yunkai@zte.com.cn>
Subject: Re: [PATCH] phy:qualcomm: remove duplicate argument
Message-ID: <YFw7AxTiUIpc5bMc@vkoul-mobl.Dlink>
References: <20210319113612.494623-1-zhang.yunkai@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319113612.494623-1-zhang.yunkai@zte.com.cn>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-03-21, 04:36, menglong8.dong@gmail.com wrote:
> From: Zhang Yunkai <zhang.yunkai@zte.com.cn>
> 
> 'HSUSB_CTRL_DPSEHV_CLAMP' in 'val' is duplicated.

Applied, thanks

-- 
~Vinod
