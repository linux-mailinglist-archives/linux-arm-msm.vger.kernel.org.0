Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045583B5605
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 02:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbhF1AE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 20:04:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:37230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1AE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 20:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53EB9619F1;
        Mon, 28 Jun 2021 00:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624838552;
        bh=cex9UBR8tANH1+N5Lqp+EgWEV7oAAqKaKFLhstSAa1c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EaYsQiiGQNMs6OfNUuUrCiAPvHAd+HiZPHtg3F1ShjkUbGkQ7CUNratLK8opriLtP
         H6AQZozpW3PKLWyp62VDT3x8bQ5fBZzzX33XsPYC4dLej6TtgVoxfDnTZUeUR7jk7z
         r1Hx2UhFVC4+AN1pW3O0vNfP6ZXjn1QzJ6snE71VUrg8axEOfG0uq4uJgaHqTd0fYQ
         13ioEx+Ny0yDeECY5HlLrugjWQ8gVYSM9ev43Jwku8XGa9t4e8wmy5aftC0ff81WOL
         L9j6wHXVx2e1GOzLypEQHDbWg5pVCEpbY82VALffDygRCDQ7qFkGKAnxgr5TNRV8ho
         U1mWnT0hg/duQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210605104040.12960-1-bartosz.dudziak@snejp.pl>
References: <20210605104040.12960-1-bartosz.dudziak@snejp.pl>
Subject: Re: [PATCH v2] clk: qcom: smd-rpmcc: Add support for MSM8226 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 27 Jun 2021 17:02:31 -0700
Message-ID: <162483855121.3259633.18353346032569562123@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bartosz Dudziak (2021-06-05 03:40:40)
> Add compatible for rpm smd clocks, PMIC and bus clocks which are required
> on MSM8226 for clients to vote on.
>=20
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---

Applied to clk-next
