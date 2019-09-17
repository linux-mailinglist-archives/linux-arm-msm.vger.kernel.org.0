Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77116B52BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 18:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfIQQQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 12:16:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:51028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbfIQQQN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 12:16:13 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDBE921907;
        Tue, 17 Sep 2019 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568736972;
        bh=cNPH8Z1UxHn6Kcj+GfcbFfpHSm85B3uQ9pAaeBPeeyA=;
        h=In-Reply-To:References:To:From:Subject:Date:From;
        b=H8jA5SLH/qVPIFoP5DjUCwlZFCYwP34cNEgPWO01JuIhdCHbfAjm1Hup0Tn2E9lkZ
         xkV/NOYklPFwwDbevcp65zCS2nnKiJb+p1qi+MDpJPuM7parEA+0tggvaDp9b9hAIu
         dV/0b9uJ3ZrT73mt3UHfHzaqZR9YSwL2XeVB5CHo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1568375771-22933-7-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org> <1568375771-22933-7-git-send-email-gokulsri@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        gokulsri@codeaurora.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com,
        nprakash@codeaurora.org, ohad@wizery.com, robh+dt@kernel.org,
        sricharan@codeaurora.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 06/12] dt-bindings: clock: qcom: Add reset for WCSSAON
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 09:16:11 -0700
Message-Id: <20190917161612.CDBE921907@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Gokul Sriram Palanisamy (2019-09-13 04:56:05)
> Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.
>=20
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

