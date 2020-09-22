Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B5127482C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 20:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIVSeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 14:34:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgIVSeB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 14:34:01 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C45702065D;
        Tue, 22 Sep 2020 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600799640;
        bh=4+RV/uwNfuWjZ1pZHiQHtquWOdcsLIjpw1TDpWu6liU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oQd3FDM4HEmVIEZHbm8BLTNNnV2hEGLA8gjE/uwb4bp0odlWqhTT7pXUhSr8Krbly
         vR/gsiV+xWNKLelcxSQRhx6lFegaVB+osUegV7rOeTZ0KmkieBccDZyK0O8o9QBW/9
         bmXtLTi6xA84YgMmRKG+9TosWVULX/mxtwsg8iAg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200922120909.97203-1-konradybcio@gmail.com>
References: <20200922120909.97203-1-konradybcio@gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Fix wrong parent_map
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 22 Sep 2020 11:33:59 -0700
Message-ID: <160079963957.310579.17971187414769458107@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Can you send your patch To: somebody?

Quoting Konrad Dybcio (2020-09-22 05:09:09)
> This was likely overlooked while porting the driver upstream.
>=20
> Reported-by: Pavel Dubrova <pashadubrova@gmail.com>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Any Fixes tag?
