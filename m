Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03AB1D3FE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 23:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgENVX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 17:23:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:47186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728035AbgENVX6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 17:23:58 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 258172065D;
        Thu, 14 May 2020 21:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589491438;
        bh=hwhB75hjGwoB/wgeS4DJZxQcWexZGFpkaxsr9BCtV/A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O2/YTlgWYT8avs1aH41fxnibiSdSFbsiwWm+6gX93a8DOFDWP+XykIzy/3WK1X7SA
         VVEBE2/rGYokj67++rz0UDem+BMQFjX91mHTAJyxbOKWN+weAXyNIVb4WwB6q7gSDU
         OIeI3DJ9rnXizpQ9i70o4R8QlanIzweT9dIvhHmM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200417070044.1376212-2-bjorn.andersson@linaro.org>
References: <20200417070044.1376212-1-bjorn.andersson@linaro.org> <20200417070044.1376212-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/4] clk: qcom: gdsc: Handle GDSC regulator supplies
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 14 May 2020 14:23:57 -0700
Message-ID: <158949143731.215346.8783756589199321663@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-04-17 00:00:41)
> Certain GDSCs, such as the GPU_GX on MSM8996, requires that the upstream
> regulator supply is powered in order to be turned on.
>=20
> It's not guaranteed that the bootloader will leave these supplies on and
> the driver core will attempt to enable any GDSCs before allowing the
> individual drivers to probe defer on the PMIC regulator driver not yet
> being present.
>=20
> So the gdsc driver needs to be made aware of supplying regulators and
> probe defer on their absence, and it needs to enable and disable the
> regulator accordingly.
>=20
> Voltage adjustments of the supplying regulator are deferred to the
> client drivers themselves.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
