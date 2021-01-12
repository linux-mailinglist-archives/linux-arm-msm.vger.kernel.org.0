Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291BB2F258D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 02:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbhALBeD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 20:34:03 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44283 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729339AbhALBeD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 20:34:03 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id DC8305C0061;
        Mon, 11 Jan 2021 20:33:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Jan 2021 20:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=mtfFrTyX/+9/DrgMLh8qvL+wEV
        rs0MG0RhAVdwyXeYU=; b=55w/xXaLgK371x9biYT6Mxvj50mrS9X0+nMNgRH2Ca
        CD4SPXSmcaC6Xkvggp/aT2dWBbhGbw6+sXgqbGF/KiCbVze/JltAGc5c0EGFWb1K
        QpA8ijowwjclN3RPOWOWWFPvgNfeBpA8ckkVKAl5LfIBNDbfGd/QKIZDcprpXWIT
        Qa+HE+t9/4cx8Tm5Jumm5OosAXmV3Z3xpkU3uhMebXYVXQzQbAmf6+n4J15dCLnR
        9YCbjsVTtDjEHaPAlTw+zK6NWLBI/hOuzGC1ldjdil2xPtJrWvP8KkbtqIT0kfUN
        pb6MvC8S2LLvntsbP31+DJ13SRPooU9yrHuDrmhcOhJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mtfFrTyX/+9/DrgML
        h8qvL+wEVrs0MG0RhAVdwyXeYU=; b=SqMFbxXOiV80g6KAHoPPdPSF0BZ4Tgyi2
        07nGjXnE8UQyuKYczjnzWsUKyTsMdSBMuyr8kN/eBUw5sfsPQTmQbv3OJvblyYnm
        +ebFmzjSECxzk/4i75pbjsDxEKtSGNqHiMpXnQc8fsDH5/O7uAsI6lKIIv5EekqA
        0QBpqAKhCWGELytNKzlBEj65lmzcHV3LdBpxBGMl2E4U0xx0xBW15wSjrpQCxcco
        RlkupeXndb28BXb9NUbYfKe/HC4ypr1A6O/LMH63qgDQERAwqiUiFOnMhlX3pBdP
        KIn9Q8DojRZSwDTffuwT8+XZXHcHukHbRkpigqKOmj5RrsAX1mMgA==
X-ME-Sender: <xms:XPz8XztV-_MkOoe2-XLQQm5_35ArKi85WyvNVfjVWJVQZ45L4e_SZA>
    <xme:XPz8X0do8LSnCzgbj-Au4y3E3szeUm1a8foa_UX9rqUj6xWtO6ZHilKawEp1wtJyU
    dlQ9MLj2XDMbMz2jvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghnnhihuc
    fnihhnuceouggrnhhnhieskhgurhgrghdtnhdruggvvheqnecuggftrfgrthhtvghrnhep
    hfeihffglefgudefvdduledvfedvfefgieeuueefgeetffdukeeghfevtdeifeetnecukf
    hppedutdegrddvtddtrdduvdelrddvuddvnecuufhprghmkfhppfgvthifohhrkhepuddt
    gedrvddttddruddvledrvdduvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegurghnnhihsehkughrrghgtdhnrdguvghv
X-ME-Proxy: <xmx:XPz8X2yI4LKsHuLxluWaN-57QL3fWafiR9q0mN35XBxWZHq38OqUag>
    <xmx:XPz8XyOKnpSqVTacftZUwEFOR4xjXCjNbmL01QB6a__UPPvBj8jsJg>
    <xmx:XPz8Xz8HJKY3FZeWeshpoL-Mia14QvT07dYJUHG8W7LuAqHGSOlzsQ>
    <xmx:XPz8X_ZLdPskZcdKO591IYbl5jkEoSl_KkxOi5c2vBLxwuD4vccKbw>
Received: from pinwheel.localdomain (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9C94D24005A;
        Mon, 11 Jan 2021 20:33:15 -0500 (EST)
From:   Danny Lin <danny@kdrag0n.dev>
Cc:     Danny Lin <danny@kdrag0n.dev>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm8250: Define CPU topology
Date:   Mon, 11 Jan 2021 17:32:53 -0800
Message-Id: <20210112013255.415253-1-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

sm8250 has a big.LITTLE CPU setup with DynamIQ, so all cores are within
the same CPU cluster and LLC (Last-Level Cache) domain. Define this
topology to help the scheduler make decisions.

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 65acd1f381eb..30ccadb753a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -199,6 +199,42 @@ L2_700: l2-cache {
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

