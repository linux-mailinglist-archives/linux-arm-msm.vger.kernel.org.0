Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB562B25C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 21:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgKMUrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 15:47:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:58820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbgKMUrp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 15:47:45 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B53522201;
        Fri, 13 Nov 2020 20:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605300464;
        bh=42lgSM0oR4oMLDeewFvD9Hxt1b1sFA3gDG5ig+3poh0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Zkwyr23sXlyUNOAKHu9XYtw2CC9Y/N+g9WgyhjY03hCFjM6bSgAbJuDTQLC+gMllH
         F33ND1TlMfUhNGECaTSlqKbHBs3/2TdVbrD4JsPi4VJ1SLVznj+TBNZoukN4H9eVjV
         eAjOmgJowyzuco/w0ESQ8l798EAZmZi+v7sg+Xy8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fec878502147336cbf2cf86e476e9dd797cd7e6f.1601360391.git.mchehab+huawei@kernel.org>
References: <cover.1601360391.git.mchehab+huawei@kernel.org> <fec878502147336cbf2cf86e476e9dd797cd7e6f.1601360391.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 2/2] spmi: fix some coding style issues at the spmi core
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Fri, 13 Nov 2020 12:47:43 -0800
Message-ID: <160530046322.3428466.14085002700866520617@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mauro Carvalho Chehab (2020-09-28 23:22:13)
> While preparing to port the HiSilicon 6421v600 SPMI driver,
> I noticed some coding style issues at the SPMI core.
>=20
> Address them.
>=20
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Applied. Thanks!
