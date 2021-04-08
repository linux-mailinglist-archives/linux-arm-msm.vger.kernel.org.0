Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307CA3578E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhDHARN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:17:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHARM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B8F061178;
        Thu,  8 Apr 2021 00:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841022;
        bh=XnhoEGAZ+6T38D5/YGISSeojtmFxZPksjeDHnRAwAm0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TDOwAqn66VTxcyCtbRoIP4hqn5qKqzxVj66Hqu3a57y8daitraqOI66MUvXvhON1q
         olYpcYAp8eGxhTqgrftNEKinUn9LbDOwwMBCeTjWMOXMV+2Rkk2b9zozDFSL93wIRp
         mXmXTSUWEqmF2MZQd2hKoyes4LjBHtnSMYWh8lVYVI8zIC2KuMBDLh3o7eqfsv/KQx
         qzBX/JWQupEQb47v/9Q+Ws9oO1MMfqdD0tJwsg71tlO+gkdZJMH+ajOiL8B1GES/Ub
         basu2Yuni272I0SWEHcjAyIzcK+SLZcesRGN3xlLfCj4+a8ABNpbh8LbhNSFq+ZBT3
         MEVng5L0zXc/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-24-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-24-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 23/33] clk: qcom: gcc-sm8250: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:01 -0700
Message-ID: <161784102128.3790633.2356562776249158357@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:33)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
