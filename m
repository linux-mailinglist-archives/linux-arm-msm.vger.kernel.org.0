Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 193A040BAAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235252AbhINVpV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:45:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:46996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235227AbhINVpU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:45:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAA5A60F46;
        Tue, 14 Sep 2021 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655842;
        bh=3IpTKFXSBjSFe20nKx8nZa4WQLOW39FByQrB2ntGZL8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mEsUQtu+9MhluvTdl9nCPHzk0Ga97G7eHWYAJaE5dcCmjQt+8WBRAxbvaKKAT9HSq
         ZiLmZbTmgrW8eGU3AnRPUkQsrhaTp4BhgUgNpTZq3Z2MyaSLubRcpzwqYpR9CR24FQ
         6iZpNJYcJkjsgvhpO7hKcp1QZZHLHRSAW9KeKHY5Z67cTf26nhuEyer7LMwcLlCSBu
         7xunri1ZAOjoe9BPG8SL4d5KN5lr+CrQZ03jFE9yKBoozaEFz1BCVOfCYfniPJNoCT
         ze/X0e5UK/r9qIgvT3s5pfwDQzO9EBEntliTBrWpBWR7qxDlZ0ehCsAitj77oDWs+q
         xMWw1EkJBXCQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210911131922.387964-1-marijn.suijten@somainline.org>
References: <20210911131922.387964-1-marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 0/2] Use "ref" clocks from firmware for DSI PLL VCO parent
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 14 Sep 2021 14:44:01 -0700
Message-ID: <163165584152.763609.4056232270079096475@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-09-11 06:19:19)
> All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> global name, most of which don't exist or have been renamed.  These
> clock drivers seem to function fine without that except the 14nm driver
> for sdm6xx [1].
>=20
> At the same time all DTs provide a "ref" clock as per the requirements
> of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
> that clock to use without relying on a global clock name, so that all
> dependencies are explicitly defined in DT (the firmware) in the end.

I can take this through clk tree if it helps avoid conflicts. There are
some other patches to sdm660.c in the clk tree already.
