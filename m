Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19583FA862
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 05:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbhH2DxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 23:53:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:58744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233468AbhH2DxO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 23:53:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6998A60F35;
        Sun, 29 Aug 2021 03:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209143;
        bh=8ULAh0AUqm5KyHOdgbD4AZgKbYQEKMTERkTsmn2toSc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jnD5BzWbDiMqvNRt8sJp70hX45Z5uCduP7+1aGuwsAmIg6hTaBpspjDcY9l8Xp2Rb
         Lo43FE/JoAXDglW62oiWEXcdTOnacLQPd66Y2tkW3IfUd5Vm+qEINxZOax3t/9NW7m
         /6cDr8JbgtntbPSLcOJzbCmJuNmvBZFyLX+jVfUw83Q2YTJ/VyKqQZomvHs4wWLEBC
         d1v/QyXEx4I+R7Z5cNW2LQOgkTHWMVGpqKueWZbVuprlW7ifkZW3fqMYbLqwnK5fIu
         UBAEc2dt0RMwnPfv5ePdYm29dvyhRS7YvLuSxJjcV5cZGy7Mozv1CZe79ELC8ThB+A
         prQ5gr9xfK0dw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210618111435.595689-2-konrad.dybcio@somainline.org>
References: <20210618111435.595689-1-konrad.dybcio@somainline.org> <20210618111435.595689-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v3 2/3] clk: qcom: Add msm8994 MMCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Sat, 28 Aug 2021 20:52:22 -0700
Message-ID: <163020914229.2218116.2262099312947690552@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-06-18 04:14:33)
> Add a driver for managing MultiMedia SubSystem clocks on msm8994
> and its derivatives.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
