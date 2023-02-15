Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A127697E01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 15:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjBOOIl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 09:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBOOIk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 09:08:40 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D20B45C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Feb 2023 06:08:39 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 92C955C019C;
        Wed, 15 Feb 2023 09:08:38 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 15 Feb 2023 09:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1676470118; x=1676556518; bh=Gu/FcsOCUV
        TpChSiU1zhnNc7VSd0HRY/lqaNja2+QQU=; b=cXHG5Pkanno7CQ4Sx/U0V+6xeH
        iXuwIt4KsfokXuvUJSjDhwkvrzH/RQRBl7H6+gCeNKzEvX5bv5I3MZN5oPjGKJZn
        Qglle7XFqpu7y11TlxMN9Wcz1/dzl/NnXIbAM2NvAvye+h/8AoBxg8o42kzs6Dy3
        PQCOywl579TkwvrEg0ErejW/9Vr5kVLTUl50vznZ094VUZ0zf8Ube/N+QLoHa5hp
        eXrTMnDA/v5pNdlO+uE8WGeTp3Ohi6gkAppbODhJIA4vjboCcjxR0dJ03isN+lPK
        nvGlbUtggG9gnBirQYQ+O2wEqT62GeBbZBXhek41C+qsNLn9iAF3I8Xo37mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1676470118; x=1676556518; bh=Gu/FcsOCUVTpChSiU1zhnNc7VSd0
        HRY/lqaNja2+QQU=; b=iuhEKVK5bncac6vb7t89QGZ/BLCSmGUPpHr0zhue2aeH
        QSvwYLU8eIhZ9Fg9qj7Yk4OWAVqKUGHkzeRFNDFHxzim6osrj43IpXZaGaO9wiqp
        m6ob+Ca66ea5C31A4wEnnde9AWmIU8X1XWDJieyKbtc9CcB1nzYWtNff55TYVD/M
        3ANuET80JtGEFMfDlE6YAgzxsRpP/2Say9aKpnBvzAHdhqnIh/OjcK9gbqrK3xe5
        uNg8IrD91BnoXgmE/b1lpmohYTqS+/5BdNbp5L1s8e7qcIoqIoM9Fl58JtiOwDq7
        amupWm2heQ7VZvwDRmoAoP5Orwj75dEAJ5Bbmlg8gg==
X-ME-Sender: <xms:ZufsY48gw1vF3VLN_ogIZrDN7VjnpIUQfj9eiZW__1MJFDaGliudwg>
    <xme:ZufsYwtzH6-KEE4VLCSPS25Yvfp_HoXm5sJzDeXBM40HVYDXwrskMKq1XWE1T-lmK
    9EXGXo31uTys-VhSNs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ZufsY-A1RGHNspw1Ee57Td-Vd5F-Gpna3w9rIsBMe9PpJcyBys36PQ>
    <xmx:ZufsY4ec1eHQGS-fCgCCd4aDLrBa1J0b4HjPUleeOuIsh5cPmELfXw>
    <xmx:ZufsY9OzTK3lFjGS_RHQz7SmPSYig7p41Kk-t5CA032SjabrS-SAlQ>
    <xmx:ZufsYw0XMIjNi4Hjy3gM4TGBdGHUgX3CLvrPn4_TUOTWdyOfvXzG8A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4D8ECB60086; Wed, 15 Feb 2023 09:08:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <f7b1ea7d-18cd-49b7-9972-aa40f334d038@app.fastmail.com>
In-Reply-To: <20230215043658.1156472-1-andersson@kernel.org>
References: <20230215043658.1156472-1-andersson@kernel.org>
Date:   Wed, 15 Feb 2023 15:08:06 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
        soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Andy Gross" <agross@kernel.org>,
        "Olof Johansson" <olof@lixom.net>,
        "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: [GIT PULL] One more Qualcomm driver update for 6.3
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 15, 2023, at 05:36, Bjorn Andersson wrote:
> Arnd, I hope you're okay with a few more last minute updates for v6.3; bringing
> battery support and, in the DTS patches, support for USB Type-C based external
> displays on the 8cx Gen3 laptops.

No problem, as these are all smaller follow-ups to earlier
patches and nothing controversial.

  Arnd
