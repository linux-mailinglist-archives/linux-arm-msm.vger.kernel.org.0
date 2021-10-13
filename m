Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC9B42CD7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhJMWMR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:12:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:42334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231229AbhJMWMQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:12:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B29861039;
        Wed, 13 Oct 2021 22:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634163013;
        bh=SyR96/qkh3mZJMjGgD+4H7RM4fsK8t9JZGJaVb7lo00=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O3lEeL/RTydm/Ac5PDPgbY+kDQMI0wW7eiB52vVVmx95qGYvYfd0welW3vc8bpI+U
         igMJmGsxxyyY2v5lm4ij6RTmSVhZO5wx7KTTVtEYip+hEfJSzqQMU8gD9BioYWNfen
         JrrqIOXjxQCCjT8pVR3v42MM9iHS+n/elxh2TetoyakYMQBRc7plDSTvASgo9rEEot
         EsvO2k8k9nvFVVHlsGkozX+wPrCY4Hx7iruyjUP/cqw+YypfVfIYp3NZkGRuD02RjI
         tARk4AvIdIlelSEUulve308ywhlX2if78gqQFPSX7w+6IggOgtDkjBEyFpx0nmPz+m
         g7Nw2gtgR+xuw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-7-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org> <20210923162645.23257-7-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 7/9] clk: qcom: gcc-msm8994: Add modem reset
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
Date:   Wed, 13 Oct 2021 15:10:11 -0700
Message-ID: <163416301196.936110.4873624693308718315@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:40)
> This will be required to support the modem.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
