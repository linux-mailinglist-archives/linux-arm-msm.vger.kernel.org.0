Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502747CA9D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 15:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbjJPNjv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 09:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234003AbjJPNj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 09:39:27 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44AC10E9;
        Mon, 16 Oct 2023 06:39:25 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 9CB76320099B;
        Mon, 16 Oct 2023 09:39:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 16 Oct 2023 09:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1697463562; x=1697549962; bh=d5
        3nxynixMgLcO43ZPPmragb1PsGORqKVL/bqIGbDbQ=; b=Ac4T3bvipteJt+7rCj
        6D/wDzP83TpefuiwQAa3Hbb0m9UV//GWGJkRiHANoU8g6MKK3+ReEaHQtPL5yt9I
        vJ7ZnIb2hgS/Vm8985z6rGRnz/5JnbBhiB4tlRESTzMIApoZ4lCla6oJNs2n+KeI
        F6ya6Rsn2YK7Bmyj3YfAuRbd8yob8lF0hzRB9oTeAZl0a0/KIRey3tIF0W8SEHcx
        0SMS7/PaTUYUHMGPPj81OaRW8rZTtdwgZWwuBEXLXqz9iXOstYnyzBF6NoUCLfBB
        DNVc2XY6eDl9rjk4GqW8rpr80iU8Y/7eEHg5vACJPQh9aih4E3SRT33TD1ixsQ9m
        ts+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1697463562; x=1697549962; bh=d53nxynixMgLc
        O43ZPPmragb1PsGORqKVL/bqIGbDbQ=; b=VF1Yj5HT8hG/M5aa1KcN/4kNot2pB
        zj2uqD2LBNKteg9TNvgbZBOZa/Zs+NZZrU3G42S0ZZ8mfLcNs1scNCV8cxPTLkLy
        mDExPSnBnJli+2LPJ/hmu+ZkbbDv/4t+PlUaQOmSUjEehabjhsuUTgDLnh9KFGyG
        YW0FfJ/FyJEcBxZjMX6Bz+FJw87DZD0M7Alofg6TFZ8TS3tJQwKzoRKNnyxpEmkw
        ixsDizhgHRIR378ETBhsfSSjqHFP/e6wy4VLkEyUWACLvSklxkWLsE1igUrBX3fd
        K8Tmp9QHNWJcsQhUxAausD62Lpe0qg6l+9OV+766eeuf2DGs26OhlXSmA==
X-ME-Sender: <xms:CT0tZbk-5Aa22k4qhv1d2w_gi4aD98sUID18iD_XEnGIVSI7p3flmQ>
    <xme:CT0tZe0GC4jND8wgnorjtW5eTJcxWKuuyCtKQY5Aw0PIIKn_U4TW_Q-WniNYTAT5C
    jZD-HVzJt8jmJWiVDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjedtgdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:CT0tZRo5x7RFbs-sQxi3Y3YPEtpwrKPzHL4M-gO7fs47p8-GWyp7CQ>
    <xmx:CT0tZTkY_Go4hzHqGorx3vtsG1kTXw2VDo_TBYzHj6dZ-0vv6Q9Kyg>
    <xmx:CT0tZZ1K6QmfTbxJj6GHTLY-Vc__ygWx2K3EjLsVGGNZiK0Vu7EAWg>
    <xmx:Cj0tZR9k_gsA2lpTR2VIxKj7xaH8XjA-srx_m82XcjjjMbFh7lhnaQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A07ADB60089; Mon, 16 Oct 2023 09:39:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <a12eee9b-e159-4e1b-b812-60cdf93c1b41@app.fastmail.com>
In-Reply-To: <20230826221915.846937-4-dmitry.baryshkov@linaro.org>
References: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
 <20230826221915.846937-4-dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Oct 2023 15:39:01 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdm845-mtp: switch to mbn firmware
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Aug 27, 2023, at 00:19, Dmitry Baryshkov wrote:
> We have switched most of devices to use mbn (squashed) firmware files
> instead of spit mdt+bNN. Even this DT uses modem.mbn and a630_zap.mbn.
> Let's switch adsp and cdsp firmware files to use .mbn format too.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I saw this pop up in the dts pull request today, and this needs
some more clarification I think: Why does the dts have to know
about which format the files are in? I would expect that to be
handled by the driver internally.

From what I can tell, either the two files are compatible,
and the driver can just try both names by manipulating that
string, or the two are incompatible and changing the firmware
name would also mean that the dts node and driver would
have to be aware of the difference.

      Arnd
