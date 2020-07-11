Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD92321C10D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 02:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgGKAMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 20:12:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbgGKAMa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 20:12:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 908F4206D9;
        Sat, 11 Jul 2020 00:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594426349;
        bh=8fx3o7YPTqqLEFov5GsDKcWXomusI8PB9Gem520UFz8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Z+YWycqxGRPDM1BnMJ0twVvbwlm7pR80eSVYlQHQX26TJxPq/w/Zq/HTmyhBMzrCs
         2jie0IOe48iG+WmEFzodd5vC8dAmW8WcNuWEL7uFN8Kh5rQVVsDp4F/KmcCN7doSDk
         U6+L4T8xp9W7lPFu4Fsq2EuCdbdGlXUXFqfeLfL8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1593766185-16346-2-git-send-email-loic.poulain@linaro.org>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org> <1593766185-16346-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v5 1/5] soc: qcom: Separate kryo l2 accessors from PMU driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org
Date:   Fri, 10 Jul 2020 17:12:28 -0700
Message-ID: <159442634887.1987609.14522219371112642819@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-07-03 01:49:41)
> From: Ilia Lin <ilialin@codeaurora.org>
>=20
> The driver provides kernel level API for other drivers
> to access the MSM8996 L2 cache registers.
> Separating the L2 access code from the PMU driver and
> making it public to allow other drivers use it.
> The accesses must be separated with a single spinlock,
> maintained in this driver.
>=20
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---

Applied to clk-next
