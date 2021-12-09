Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B50246E3D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 09:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbhLIIPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 03:15:23 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:48106 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbhLIIPX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 03:15:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D4BC0CE24F4;
        Thu,  9 Dec 2021 08:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FC7C004DD;
        Thu,  9 Dec 2021 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639037507;
        bh=zlJsiU8C/gOSrJLjUkTpTr88nUTCi+r+VdBnK5U6PkQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HSTWRaLQ3lqnafhD1fJsdHiolxHPmg4w8S+8M8Vwweovtpw9ErpEaQYOxYB05iQN0
         bFPlIv/Ae9GWirZWl8FMlBwpVtvugRtGAGi2OzvcupS7FO2DVzLo/Upty2YRPpNYeA
         jjrTCgwkRteZ9MiAshNU3RMOYtRaNgRTkR8uj7bHWzPel9kfqQWv2EOEDjkmrVtO9Z
         RjU1qZwt8RkUByWv9PFi262tqjF35zOuisXUDsDrDt91atIvqen5g89HepPcLSTko+
         lgF7BqSd20h9f2GSp3/Jq7awsOh8KgIUHoUS16hnc2eFAB/AUm1lWUs0Sw4OJHuofw
         31Z9d6TQTnXHg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208175430.1333594-8-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org> <20211208175430.1333594-8-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 07/11] clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 09 Dec 2021 00:11:45 -0800
User-Agent: alot/0.9.1
Message-Id: <20211209081146.F0FC7C004DD@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-12-08 09:54:26)
> If all parents are specified as clk_hw, we can use parent_hws instead of
> parent_data.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
