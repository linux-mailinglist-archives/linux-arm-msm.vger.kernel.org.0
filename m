Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A584CC670
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 01:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731499AbfJDXUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 19:20:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:59404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729968AbfJDXUW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 19:20:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 062A1215EA;
        Fri,  4 Oct 2019 23:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570231222;
        bh=A5i8cqapG27X5CHR55uoln6f4Z8Ed6VwY+A+u+ziJww=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=givZ0GXYjhduIcQxPjQTRzJcSnxBRYpsC/B5MkadCkE1HVWkvQxfiOIxTdzVvHC3D
         8Bu2sVKod2Oz2nj6WjjNHVNSHUlnP5qmyCtfckh9yyb2qRWGfsBVox6FXxHw5UlDBF
         XDVSkcKstVMokIOdRZgg9aE3ouqiDQecDJOkTMF4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <81a2fa46-a7e6-66a2-9649-009f22813c81@codeaurora.org>
References: <20190918095018.17979-1-tdas@codeaurora.org> <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org> <20190924231223.9012C207FD@mail.kernel.org> <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org> <20190925130346.42E0820640@mail.kernel.org> <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org> <20191001143825.CD3212054F@mail.kernel.org> <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org> <20191003160130.5A19B222D0@mail.kernel.org> <81a2fa46-a7e6-66a2-9649-009f22813c81@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC) driver for SC7180
User-Agent: alot/0.8.1
Date:   Fri, 04 Oct 2019 16:20:21 -0700
Message-Id: <20191004232022.062A1215EA@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-04 10:39:31)
> Hi Stephen,
>=20
> On 10/3/2019 9:31 PM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-10-03 03:31:15)
> >> Hi Stephen,
> >>
> >> On 10/1/2019 8:08 PM, Stephen Boyd wrote:
> >>>
> >>> Why do you want to keep them critical and registered? I'm suggesting
> >>> that any clk that is marked critical and doesn't have a parent should
> >>> instead become a register write in probe to turn the clk on.
> >>>
> >> Sure, let me do a one-time enable from probe for the clocks which
> >> doesn't have a parent.
> >> But I would now have to educate the clients of these clocks to remove
> >> using them.
> >>
> >=20
> > If anyone is using these clks we can return NULL from the provider for
> > the specifier so that we indicate there isn't support for them in the
> > kernel. At least I hope that code path still works given all the recent
> > changes to clk_get().
> >=20
>=20
> Could you please confirm if you are referring to update the below?

I wasn't suggesting that explicitly but sure. Something like this would
be necessary to make clk_get() pass back a NULL pointer to the caller.
Does everything keep working with this change?

