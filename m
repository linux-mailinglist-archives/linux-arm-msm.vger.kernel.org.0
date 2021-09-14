Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A845740B9B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 23:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234363AbhINVOl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 17:14:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234298AbhINVOk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 17:14:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 894A9610D1;
        Tue, 14 Sep 2021 21:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631654002;
        bh=7HE77BXEi8gZJx5D5W1KRYRzBxiyfZmcZVuVI3cDdZo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rAQU2mMJ1Q7/yfgtA5H+wMnmxNfTWLwzvHsPfZPfwtHZFkTM8PtoQ0w0iNrYUZpsP
         BWkC31E0wD/wROa1k6pJIyPH8uXNJTsNyxQRkpRhEQ3CJYK6gd8xc7a3WOMwfC2aLt
         J0/Ge4yxeofKqMry48WHKVdzOS1bX7o74G0H4NzDnbbn9ws/OqNZ428z+tJLUOI8IG
         AvW5wJv0Gc9SzgVcfOs5j9TZXxUzZA4ZZ9BUnBwurptEdqTNDZ94nsgA45aIgjovqz
         EVWNOhgqafVKxnu/+83bPLzYjJnqb/93/H/5Itw3U7nHaRIju0DVqc+Z2TY/tBtG7T
         D3rAT8SSCyprQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829204822.289829-5-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org> <20210829204822.289829-5-marijn.suijten@somainline.org>
Subject: Re: [PATCH 4/4] clk: qcom: gpucc-sdm660: Remove fallback to global clock names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 14 Sep 2021 14:13:20 -0700
Message-ID: <163165400096.763609.16224534023728394535@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-08-29 13:48:22)
> The necessary clocks for this driver are already fully specified in
> sdm630 DT under the .fw_name, and do not need an implicit fallback to
> their global name.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
