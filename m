Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5260913069D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2020 08:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgAEH0c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Jan 2020 02:26:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:47622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgAEH0b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Jan 2020 02:26:31 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7C1F21775;
        Sun,  5 Jan 2020 07:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578209191;
        bh=pXmk4pgSFsqM39qJ0rnmFFQwRJk0u6VSodiUqZ3Wrws=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=iVHgQgo72LZsXb8prGcpuf/xpxdn9zdUXQf5hR3G+SajfE57LRpA45hO8Pf8g4RgT
         c5aRcFd00KNgp6iz4YG67M610Bxm6UgnAvqw8BlBdsG3OTWBOI8D8FMsA9Lf54wG05
         lQO11oePEIJ8Va7eU4dFdzKZejkVx9HCp5JGLZM4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1577428714-17766-7-git-send-email-tdas@codeaurora.org>
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org> <1577428714-17766-7-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 6/6] clk: qcom: Add video clock controller driver for SC7180
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 04 Jan 2020 23:26:30 -0800
Message-Id: <20200105072630.D7C1F21775@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-12-26 22:38:34)
> Add support for the video clock controller found on SC7180
> based devices. This would allow video drivers to probe
> and control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

