Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1917C58D3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 23:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF0Vhm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jun 2019 17:37:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfF0Vhm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jun 2019 17:37:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BEFD2075E;
        Thu, 27 Jun 2019 21:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561671461;
        bh=BhvTO9iM0Nsao/9cTaXxE5CBmVbZ+tgky6uuV5SvCsw=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=sIh+t5btWI1aeDdEsYnXH/Z10Zp3bKUsTsPdQIzYHZJxOUprvI6BjYUqs3/GCxOf2
         iYn53O4dAW8ENyJ0DXdirvejozK7cLnmPjsdezvumYPsbIsZfM/KXglFdOf20hvmEg
         6umpGCJHhIgeDvTKssKsEbVRh8oPz7J7aOLsjHS8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190625063140.17106-2-vkoul@kernel.org>
References: <20190625063140.17106-1-vkoul@kernel.org> <20190625063140.17106-2-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] clk: qcom: clk-alpha-pll: Remove post_div_table checks
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 14:37:40 -0700
Message-Id: <20190627213741.5BEFD2075E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-06-24 23:31:38)
> We want users to code properly and fix the post_div_table missing and
> not reply on core to check. So remove the post_div_table check.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

This doesn't apply. Not sure why. Can you please format-patch with
--base=3D so I can know what baseline commit you've based your patches on?
Helps me avoid needing to ask, like right now.

