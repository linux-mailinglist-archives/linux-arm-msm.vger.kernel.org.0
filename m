Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC06269F34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 00:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731925AbfGOWwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 18:52:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:56302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731510AbfGOWwl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 18:52:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F126620665;
        Mon, 15 Jul 2019 22:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563231160;
        bh=1Tv2lt5v3Y0Qf8wz/fgSxttQYEZD5OiJ0zOQIc32Jk0=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=ELmv38xHz4/F/65m2ju5eCjgKYsMesb7V+H5rXWvAGfBPH5j1FsH3Zm5CAvycj620
         3mBZOmz1EGzJTSYaJTZ/pF7u0NX/b+bKaP9u/beMzBdXdoThufFoebFyfLcTBt6RQ5
         /ZEGIaUT9fX1NAqiXsEDg98jjJPzvHN59d8WUgOE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1557339895-21952-2-git-send-email-tdas@codeaurora.org>
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org> <1557339895-21952-2-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/3] clk: qcom: rcg: Return failure for RCG update
User-Agent: alot/0.8.1
Date:   Mon, 15 Jul 2019 15:52:39 -0700
Message-Id: <20190715225239.F126620665@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-05-08 11:24:53)
> In case of update config failure, return -EBUSY, so that consumers could
> handle the failure gracefully.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

