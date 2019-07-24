Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACD572694
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 06:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfGXE2W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 00:28:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:53956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbfGXE2W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 00:28:22 -0400
Received: from localhost (unknown [171.76.105.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4B1F20644;
        Wed, 24 Jul 2019 04:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563942501;
        bh=S9qnviynYU0KAeO6ysWq6+crn3FV5oKpaQrgguAbybs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FOYnyjM3Yq3iXIfFP8D6RqUc9SLGls+uJ+fhoEki9sifdRyF24LeVS4UEMWV7xMHf
         o+/vmo5i777rf1NjTjGeX0xv8Av/NSNVMTTUctWb+x3/QfLcHqb1nC1mY6xgZnw1lD
         cNlURjhd2gjDT7AnEt3luueW9qPK4JbUEzTgqw7E=
Date:   Wed, 24 Jul 2019 09:57:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vaishali Thakkar <vaishali.thakkar@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rafael@kernel.org,
        bjorn.andersson@linaro.org, Imran Khan <kimran@codeaurora.org>
Subject: Re: [PATCH v6 3/5] soc: qcom: Add socinfo driver
Message-ID: <20190724042709.GD12733@vkoul-mobl.Dlink>
References: <20190723223515.27839-1-vaishali.thakkar@linaro.org>
 <20190723223515.27839-4-vaishali.thakkar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723223515.27839-4-vaishali.thakkar@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-07-19, 04:05, Vaishali Thakkar wrote:
> From: Imran Khan <kimran@codeaurora.org>
> 
> The Qualcomm socinfo driver exposes information about the SoC, its
> version and its serial number to user space.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
