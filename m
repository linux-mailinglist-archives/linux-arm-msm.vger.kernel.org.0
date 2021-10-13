Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77A342CDDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhJMW1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:27:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:47496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231417AbhJMW0l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:26:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CC5A610CC;
        Wed, 13 Oct 2021 22:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634163877;
        bh=uA86BLXuMHR5jGshcvAydQgUQ57YM0pu+Q+PaPX6zMA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Mt7Isyev1i7WxwaIcHhSnGW8dG10Q5+fkIaOwnSChOWDP7SRTvxPzglQIzBUd+AOd
         N9zR1a+cNzoQKzVS640YVa7UlIagHG+Z5VvSkpQ9YyH5IbfKdE49GG4GH70zrRNHNm
         rxN5SSY6yJl96u9dFgu2JUEkpzQzWVO05JxR+Irc7ce1Dzw8A7SoL/HK3SWT3LwJKI
         63HphtA02lFXKVsYIQ+wa2a1GybzODx3WReLsz2zgsKwujQpunvBXyqGwTouGAgRrK
         FpWLaNCbKGbokI8bcY0k9xD2uwUk+RtpCP3mcT7RpLkGMgSy7GJVZ6NsN0kuM9eikS
         c56Q+VuvjQYQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1633484416-27852-2-git-send-email-tdas@codeaurora.org>
References: <1633484416-27852-1-git-send-email-tdas@codeaurora.org> <1633484416-27852-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 13 Oct 2021 15:24:35 -0700
Message-ID: <163416387594.936110.8636853145382386100@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-10-05 18:40:15)
> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of gener=
ic
> properties that are needed in a device tree. Add the LPASS clock IDs for
> LPASS PIL client to request for the clocks.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
