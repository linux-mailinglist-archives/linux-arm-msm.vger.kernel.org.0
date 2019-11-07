Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED01F3A23
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfKGVL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:11:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:45724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbfKGVL3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:11:29 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC26820869;
        Thu,  7 Nov 2019 21:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573161088;
        bh=gqfDfrBnuQo+Z0mKDvJgEmduNsQSfl0fa6i3Yyq/oTM=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=e95Pv5qsUcRTsMOAv/RrDINlnv8VDglS0sUGW0z4CPRc3LXVsk9pN7eXyANqba8Rx
         lJf2Pxz/OfHK7+CNZQnUSmePybr8ucuKme9fImLFZt3/9n9LGsf6HJiNzsvKbgyelx
         vrA9giSMo11+pHDl6PIz0mQ7jS0QprigXZQ1OVKA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191014102308.27441-2-tdas@codeaurora.org>
References: <20191014102308.27441-1-tdas@codeaurora.org> <20191014102308.27441-2-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v4 1/5] clk: qcom: rcg: update the DFS macro for RCG
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:11:27 -0800
Message-Id: <20191107211128.AC26820869@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-14 03:23:04)
> Update the init data name for each of the dynamic frequency switch
> controlled clock associated with the RCG clock name, so that it can be
> generated as per the hardware plan. Thus update the macro accordingly.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

