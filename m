Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48DD718725C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 19:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbgCPSbX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 14:31:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:60256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732266AbgCPSbX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 14:31:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82D9D20674;
        Mon, 16 Mar 2020 18:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584383482;
        bh=6XRjGIiTxWKPSjMirq3VwVUVUVhM/8f9jqVqkT7VJlM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Zs1Oq84/0Tzg/7yIYFTDn+1NnKarlnJ16aUn3hsZwwE1QMHUrJlPOCQCw5yX4zgGa
         q+kNSMs4EPvZ3+NGoymg6EEEuat/aBy9CWVn7L8xhKdyhuvwFbOfQEFoBwSQ3BIyd8
         e1eIzO8ELDvh0vJ9SPgRb/Genw3sfGQdip8SxcwI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200314133600.183-1-ansuelsmth@gmail.com>
References: <158413140244.164562.11497203149584037524@swboyd.mtv.corp.google.com> <20200314133600.183-1-ansuelsmth@gmail.com>
Subject: Re: [RESEND PATCH] ipq806x: gcc: Added the enable regs and mask for PRNG
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Abhishek Sahu <absahu@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kumar Gala <galak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Ansuel Smith <ansuelsmth@gmail.com>, agross@kernel.org
Date:   Mon, 16 Mar 2020 11:31:21 -0700
Message-ID: <158438348176.88485.14753820783752413756@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Ansuel Smith (2020-03-14 06:36:00)
> Kernel got hanged while reading from /dev/hwrng at the
> time of PRNG clock enable

Authorship is still wrong. There should be a From: Abhishek Sahu
<absahu@codeaurora.org> line above this line.

>=20
> Fixes: 24d8fba44af3 "clk: qcom: Add support for IPQ8064's global
> clock controller (GCC)"
>=20
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---

Also, please don't send as a reply to the older versions of this patch.
It makes it harder to keep track of what is new and what isn't new and
buries it deep in a thread for me.
