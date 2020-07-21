Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8F32279ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 09:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGUHyq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 03:54:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:33094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgGUHyq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 03:54:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A423920B1F;
        Tue, 21 Jul 2020 07:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595318085;
        bh=+n3MEvA174swEY1nr5PHytf8BCPKUK+lXJPb46p0iIQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rU1cU5K2H+PA1j0ib/6KOUvlhw9cIOc5rUJubv0IYDLIoQerrhuuzUQ+2kaADnitP
         r4HyqxmnAZsbpuJPtp7d1YjaNbkDAr/iciRv4LhdAF2KAnohOsBx3/hhiYUORVoqFl
         hFrJGOT8d0/JQkfh6GIdZNUwKmNrLn0BiR9i3sD0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200709135251.643-1-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca>
Subject: Re: [PATCH v3 00/14] Enable GPU for SM8150 and SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, Vinod Koul <vkoul@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 21 Jul 2020 00:54:45 -0700
Message-ID: <159531808502.3847286.3510600528777978505@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-07-09 06:52:31)
> This series adds the missing clock drivers and dts nodes to enable
> the GPU on both SM8150 and SM8250.
>=20
> Note an extra drm/msm patch [1] is required for SM8250.
>=20
> As noted by Dmitry, GMU init fails with newer firmware, needs this patch =
[2].
>=20
> [1] https://patchwork.freedesktop.org/series/78968/
> [2] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/comm=
it/?h=3Dtracking-qcomlt-sm8250&id=3D01331f2ccbe7e6c4719dbe038a5fb496db32646d

Vinod, can you test this patch series? And Taniya, can you review it?
