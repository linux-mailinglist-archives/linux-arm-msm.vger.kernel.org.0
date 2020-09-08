Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72872262206
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 23:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgIHVl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 17:41:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbgIHVl2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 17:41:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B66620759;
        Tue,  8 Sep 2020 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599601287;
        bh=yqVXwTfivLiGaQNirAdsTNu0RrcFPS4TRluVtIzQWlI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cIc2Y5rhPerVJiX8+oMEoSaPRWckEKKETETUBg9tlWzgKIbls/dfOM/H9fBaS7oF7
         5/m92B9F46BE/2cYyP59+iCZqbUyxfAR8rmzCiE6W0hRrr9hRpQ8l4KW0JJb8CLLYP
         U3PxBwsTg5Iqa9avLvIy3XmJDchr0UaXaOC9HHWU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1599584848-15530-1-git-send-email-tdas@codeaurora.org>
References: <1599584848-15530-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 0/3] Add Camera clock controller driver for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 08 Sep 2020 14:41:26 -0700
Message-ID: <159960128642.454335.17145528250119232852@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-09-08 10:07:25)
> [v1]
>  * Add support for Agera PLL which is used in the camera clock controller.
>=20
>  * Add driver support for camera clock controller for SC7180 and also
>    update device tree bindings for the various clocks supported in the
>    clock controller.

I got duplicate patches in my inbox. Is something broken on the
codeaurora server?
