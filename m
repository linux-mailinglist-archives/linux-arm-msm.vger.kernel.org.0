Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98EB124CBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 12:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfEUKbW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 06:31:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:47430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726344AbfEUKbW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 06:31:22 -0400
Received: from localhost (unknown [49.207.56.136])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C20FE21743;
        Tue, 21 May 2019 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558434681;
        bh=mb4gcRCdlc4t1BxrH1KDO67uUQe97itsvMsgFVRR+oI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1T3azC+0XgH3xEp8zysLMOSu8S++YutNokP4axowBzBYutjJuCkzQ7/lP7XAaYOlW
         Snz0V6hyebzOKq70E2UHDr5QECQvx96Tszf1olmuzgFudaQ7kHEldkcMOj8WN96mF8
         MlGCXvuGWzq8EJexNscqQiGDglTT3tQZ38Y/WuxQ=
Date:   Tue, 21 May 2019 16:01:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org,
        gregkh@linuxfoundation.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, jslaby@suse.com, keescook@chromium.org,
        anton@enomsg.org, ccross@android.com, tony.luck@intel.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tty: serial: msm_serial: Fix XON/XOFF
Message-ID: <20190521103117.GD15118@vkoul-mobl>
References: <20190520183848.27719-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520183848.27719-1-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-05-19, 20:38, Jorge Ramirez-Ortiz wrote:
> When the tty layer requests the uart to throttle, the current code
> executing in msm_serial will trigger "Bad mode in Error Handler" and
> generate an invalid stack frame in pstore before rebooting (that is if
> pstore is indeed configured: otherwise the user shall just notice a
> reboot with no further information dumped to the console).
> 
> This patch replaces the PIO byte accessor with the word accessor
> already used in PIO mode.
> 
> Fixes: 68252424a7c7 ("tty: serial: msm: Support big-endian CPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
