Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283916814A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 16:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238050AbjA3PTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 10:19:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238099AbjA3PTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 10:19:24 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8FE3526F
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 07:19:15 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 0CEC45C0153;
        Mon, 30 Jan 2023 10:19:12 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 30 Jan 2023 10:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1675091952; x=1675178352; bh=fNr7HPmcev
        8OSbt0brbJfgY8SuJhTkFSSZxPEwoacvM=; b=BsPqJfNUIcZMYHDI3tm7jqASE7
        qvd22Aib3spis77PI/BlLEQCM6PrNY3lGIunNl7rQIIbpsTidJYO84Vcnfxz8AlG
        DACvRB0xuCj/zPRjM7vwqX70RrN/KgEZFlayZ65F5ZAIzDirhB0P3+uU4ORnILqC
        +Jgf3dHzcpO7zljTh+Caa0+VhCQyyx0GzsaPjBQ6535FmkvfEUBGVYwnHkdRQ6dz
        CbAac8RAI15DiTKJQ1XSt5sZK00z+XAywN5wYNn6ADC/cRaELGV1j5JwwdNnicMl
        B3vsD+XAbNq5QE+P5+/binppw8GrgcQwJbrFzQZZTByhBJsGP5pvg5xRwJVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1675091952; x=1675178352; bh=fNr7HPmcev8OSbt0brbJfgY8SuJh
        TkFSSZxPEwoacvM=; b=ih8wItzeIps5NfJdvGTbhI0edhG0JwHvMj0fEPOYYHZt
        ld7KKuSd+7k5HgJwdBDhv4a/cxPdnh0fFQ4zll4s2IOGC9Uwe+v8JFe3zOxDKFlR
        OlLNEMv0KugpIF+3OgT4brzVjg/9PIC+7JO1FNgsrgIWvjSTnaf34xxzm+t74wxl
        UIZ9zWCNZCBOqzVLFrx6v4xl44RcbKVAb4xd9xmve+l+GwCZ0fY+HUyV6B8DK43b
        /I+Yg7RD+cllDX8Sw4Z3YoR9Ncw5CeHOLumIzID/9rrSviYz1rSIemutaKBRQAsj
        UJW9InTfD0/4x0doOGNHR2dzb3gXDspsE/LKHpuaiw==
X-ME-Sender: <xms:79_XY7bLQX2KOyliHI7ZwJ__-rDsX7wQ9SikMSjOluiW39lTcrl1YA>
    <xme:79_XY6Zcx1kRXtHOmAbiX2a6CsPImHbzP0ohVKQwthShh3jPOEJwcuZi9G_onuSRM
    XUFdQOLwIYWXhMfl34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:79_XY9_uh6uadoNBHlpE3IryKLOmMGu7aiwrWl5OlsNsY_LarcEVug>
    <xmx:79_XYxp79AWtQ2T_ztYllXpU_lnO4SE07f7DIbVACoiAiq_jju-utg>
    <xmx:79_XY2qK7XNgwoRELVrAVmKQ3cGvlkyrm_M_Qx8z_1uRg_ABZagEZQ>
    <xmx:8N_XYzq-vLAWyV737KI2wZNT2Ioh2TwJQyqmjIIWs_wNUS_PcXQB8A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 887FDB60086; Mon, 30 Jan 2023 10:19:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <cdcff86c-77fe-4c5d-b8e8-58b815b9e969@app.fastmail.com>
In-Reply-To: <20230126163008.3676950-1-andersson@kernel.org>
References: <20230126163008.3676950-1-andersson@kernel.org>
Date:   Mon, 30 Jan 2023 16:18:45 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
        soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
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
        "Leo Yan" <leo.yan@linaro.org>
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

On Thu, Jan 26, 2023, at 17:30, Bjorn Andersson wrote:
> The following changes since commit 6049aae52392539e505bfb8ccbcff3c26f1d2f0b:
>
> ----------------------------------------------------------------
> Qualcomm driver updates for v6.3
>
> This introduces a new driver for the Data Capture and Compare block,
> which provides a mechanism for capturing hardware state (access MMIO
> registers) either upon request of triggered automatically e.g. upon a
> watchdog bite, for post mortem analysis.
>
> The remote filesystem memory share driver gains support for having its
> memory bound to more than a single VMID.
>
> The SCM driver gains the minimal support needed to support a new
> mechanism where secure world can put calls on hold and later request
> them to be retried.
>
> Support for the new SA8775P platform is added to rpmhpd, QDU1000 is
> added to the SCM driver and a long list of platforms are added to the
> socinfo driver. Support for socinfo data revision 16 is also introduced.
>
> Lastly a driver to program the ramp controller in MSM8976 is introduced.

Hi Bjorn,

I don't feel comfortable merging the DCC driver through drivers/soc/
at this point: This is the first time I see the driver and it introduces
a complex user space ABI that I have no time to review as part of the
merge process.

I usually try to avoid adding any custom user space interfaces
in drivers/soc, as these tend to be things that end up being
similar to other chips and need a generic interface.

In particular I don't see an explanation about how the new interface
relates to the established drivers/hwtracing/ subsystem and why it
shouldn't be part of that (adding the hwtracing and coresight
maintainers to Cc in case they have looked at this already).

Can you send an updated pull request that leaves out the
DCC driver until we have clarified these points?

      Arnd
