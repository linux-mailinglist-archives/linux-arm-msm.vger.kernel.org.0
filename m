Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB2423B77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 17:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731998AbfETPDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 11:03:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:37320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731646AbfETPDV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 11:03:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DBC520856;
        Mon, 20 May 2019 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558364600;
        bh=LoBgKje1Gf3CQj9wHBwQACbPq2B8PUlWMdKdoLahbI8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=msbXW5oUY2j3RtCjlxu+PBDh1QNS8oMub7DHYPj35+0fG8dIZo+GuyMPItz6RWQSu
         oC+y+OGWpqAUsmxSB8ZVwipfLDVEPEwArPMviRS/88xUBTWoV606T4nO3A/TYJabaQ
         tFJR5MHGGIrLUvVb7JrAl5Y56Yr4lvyMbvFhFyBY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f0c89b84-7c3d-596d-06e1-cb5172e62970@linaro.org>
References: <20190520103435.30850-1-jorge.ramirez-ortiz@linaro.org> <20190520145110.7BDAE21721@mail.kernel.org> <254704a2-ee20-30cd-8362-6e1bd23ec090@linaro.org> <f0c89b84-7c3d-596d-06e1-cb5172e62970@linaro.org>
Subject: Re: [PATCH] tty: serial: msm_serial: Fix XON/XOFF
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     jslaby@suse.com, keescook@chromium.org, anton@enomsg.org,
        ccross@android.com, tony.luck@intel.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, khasim.mohammed@linaro.org,
        agsumit@qti.qualcomm.com
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, agross@kernel.org,
        david.brown@linaro.org, gregkh@linuxfoundation.org
User-Agent: alot/0.8.1
Date:   Mon, 20 May 2019 08:03:19 -0700
Message-Id: <20190520150320.5DBC520856@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez (2019-05-20 07:58:54)
> On 5/20/19 16:56, Jorge Ramirez wrote:
> >=20
> > yeah, semantically confusing msm_reset_dm_count is what really matters:
> > it tells the hardware to only take n bytes (in this case only one) so
> > the others will be ignored
>=20
> um after I said this, maybe iowrite32_rep should only be applied to
> uartdm ... what do you think?
>=20

Probably. The uartdm hardware typically required words everywhere while
the pre-dm hardware didn't. It's an if condition so it should be OK.

It may be time to remove non-uartdm support from this driver
all-together. From what I recall the only devices that are upstream are
the uartdm ones, so it may be easier to just remove the legacy stuff
that nobody has tested in many years.

