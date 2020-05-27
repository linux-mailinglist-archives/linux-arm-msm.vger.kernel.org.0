Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12301E3616
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 05:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387411AbgE0DB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 23:01:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:51362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgE0DB0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 23:01:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D083207CB;
        Wed, 27 May 2020 03:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590548486;
        bh=umyG6sQpmywyi63pKwNaEjnZU46ZZSzyIpRghYMHNFA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OGjNRWWk5H6jd6nnJwIv2ZNsRdDUwwpdOgIm7jODFD5qFCHzn7md2jtrVsZvbMhL0
         nZqw6yk9rpASscC+/FIAQmRPbfdCh9GmXgLv5w4qrgiOlLXCQy3R3560oTos1EmUIG
         VvKc/sgIU5Q/H8v/uHZZr9U333kOeTIm4xFKaut0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200501205728.152048-3-konradybcio@gmail.com>
References: <20200501205728.152048-1-konradybcio@gmail.com> <20200501205728.152048-3-konradybcio@gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: soc: qcom: Document MSM8936 SMD RPM compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl
Date:   Tue, 26 May 2020 20:01:25 -0700
Message-ID: <159054848534.88029.16458151480427335324@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2020-05-01 13:57:28)
> From: Vincent Knecht <vincent.knecht@mailoo.org>
>=20
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

Applied to clk-next
