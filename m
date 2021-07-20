Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF883D03A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 23:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhGTU2X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 16:28:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233182AbhGTUWC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 16:22:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E6DC610A0;
        Tue, 20 Jul 2021 21:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626814959;
        bh=J0Z4DHV4n2QmspyYL0WjE5JY6nTCY+xRsOK+PY6V0oU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RHiDpIMe/9oRJI+I5CC9xL1lLGCkjLSI8yltKk2WExA6ABv+DjTKU4zeclw6Gd9J1
         t0SW+AqQ5dOHWX2GI1YB326oRhnpiDVOLzun6VV81ethESzuSbzLJY14S97CQbDnMP
         sNfkAav5Xlya3pH65tvNlJdiHWrzP5NOQM4gc5RFgPPDkmiR70SLV9DuocqBUzXJ2H
         mQu4Ir68WLxPdErbhuUKCj1V7/FZRgsJaOIz+u5kexPkb24DzNPS27gt/0pIlSeolq
         L+JQgxlhcJFGL7jekeeB2OylvgXslIsUEm9yGlchOiDAW71oRy5tAShK7vR2tMwLsL
         TQVdx+WwsEQig==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1626189143-12957-3-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org> <1626189143-12957-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: Add SC7280 DISPCC clock binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 20 Jul 2021 14:02:38 -0700
Message-ID: <162681495843.2679160.12369265830930027273@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-07-13 08:12:18)
> Add device tree bindings for display clock controller subsystem for
> Qualcomm Technology Inc's SC7280 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
