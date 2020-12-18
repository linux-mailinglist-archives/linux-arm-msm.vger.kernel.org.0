Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C888F2DEB05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Dec 2020 22:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgLRVWC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Dec 2020 16:22:02 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:34021 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgLRVWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Dec 2020 16:22:02 -0500
Received: from marcel-macbook.holtmann.net (p4fefcdf9.dip0.t-ipconnect.de [79.239.205.249])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6F417CED31;
        Fri, 18 Dec 2020 22:28:36 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Bluetooth: btqcomsmd: Fix a resource leak in error
 handling paths in the probe function
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201212094658.83861-1-christophe.jaillet@wanadoo.fr>
Date:   Fri, 18 Dec 2020 22:21:19 +0100
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        Johan Hedberg <johan.hedberg@gmail.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <53063008-8797-4395-B9D1-9D56D2D0D54C@holtmann.org>
References: <20201212094658.83861-1-christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Christophe,

> Some resource should be released in the error handling path of the probe
> function, as already done in the remove function.
> 
> The remove function was fixed in commit 5052de8deff5 ("soc: qcom: smd:
> Transition client drivers from smd to rpmsg")
> 
> Fixes: 1511cc750c3d ("Bluetooth: Introduce Qualcomm WCNSS SMD based HCI driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> drivers/bluetooth/btqcomsmd.c | 27 +++++++++++++++++++--------
> 1 file changed, 19 insertions(+), 8 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

