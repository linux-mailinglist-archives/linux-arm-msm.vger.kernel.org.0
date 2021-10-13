Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1681C42CD80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhJMWMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:12:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:42460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231223AbhJMWMX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:12:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3E05610FE;
        Wed, 13 Oct 2021 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634163019;
        bh=xHyUgCyrHzK7POkCLQIsezCDmmu/utKR8BIGbsFHzrY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HLqONRDrGzQB9q7qViO+47O4IjHWprVw0DsTdZoQhlBiIxg4lMPUANskaou2bMiJv
         cHg+LAlJ1xW2H2S6Cfhs2HkH8k5CPcgfloTW/H6KfjtgbXOEnlo5ti/uomT7US9mwR
         wM0pyZEBAN1tLAZig0tcav9oRFfA6Ow+mjTIqAwHJ7fjYrZn8O2dOSu6qyb6wBZgqO
         if0pXlPFdtBB+UDKJQe3tV5Ip4feZD/cMOTRmKszn5IAOhB3i1T3WyGXwiRs3iLjgh
         IazxGm8UH9Gb1/462mtVQBhp16PctFKQIF7LqCIeV8EIxFIpalraNyXXyrhvDricQU
         X8s90c0vZrrDA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-8-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org> <20210923162645.23257-8-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 8/9] clk: qcom: gcc-msm8994: Add proper msm8992 support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 13 Oct 2021 15:10:18 -0700
Message-ID: <163416301873.936110.13341261000793759064@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:41)
> MSM8992 is a cut-down version of MSM8994, featuring
> largely the same hardware.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
