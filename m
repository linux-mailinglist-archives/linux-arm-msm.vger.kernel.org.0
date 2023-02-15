Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4171697F18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 16:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjBOPGC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 10:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjBOPGB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 10:06:01 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438B8268E;
        Wed, 15 Feb 2023 07:05:59 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 12CD25C00A4;
        Wed, 15 Feb 2023 10:05:56 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 15 Feb 2023 10:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1676473556; x=1676559956; bh=s0AJKWLVNc
        ykc9c6LDSigdn2GWFyqJgMF7HOsHcq26g=; b=ejQFZjZ9zb1zguVU2EOGqYlUVh
        cFXXakvC+UYW1eEDDlBHXuVgORXhkLJUYHeNs/tpaMeVt8D3mgKwwvZuVLu6MNEL
        Wyfpw3imKLVmqCrYaaRnW7V30ufhO1g7L7ZbDAnkDte5OwZB1XFQUJ5AF2jJoQI5
        sQh7arAdmV3x91ZXfiAip8e/e8l7G9K38D6I5cHL4fg6zkCKJUSkQlPrv0BOgkX2
        cXtmNMDdq7Eew30jzbn+LmkS2FKKvKWLZAmR9JflEaMIyiVc1KbRxBB1GKInnCgq
        mbID759E9AhIIlSwIDY+/Ism2nzwYidLoPJ8pjXC3ABJzbgkPNSV3JfCVTRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1676473556; x=1676559956; bh=s0AJKWLVNcykc9c6LDSigdn2GWFy
        qJgMF7HOsHcq26g=; b=qKd6ui6kt/QmFfZ5XRDtUeNEX7FtdhbHnStJtNfR6eZc
        wRn4cTkipY4uzUYopa5DlNNnjNXFNHxwZf+Jsdii+o0BZKpVg3t/7B9qy0bv/xer
        cxETHA2ifvS+ICvO7f6KEJtR5xGDprVTn+TATqVCFp+ob/XSYqw3rAWbxyFRyKXV
        RTSEvL0Xl3CXiLH4NYYb6+fguIHV5C3+x2dnSkJPdQtMLxC0khVrjNx32GqrStlB
        nGSfY6YQIbYo2ml5+3cw+vgvgW5e6uBrE5IHoBjYrY6T05i6clUJFbUUfGg5wVtV
        1DLAlw9X+EsEOLISV7fLDTRZ4Z/iekFNAL+GkqE9Ig==
X-ME-Sender: <xms:0vTsYyhaIfGJXZOY4UIk8eX3ryHGOPd0Rar9l5x0M2A_wUmyQ550kA>
    <xme:0vTsYzBvCbccNt_KY-9NW3tY42lNwEmd8pfv2LPRbk9t-9Q9n6vdisQoxQmMNIZmt
    Fggn3EUy8rA3puKPw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:0vTsY6HPiYD2pfZHnH7sTkhB4t4EH7mBGOV3ucnha3Cez3_5WLwigA>
    <xmx:0vTsY7R5h9bL1-lbUFlxGpUF_T9Wa9i-ahYkdq7R8s2za3KmUMH2NQ>
    <xmx:0vTsY_xNOpVeoJLODC5q1JMqQP_3FtokGa4vQ_EeFSTJOWcYvfQvgA>
    <xmx:1PTsY1kDDXkQLABNSTjcLhvyt1d1DR4aLSJaoULwVx93xuO45a2r7A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B42BEB60086; Wed, 15 Feb 2023 10:05:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <9b680581-0956-4188-9af9-af06b625c001@app.fastmail.com>
In-Reply-To: <20230130222412.t2tkkhqfep2orxf2@builder.lan>
References: <20230126163008.3676950-1-andersson@kernel.org>
 <cdcff86c-77fe-4c5d-b8e8-58b815b9e969@app.fastmail.com>
 <20230130222412.t2tkkhqfep2orxf2@builder.lan>
