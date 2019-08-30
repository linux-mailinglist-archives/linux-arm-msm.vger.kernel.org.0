Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7A39A2EF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 07:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbfH3Fcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 01:32:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:38066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbfH3Fcz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 01:32:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7EE62073F;
        Fri, 30 Aug 2019 05:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567142726;
        bh=NkDEyysOoEkY5x3koc3MeykF+ujhFS2LOE/j81tDytQ=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=dfWudf5x9Qm/heJhO5v8p6XUAyLNMaJMtFPKiDvNV1PHLNZ5wH8w5BWkUBPHtwpg7
         J38VkpizTIekwzpxu/v/djZGI2tHDX5d5Fvoc972QLgvpAz04xHYoSAGpcY07fumQs
         ny7ic9UGoDHFc7DINoa7Xh/O0CrxVBiUl/KYTHWU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829200340.15498-1-jorge.ramirez-ortiz@linaro.org>
References: <20190829200340.15498-1-jorge.ramirez-ortiz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcs404: add sleep clk fixed rate oscillator
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com,
        robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 29 Aug 2019 22:25:25 -0700
Message-Id: <20190830052525.E7EE62073F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-08-29 13:03:39)
> This fixed rate clock is required for the operation of some devices
> (ie watchdog).
>=20
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

