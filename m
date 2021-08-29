Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20753FA890
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 06:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhH2EFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 00:05:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229461AbhH2EFo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 00:05:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB14660E94;
        Sun, 29 Aug 2021 04:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209893;
        bh=0uL6F6jRq2IqpmuvqQzg2xxWRG8Hq/wDjCaVk4XjfOs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FD8V/OhYuvgCuTGM7BkraLj/O5ZdtL61YuAZAc1/85uDjW0xvyLLbqB266rnYZ0eL
         +EnPYtYUCDLEDjTiTIDa8gcK4wADlQVlwXILP6ydV/UfGU4nNSja2O5h4vpmluBr2P
         mD6HCyTpPJyDm2gqe0rWINolxLFCFsv8ujF0yxBS7WiKFeLXUpONqDRejiyIIGA08F
         5H/uDdSOu47z2HMqm1cvYB31fT5cwwNjf6htGWeYEZ3ehizf4lH1XLNQRhWvHWCHXV
         PySrcIUVw6SCltUvEOritSK6BL8//PnSv7QtVM/hSLVTRQbSpvxDcSFaet3/hvLD0N
         ZXzeoLnp3CtMg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210820203624.232268-2-konrad.dybcio@somainline.org>
References: <20210820203624.232268-1-konrad.dybcio@somainline.org> <20210820203624.232268-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add SM6350 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Sat, 28 Aug 2021 21:04:51 -0700
Message-ID: <163020989173.2676726.10261124443987612765@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-08-20 13:36:23)
> Add device tree bindings for global clock controller on SM6350 SoC.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
