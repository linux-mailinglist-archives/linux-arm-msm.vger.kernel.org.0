Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D2142CE46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbhJMWf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:35:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:51368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231501AbhJMWfZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:35:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB70660E78;
        Wed, 13 Oct 2021 22:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634164402;
        bh=pGe9Ih4UUgR/4mt8SdRU+IwibASPDZOUR/mFwBasfSQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=D7155HEq6NW930Rgt6Q9XQqLH/Fq1t4EObi9txBqd1mA3EHDHDJUyvhiu1fWD6lHW
         J/HjhOJkx9RPw+8BDCuPr5SvDigJOXeZS6hpnqzw4AjWbHG3dzRNTgDp2hBkC42opP
         kNuCphiUNiQHEXzfgv7HrTX2gVS3J2tpy7cR4n+KEnRvcpvEEoRlum3aWYnfDcA5hW
         gj90fIvqIXEAF0QQmvMisxVKCRuW19DFIvRTYeQhE8Qs/J3IxyMevwv7hzipWNzt43
         o8Nv20Ez5pHKDyllE58MKyRHZZEq+GCYHWQUEwRAzwxS2jLMgRc7UqfclCI3a7jTWg
         Q4qYzVoKzJ45g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1633567425-11953-2-git-send-email-tdas@codeaurora.org>
References: <1633567425-11953-1-git-send-email-tdas@codeaurora.org> <1633567425-11953-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/2] clk: qcom: camcc: Add camera clock controller driver for SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 13 Oct 2021 15:33:20 -0700
Message-ID: <163416440084.936110.13404843355831043689@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-10-06 17:43:45)
> Add support for the camera clock controller found on SC7280 based
> devices.
> This would allow camera drivers to probe and control their clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
