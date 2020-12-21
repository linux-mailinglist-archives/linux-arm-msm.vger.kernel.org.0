Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33BD2DF744
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 01:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgLUAaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 19:30:24 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44295 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726912AbgLUAaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 19:30:21 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id F25345C0130;
        Sun, 20 Dec 2020 19:29:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 20 Dec 2020 19:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=DywCLncDVnWCY
        z8TnEB38M0DsxPI5PKcpmKQY7KHOhM=; b=Bley0H6F8ibXAW3p8ZdvMrPDT8baL
        JHZel8n5CinkI8JhmC9N6JzqWYnjSXDJrogR1fQwvDB/Gnm5ufrK950fqw6JQ6Cf
        BZwQLuxLKHY3rlPS2V5RDY+r3jz8dIOvE5PrGHGsJ6iC4Djn4FiJ9KYvzN3VI3Ui
        Sb4P+xpRAyEAcbcjFe4o5IjCAvtlp94Ru/xhLUkjwFnp8jBRwbPUDr3MJ1LTbgXx
        G2VcZLfCZuwXz/EazC4riC0JX9S9j65PgCLhz5xg7o73IiQFGdOJj8OoRVstCnXS
        TKX3cWRcrzpS8jTk4UXTxXncGizwa/7T6VxT0XBe3Ytr0Ph1DlaXde1Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=DywCLncDVnWCYz8TnEB38M0DsxPI5PKcpmKQY7KHOhM=; b=JIzc3GlJ
        sdP33BCpKPG5vikmMGzsYI9E8JS2IBzUDENB5A5nIN2Hq3T+RH4jtFWMoA3Pe4Jg
        l9WC0OlTTLjlVKUMS5gY6Np/s72tzVaengAKM05qf1QNZLGNW3/sTUBAIrgRfocD
        HXdt0jtff0f+CtWX+voJQ9KQk5EbcRAAu2cfAbsYtMLn6jXJNRt6546Xq0MHzyzH
        W26DRG2TD6wl+l3HZlGQXoHeAxc3Rc0M8tMC8X+IpCp99rw/k9JC6B3ZAdpgK9pe
        hcnSxADmTTecW/4n0yV9arR/NwD0LfJdWVhrq7nXQtd+P3fVCPEKWCRul4a4dXLL
        6BZMOhTGdAOKww==
X-ME-Sender: <xms:aezfX472VsRPCLtnNVBH3113Jw4UAPMS4KcqRe6de-oMNr7izCzHkA>
    <xme:aezfX56qaHHk3GaQf5U3zgh84OX4YJKdBcN3JxS08G6PjEwONkCZtIoBl7bHHsXrm
    c4nxQnYFY9ft6LBunE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnnh
    ihucfnihhnuceouggrnhhnhieskhgurhgrghdtnhdruggvvheqnecuggftrfgrthhtvghr
    nheptefghfehteeugefgueeviedutdduheetheeghfevjeelvefhgfetleduheduuedune
    cukfhppedutdegrddvtddtrdduvdelrddvuddvnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepuggrnhhnhieskhgurhgrghdtnhdruggvvh
X-ME-Proxy: <xmx:aezfX3fx4pefHCJqE-BE9tqjTS6J7QmUTY64vfhv7aLx1-x1ULelUg>
    <xmx:aezfX9IlKaEz4eE-t2rpfi0EB5itBHtweqV9Oyx4lWR2Ym0diskgKg>
    <xmx:aezfX8KKW8yace3t4xJXeoyduxz8zFEcrHeS0mUycu7HWAYVQ6P67g>
    <xmx:aezfXxFXqyh5DD7UwNT3sKAYDh8WJicK7rcKMua4xoAFlXXitUjM2A>
Received: from pinwheel.localdomain (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2A5ED240057;
        Sun, 20 Dec 2020 19:29:29 -0500 (EST)
From:   Danny Lin <danny@kdrag0n.dev>
Cc:     Danny Lin <danny@kdrag0n.dev>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sm8150: Define CPU topology
Date:   Sun, 20 Dec 2020 16:29:05 -0800
Message-Id: <20201221002907.2870059-2-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221002907.2870059-1-danny@kdrag0n.dev>
References: <20201221002907.2870059-1-danny@kdrag0n.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

sm8150 has a big.LITTLE CPU setup with DynamIQ, so all cores are within
the same CPU cluster and LLC (Last-Level Cache) domain. Define this
topology to help the scheduler make decisions.

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b58cf1b8542c..75ed38ee5d88 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -160,6 +160,42 @@ L2_700: l2-cache {
 				next-level-cache = <&L3_0>;
 			};
 		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+
+				core4 {
+					cpu = <&CPU4>;
+				};
+
+				core5 {
+					cpu = <&CPU5>;
+				};
+
+				core6 {
+					cpu = <&CPU6>;
+				};
+
+				core7 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
 	};
 
 	firmware {
-- 
2.29.2

