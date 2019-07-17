Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD3A6C1DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2019 22:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbfGQUJA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jul 2019 16:09:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:53200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbfGQUJA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jul 2019 16:09:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B655320880;
        Wed, 17 Jul 2019 20:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563394138;
        bh=FUl5oq5OLvGQbM0JREz7A+G6Gvt+zNX0Xe4vIIy0EJ8=;
        h=In-Reply-To:References:Subject:To:From:Date:From;
        b=tNPd9orqIA8RDTL00I+EhptK09h/kV4IRaoaLxwv3Gz7IIGp5GOcUehVAAt3dsBJe
         diE8IDrWJ5U1dXv71OgGUAjhTkqcQasmsux2mDtRhYDaNU7BaXz6N9iGKxaau1E2HO
         aA9dDRIjSVVKs846AtLVmdalf3h+bkpPTGdA6a+8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1562859668-14209-7-git-send-email-gokulsri@codeaurora.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org> <1562859668-14209-7-git-send-email-gokulsri@codeaurora.org>
Subject: Re: [PATCH 06/12] dt-bindings: clock: qcom: Add reset for WCSSAON
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org, devicetree@vger.kernel.org,
        gokulsri@codeaurora.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 17 Jul 2019 13:08:57 -0700
Message-Id: <20190717200858.B655320880@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Gokul Sriram Palanisamy (2019-07-11 08:41:02)
> Add binding for WCSSAON reset required for Q6v5 reset on IPQ8074 SoC.
>=20
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

