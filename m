Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9D928E861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 23:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730821AbgJNV0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 17:26:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:37462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbgJNV0j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 17:26:39 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CF6521D7F;
        Wed, 14 Oct 2020 21:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602710798;
        bh=GbtiM9kXEbfKdFsmdbk27Xgl0DWs7DjCX4AXAshrDPo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Zx3uMa4aEAXw2Om53YhUvdfxhYsDtX/Y1PoydAjg5r3qqS/03zQAM8DQWD5f1U2KW
         IM/yZX0qOrjgJTHK2IO44WJL3UtOwbSqMqfpV/mWhEN5lO3fHSOf2e8x/zOxm2kKVE
         XH2ulQbVeCglQxPNeDtjlJ1PdWTI6HKZTdxFZklY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201003105653.GA117381@kroah.com>
References: <cover.1601360391.git.mchehab+huawei@kernel.org> <160167373743.310579.11803841154320142421@swboyd.mtv.corp.google.com> <20201003105653.GA117381@kroah.com>
Subject: Re: [PATCH v2 0/2] Some small cleanup/fixes for SPMI driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Wed, 14 Oct 2020 14:26:36 -0700
Message-ID: <160271079652.884498.2384315265584338952@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Greg Kroah-Hartman (2020-10-03 03:56:53)
> On Fri, Oct 02, 2020 at 02:22:17PM -0700, Stephen Boyd wrote:
> > Quoting Mauro Carvalho Chehab (2020-09-28 23:22:11)
> > > Hi Stephen,
> > >=20
> > > While double-checking against yesterday's linux-next, I noticed
> > > that those two patches weren't merge yet.=20
> > >=20
> > > As you replied to both with your Reviewed-by:, are you expecting
> > > them to be merged via someone's tree, or are you intending
> > > to merge them via your tree?
> >=20
> > Per the maintainers file I am a reviewer not a maintainer of SPMI.
> > Usually Greg applies patches here. I can collect patches and send them
> > on up if that helps.
>=20
> Who is the maintainer?  Having a "reviewer only" is confusing to
> everyone involved, as you might have someone who can review patches, but
> no one to actually merge them anywhere?
>=20
> Not a good situation :(
>=20

Ok. I can spin up an SPMI tree on kernel.org and make this change to the
MAINTAINERS file (plus whatever tree path I can make). Do you want me to
send you patches in email form as a pull request? I imagine the patch
load will be fairly low.

----8<-----
diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..3e09630455d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16338,7 +16338,7 @@ F:	Documentation/networking/device_drivers/ethernet=
/toshiba/spider_net.rst
 F:	drivers/net/ethernet/toshiba/spider_net*
=20
 SPMI SUBSYSTEM
-R:	Stephen Boyd <sboyd@kernel.org>
+M:	Stephen Boyd <sboyd@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 F:	Documentation/devicetree/bindings/spmi/
 F:	drivers/spmi/
