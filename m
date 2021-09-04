Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5AAB400B21
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Sep 2021 13:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351522AbhIDLGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Sep 2021 07:06:53 -0400
Received: from relay03.th.seeweb.it ([5.144.164.164]:34663 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351516AbhIDLGw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Sep 2021 07:06:52 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 562DE1F70E;
        Sat,  4 Sep 2021 13:05:50 +0200 (CEST)
Date:   Sat, 4 Sep 2021 13:05:49 +0200
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
Subject: Re: [PATCH v2 03/11] interconnect: sdm660: drop default/unused values
Message-ID: <20210904110549.7sonfny7n6ahu7r5@Marijn-Arch-PC.localdomain>
References: <20210903232421.1384199-1-dmitry.baryshkov@linaro.org>
 <20210903232421.1384199-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903232421.1384199-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-04 02:24:13, Dmitry Baryshkov wrote:
> Simplify qnode setup by removing unused/default values.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested on Sony Xperia XA2 Ultra (sdm630-discovery)

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
