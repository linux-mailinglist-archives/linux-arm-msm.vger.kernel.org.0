Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38951D924D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 15:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393602AbfJPNUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 09:20:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37878 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393595AbfJPNUP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 09:20:15 -0400
Received: by mail-wr1-f67.google.com with SMTP id p14so28027343wro.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from:cc;
        bh=CRTJozMzC0Sq8yDxtGDsD1ywHLbA5/ocQGk+2VJ+CuA=;
        b=oKUVRL7j9UAZKXm5UCUADCaqr4NS4FI6Ffjga6PZVLqpUwStLyTNafOX6SKjWpebwD
         JO588yRlcxBtDW7tEkIsn58BF+NuIcArO1872kulij5VM4fM+/V+6KGtHqRV8v4a24W7
         ezDFlmKqsRF9eIgMlAuitUYW7vHHOUXCDuBqxCIpR5QRmEcRQL0S1IQr/8TPfufJaQtJ
         Np4RxNN0Bl3K7wlEiffIql6avoug/4mVL4APDBnO2flhUDYXtgoGF9+8Un5xApUplJIh
         KwFmQDrDzhmDjlBK1rYYbG60mxax0T8XbyFnou/xk3yJekcc6Chla/RMVjR73gV+TY47
         4rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from:cc;
        bh=CRTJozMzC0Sq8yDxtGDsD1ywHLbA5/ocQGk+2VJ+CuA=;
        b=sNSpvoY5w5adkLdDpkKBdC9ZOppM59+AIovlMqh2mLxyX2t4LMFRS/5jm18+VUZAc/
         0QSifIJaaHQoYz4/lR+d28ZqElNOQUAqA7bbZBdsrS1KfWDKQaehrgu5rwvlY6ZcGI/d
         EzqXItZw5CnC1Yks4VJxsooRW9O2s7BGFgsM+WokFtp6iDQGV+YzGcos22ti27cVyL1r
         ahuF5LLT4LdOMGkfOXZXqG5n6/U7+uHgC8eJd/fJ4x/0z8ECTMsstFC4n0IcyM5pC9cL
         WNEmV5I+OJLIy7wnc1WrDed71FzwtZHUocYuNYirGniyFc60wFNlI2GZ2RuQa1X6rXQ8
         igLw==
X-Gm-Message-State: APjAAAUCK1g+pNbvoH8SnWt4Gg8epefJp8X+ZD1+xOg90HYe6vCG6OYf
        8mvaOUe8Y6eAh273eU0doHpjEg==
X-Google-Smtp-Source: APXvYqxAl12/I5KYaBJs3MqRhWjcFCVnysK215fMFKYBqgC7UyEt15RheXyIMLQParjuuhOeF1z5Ig==
X-Received: by 2002:a5d:4ec1:: with SMTP id s1mr2608717wrv.42.1571232012715;
        Wed, 16 Oct 2019 06:20:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g4sm29489365wrw.9.2019.10.16.06.20.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 06:20:11 -0700 (PDT)
Message-ID: <5da7190b.1c69fb81.560a8.e3ae@mx.google.com>
Date:   Wed, 16 Oct 2019 06:20:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Branch: ci-next
X-Kernelci-Tree: agross
X-Kernelci-Report-Type: bisect
X-Kernelci-Kernel: v5.4-rc1-28-g3836faaf73f4
Subject: agross/ci-next boot bisection: v5.4-rc1-28-g3836faaf73f4 on beagle-xm
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
        mgalka@collabora.com, broonie@kernel.org, matthew.hart@linaro.org,
        khilman@baylibre.com, enric.balletbo@collabora.com,
        Stephan Gerhold <stephan@gerhold.net>
From:   "kernelci.org bot" <bot@kernelci.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

agross/ci-next boot bisection: v5.4-rc1-28-g3836faaf73f4 on beagle-xm

Summary:
  Start:      3836faaf73f4 Merge branches 'arm64-for-5.5', 'arm64-defconfog=
-for-5.5', 'defconfig-for-5.5' 'drivers-for-5.5' and 'dts-for-5.5' into for=
-next
  Details:    https://kernelci.org/boot/id/5da6ccfd59b5144bc3752596
  Plain log:  https://storage.kernelci.org//agross/ci-next/v5.4-rc1-28-g383=
