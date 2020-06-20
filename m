Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694BF201FC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 04:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731792AbgFTC0o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 22:26:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:51700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731772AbgFTC0o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 22:26:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FD9A22DA7;
        Sat, 20 Jun 2020 02:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592620003;
        bh=XyQRSgZK7Hy/N3rTtel5X2W9AMQrj2c4MSd9bF6kaF4=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=OsjiYIhvl9qI7IbEaX7uMPFzZJYny1CHAStIzZN4c0TBfognrTgV6Hc/xTGEgr+5+
         mJW3TdtSpkxILBUkh1iC8Pl3l9X6HLqFsylBPV9nKQigst69OL8hT3VSbbj95ETiQQ
         x2uZtJgMFcu8EXWkodya8LW1CAQ9wJlpa2nitiw8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1591440907-20021-4-git-send-email-sivaprak@codeaurora.org>
References: <1591440907-20021-1-git-send-email-sivaprak@codeaurora.org> <1591440907-20021-4-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V7 3/4] clk: qcom: Add DT bindings for ipq6018 apss clock controller
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org,
        sivaprak@codeaurora.org
Date:   Fri, 19 Jun 2020 19:26:42 -0700
Message-ID: <159262000293.62212.11609056599995521360@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-06-06 03:55:06)
> Add dt-binding for ipq6018 apss clock controller
>=20
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---

Please pick up Rob's tag when resending this.
