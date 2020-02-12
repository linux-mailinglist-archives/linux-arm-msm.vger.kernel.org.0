Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC1C15B475
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 00:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729288AbgBLXFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 18:05:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:48294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728674AbgBLXFm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 18:05:42 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 461BF21569;
        Wed, 12 Feb 2020 23:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581548741;
        bh=zoHJIVwhMASkDGemE+WVpt+ECpAdmrv/geeULqCSSvY=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=DWWpcl/5iq4RiRXmnPpX9cZGUKtz6UBHZ7rPLZRKE9egTqlI6sYVXKx7EZ/mvWXr6
         SUUAKQL7Ci+tdYeMmUdDIe86RXQ3HTaZ75IqQ8aBfkeIoSVrYy+1veJyAF8ms26sQR
         kXe8dPGwvuqV0CY3EBEUgAXhhPgDBAjrn2RVvnFE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579905147-12142-2-git-send-email-vnkgutta@codeaurora.org>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org> <1579905147-12142-2-git-send-email-vnkgutta@codeaurora.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Add RPMHCC bindings for SM8250
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jshriram@codeaurora.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, psodagud@codeaurora.org,
        robh+dt@kernel.org, tdas@codeaurora.org, tsoni@codeaurora.org,
        vinod.koul@linaro.org, vnkgutta@codeaurora.org
Date:   Wed, 12 Feb 2020 15:05:40 -0800
Message-ID: <158154874056.184098.12906798791051466643@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Venkata Narendra Kumar Gutta (2020-01-24 14:32:21)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> Add bindings and update documentation for clock rpmh driver on SM8250.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> ---

Applied to clk-next
