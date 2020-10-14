Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B890028D7E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730883AbgJNBRn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:17:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:39914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727197AbgJNBRn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:17:43 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5F2B207DE;
        Wed, 14 Oct 2020 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602638263;
        bh=OFLxz2K16rlpf7flO0WrYWjNiVhzc+e+6FuvVakk+NE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Nv20jJwNNkoWajuc9RZLhbxKN5LbopWY3sI9Qu7NjWZWj6LT19LWNR6l6N4r2xzvv
         wo0xOVm/1ZGFXGgtSb785XHjgBR8YXgo3rCr/zd0aYgSw9aLxAmFUyq6/Sv0CGnv0n
         kbJiAI2HxOkSEyaKCzXgUrSEQKcRiXnBllkEZ0vc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200923160635.28370-5-jonathan@marek.ca>
References: <20200923160635.28370-1-jonathan@marek.ca> <20200923160635.28370-5-jonathan@marek.ca>
Subject: Re: [PATCH v3 4/5] clk: qcom: add video clock controller driver for SM8150
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 13 Oct 2020 18:17:41 -0700
Message-ID: <160263826171.310579.17807183827310814176@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-23 09:06:30)
> Add support for the video clock controller found on SM8150 based devices.
>=20
> Derived from the downstream driver.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Applied to clk-next
