Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3D185946
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 06:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbfHHEae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 00:30:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbfHHEad (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 00:30:33 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BD9D21743;
        Thu,  8 Aug 2019 04:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565238633;
        bh=KziBHQM/r4QxGqFOVk7uWWQmyQbgi25T2WSKc1JhNMQ=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=avGNB5dd1RkjtwY7HTGMb3n5cF/9S1H7Ck6ZjFMyu/AHthVKUepYLSh9u4ck3O0E1
         GhOD4Gucjp7U5G6Qm1cbLBUVC6Tm+nYuP6jZsE7JFxd7gYwkt8Htl+o+hcMfkv52OY
         Ee88rbzVZidJMBbNz45YuvUnVCH/UOGdrRzMkKLw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190722074348.29582-3-vkoul@kernel.org>
References: <20190722074348.29582-1-vkoul@kernel.org> <20190722074348.29582-3-vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 2/5] clk: qcom: clk-alpha-pll: Remove post_div_table checks
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 21:30:32 -0700
Message-Id: <20190808043033.2BD9D21743@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-07-22 00:43:45)
> We want users to code properly and fix the post_div_table missing and
> not rely on core to check. So remove the post_div_table check.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next

