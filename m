Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6F442CD63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhJMWL0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:11:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:41400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230142AbhJMWLZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:11:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 229B0610CF;
        Wed, 13 Oct 2021 22:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634162962;
        bh=eHCSz6m9p8VBeP1Fc64wmbF00PZridKyFYWbVYHrvqw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CKqNxgfdPmaezavJ6+gi4+bub6vkQ51HVYr2wlY2kknwmiUps9ADHibh0oEx2aOmr
         ZaUBqWQlFjZDt8n2XVIGVOHIwIgNTi9zErAuy+iQPJC5CoOoHPI4MIdRiviJNWJIdw
         oeTUqYqXVUcnvNYmiaT6OQqhLfLxrA+sFV9Br5g7z81hTKJ+DlYLofEaIV6Cdk2+Jp
         FXRdtnZFdqF3UxnI9KaLLu0EGlCJktPJsxr0F33GNCuQh11puJVd/4FeX+rT88A37E
         Tp0uOTpIJ51QrwnnZ5bUGMB2d56b48CamccwiGNUTqhT6ull/OrusTZePzM3DbLjoZ
         8Hf/YQsgZmfnQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-1-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: clk: qcom: Add bindings for MSM8994 GCC driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 13 Oct 2021 15:09:20 -0700
Message-ID: <163416296096.936110.1157816048811382134@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:34)
> Add documentation for the MSM8994 GCC driver. While at it, retire its
> compatible from the old, everyone-get-in-here file.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
