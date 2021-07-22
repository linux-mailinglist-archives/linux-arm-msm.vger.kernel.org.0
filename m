Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D38C3D2FDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 00:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232270AbhGVVzQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 17:55:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231596AbhGVVzQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 17:55:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9474260EB1;
        Thu, 22 Jul 2021 22:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626993350;
        bh=pAOChHzb5VdA38qEsJrosw7Pn3TEGqD7aEAcHBmyyes=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lzNhrDpu31WYXY7zTn0ADIy1OBdG4bnNLqNJdE7XhTlpNJugM1AED5VSb/ztGchoh
         ItdmLjhskh+ZwUcKU/fwUysMbo0ezIxTc+iWkCA/nI1nDILZpAL/YmZc0gTNmJ1sCm
         PGJRYNJDxPgLPDAzv/AlP5nS+krntvHvASc743ElRZW0DrmntDlvscZDcI5Apu35d7
         Id3wTP+5ByWNuIu3kaSPdtLkq8cOunRsgRXz/q6Ogyb9OOpSmOjYqTd9RT1j3HyB4Q
         ZTO3ikxeh/TjRqAPwDVsT6v+WxCeLOPsdWOQx512XseKwvFZeiRx7Ew7Ob8B5MREQA
         xut43MC19V7mQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210412170334.GA3971998@robh.at.kernel.org>
References: <1617969272-10246-1-git-send-email-tdas@codeaurora.org> <20210412170334.GA3971998@robh.at.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette =?utf-8?q?=C2=A0?= <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Rob Herring <robh@kernel.org>, Taniya Das <tdas@codeaurora.org>
Date:   Thu, 22 Jul 2021 15:35:49 -0700
Message-ID: <162699334935.2679160.11857227952683943994@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Herring (2021-04-12 10:03:34)
> On Fri, Apr 09, 2021 at 05:24:31PM +0530, Taniya Das wrote:
> > diff --git a/include/dt-bindings/clock/qcom,lpass-sc7280.h b/include/dt=
-bindings/clock/qcom,lpass-sc7280.h
> > new file mode 100644
> > index 0000000..a259463
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/qcom,lpass-sc7280.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>=20
> What about non-GPL OS users?
>=20

Taniya, are you resending this one too?
