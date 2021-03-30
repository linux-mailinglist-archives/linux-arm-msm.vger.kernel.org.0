Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B1934DD32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 02:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhC3AqZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 20:46:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:56732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229763AbhC3AqZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 20:46:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D488961987;
        Tue, 30 Mar 2021 00:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617065185;
        bh=51KJqQT9waX5629FhQj8t3xATmC1WcOmQRRe6U6ghU8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MseyEBQpjeqZpED+CwD57ZN5jYm6+0SrEGGhHvW3fUP2SOOqDR/eh5uGZVVYpIyFq
         w+p6bLb4nb8Gy12Mh3w0n8W+mOkBSf0RHwvXlYTklGPK39tB/koAUD42qDXHB4bfHj
         wh3wraSeKTefFHqlZ9P8GLtompSgVwdp/OVlQ2MZIknOH5vitkj9tgBoFsLiVh2PKL
         RCWY/JOMTVjA2RrbMoqzUl7w2Py97EsZz5ODOliEI4DZJDMKxe+9OYn4xaQtzutx+b
         ttON/oL0fABLdBYHAO8an1kPWcL/UIdVCbtyWrYoiZCFnQ7AdYBzx0iE7PY38kB0lV
         ZigPfrPULC5bA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210327110305.3289784-3-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org> <20210327110305.3289784-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 02/25] clk: mux: provide devm_clk_hw_register_mux()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date:   Mon, 29 Mar 2021 17:46:23 -0700
Message-ID: <161706518350.3012082.6757627448543126043@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-27 04:02:42)
> Add devm_clk_hw_register_mux() - devres-managed version of
> clk_hw_register_mux().
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
