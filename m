Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7052F38AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 20:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfKGTdD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 14:33:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:39158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbfKGTdD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 14:33:03 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E50692087E;
        Thu,  7 Nov 2019 19:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573155183;
        bh=t2V/SkooUIaoThHxE9uqbgqy1lEM+6lfOL5vMVPMZJM=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=LKPsJcDboGx1XgGIUZtS67K6nX26WfDByCzENkH+K1O+fy0EzycCepEk+ri68Gqkf
         fKkFbOMwkJJjQTEbBQ29UsYr0nlZR5rv0wOQxd2hvBTAC0+bzH8dwaPaV1EWGqsSVY
         38Ji59oGFf1lBfYQJeoYVO4t2+MVrAtCbT/j5VsM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191025093332.27592-1-yuehaibing@huawei.com>
References: <20191025093332.27592-1-yuehaibing@huawei.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>, agross@kernel.org,
        mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] clk: qcom: remove unneeded semicolon
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 11:33:02 -0800
Message-Id: <20191107193302.E50692087E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting YueHaibing (2019-10-25 02:33:32)
> remove unneeded semicolon.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next

