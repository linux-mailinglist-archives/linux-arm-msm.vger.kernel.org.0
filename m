Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26663E2133
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 03:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243281AbhHFBsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 21:48:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243276AbhHFBsx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 21:48:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A2D460EB9;
        Fri,  6 Aug 2021 01:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628214518;
        bh=4yY2f3P6xCyFtufN8S21ZwHcak1iKypQJ0UMXKwRhiA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NHUXrlKxekVWI8G12lBjc57nUYMEQS0AgGWO2fw15UMR1HNeU2jtx85A69UCYOfLY
         sTrx+fFvSSZGsnXWyqnPdbR+4OmE9TNeIW9eTBy0ZI8QWqZsvNtbIV71lmRrZQlW0v
         7pnMbB0FM8R0qut3HT6QAP6ZfPkaZoMs+noIPv9vLEF8uuILZZSopJTnWSGAXtIA9F
         2cJ27bwuMnJAQtiUBfKbf8+U4Kepa6WRY1Dcsl8QFMrsEsTo+0Dkm3RFI5gd2UlpTU
         DtQ3VAqIz1Svf22VIzdugdLJtNVWDrr4W7aL2Sqa8eBiy3V+57azGg5/M3kV25EA7r
         MzPzSp5rdhUcg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210805222400.39027-2-konrad.dybcio@somainline.org>
References: <20210805222400.39027-1-konrad.dybcio@somainline.org> <20210805222400.39027-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/2] clk: qcom: smd-rpm: Add mdm9607 clocks
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
Date:   Thu, 05 Aug 2021 18:48:37 -0700
Message-ID: <162821451725.19113.16747598174750272797@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-08-05 15:24:00)
> Add support for RPM-managed clocks on the MDM9607 platform.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
