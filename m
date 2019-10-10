Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45371D1F6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 06:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfJJEQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 00:16:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbfJJEQa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 00:16:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E771208C3;
        Thu, 10 Oct 2019 04:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570680989;
        bh=jkym8ovsgPYWmAnsP8E+JrX02gbHvAT96T30iEAJB0g=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=Sc+3ONYgfB0a8MfoDZHiWBzooO3m/K9COsajQpUHl+4a0KGi9ZLHoHdl6qoDFqgs7
         VSM4BWFq7mFiPsS9N6HoW2RZx6DIK6HEnMhw0V6dxhjFKc64uldBQhBfNnP7UOS2um
         QrOF+nNN4sUtSu9KET7tW9SFClzeiEgL34frJMak=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d17dad3d-d32c-b71c-0e56-d15cb246f742@codeaurora.org>
References: <20190918095018.17979-1-tdas@codeaurora.org> <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org> <20190925130346.42E0820640@mail.kernel.org> <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org> <20191001143825.CD3212054F@mail.kernel.org> <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org> <20191003160130.5A19B222D0@mail.kernel.org> <81a2fa46-a7e6-66a2-9649-009f22813c81@codeaurora.org> <20191004232022.062A1215EA@mail.kernel.org> <d17dad3d-d32c-b71c-0e56-d15cb246f742@codeaurora.org>
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
Date:   Wed, 09 Oct 2019 21:16:28 -0700
Message-Id: <20191010041629.6E771208C3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-09 02:19:39)
> Hi Stephen,
>=20
> On 10/5/2019 4:50 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-10-04 10:39:31)
> >>
> >> Could you please confirm if you are referring to update the below?
> >=20
> > I wasn't suggesting that explicitly but sure. Something like this would
> > be necessary to make clk_get() pass back a NULL pointer to the caller.
> > Does everything keep working with this change?
> >=20
>=20
> Even if I pass back NULL, I don't see it working. Please suggest how to=20
> take it forward.
>=20

Why doesn't it work?

