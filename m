Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E831036F400
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 04:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhD3CWA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 22:22:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:43676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229577AbhD3CV7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 22:21:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70B24613EE;
        Fri, 30 Apr 2021 02:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619749272;
        bh=ai/sj/47LFXF31eZSRetrDDH+VBnWkLmpdNbx7cy0kM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EoyLj6kLG/1nlo2L2O+xYbiTMuQ92j2snnXPguTYeX6Sy+wECS2U7lp/vk9hSNb0k
         yKX5ENpmHW4Mzcqz0ObHBxg7NQfPf8fS5LQbIXEpGixMVTcFOA9oHOHx36Hkl25VF+
         OX64XjT4Y4/ev8xIy3zoMRA9mLfFEhlS5f/3WCtXRym5ZCMxBbULTMpTD2wJJ0GMY4
         EVu0j4c/HxqxQt3DfzXIjd3jvRz2aI/aaf6ivXQgE/U2kWDZlxVY8nldEdbKDK/6C8
         gYmTV/bKEEgkVA+vEGtQIjSZ8oSHZFvDC++wxJ1dyFXJWVSl6koWW87FPfluhr0FIP
         h/qXncpVFzq3Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ed64fe46-361b-5bf9-88a6-d35cac2c98e7@codeaurora.org>
References: <1619334502-9880-1-git-send-email-tdas@codeaurora.org> <161956919717.177949.9925740807826300314@swboyd.mtv.corp.google.com> <ed64fe46-361b-5bf9-88a6-d35cac2c98e7@codeaurora.org>
Subject: Re: [PATCH v3] Add support for duty-cycle for RCG
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 29 Apr 2021 19:21:11 -0700
Message-ID: <161974927117.177949.8019204674384480875@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-04-28 23:55:16)
> Thank you for your review.
>=20
> On 4/28/2021 5:49 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2021-04-25 00:08:21)
> >> The root clock generators with MND divider has the capability to suppo=
rt
> >> change in duty-cycle by updating the 'D'. Add the clock ops which would
> >> check all the boundary conditions and enable setting the desired duty-=
cycle
> >> as per the consumer.
> >>
> >> [v3]
> >>    * Implement clockops for get_duty_cycle.
> >>    * Return -EINVAL for Non-MND or HID RCGs.
> >=20
> > We don't need cover letters for single patches. Please add these details
> > after the dash before the diffstat on the single patch.
> >=20
>=20
> Sure Stephen, will take care from next time. Let me know in case I need=20
> to re-submit the patch again.
>=20

Don't think so. Merge window is open so I'll apply it in another week.