6faaf73f4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/boot-oma=
p3-beagle-xm.txt
  HTML log:   https://storage.kernelci.org//agross/ci-next/v5.4-rc1-28-g383=
6faaf73f4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/boot-oma=
p3-beagle-xm.html
  Result:     0d7051999175 arm64: dts: msm8916-samsung-a5u: Override iris c=
ompatible

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       agross
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
  Branch:     ci-next
  Target:     beagle-xm
  CPU arch:   arm
  Lab:        lab-baylibre
  Compiler:   gcc-8
  Config:     multi_v7_defconfig+CONFIG_SMP=3Dn
  Test suite: boot

Breaking commit found:

---------------------------------------------------------------------------=
----
commit 0d7051999175f97dfb1aa32e9008f08bf044a0a7
Author: Stephan Gerhold <stephan@gerhold.net>
Date:   Thu Aug 22 13:23:39 2019 +0200

    arm64: dts: msm8916-samsung-a5u: Override iris compatible
    =

    msm8916.dtsi sets the iris compatible to "qcom,wcn3620".
    While WCN3620 seems to be used on most MSM8916 devices,
    MSM8916 can also be paired with another chip (e.g. for WiFi dual-band).
    =

    A5U uses WCN3660B instead, so the compatible needs to be overridden
    to apply the correct configuration.
    =

    However, simply using "qcom,wcn3660" would be incorrect,
    since WCN3660B requires a slightly different regulator configuration
    compared to WCN3660.
    =

    Instead, it requires the same configuration as "qcom,wcn3680".
    Replace the compatible with "qcom,wcn3680" for A5U to make WCNSS
    work correctly.
    =

    Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
    Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/ar=
m64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index 1aa59da98495..6629a621139c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -8,3 +8,9 @@
 	model =3D "Samsung Galaxy A5U (EUR)";
 	compatible =3D "samsung,a5u-eur", "qcom,msm8916";
 };
+
+&pronto {
+	iris {
+		compatible =3D "qcom,wcn3680";
+	};
+};
---------------------------------------------------------------------------=
----


Git bisection log:

---------------------------------------------------------------------------=
----
git bisect start
# good: [54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c] Linux 5.4-rc1
git bisect good 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c
# bad: [3836faaf73f4380c8f9632723be4ee82f4e50196] Merge branches 'arm64-for=
-5.5', 'arm64-defconfog-for-5.5', 'defconfig-for-5.5' 'drivers-for-5.5' and=
 'dts-for-5.5' into for-next
git bisect bad 3836faaf73f4380c8f9632723be4ee82f4e50196
# good: [acbf73bfa02881ba9e0532ba1a5f5beec573af9f] soc: qcom: llcc: Move re=
gmap config to local variable
git bisect good acbf73bfa02881ba9e0532ba1a5f5beec573af9f
# bad: [e38161bd325ea541ef2f258d8e28281077dde524] arm64: dts: apq8096-db820=
c: Increase load on l21 for SDCARD
git bisect bad e38161bd325ea541ef2f258d8e28281077dde524
# bad: [0d7051999175f97dfb1aa32e9008f08bf044a0a7] arm64: dts: msm8916-samsu=
ng-a5u: Override iris compatible
git bisect bad 0d7051999175f97dfb1aa32e9008f08bf044a0a7
# good: [8a250aa6eccdd54aebc62165c0c1fe250fee0338] arm64: dts: qcom: qcs404=
: add the watchdog node
git bisect good 8a250aa6eccdd54aebc62165c0c1fe250fee0338
# good: [efb9e0df7d8df9f6ccc4a02a52e56fb6e379e193] arm64: dts: msm8916-sams=
ung-a2015: Enable WCNSS for WiFi and BT
git bisect good efb9e0df7d8df9f6ccc4a02a52e56fb6e379e193
# first bad commit: [0d7051999175f97dfb1aa32e9008f08bf044a0a7] arm64: dts: =
msm8916-samsung-a5u: Override iris compatible
---------------------------------------------------------------------------=
----
