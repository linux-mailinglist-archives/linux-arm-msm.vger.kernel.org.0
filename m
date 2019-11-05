Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E90EF483
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 05:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbfKEEej (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 23:34:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:56952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726640AbfKEEej (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 23:34:39 -0500
Received: from localhost (mobile-107-92-63-247.mycingular.net [107.92.63.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2B7F217F4;
        Tue,  5 Nov 2019 04:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572928479;
        bh=NDV59a3O/OthvWIdOBtwNTkBLDN4MF21O3Lcza0ndnY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wd/EqbcO77qUEhuOpLFuztyjazitPQ09hDltw4NuSRk4Ra9lpswQWV9kKVcQfZexB
         WmKa1dDmjjB/fCUGCwo5C1PVd0nwMlB9pNDIYtjZoNAyItkRTZ0TTf4HhNNr6KJk+s
         9whynkKaGJhhgj6tMdSr9GZkKs6hBKzktvgKan60=
Date:   Mon, 4 Nov 2019 22:34:37 -0600
From:   Andy Gross <agross@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for QCOM
Message-ID: <20191105043437.GD5299@hector.lan>
Mail-Followup-To: Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191104055036.63414-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104055036.63414-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 03, 2019 at 09:50:36PM -0800, Bjorn Andersson wrote:
> Add myself as co-maintainer for the Qualcomm SoC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

I'll add my s-o-b and throw this on top of the next pull request.


Andy
