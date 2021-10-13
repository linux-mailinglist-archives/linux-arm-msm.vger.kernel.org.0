Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C21142CD71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhJMWL4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:11:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231200AbhJMWLz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:11:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1F4E610CF;
        Wed, 13 Oct 2021 22:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634162992;
        bh=ALpr/gITzg9Gv5BCBuVIykGKAOkvgRV1x6upf8MB8YI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=e2MtGFGFhOkyHHBAI+aKbtC7PveMWCYRYoD89JJ7ND9CcmimxKDWS6xKDJ+dTzTlO
         tvP/A3tXjjXoERNfXjFTCEF/QeWcs5IlnAh7Usv2FCZv7SlHZ/9gTrCVWdWZAyoGVA
         cXoy099bWp2GMIHTGFoGpQPlelby9tOUsfd0NdkAPlKs+MEWRnntAIyIWYJAxmok0d
         G3DNHf9zuLzHvbnGudcNmeotF5whPTFb7yrRfQubxeaYPd81VzXiuXFxaEajRAwYVT
         wZljfRqruRAn0FZTEC8r9GBpKx0wnnzgEDFxvCCe8aUcvMym4e3bUg5bjdsN2NHFz8
         Zva9nJVygADcQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-4-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org> <20210923162645.23257-4-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 4/9] clk: qcom: gcc-msm8994: Add missing NoC clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 13 Oct 2021 15:09:50 -0700
Message-ID: <163416299086.936110.15282577286077846707@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:37)
> Add necessary NoC clocks to provide frequency sources for
> relevant branch clocks.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
