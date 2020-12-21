Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD302DF745
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 01:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgLUAaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 19:30:24 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40481 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726829AbgLUAaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 19:30:18 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 38E575C012E;
        Sun, 20 Dec 2020 19:29:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 20 Dec 2020 19:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm3; bh=xmFfHc/XNgYTvK9K2LY3tAGk5j
        EnmEeMQY49PeD4Lys=; b=FhLI/9i1UiI2LB8yzpYTu379dGP2bTm+gz4XfDwXt4
        WtKPOMw44SplwqSDt0qGLizwhAKlK8/RbUW5Xy0Nh7lUeNe0q4rpbgrN5zQFh3xV
        sL+zUc81JESJOJDpvL0hVvcBdWQSpntQ2XdhzAEV1k0Ig66f4rcFjL6KvGgBZAqK
        xd8bjPMJ8KGasRE2vvMf+igjUKH8Akaz5j+qCgiqNZP49txkdd7lEMiCutU4vygZ
        p+OWY19+gsvNFLyTxVAD3wna2bbZNgdJ8qEFm/TCDLvbDfKVvZD8X+5KGJt1+k2m
        re5g87zXdiOsQJo3TdGWdt3lEwFceJiZe4XvbveA0v5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xmFfHc
        /XNgYTvK9K2LY3tAGk5jEnmEeMQY49PeD4Lys=; b=F++19EILUrbmsMyt73rcAb
        VHIhsF6hPyy1aBabEIHJREm15Cuv37OxGh0UYYKxYkUjgrICvWjwS4XEaSmPIuhy
        Fg2Yq0M7GLusLtnHXGEx4xn53oyu8fO2wylpkcUzOJqRKipJ6j2GyMya5ENbwbd9
        R2jlZsqMUhSGS3kW34pu57MJpmPgFJPwG1py6wSxaam3PYgZdcceyAKCHAJgSHon
        siBwghBTOayODJUYCBCiJymrwyEprteUXxDVTSbE9iWYoB0Ne1W8QMjSxk58xs8K
        bYXsi/Ysjucb+dkCcs/lw22VU/FIcz5QoYa6z9CoHJlWIe1pOqzhp16byo19PMTw
        ==
X-ME-Sender: <xms:ZuzfX8PFdSsJPwQ71l7VneJiyE8pIuGj1zN5M4EaIVUq1nvaHnqAQA>
    <xme:ZuzfXy-CjAJ4sJ1luKfjMfKcOxJMyfDL4dFY2fRjOB0tkneN0E3Snt9DKtCNjp8iu
    H7DwfwO9TMp5LPW3R8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgrnhhnhi
    cunfhinhcuoegurghnnhihsehkughrrghgtdhnrdguvghvqeenucggtffrrghtthgvrhhn
    peehueehheeljeeljefhgeevudelvdelleehgfeludffleegteefudfhuddujefftdenuc
    fkphepuddtgedrvddttddruddvledrvdduvdenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegurghnnhihsehkughrrghgtdhnrdguvghv
X-ME-Proxy: <xmx:ZuzfXzQAfg9S5TLVVnvAXyXaIoex6dhbipOzBJV8rtG-0SVT9WHXyQ>
    <xmx:ZuzfX0s6qFmL5GMnWvoCWwaK37CD4n4ZuAb2X6yA8uqApPKnCmNCdg>
    <xmx:ZuzfX0f4Z1RI7ZfJRBX_AyXj69e2_QMvieI4tDq8vbu_y8vF7jJgkQ>
    <xmx:Z-zfXz65qpouYZogf4j7lCMdJZHdK5go5L63JpWpgoDgNQbIGwiYjw>
Received: from pinwheel.localdomain (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id D5AB9240057;
        Sun, 20 Dec 2020 19:29:25 -0500 (EST)
From:   Danny Lin <danny@kdrag0n.dev>
Cc:     Danny Lin <danny@kdrag0n.dev>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] CPU power management for SM8150
Date:   Sun, 20 Dec 2020 16:29:04 -0800
Message-Id: <20201221002907.2870059-1-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches add support for high-level CPU power management on the
SM8150 platform. cpuidle and energy-aware scheduling are now working
with the new idle states and CPU energy model.

Danny Lin (3):
  arm64: dts: qcom: sm8150: Define CPU topology
  arm64: dts: qcom: sm8150: Add PSCI idle states
  arm64: dts: qcom: sm8150: Add CPU capacities and energy model

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 102 +++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

-- 
2.29.2

