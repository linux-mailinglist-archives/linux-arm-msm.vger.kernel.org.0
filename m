Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2E370EDE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 08:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239721AbjEXGgt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 02:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239704AbjEXGgs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 02:36:48 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942D71A2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 23:36:41 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id EE14F5C0271;
        Wed, 24 May 2023 02:36:40 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 24 May 2023 02:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1684910200; x=1684996600; bh=91
        5suAEeXe825eovY24TQkPIUR8OuODqtLgTUVs+xw0=; b=TlIOtNSfsdoHoXJuOS
        8fz4qIYtnBWdUNozHAeZ1svgJrnFZyaFD638wGTIca2Wq/dUtBhpCdq4rA9mmOzo
        8QeL65ihvucXMBCuZysQHW49jNJD1uC2ikahf3VHOHOgv6su2s0L8lOW/cuDVsSS
        ca7NZx9gytut67IrNf3WieKd1A5S2dUOs/LG1xJwWRhXS3RIi78Psns9D+S1iblY
        D45pqDnhfyyGNfUh7EdItxHNcxWmL5G+OKyMXjvP1h4lzGDI6Aa5aTLqDcSVbNfU
        FdxAl1vysy1+mwsxXggXQRuRhjG5/qF/KJ67PL+u2EJfK3v7Pc5x6x7g5vAN7+mc
        prZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1684910200; x=1684996600; bh=915suAEeXe825
        eovY24TQkPIUR8OuODqtLgTUVs+xw0=; b=nxiP+H2uDP3JLKhfeu3ZisQ+t5u5C
        9VoUq652VQGb+qwruuGSEu9Nk0YgkuX+pD1HLBKRcCQ6sAkgTbqrK7oj+iOMZw+t
        4Tc23qT/WCM6mfkq7mEKnpwYODrZRT8MpOWswwQZ9iYBB7zutH5BmEO1+u5fitNT
        yu28lPoARfyBv7yy02HH1onpUAzvCeLVNaesSDi0PxEti2zxucxThS6c4skjAs53
        pu/kldnEr5ZX9kbT0RJl8BALwBcH8wGvhrn44S5DH6VIwJ+a6PlZbc+PEiBgbpA+
        hzAq0RcB3yCtcs2Bj+wnQUfO0UpGLRcQIaRB0Bhfy50EZwbJ1qO5kp9UA==
X-ME-Sender: <xms:eLBtZKP6X5XbiZmbDXuUzN5kQ0crVY-XDp9DUE4ghKxG5Sq3NKcmTA>
    <xme:eLBtZI9FRoVh7QS0qig0RHbKX1BMNwD-2vtqG-kkWArBrWOQ9STbnYg1v4Nrw3b0a
    mvKjd6I_sjIZ-vm-PM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejgedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:eLBtZBRwnvrxyB3OCUT6CeQkpN0WXruRMo19h2PSt_z2t4fD0Lm1lA>
    <xmx:eLBtZKsce_0QYgEZ5pC1vIWEiDA9vT-yJoy6DPN_So_YxY7ofxsGkA>
    <xmx:eLBtZCebFH3AKJx1wbwwtTJR4a8CwH6oTKB5lCagkvazKkZE2uu3xA>
    <xmx:eLBtZPHd2jKR9uBJagVaUwJZ1aWcpF1vxPOV8oE4mqM1Gm5ashesiQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B0BD8B60086; Wed, 24 May 2023 02:36:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <179b8c7e-d355-4051-beb4-ac44808bdaaf@app.fastmail.com>
In-Reply-To: <bacae75a-6030-ff8b-179f-7d662140bae7@linaro.org>
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
 <20230523165411.1136102-4-vladimir.zapolskiy@linaro.org>
 <21baf481-347f-d4b1-87df-833ed16cb729@linaro.org>
 <bacae75a-6030-ff8b-179f-7d662140bae7@linaro.org>
Date:   Wed, 24 May 2023 08:36:20 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        "Bjorn Andersson" <quic_bjorande@quicinc.com>
Cc:     "Will Deacon" <will@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: defconfig: Build interconnect driver for QCM2290
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 23, 2023, at 23:11, Dmitry Baryshkov wrote:
> On 23/05/2023 20:30, Konrad Dybcio wrote:
>> 
>> 
>> On 23.05.2023 18:54, Vladimir Zapolskiy wrote:
>>> Build Qualcomm QCM2290 interconnect driver.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>> Do we know why some are =y and some are =m?
>> 
>> I'm for =y either way, if we can.
>
> I think this might change from platform to platform. What is the 
> condition for selecting 'y' or 'm' for the core drivers? Is it 'should 
> boot to rootfs without modules' or 'should boot to UART and load initrd 
> without modules' ?

I think we are a bit inconsistent here. I'm generally fine taking
changes that are required to boot into rootfs without initramfs,
but would like everything else to be loadable modules.

Android tends to want everything as modules and require an initramfs
for loading them, so I think platforms that are mostly Android
specific lean towards that even for core drivers.

     Arnd
