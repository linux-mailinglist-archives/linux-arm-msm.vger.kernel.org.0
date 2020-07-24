Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4195022C14A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 10:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgGXIwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 04:52:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:36912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726554AbgGXIwL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 04:52:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B2F6206EB;
        Fri, 24 Jul 2020 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595580731;
        bh=TrE1VL0OobZV2RwQUsXVV4IibzHFB0SYdRSYY5qvprg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F57rV/91IIJ3/XSUjSCpkum9TE/bk5LRSshT/+z2e6iDnYuQS19yvWK8d3fkH0xAT
         rz0xcELTimQpYJn3UOzU1/hm3oo7cLBnPGGDS+5IWxfuG2BgvQs6PUmjTNwhugKPim
         vfmQM2BoaPMTXKGR+9clLmLLG1HGx5F+VPLbmS1U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200709135251.643-3-jonathan@marek.ca>
References: <20200709135251.643-1-jonathan@marek.ca> <20200709135251.643-3-jonathan@marek.ca>
Subject: Re: [PATCH v3 02/14] clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Fri, 24 Jul 2020 01:52:10 -0700
Message-ID: <159558073090.3847286.14143573907105364978@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-07-09 06:52:33)
> 0x44 isn't a register offset, it is the value that goes into CAL_L_VAL.
>=20
> Fixes: 548a909597d5 ("clk: qcom: clk-alpha-pll: Add support for Trion PLL=
s")
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-next
