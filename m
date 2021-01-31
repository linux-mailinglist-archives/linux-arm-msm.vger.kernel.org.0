Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8672E309D8F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 16:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhAaNw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 Jan 2021 08:52:59 -0500
Received: from onstation.org ([52.200.56.107]:47226 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231487AbhAaLir (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 Jan 2021 06:38:47 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id D6FFE3EA80;
        Sun, 31 Jan 2021 11:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1612092274;
        bh=N7L6fYDhLPEG1s25GmMdw67xLRXQSzEGfILyYkgFoB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bGzAIJUuYJex6YorJw760tBTxwpO/jDzyfs7CFLdlzfB/TTzc+/8pw8rtGpgtnGQa
         l3u3totDRxCxws6iaI2FEz9JRLfVcsDMqj8hOpoxbY29bPeVwhKjAQr9TrndGB1mGY
         qVfoaNy3m/rcW54WE6MEVRETWrE5cuOO2Ut2rBrs=
Date:   Sun, 31 Jan 2021 06:24:33 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ocmem: don't return NULL in of_get_ocmem
Message-ID: <20210131112433.GA5545@onstation.org>
References: <20210130142349.53335-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210130142349.53335-1-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 30, 2021 at 03:23:49PM +0100, Luca Weiss wrote:
> If ocmem probe fails for whatever reason, of_get_ocmem returned NULL.
> Without this, users must check for both NULL and IS_ERR on the returned
> pointer - which didn't happen in drivers/gpu/drm/msm/adreno/adreno_gpu.c
> leading to a NULL pointer dereference.
> 
> Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Brian Masney <masneyb@onstation.org>

