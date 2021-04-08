Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7AB358E6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 22:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbhDHUar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 16:30:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231897AbhDHUar (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 16:30:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EC0361159;
        Thu,  8 Apr 2021 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617913833;
        bh=J464dW0AKWMholSo1mjYDCNx096zmLCksHQ0LL/pQBc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sqV00UvbPo40W7FCMs6d+SrLnJD1arFSp0D3+CFTnIw7C7uMSnTK5aQ8khrFEPQBZ
         JcfgAGOhZJqhOIQc7o4B3WlR7q4BNvOC0+BOTLqYVYz6Q/JnIvMBGug5biRlbTAjzr
         kLpynLEpAO0vsW7xfZtbuPNSmX4BQliItwfEL4Qdcm7jEQDURjaY+FbPKHlYM0VhEF
         GVxGcntBxsNUkvccUL6zcnWRs50Jv+obOrXZ7XjoFtwn2X9LMEckMWwmRKew0nPMwr
         OINjslNg0HXyhDOaTQCUpLMA/5bmPMnAC1VeLEJ227IYQMZd3UJ4OnIU9fuC8LCH/E
         hMNCdT1PMzw/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210408135509.208921-1-clare.chenhui@huawei.com>
References: <20210408135509.208921-1-clare.chenhui@huawei.com>
Subject: Re: [PATCH -next] clk: qcom: Add missing MODULE_DEVICE_TABLE
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Chen Hui <clare.chenhui@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com
Date:   Thu, 08 Apr 2021 13:30:31 -0700
Message-ID: <161791383177.3790633.17835417455437133606@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Chen Hui (2021-04-08 06:55:09)
> Add missing MODULE_DEVICE_TABLE entries to support module autoloading,
> as these drivers can be compiled as external modules.
>=20
> Signed-off-by: Chen Hui <clare.chenhui@huawei.com>

Any fixes tag?
