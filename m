Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4034B3578F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhDHARp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:17:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:42774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHARp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53A0F61178;
        Thu,  8 Apr 2021 00:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841055;
        bh=7vleHCJpfPv8JFOUPXaBNNtB2Q6Cb/9c327Qzb5oPAw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uJJeAMhQAEbDNU9GIeF1FSjd+4LpmzIbpQG/JyIuD+6FK+/MGgGkiHOIMJoSfQGRp
         a3dG8/8badQacHEPiIPty2NqED8AMl+QMUZ/oRpgyi+J5ezQiazgWCJT9BSMZfeevU
         CX2aEZgDVGnRLwGJQApbpb+viYrli7pvnHqAdqIlV/e2uhL2Z36M2Ca7WrV3gWgmHE
         FhgiE9pUpdqDht+n2H4iAhcCkWBLcHPjRqFNG6CKGf42nLKHaUQlHde+GQRxOPMktw
         7dc++9o8dyBlTKws+1E9TNmiDsiT/WZl51V84s/2peIR68yAbWfiVKZ1xmnge1N1F6
         gdMIUZzuiYfCg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-29-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-29-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 28/33] clk: qcom: videocc-sm8250: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:34 -0700
Message-ID: <161784105422.3790633.14698878401245214264@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:38)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
