Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95EB4129CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 03:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfLXCQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 21:16:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:48254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbfLXCQh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 21:16:37 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF47E20643;
        Tue, 24 Dec 2019 02:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577153796;
        bh=Xl1sl6qPOVuQHTaphbCgGtQrDI9M8MqK9eJ5gq7yL7g=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=mfmJvbEY/K1nmfa3j6qBL+0BM8/Y7DP+64wSIsLWY5un1ffy2ROeiF8kQDe7COrEF
         G7QWKlmjCpHp/0kzJMoc+EbVzlzQcw+6zDDauEYCp2cI3hh2bgADo5JDu2oU6CGEoc
         MyA4h0lqPxvzwSIIrYU77piEW9vGZ0kAB8+A6RMs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191220175616.3wdslb7hm773zb22@flawful.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org> <20191125135910.679310-8-niklas.cassel@linaro.org> <20191219062339.DC0DE21582@mail.kernel.org> <20191220175616.3wdslb7hm773zb22@flawful.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
To:     Niklas Cassel <nks@flawful.org>
Subject: Re: [PATCH v3 7/7] clk: qcom: apcs-msm8916: use clk_parent_data to specify the parent
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 18:16:35 -0800
Message-Id: <20191224021636.CF47E20643@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Niklas Cassel (2019-12-20 09:56:16)
> On Wed, Dec 18, 2019 at 10:23:39PM -0800, Stephen Boyd wrote:
> > This is odd. The clks could be registered with of_clk_hw_register() but
> > then we lose the device provider information. Maybe we should search up
> > one level to the parent node and if that has a DT node but the
> > clk controller device doesn't we should use that instead?
>=20
> Hello Stephen,
>=20
> Having this in the clk core is totally fine with me,
> since it solves my problem.
>=20
> Will you cook up a patch, or do you want me to do it?
>=20

Can you try the patch I appended to my previous mail? I can write
something up more proper later this week.

