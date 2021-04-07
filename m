Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C0335723E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 18:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354336AbhDGQhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 12:37:07 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:12073 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbhDGQhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 12:37:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617813415; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hGzxAg5H0D2lg3T6QOJCNnkoncCkGpyniBQVDETRmfXwAzW5qMj8l0K2g5aa6vnfJk
    H66x6r0su/x2pyWDE1bS3Ebx4XhPvY4c/pvkv7QWsAHLV79Pf/e+zrg+wTD9iFU2IBjV
    6echrYtFNKHApITc1YQSCyN5Lw6Ba0vbNvfEc7zpYbm4DiJjcL9w08oqXLhHaL3A6xnn
    bhnetauC1IIrwaRU1+oYQIKn0vr/KzVpz+/AXGnFaXdTOoV8CkM4vgQreGrfT782uveS
    EnPoXe+zj3YXHI1zpa3H5BBcvMjzAcAjdwb1lCUSaUlPjB9/CJ23pEpQMN7IjVI1gGNb
    T8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617813415;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6DgClNx6s6N7oRNUAhbSSzXE1oq9pX6Z5rOOAzgqerI=;
    b=r6sr21mgLMt+yGKMBHIfdj7qnqRd0sSPr6RGjs4e4wEVl2H1mneGfnRI9Z2Uc/UlJ5
    V6MER1qNoRDkORROsA/5MXF+QOCYoDMLnyO+aW615LzbCdbAZyYKUVU1Gejm/Stx22A0
    Gwrqx7kkKhgLr07ZqXYALkRkQh6nhbx7KoMYBE3qnGRn7hgSCpJJUjB1G7YpiIhuvfk7
    BrUGwFlHSjaIeW+wELb7pMNBKDMcfwL0HN/a2Uw4JEzDOn/Pywh7jRhSAh3zh7Kbcyic
    PUYlKzNjfgZ5esI8NgYTVbsxXzHgrgblI4ZnVxIyP5igIuwTRKoSt22nEtdN92V2pOEB
    EApQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617813415;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6DgClNx6s6N7oRNUAhbSSzXE1oq9pX6Z5rOOAzgqerI=;
    b=X1JOjf9yylZy4LOsJWGHLh4UVT7GY3o0+lEHfotYbcOfZKNw54NZpZz7D9HPTnTSw8
    3+ym3BQTFoWLt9ATZUG/thLvwbohoxZM3XDiv4XORzLo9QW/Kik7XhbYEbTOcvYqrbLB
    UPc2vvw6FMZ9+E/3N7ZXWDs0DkHPOsK0m1N3vGyfKl774BXWKoA/x1aFEbN4mXtM+ppL
    u7V2borqtk0mZzEojV5ef6qiR/H86KKF2Vct/u8PXwd93PsyrpDhcJpO8RmRsmYgD5gH
    nZp5oRYWD8kMHFgGLU8eSM4Ax1RXrEFqNnHSFeFZuPxSPC6CYJEhsD8Dm+59rTR21BUO
    2gkg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6Nd3EC"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.24.0 DYNA|AUTH)
    with ESMTPSA id 409abax37Gas20p
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 7 Apr 2021 18:36:54 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] arm64: dts: qcom: msm8916: Add GICv2 hypervisor registers/interrupt
Date:   Wed,  7 Apr 2021 18:36:48 +0200
Message-Id: <20210407163648.4708-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ARM Cortex-A53 CPU cores and QGIC2 interrupt controller
(an implementation of the ARM GIC 2.0 specification) used in MSM8916
support virtualization, e.g. for KVM on Linux. However, so far it was
not possible to make use of this functionality, because Qualcomm's
proprietary "hyp" firmware blocks the EL2 mode of the CPU and only
allows booting Linux in EL1.

However, on devices without (firmware) secure boot there is no need
to rely on all of Qualcomm's firmware. The "hyp" firmware on MSM8916
seems simple enough that it can be replaced with an open-source
alternative created only based on trial and error - with some similar
EL2/EL1 initialization code adapted from Linux and U-Boot.

qhypstub [1] is such an open-source firmware for MSM8916 that
can be used as drop-in replacement for Qualcomm's "hyp" firmware.
It does not implement any hypervisor functionality.
Instead, it allows booting Linux/KVM (or other hypervisors) in EL2.

With Linux booting in EL2, KVM seems to be working just fine on MSM8916.
However, so far it is not possible to make use of the virtualization
features in the GICv2. To use KVM's VGICv2 code, the QGIC2 device tree
node needs additional resources (according to binding documentation):

  - The CPU interface region (second reg) must be at least 8 KiB large
    to access the GICC_DIR register (mapped at 0x1000 offset)
  - Virtual control/CPU interface register base and size
  - Hypervisor maintenance interrupt

Fortunately, the public APQ8016E TRM [2] provides the required information:

  - The CPU interface region (at 0x0B002000) actually has a size of 8 KiB
  - Virtual control/CPU interface register is at 0x0B001000/0x0B004000
  - Hypervisor maintenance interrupt is "PPI #0"
      Note: This is a bit strange since almost all other ARM SoCs use
            GIC_PPI 9 for this. However, I have verified that this is
            indeed the interrupt that fires when bits are set in GICH_HCR.

Add the additional resources to the QGIC2 device tree node in msm8916.dtsi.
There is no functional difference when Linux is started in EL1 since the
additional resources are ignored in that case.

With these changes (and qhypstub), KVM seems to be fully working on
the DragonBoard 410c (apq8016-sbc) and BQ Aquaris X5 (longcheer-l8910).

[1]: https://github.com/msm8916-mainline/qhypstub
[2]: https://developer.qualcomm.com/download/sd410/snapdragon-410e-technical-reference-manual.pdf

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 4c155735fbc9..4f06c0a9c425 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1766,7 +1766,9 @@ intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
 			#interrupt-cells = <3>;
-			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
+			reg = <0x0b000000 0x1000>, <0x0b002000 0x2000>,
+			      <0x0b001000 0x1000>, <0x0b004000 0x2000>;
+			interrupts = <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
 		apcs: mailbox@b011000 {
-- 
2.31.1

