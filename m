Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4CF42E58B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbhJOA6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:58:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233550AbhJOA6H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:58:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0839611C5;
        Fri, 15 Oct 2021 00:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634259361;
        bh=DduKWATmm0Y0dvPS/3ZTin2c10YX7Z5BYUtUO7Xc6YU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Qwy123twW/38jobkfNluUC+ey4Wx0BmJpc5HNYV4ZpBa0RCiLm1tjmI6zjozBYP6i
         D7VPlWyv7ii8Cu6qJOVIHMnswES5gekvqYo/z/x7DMpdenB6Yxbirz/Ttz16ILAVw/
         DDBnV0fDUfgTAegp9yfPOpd1dH9cTPUTj5xx0DPX5pq9H3DZVNdl4IMsCJ5AjdhxpI
         Zra+H9tPQm8tL0ijvC6JGI2GVNEc0dr7kqe/VVj+2wLs4rQczWBlHYYjGNutXpgoZB
         t50fE09SJzNsiyPFGjhNur+NnpAQbDrgIoQ+ewr5Hc5bCso/Vb5lJbFPIU/IJxh97x
         maiTIECuBjEZQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829154757.784699-3-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org> <20210829154757.784699-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7 2/8] dt-bindings: clock: qcom,videocc: add mmcx power domain
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 14 Oct 2021 17:56:00 -0700
Message-ID: <163425936062.1688384.10238808458119854221@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-08-29 08:47:51)
> On sm8250 videocc requires MMCX power domain to be powered up before
> clock controller's registers become available. For now sm8250 was using
> external regulator driven by the power domain to describe this
> relationship. Switch into specifying power-domain and required opp-state
> directly.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
