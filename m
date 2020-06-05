Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136791F0022
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 21:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgFETAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 15:00:00 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:28064 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgFETAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 15:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591383595;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=uG+xyzcgFcPs8d4qfzghhlZ8ma9xNU5sLA5RgBUV1Kk=;
        b=FUuhFf0w0uFYZQIU+9On405Sj5fwfntCYdRYcmcai+QY4rUJN4oANzm6sUK7PS++0H
        MJY4sD/0KWg+H5rRExlwsvef3Qnb4aIavBX5UtawVg1WjV4S2f9ASPFjxt7MP86Nuf6+
        PMjbibmLiSxSZSxKXoFZ5q/HAKPp1knkUHR4kjYQFHw+TBsUWXBb14cpOuBt9zo012/N
        CNXlHAeeLeaT598NHC2sDz8gXrsPtnUlHgUIUoU6wMFDpxsQJ/5L77bUbEfQcPgrrTBI
        TKTmklWkFghX6a+aZgcsQRBCO9Aej44I8gAiTRt7JNmv6DGzHimXq6iGNvqQkKwe8BaR
        w/2Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6IlKY="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.9.1 DYNA|AUTH)
        with ESMTPSA id U0b5f2w55IxqKmE
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 5 Jun 2020 20:59:52 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/4] arm64: dts: qcom: msm8916: Set #address-cells for lpass
Date:   Fri,  5 Jun 2020 20:59:13 +0200
Message-Id: <20200605185916.318494-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As of commit 4ff028f6c108 ("ASoC: qcom: lpass-cpu: Make I2S SD lines
configurable"), lpass now supports children nodes to configure the
MI2S SD lines to use for one of the I2S ports. For example:

lpass@7708000 {
	dai@3 {
		reg = <MI2S_QUATERNARY>;
		qcom,playback-sd-lines = <1>;
	};
};

The "reg" property refers to the DAI number in this case,
so we need to set #address-cells and #size-cells appropriately
to avoid DTC warnings.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 32bd140ac9fd..b0f9cfaba1ed 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -700,6 +700,9 @@ lpass: lpass@7708000 {
 			interrupt-names = "lpass-irq-lpaif";
 			reg = <0x07708000 0x10000>;
 			reg-names = "lpass-lpaif";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
                 lpass_codec: codec{
-- 
2.26.2

