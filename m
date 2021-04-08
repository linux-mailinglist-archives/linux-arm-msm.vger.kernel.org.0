Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06603578BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhDHAO6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:14:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:41834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAO6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:14:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD13261178;
        Thu,  8 Apr 2021 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840887;
        bh=CjcNotMzAiS7nsA/+J8t5DiGnGSCGc0vKPJ5V7H3OL4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sdQ8CCXuMnWbf2lOcvrCm7DaoxmNZjBS+isp4ySmAW2CCXoDceSUQ83RHZvEHhWTu
         fHVdD8WVpijjOurkKuRhH9kws5XWPbc/Kwz+Y6B2xnehhcWX6BT03vjPcq+kmq5Rmq
         1SnBU10EYVmvXN+V++Z/Z0jVWRg+whPK5MfPk46Ga69kEi6hWThysDtA+yG1hpKK3R
         4CvS4+7MZEbOssHS24bMZ0r4Y4NChHDkJu2aBuBLThWkG2ZtTza3KIl4llGNLzBUq1
         UrwXjtCRWTyBGvvMsxRWtjlUokdIjlg9zXl9hyxGrqBupQVMy7npyVQZ1Xdqxh1uSr
         yKsfX+GkleshQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-3-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 02/33] clk: qcom: dispcc-sm8250: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:14:46 -0700
Message-ID: <161784088671.3790633.15887980841687498824@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:12)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
