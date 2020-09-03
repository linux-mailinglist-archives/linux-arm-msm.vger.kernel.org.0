Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609D925B981
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 06:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgICEAW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 00:00:22 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:55131 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725919AbgICEAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 00:00:19 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 63ED45C01DE;
        Thu,  3 Sep 2020 00:00:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 03 Sep 2020 00:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=uqR1cgSeYmys9318Brf3VDOyr7
        tVz0rUsRyqpo86SAQ=; b=OYCMtJ338DOKcpvTZEErWdjRjF3A/PTia/BXX/nkfh
        mzYu5kI21YKN3WeaNHdQrREuh7xhGKc8wXoXo/Vjhr08t2twlHL6yTFG1kjJiYkc
        8mYrrP7UlOccMGfGXqbl65Tg7SSIt0+OoIwkk4uTrS4oQOt3jFJoCaXPQ+p086Gb
        kPoZlk4abAeP0g4PVM0LVtWcEaq7xcedoUGZuXXeCftYtBNDz9fLAxaPVSv2hkoQ
        YPJ8WwQFaQaZiOgiM/cy1TiPCArxMbQLaxNi2A/wfdNvSKknOK3SXgT+RMB/TQSX
        qdkmtjZXUdIlq3qVs2DAGSjbF42WqE2MQUdQf1WVvYgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uqR1cgSeYmys9318B
        rf3VDOyr7tVz0rUsRyqpo86SAQ=; b=J8vToR7OP3IyXq5mJI9/j8+cwGk24lHom
        h6toLO1izrGCIh3NlkuWX4DAhqTVS/NWHuZSQa0V+YtnmlEbrgFJI7gYDSGIbIZF
        DuY7j1gaOhqyhReuAJ6nz7epvb5a5W61+QTY9XIAlnK/SK0ZKG/VrOmgqqYdZy7K
        EWi3nDqmsw5+pBTwRwFwjFuC+lU2qNVubDYdmC6rdhg9vGYbMZAl2rK4CiNFV9Ag
        Waqbd+aHS5g/ogEpvfbNOK/9SBRXUce0n79yXi1UnMGZBxOsEMhXtncHHr0KBH0P
        +A534O4WpctSzExK27UkJ5IonHR777SLQ7SSQXEOBuTOEilKn91Ug==
X-ME-Sender: <xms:UWpQX5rmxNvDg3IxRnnvAfFMu0QBeArZ2PZCbnMTjub6hFgVnbDDhA>
    <xme:UWpQX7qn8uPW_yrFOzDA_VUbOuqsu2S8ah7athKy4XuWAeKoxvfjt54304ckI3rP_
    9euBYT6XVwd7Q-8Ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpedvffeijeeivdfgjefgtedutdelkefhuedttdeugeeiteefvddvfeduheei
    udetleenucffohhmrghinhepshhpihhnihgtshdrnhgvthdpkhgvrhhnvghlrdhorhhgne
    cukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:UWpQX2Pe2vMQEswq2mHfB55nOXq7ktcgrDqvGE5B-GuUf31kF81Oww>
    <xmx:UWpQX04OJZrVDaUqerAy7IBuaaRXT9ItFYr8q_yDAQ6eFV_jixe4TA>
    <xmx:UWpQX47vzPw2w8Gv6_MtsBah1tthJIZC_HJ3Ahcc_N5bOz6k8mrlYA>
    <xmx:UmpQX1smAUC_-SebPONK1QkrAszTcIam1bG_d0ga5rg6mW4kWyHMOw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8F38830600B4;
        Thu,  3 Sep 2020 00:00:16 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH RESEND 0/2] Common protected-clocks implementation
Date:   Wed,  2 Sep 2020 23:00:13 -0500
Message-Id: <20200903040015.5627-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stephen, Maxime,

You previously asked me to implement the protected-clocks property in a
driver-independent way:

https://www.spinics.net/lists/arm-kernel/msg753832.html

I provided an implementation 6 months ago, which I am resending now:

https://patchwork.kernel.org/patch/11398629/

Do you have any comments on it?

Thanks,
Samuel

Samuel Holland (2):
  clk: Implement protected-clocks for all OF clock providers
  Revert "clk: qcom: Support 'protected-clocks' property"

 drivers/clk/clk-conf.c    | 54 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk.c         | 31 ++++++++++++++++++++++
 drivers/clk/clk.h         |  2 ++
 drivers/clk/qcom/common.c | 18 -------------
 4 files changed, 87 insertions(+), 18 deletions(-)

-- 
2.26.2

