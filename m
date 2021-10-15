Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AFF42FD28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 22:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243021AbhJOVAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 17:00:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:33880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233527AbhJOVAq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 17:00:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70B8D611C8;
        Fri, 15 Oct 2021 20:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634331519;
        bh=dnhU3wtRX7bT2bq9tiHUtMnhaK6NX1drdYaHmI6czC0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ewbBplKerg8taL0KlCahYh9/akFDTqPSg8vTR4ISXNdghQktA/zMYhJvetI3SSTiR
         nRFx/RgiIqr5mEs0S4NMswOamMCkK1Xrw4y6ItMFpbm3ndUUtpYYsTYg7Tj2GtZuLk
         gQjuPc8tHPyxZp+r3aeyIVgLkxuMHWS1I0vyUIBsEPxsIuxshpUrjymKaaCvcNQdDZ
         NHCAv25DiuKpbGyhu3vnxzmU8pBYJ86WnvzKRNPwGajeSQLLm9EEd8ytO0SY+wS/YS
         GhtCeXHRng3Ce+b9n2pPCkvFqjfVWpCexuBypvwU7zkL01Bd/lV8pQbeS91oxsEArz
         RrOqzqfRfNtTw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
References: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date:   Fri, 15 Oct 2021 13:58:38 -0700
Message-ID: <163433151821.1688384.7720591539857708126@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-10-14 14:42:21)
> Stop using legacy clock names (with _clk suffix) for HDMI and HDMI PHY
> device tree nodes.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
