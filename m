Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD8C357903
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhDHAVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:21:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:43246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHAVW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:21:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 116AB61159;
        Thu,  8 Apr 2021 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841272;
        bh=/jNwJuI0h1cfno4dBmqufxkPSvDs863hztsilHrgOow=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B6eYXILXoUiTA1FhdwILRelUsaFr1wGaXKs7F25wXYsqyjHqp98TObCVXptSMmjwb
         lzXvWlvQOldzC/MIVLsBjpM6vDaVbC7LyQqFSkto7df8rPKxKnNRV80Lr+N9UWhi3t
         PvrFfgN282sIao/2RFqYiODBRLcT0PTkRs/UpsieQtwWDzcZU1LL10H4WoIfaSz/O1
         2XnKzHdj7iteKelXmTSqj/P+jXoMzFFyz9NQxhs3CPoh5mQJ4lSy7vlX7gVK2/ghlV
         C27DTRAW3rRbhREkg46EE9inzXvC6UQGefBiO1nhLUBJupnRvkEJPJC6eoGtURlVjn
         68YApQuWfGpwA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210406231909.3035267-5-dmitry.baryshkov@linaro.org>
References: <20210406231909.3035267-1-dmitry.baryshkov@linaro.org> <20210406231909.3035267-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sdm845: add required clocks on the gcc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Wed, 07 Apr 2021 17:21:10 -0700
Message-ID: <161784127077.3790633.9301999496352790132@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-06 16:19:09)
> Specify input clocks to the SDM845's Global Clock Controller as required
> by the bindings.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
