Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F82831A8F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 01:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbhBMArJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 19:47:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:56996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229693AbhBMArI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 19:47:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02B2A64E02;
        Sat, 13 Feb 2021 00:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613177188;
        bh=Ma2H2ZMsfg0W/faOIZ3WFa6wdkaoXA9Bfy3yWgfgwuc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UUI8cY11Z1ujGtE4elCjYx/J5P1SNjTFwBdIK+aheeMZnczF3ZlqJcCCRz/ex2T/z
         N0d068K5nEEJAo2wyCGNoAJk7Nq5qQOs1B8gODalz8S3NWkxqSNRVIdgChGn9yyXRY
         UTOJZUItvRPTYpaHFAeX8Zn0CL1yxh9b7cwT1Qzy5mHGItSsv7lClopP5TrLUmfp47
         UnC0pXzwdImfAin5dQvzzqlzctgok1qCjk73mPB5TAnOk9NHHAYdsKpbZXe5VZ7Qyb
         ICOw53C9ybT/kWflRqsw2x1Ojc9ZnrScsGOuQOtFi+DOiQjDf993KQaevHe7gh6VlY
         EKByq807D8UhQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612977230-11566-3-git-send-email-tdas@codeaurora.org>
References: <1612977230-11566-1-git-send-email-tdas@codeaurora.org> <1612977230-11566-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/2] clk: qcom: rpmh: Add support for RPMH clocks on SC7280
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 12 Feb 2021 16:46:26 -0800
Message-ID: <161317718687.1254594.11939549942850659627@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-02-10 09:13:50)
> Add support for RPMH clocks on SC7280 SoCs.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
