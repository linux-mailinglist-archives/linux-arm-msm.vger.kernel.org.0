Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A2A2273FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 02:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgGUAmL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 20:42:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:47978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbgGUAmL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 20:42:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D492B208E4;
        Tue, 21 Jul 2020 00:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595292130;
        bh=0Vzzc2WL8yErIT2TSICeVJFxNGXmGc+yQnHWxMLFDEo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OYe9rhroqRtt9lPtGJc86RXtJqbqu87hNLFWTPYdbRqk9f5ag1E4LPKgHg7O3V/W5
         6IxQ+R5Hc+M7Ntfhzqe6CQnfWBr6oRAmAY1pz3oZ4ry5F9QJwI+WJ9bO9FmkNN5LMw
         IdKdhpBx0dqekhTCmQTpvfxKS3MKadYw0E9riILI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
References: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH v6 0/5] msm8996 CPU scaling support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        robh@kernel.org, Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 20 Jul 2020 17:42:10 -0700
Message-ID: <159529213012.3847286.8807565794510072249@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Loic Poulain (2020-07-20 07:02:15)
>=20
> v6:
>     - Add Acked-by Will tag to l2 kryo accessors patch

I got this one.

>     - Fix msm8996,apcc dt binding file (errors reported by dt_binding_che=
ck)

I've already applied v5. Please send incremental patches to fix the
dt_binding_check problem.
