Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2927F3D03A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 23:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235504AbhGTU23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 16:28:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:56518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229887AbhGTUWY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 16:22:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DE3E610CC;
        Tue, 20 Jul 2021 21:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626814982;
        bh=nU3Q98eKKTVbBIJmjwymH4v+GdzqvaK368pjfDDkD+Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lXinCvv1m+FuF1G8EyUJ/1ShLdirRI+NGrXqfgghINwN5KybESBD8YqoOy2NfdqCX
         rLdbPBUYiXncr9vFMMvE62/Rmn5+WAtABb/39oiqxkB81NGuKSTodRkbg5vZRxL1Q1
         0QVZLUDti1BUixWR+RN8O/UbXxR+8o6HiAYhL+lM4chgEyRZ7d99mKEuqMeAfEzpNy
         ruM6+Tv2+UxJhMOpk93VEVdU6H9OZ2uDtqwehuv7VLL6iyQmFW3jqsgtl2pwo7UZbC
         GkDE9YuIQEs7W0P6XfKR4jOqr8vYGRlrBtza09FaNw/CC4EaLn1uAz2Y5u2PQUXxEm
         gN07myiKHvR1Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1626189143-12957-7-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org> <1626189143-12957-7-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: clock: Add SC7280 VideoCC clock binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 20 Jul 2021 14:03:01 -0700
Message-ID: <162681498102.2679160.5347078476306227193@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-07-13 08:12:22)
> Add device tree bindings for video clock subsystem clock
> controller for Qualcomm Technology Inc's SC7280 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
