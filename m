Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9E841B4F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242029AbhI1RXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:23:19 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:9000 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241997AbhI1RXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:23:18 -0400
X-Greylist: delayed 21036 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Sep 2021 13:23:17 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849690;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ahq0OJq7JAJNssL5upRLs89oI17gIphySqvW7pf3FXo=;
    b=G+oY7swVr3wmnFaSRpDlhe0CojjZK1gfCbejHpE5NLDMhY6BsqeoqwLD5BBR2gmmYP
    8WqEPPNCFFGNOglLLNFJVK9jt/eOnE3sVTAD466dkmFLxwt7mYzI+H3hdzQUc3wkrs8y
    9fW1x6qGv4PxjNtHJ1rA8dz4t8Dib0OzN8fRoiI4NBlH6fN2Gk4ByWOEHkVoVRmPajIC
    lmnwpbp6R+cSEOJagwz01HwkleT71Bx32dy4AkqgWk7BraKqOGp96IgzzpOeBWZ6lyYQ
    1vcSrnRoKC8Pkn1O9drt7cdfjPHawlM/3/RSic7R6mwnNGEzDw0g7ixfY3v6shW5Gf0c
    QpRA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLUoBN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:30 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 07/15] ARM: qcom: Add ARCH_MSM8916 for MSM8916 on ARM32
Date:   Tue, 28 Sep 2021 19:12:23 +0200
Message-Id: <20210928171231.12766-8-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a CONFIG_ARCH_MSM8916 option to enable building MSM8916 support
on ARM32. Note that since ARM64 is the main supported architecture
for MSM8916 this is only intended for testing and for devices where
(signed) outdated firmware does not support booting ARM64 kernels.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm/mach-qcom/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
index 1772eccb5caf..4ef3acd2448c 100644
--- a/arch/arm/mach-qcom/Kconfig
+++ b/arch/arm/mach-qcom/Kconfig
@@ -21,6 +21,16 @@ config ARCH_MSM8X60
 	bool "Enable support for MSM8X60"
 	select CLKSRC_QCOM
 
+config ARCH_MSM8916
+	bool "Enable support for MSM8916"
+	select HAVE_ARM_ARCH_TIMER
+	help
+	  Enable support for the Qualcomm Snapdragon 410 (MSM8916/APQ8016).
+
+	  Note that ARM64 is the main supported architecture for MSM8916.
+	  The ARM32 option is intended for a few devices with outdated (signed)
+	  firmware that does not allow booting ARM64 kernels.
+
 config ARCH_MSM8960
 	bool "Enable support for MSM8960"
 	select CLKSRC_QCOM
-- 
2.33.0

