Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC41F3943C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 16:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236386AbhE1OIs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 10:08:48 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22801 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhE1OIj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 10:08:39 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210528140702euoutp02fc6734c79469b65a6b42b6f456113ad5~DQCXq8F0j2766627666euoutp02M
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 14:07:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210528140702euoutp02fc6734c79469b65a6b42b6f456113ad5~DQCXq8F0j2766627666euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1622210822;
        bh=915u9PCSs+VWQ3C+/MLLVc+QsXwlQ/JIGcQxvElvrt4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=YDECQNmZZEe3C1QbNr0n7UgjELYTDNoNCqLw5GIZbCh5uwamHXOTUEkJh6CnoVGLp
         QOJPaMkZgTGmjSfF8LyuejPSudBzCTNxHSwE2SjuEjhIcKrFmSRLAcAe7GvxLfUwld
         G6hFbpo7Ee3lpVgiqSitHadHEkj68F0Yf+HmQ80E=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210528140702eucas1p15f3d2e1a85d2e47bc15b1329750b1511~DQCXVuqfT1530415304eucas1p1q;
        Fri, 28 May 2021 14:07:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 07.68.09452.509F0B06; Fri, 28
        May 2021 15:07:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210528140701eucas1p2c0ae6147be49494900dd25c1d72ab98a~DQCW2y22d0349503495eucas1p2q;
        Fri, 28 May 2021 14:07:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210528140701eusmtrp14a2a12237fb03936bd142592b8cbaefc~DQCW1MmLo2417124171eusmtrp1c;
        Fri, 28 May 2021 14:07:01 +0000 (GMT)
X-AuditID: cbfec7f2-a9fff700000024ec-21-60b0f905efac
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 91.96.08705.509F0B06; Fri, 28
        May 2021 15:07:01 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210528140701eusmtip29bc905c181cfefe6845fc743bb9f0110~DQCWautIL1767017670eusmtip2e;
        Fri, 28 May 2021 14:07:01 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] arm64: defconfig: add drivers needed for DragonBoard410c
Date:   Fri, 28 May 2021 16:06:25 +0200
Message-Id: <20210528140625.6972-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7djP87qsPzckGPw6am5x7vFvFouNM9az
        Wpze/47FYtPja6wWE/efZbdYe+QuuwObx6ZVnWwed67tYfPYvKTeo2/LKkaPz5vkAlijuGxS
        UnMyy1KL9O0SuDI69+5gLtjPWbFh20TmBsZtHF2MnBwSAiYSm9duYOti5OIQEljBKDGz5RYT
        hPOFUaKj6xcLhPOZUeLihe/MMC3rFrRBtSxnlNh87SYjXMu+j3PYQKrYBAwlut52gdkiAu4S
        9+Z3sYIUMQtsZ5R4eGgTUIKDQ1jAU2L7V3GQGhYBVYnf14+wg9i8AjYSq99NhdomL7F6wwFm
        kF4JgZ/sEtN/z2aBSLhI7Lq6hwnCFpZ4dXwLO4QtI3F6cg8LREMz0LJza9khnB5GictNMxgh
        qqwl7pz7BXYFs4CmxPpd+hBhR4mFLxoZQcISAnwSN94KgoSZgcxJ26YzQ4R5JTrahCCq1SRm
        HV8Ht/bghUtQJR4S3adUQMJCArESZ9pWs05glJuFsGoBI+MqRvHU0uLc9NRiw7zUcr3ixNzi
        0rx0veT83E2MwARw+t/xTzsY5776qHeIkYmD8RCjBAezkgjvwea1CUK8KYmVValF+fFFpTmp
        xYcYpTlYlMR5V81eEy8kkJ5YkpqdmlqQWgSTZeLglGpgSnJYu2iHtupvJ+tJx+f51pR8kmUu
        zZm1zdHjiNMPhZL0T9/63Nmei2UkObzSU3/VblWteMBARXX3QtXjE1Z+33UnYXZmp8B2j7jp
        axYLShXOYDCOyfvYc6rwvf/Hz5KWPzfNPb6/9KS0vOg2paWnhT8HPcviKOlw1rpjtH2yomNg
        6ofdirejrKMXVOtvcM24E9AvwNiizGLcMHeZw+yv1xTdHjz5uavPYsVqveXfS4sDTPYsiDtV
        38SWt3vC47zZGvl2qxa+Db+vqq3dyyrRfevvQnXTmt2BsR9Ctx17s1zeKf/y4bv/zx7sLzIU
        7b1o+eRXb5tFwOnm6X4TWWN0Tttq7bx65/wHrcVz/Z10lViKMxINtZiLihMBa1sA728DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsVy+t/xe7qsPzckGHy7KWJx7vFvFouNM9az
        Wpze/47FYtPja6wWE/efZbdYe+QuuwObx6ZVnWwed67tYfPYvKTeo2/LKkaPz5vkAlij9GyK
        8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DI69+5gLtjP
        WbFh20TmBsZtHF2MnBwSAiYS6xa0sXUxcnEICSxllGj4MZkFIiEjcXJaAyuELSzx51oXVNEn
        RompU6cygSTYBAwlut6CJDg4RAQ8Ja68KwWpYRbYySix++JNsLgwUHz7V3GQchYBVYnf14+w
        g9i8AjYSq99NZYaYLy+xesMB5gmMPAsYGVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIEht22
        Yz8372Cc9+qj3iFGJg7GQ4wSHMxKIrwHm9cmCPGmJFZWpRblxxeV5qQWH2I0Bdo3kVlKNDkf
        GPh5JfGGZgamhiZmlgamlmbGSuK8W+euiRcSSE8sSc1OTS1ILYLpY+LglGpgEp6mLTE/Lu3f
        s0uHnh8790nkTGHklVVXLack3mOet/TXuzteXU/+TbTduWnzDOFZ9tL5W47F2hdY1DcLnTi3
        ummJ+IKLa+46rr73osbi6qwrWcqLr++32itq566yZf39i83+/w7zOEv8Z/uqGHq623pTcz7D
        V/2+A7c5m8/MnFAldpj5jFhuC1PfAY9NjJP2i3ZqrCh3bbI1roiNDXm078Wmy89aZl9SmM5+
        zjHyxb30Cs7sZ9O9svf9Z9x97aWon8vpRd+idl9UbKjd9Kydc0XhDa7fPVHbVn/uVBWQYf7y
        5gCTp37OfpEFQrGnF1St0l3asn7TkaOKd1jypYNnrv6judmnRkuds/acYemq3/5KLMUZiYZa
        zEXFiQBoki81xAIAAA==
X-CMS-MailID: 20210528140701eucas1p2c0ae6147be49494900dd25c1d72ab98a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210528140701eucas1p2c0ae6147be49494900dd25c1d72ab98a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210528140701eucas1p2c0ae6147be49494900dd25c1d72ab98a
References: <CGME20210528140701eucas1p2c0ae6147be49494900dd25c1d72ab98a@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add modules with drivers needed for DragonBoard410c board
(arch/arm64/boot/dts/qcom/apq8016-sbc.dts).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6d2979879593..de39d7648b36 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -662,6 +662,7 @@ CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
+CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_IMX219=m
@@ -775,6 +776,8 @@ CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_GTM601=m
+CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
+CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
 CONFIG_SND_SOC_RT5659=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
@@ -1062,6 +1065,7 @@ CONFIG_RENESAS_RPCIF=m
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
 CONFIG_MAX9611=m
+CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.17.1

