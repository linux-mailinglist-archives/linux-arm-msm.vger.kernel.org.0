Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3903D2F91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 00:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbhGVVcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 17:32:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:52514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231536AbhGVVcR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 17:32:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8427C60E9C;
        Thu, 22 Jul 2021 22:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626991971;
        bh=nJS9TxZk48LUjS6XEUSs3f10U77VVU1bhEqRVdXsDtE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F5dupHf7pZL8QS52sAqMikG7RxTLen5KI0F9OD5z32E+0uv+opmK4C95cpcOyBP8G
         ao+8eYgdIxG7sR1Ej0x/FErqRyJmJe+7/BMwjpr4DOzHzbuHe6byRPwyARyS6ZUx25
         CCGyOoftKje9wvQ9xNzuL4RFijquLeXQ3vjGuhYsNF9TWAhLGvk5oc4foHHekH/SkP
         OXx4hcjztKqhIyWrkH64McFJ25qKNk2HHqwugQ+NQYfOj/ACwclBzsGBHCq4YpKz7c
         z/lP34r59o1Y4gr2llLlXvfQUrvyQxhtnJ8pwiz0sy11YwO4r0wiaO3tXcq46HGziF
         0crj1smdYF1pA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
Subject: Re: [PATCH 0/2] Add support for sc7280 WPSS PIL loading
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Pillai <pillair@codeaurora.org>
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Date:   Thu, 22 Jul 2021 15:12:50 -0700
Message-ID: <162699197027.2679160.6825677812017791100@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-03-09 23:28:08)
> Add support for PIL loading of WPSS co-processor for SC7280 SOCs.
>=20
> Rakesh Pillai (2):
>   dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
>   remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS
>=20

Is this patch series going to be resent?
