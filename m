Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCDF8F3A27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfKGVLd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:11:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:45886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbfKGVLd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:11:33 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67BD520869;
        Thu,  7 Nov 2019 21:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573161092;
        bh=cyyNnznsZ2VTX91hnUs9mFGiygvXaCLNw5qOYVbMP+M=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=n2T/Y6RVUrii886yZ1xh+D3F7Nh07nbYwkgPFz9gXtyEM6zL7YrSov5UtZCcKU4y8
         ClIpEnSH+RhjiPwwFUQ1laJgx2mes5fTZ0d1tuGCTVoDCJsa/dhMSXgMwzLZcIuYKB
         jP733dsL+4jD+3Dp6s+wdhhPr7Zuh0BwRA5EjIxM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191014102308.27441-3-tdas@codeaurora.org>
References: <20191014102308.27441-1-tdas@codeaurora.org> <20191014102308.27441-3-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v4 2/5] clk: qcom: common: Return NULL from clk_hw OF provider
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:11:31 -0800
Message-Id: <20191107211132.67BD520869@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-14 03:23:05)
> Return NULL in the cases where the clk_hw is not registered with the
> clock provider, but the clock consumer still requests for a clock id.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

