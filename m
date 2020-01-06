Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612F2131653
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 17:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgAFQyh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 11:54:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:47402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgAFQyh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 11:54:37 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7BAEA2072E;
        Mon,  6 Jan 2020 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578329676;
        bh=VOZmbv6UuRrLujw9PaioNCpfbWjCJx7E/FufkilNBko=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=YRVXPiAt/DyhNi2ixJx1afoDUaj/6OlfFeZpWGDClM0FrQobUp9gCXVbVPWuwmHAa
         l1iXMrZWcosdCjFdMqGAq5KwmGOsM5hIGmN0P4tkyZ6jvwgkg1Pp8MqgLXHGVvvR9W
         dLzPEA+ymnlFWsp17I3sXv9rq0qjRTWseOhiN3y8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1578305923-29125-3-git-send-email-tdas@codeaurora.org>
References: <1578305923-29125-1-git-send-email-tdas@codeaurora.org> <1578305923-29125-3-git-send-email-tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: rpmh: Add IPA clock for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 06 Jan 2020 08:54:35 -0800
Message-Id: <20200106165436.7BAEA2072E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-01-06 02:18:43)
> The Qualcomm IP Accelerator (IPA) clock resource that is managed by the B=
CM is
> required by the IPA driver in order to scale its core clock.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

