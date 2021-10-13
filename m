Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95AC42CD79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhJMWML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:12:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:42202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231220AbhJMWMK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:12:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80B90610E7;
        Wed, 13 Oct 2021 22:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634163006;
        bh=/ENKXzOCTJvOLVDsweC/+/d7Z7DLaSpRQ1KWOsPlYHU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gTtdhsPd4rzhWgVLjF6i1kuc5dKKG9LIpeD1KSHKuoT5vyVfDDJKMENOE/pDZH/bk
         554fwPaa8rAqfLqK3odnwdq3IVVkLixoTr8YiWCxoZBcYD44CNxg3lTyWRfesvMfAk
         8lxc2HaFR3MalP4HCxftCLtJJfrybQrNp8KSXmiOmZHI6ESyUOgbTnnEwGiDSaqw5S
         gC0Kfixa4xwM7JNjO3JOciz9xMursG6fHKdBXktnAiO09XejjNyS/C6rAROFyiQMJ5
         Qkk0SpeYdSKx+pkIzxSjoJDwXompZ6Vx8u/Y8lp04SCdBg2zHnzV3giQ4c1DoMxTZQ
         Ltz+HZ4XqOVMg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210923162645.23257-6-konrad.dybcio@somainline.org>
References: <20210923162645.23257-1-konrad.dybcio@somainline.org> <20210923162645.23257-6-konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 6/9] clk: qcom: gcc-msm8994: Remove the inexistent GDSC_PCIE
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 13 Oct 2021 15:10:05 -0700
Message-ID: <163416300531.936110.11932940418063695463@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-09-23 09:26:39)
> This GDSC is not present on msm8994.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
