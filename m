Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0017E400B1B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Sep 2021 13:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351479AbhIDLGP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Sep 2021 07:06:15 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:39409 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351516AbhIDLGP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Sep 2021 07:06:15 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 787DF1F73A;
        Sat,  4 Sep 2021 13:05:12 +0200 (CEST)
Date:   Sat, 4 Sep 2021 13:05:11 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 02/11] interconnect: sdm660: expand DEFINE_QNODE macros
Message-ID: <20210904110511.3y4gi3lmnqlitsya@Marijn-Arch-PC.localdomain>
References: <20210903232421.1384199-1-dmitry.baryshkov@linaro.org>
 <20210903232421.1384199-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903232421.1384199-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-04 02:24:12, Dmitry Baryshkov wrote:
> Expand DEFINE_QNODE macros, which with an addition of QoS become an ugly
> beast with tons of different arguments. While we are at it also move
> links lists to separate arrays.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested on Sony Xperia XA2 Ultra (sdm630-discovery)

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
