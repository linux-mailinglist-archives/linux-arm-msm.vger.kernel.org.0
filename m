Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D1D3982C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 09:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhFBHRV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 03:17:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:51624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230228AbhFBHRU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 03:17:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A0F861363;
        Wed,  2 Jun 2021 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622618138;
        bh=1nF2GL4/fVIcPgYJ/kudShgEr5oC5wCkl7EGY7Z8DFs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MPQY8JQ5cHi/PAz5vFwoYnHyQs051pWhnVe589jfgcqp8soCVDVeiHEkMuH4AnbBh
         XYp2EKu+FKxodxOyRH/M4FLBHJnlt1bw1paP5m4NNuWQ6348/rygH36r6cMACpl+Vq
         ZLIH92zWiQS+uNKupYLzUR1X32kzHEFkeJGVvBYvlhB8CqfNj7Y/yA9NSUY2CVj6xE
         uHq3k80PCrOAwYpZ4+76bv/Mxq0M7IxpXEG32FbrocL8YnLqfD6dry+UVtpB0X5VED
         HUojF9pmwIz5iYUMK+2Zx+R1xIRGqQcEbERUVTSeTjYg6zYh+k5UKKmMwH9CQllGVC
         WBIuCbOnCb29Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210524225456.398817-1-konrad.dybcio@somainline.org>
References: <20210524225456.398817-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] clk: qcom: smd-rpm: Switch to parent_data
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
Date:   Wed, 02 Jun 2021 00:15:37 -0700
Message-ID: <162261813700.4130789.16304848178022148628@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-05-24 15:54:55)
> Switch to parent_data and with that fix the longstanding issue where
> if there wasn't a clock precisely named "xo_board", rpmcc would not play
> along well. This started to show lately when "xo_board" was being changed=
 to
> "xo-board" so as to align with DTS naming spec.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---

Applied to clk-next