Date:   Wed, 15 Feb 2023 16:05:36 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Bjorn Andersson" <andersson@kernel.org>
Cc:     arm <arm@kernel.org>, soc@kernel.org,
        linux-arm-msm@vger.kernel.org,
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
        "Bjorn Andersson" <quic_bjorande@quicinc.com>,
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
        "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
        "Jiri Olsa" <jolsa@kernel.org>,
        "Namhyung Kim" <namhyung@kernel.org>,
        linux-perf-users@vger.kernel.org,
        "John Garry" <john.g.garry@oracle.com>,
        "Will Deacon" <will@kernel.org>,
        "James Clark" <james.clark@arm.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.3
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 30, 2023, at 23:24, Bjorn Andersson wrote:
> On Mon, Jan 30, 2023 at 04:18:45PM +0100, Arnd Bergmann wrote:
>> On Thu, Jan 26, 2023, at 17:30, Bjorn Andersson wrote:
>> 
>> I don't feel comfortable merging the DCC driver through drivers/soc/
>> at this point: This is the first time I see the driver and it introduces
>> a complex user space ABI that I have no time to review as part of the
>> merge process.
>> 
>
> The DCC driver has made 22 versions over the last 23 months, but now
> that I look back I do agree that the recipients list has been too
> limited.
>
> Further more, due to the complexity of the ABI I steered this towards
> debugfs, with the explicit mentioning that we will change the interface
> if needed - in particular since not a lot of review interest has
> been shown...

I'm sorry to hear this has already taken so long, I understand it's
frustrating to come up with a good userspace interface for any of
this.

>> I usually try to avoid adding any custom user space interfaces
>> in drivers/soc, as these tend to be things that end up being
>> similar to other chips and need a generic interface.
>> 
>
> I have no concern with that, but I'm not able to suggest an existing
> subsystem where this would fit.
>
>> In particular I don't see an explanation about how the new interface
>> relates to the established drivers/hwtracing/ subsystem and why it
>> shouldn't be part of that (adding the hwtracing and coresight
>> maintainers to Cc in case they have looked at this already).
>> 
>
> To my knowledge the hwtracing framework is an interface for
> enabling/disabling traces and then you get a stream of trace data out of
> it.
>
> With DCC you essentially write a small "program" to be run at the time
> of an exception (or triggered manually). When the "program" is run it
> acquire data from mmio interfaces and stores data in sram, which can
> then be retrieved - possibly after the fatal reset of the system.
>
> Perhaps I've misunderstood the hwtracing framework, please help me steer
> Souradeep towards a subsystem you find suitable for this functionality.

I'm also not too familiar with tracing infrastructure and was hoping
that the coresight maintainers (Mathieu, Suzuki, Mike and Leo)
would have some suggestions here. My initial guess was that in
both cases, you have hardware support that is abstracted by the
kernel in order to have a user interface that can be consumed
by the 'perf' tool. I probably misinterpreted the part about the
crash based trigger here, as my original (brief) reading was that
the data snapshot could be triggered by any kind of event in
the machine, which would make this useful as a more general
way of tracing the state of devices at runtime. Can you describe
how the crash trigger works, and if this would be usable with
other random hardware events aside from an explicit software
event?

I've added the perf maintainers to Cc as well now, for reference,
the now reverted commit is at
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=drivers-for-6.3&id=4cbe60cf5ad62
and it contains both the implementation and the documentation
of the debugfs interface.

One bit I don't see is the user space side. Is there a patch for
perf as well, or is the idea to use a custom tool for this? How
does userspace know which MMIO addresses are even valid here?

If the possible use is purely for saving some state across
a reboot, as opposed to other events, I wonder if there is
a good way to integrate it into the fs/pstore/ code, which
already has a way to multiplex various kinds of input (log
buffer, ftrace call chain, userspace strings, ...) into
various kinds of persistent buffers (sram, blockdev, mtd,
efivars, ...) with the purpose of helping analyze the
state after a reboot. 

>> Can you send an updated pull request that leaves out the
>> DCC driver until we have clarified these points?
>> 
>
> I will send a new pull request, with the driver addition reverted. I
> don't think there's anything controversial with the DT binding, so let's
> keep that and the dts nodes (we can move the yaml if a better home is
> found...)

Right, this is fine. I merged the first pull request after I saw the
revert in the second drivers branch, though I did not see a pull request
from you that replaced the first one with just the revert added as
I had expected. Also, I see that patchwork never noticed me merging
the PR, so you did not get the automated email. Maybe you can double
check the contents of the soc/drivers branch to see if the contents
are what you expect them to be.

       Arnd
