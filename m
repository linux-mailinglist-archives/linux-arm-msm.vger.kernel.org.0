Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3702B6D6BF7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 20:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236428AbjDDS1g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 14:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236370AbjDDS1S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 14:27:18 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE387DB1;
        Tue,  4 Apr 2023 11:24:29 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 005E63200A4B;
        Tue,  4 Apr 2023 14:24:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 04 Apr 2023 14:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1680632640; x=1680719040; bh=07
        WV5NgL8vMYW4YUKKfLXg4CjXG2oD6eDnOlB5kaoU8=; b=JGa8FIHroy2kuC8LiN
        uVI9eJvX/WnAlMxVCM2boz1XZBjtb+I+3BkYSY6z0K9ZqvrN2EA1ZWNeF8YmXgWa
        V7ZoERoi5MO+DUwPlLn1Ucw2hvFf0D5TtT53BZ0kh45sgI2LoK7wv3R/nXR5UjSH
        9b3bKT6JkJPnOLbyM+m0a/KGQhxcNPNjqMHQGl7VSdmWk1qEBf+n7L3Qpm/GVOpz
        K000UDXHngCAGdnTsUdGte5U6Tb3GMl/EXgg4hYcXrSrCRE9DLEVQsrJY/0Pa6x3
        r/iwJCSRda8Dpxgi/lNU/+J5VtrdQIcn3rb2atd+66ob8yVvPYkPxDeXBdcsDUMy
        mxyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680632640; x=1680719040; bh=07WV5NgL8vMYW
        4YUKKfLXg4CjXG2oD6eDnOlB5kaoU8=; b=Ll7gcFmwspK8PWje88pzP5XHBF30k
        nszHo2aD9dKsbNo8i5fVt078Tqxr0/hBAmgIe+ajQ96C1nYT4iTAgVt5ROfY1LoC
        8A9lSJNqLU32vWDzOFa+jbE96Bw4RK/0ETwVf4AUECmBYYd+JjLnhSxv/eQ/IGb3
        sSyIXHjQYMKNRvy7PcwPSCZZEKQC5c/w2hx1x2dcSGMflcyX44XlS+G6JOjPy91Z
        yh4tKJ8a17uCiAWZdkc1gnJO2Jnw0pXtO2Ck+gMPHPB9EBuow1R6bHQqbPponcbM
        J3qTjK6zuv6j33MDk9klBTqg0SBR4ecSvIQUTrkUq/D/LNfrunXSlZhtQ==
X-ME-Sender: <xms:P2ssZMkSZECcK0tljlLZGMSwvrCJAmIjFEmwPAZDEf5RqMXHXs6JsA>
    <xme:P2ssZL2xvjoogo9s5uizDg9v6kC0-vA97NKuQqBvmRgcYMdo72P8RR8WDtleRILbc
    yQ_UFrDgAp-rcrbV0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:P2ssZKrTfQ5011WxEv1wwyCNED72NYIKp9vQ0ityoTuUhxw04WDIjg>
    <xmx:P2ssZIlHWQmNQEH1q8fjYjrbwibOboOyWzq-LbLbJKFwA2Zy_d-_yQ>
    <xmx:P2ssZK1P2C1CLK1diOl2BG_1LABkLUlrLHxernQyk6vxtoI3gzRE0w>
    <xmx:QGssZJ6_WY4opnWQsUKwdQXrPhNk7dDMrf3uywEiqxUk01M4F-l7RA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7E323B60089; Tue,  4 Apr 2023 14:23:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <2b04a64a-80fe-4ff3-b78b-2f999c8be9f6@app.fastmail.com>
In-Reply-To: <20230324172657.GE309305@hu-bjorande-lv.qualcomm.com>
References: <20230126163008.3676950-1-andersson@kernel.org>
 <cdcff86c-77fe-4c5d-b8e8-58b815b9e969@app.fastmail.com>
 <20230130222412.t2tkkhqfep2orxf2@builder.lan>
 <9b680581-0956-4188-9af9-af06b625c001@app.fastmail.com>
 <20230324172657.GE309305@hu-bjorande-lv.qualcomm.com>
