Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39DE7281D91
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 23:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgJBVWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 17:22:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:39812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgJBVWT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 17:22:19 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5B05206C9;
        Fri,  2 Oct 2020 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601673738;
        bh=LxOt7unr1Kti1IymCCYl+7CNJvLXDgieZ5u0n8dn6AM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MuEMCSHgUz+Jas8coqEwQ6mXRwnP69MoWpaK+MbNlcv/+tLwoDlCiUidUqOPrsnCp
         inrXDSFIQUnPHExvobnvE5ytILUYHB8Wwc/iucjqkVrZ/1TUb4spT4bPJmcIWBMD5y
         0sB/uIu/dXYr+KZto0rBMdT+nMrUnhvn2CIS42zg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1601360391.git.mchehab+huawei@kernel.org>
References: <cover.1601360391.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 0/2] Some small cleanup/fixes for SPMI driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Fri, 02 Oct 2020 14:22:17 -0700
Message-ID: <160167373743.310579.11803841154320142421@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mauro Carvalho Chehab (2020-09-28 23:22:11)
> Hi Stephen,
>=20
> While double-checking against yesterday's linux-next, I noticed
> that those two patches weren't merge yet.=20
>=20
> As you replied to both with your Reviewed-by:, are you expecting
> them to be merged via someone's tree, or are you intending
> to merge them via your tree?

Per the maintainers file I am a reviewer not a maintainer of SPMI.
Usually Greg applies patches here. I can collect patches and send them
on up if that helps.
