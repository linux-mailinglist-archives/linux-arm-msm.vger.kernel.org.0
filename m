Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4ADB28D81B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgJNBpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:45:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgJNBpO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:45:14 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABAC221D7B;
        Wed, 14 Oct 2020 01:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602639913;
        bh=xoVbLNzovx3K0pfFbOL/HHB0smvkQSozYRwebCNyDk0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hNVvia6qcLr2415w4e6BKVE/PIASPCi8OKwP7bSruYotdneHNHr40qlIvEVqo8MKQ
         5gpVCPxvcC3dnHVWFh6g2QV5n4xj8nS1sjGlDfcCswQwlFnhIBP3ImvO0+i2zEphpZ
         Lh70GCB/6InazIBger0K3g6/bxvyxhzqQEeRpmMg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
References: <20200925103115.15191-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/4] clk: qcom : add sm8250 LPASS GFM drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Tue, 13 Oct 2020 18:45:12 -0700
Message-ID: <160263991247.310579.116180302037536226@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivas Kandagatla (2020-09-25 03:31:11)
> This patchset adds support for GFM Muxes found in LPASS
> (Low Power Audio SubSystem) IP in Audio Clock Controller
> and Always ON clock controller.
>=20
> Clocks derived from these muxes are consumed by LPASS Digital Codec.
> Currently the driver for Audio and Always ON clock controller only
> supports GFM Muxes, however it should be easy to add more clock
> support when required
>=20
> Changes since v1:
>  -removed unnecessary Kconfig dependencies
>  - cleaned up header includes.
>  - moved to using pm_clk
>  - Moved to right place in Makefile
>  - moved to use module_platform_driver instead of builtin_platform_driver
>  - add null check for of_device_get_match_data=20
>=20
> verified dt_binding_check to pass on linux next https://paste.ubuntu.com/=
p/6nVzjRwvsW/

Rob's bot complained again. Can you run with

  make DT_SCHEMA_FILES=3D<path to schema file.yaml> dt_binding_check

and make sure the schema is up to date?