Date:   Tue, 04 Apr 2023 20:23:39 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Bjorn Andersson" <quic_bjorande@quicinc.com>
Cc:     "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Andy Gross" <agross@kernel.org>,
        "Olof Johansson" <olof@lixom.net>,
        "Kevin Hilman" <khilman@baylibre.com>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Stephan Gerhold" <stephan@gerhold.net>,
        "Souradeep Chowdhury" <quic_schowdhu@quicinc.com>,
        "AngeloGioacchino Del Regno" 
        <angelogioacchino.delregno@collabora.com>,
        "Bagas Sanjaya" <bagasdotme@gmail.com>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Guru Das Srinagesh" <quic_gurus@quicinc.com>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Dawei Li" <set_pte_at@outlook.com>,
        "Loic Poulain" <loic.poulain@linaro.org>,
        "Melody Olvera" <quic_molvera@quicinc.com>,
        "Naman Jain" <quic_namajain@quicinc.com>,
        "Neil Armstrong" <neil.armstrong@linaro.org>,
        "Yang Li" <yang.lee@linux.alibaba.com>,
        "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
        coresight@lists.linaro.org,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>,
        "Suzuki K Poulose" <suzuki.poulose@arm.com>,
        "Mike Leach" <mike.leach@linaro.org>,
        "Leo Yan" <leo.yan@linaro.org>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Ingo Molnar" <mingo@redhat.com>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Jiri Olsa" <jolsa@kernel.org>,
        "Namhyung Kim" <namhyung@kernel.org>,
        linux-perf-users@vger.kernel.org,
        "John Garry" <john.g.garry@oracle.com>,
        "Will Deacon" <will@kernel.org>,
        "James Clark" <james.clark@arm.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.3
Content-Type: text/plain
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023, at 18:26, Bjorn Andersson wrote:
> On Wed, Feb 15, 2023 at 04:05:36PM +0100, Arnd Bergmann wrote:
>> On Mon, Jan 30, 2023, at 23:24, Bjorn Andersson wrote:
>
> Iiuc pstore provides a place to store system state for analysis after a
> reboot, but DCC provides essentially register dumps on demand - with the
> system reset being a special case trigger.
>
> So I think it would look neat to expose the DCC data alongside other
> pstore data (except for the mentioned issues with ramoops not working on
> most Qualcomm devices), but when the reboot happens DCC captures data in
> the DCC SRAM, not in the pstore (whatever backing might be used). So
> post boot, something would need to get the DCC data into the pstore.
>
> To me this sounds in conflict with the pstore design.

Sorry for the late reply.

The case I was thinking of is making the DCC SRAM a pstore backend
that might be shared with other pstore users, in place of the
other targets like PSTORE_RAM, PSTORE_BLK, EFI_VARS_PSTORE and
the powerpc64 nvram. This might be a bad idea for other reasons of
course, e.g. if it's impossible to have more than one pstore
backend active and the SRAM is too small to contain the data
that would otherwise be store here, or if it's not persistent
enough.

> Further more, with the reboot trigger being the special case, we'd need
> to amend the pstore state in runtime to capture the case where the user
> requested the DCC to capture the state.
>
>
> One idea that I was looking at was to trigger a devcoredump as a way to
> get the data out of the kernel, instead of a new device node. But it
> doesn't seem to fit very well with existing use cases, and I haven't
> used DCC sufficiently - given that it doesn't exist upstream...

You are probably right, but I'm curious about DEV_COREDUMP, as I
haven't actually seen that before, and I can't seem to find any
documentation about what its intention is, though I can see a number
of in-kernel users.

> We made significant changes to the control interface through the review
> process, I think we have something that looks reasonable now, but I
> picked the patches under the premise that it's unstable and in debugfs,
> and exposing the tool to users could lead to more interest in
> polishing it.

Ok
 
        Arnd
