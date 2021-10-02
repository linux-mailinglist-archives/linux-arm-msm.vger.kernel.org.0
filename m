Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FED41FE91
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 00:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbhJBWxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Oct 2021 18:53:15 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:49011 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbhJBWxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Oct 2021 18:53:14 -0400
Received: from [192.168.1.101] (83.6.167.124.neoplus.adsl.tpnet.pl [83.6.167.124])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 82DB63EE73;
        Sun,  3 Oct 2021 00:51:25 +0200 (CEST)
Message-ID: <255059cf-b91c-1d29-0474-6b4b8fcef141@somainline.org>
Date:   Sun, 3 Oct 2021 00:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sdm845: Disable Adreno, modem and
 Venus by default
Content-Language: en-US
To:     Steev Klimaszewski <steev@kali.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211002001358.45920-1-konrad.dybcio@somainline.org>
 <20211002001358.45920-3-konrad.dybcio@somainline.org>
 <67e12e31-2eb3-fea6-822e-56836aabc0d2@kali.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <67e12e31-2eb3-fea6-822e-56836aabc0d2@kali.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 03.10.2021 00:25, Steev Klimaszewski wrote:
>
> This missed the Lenovo Yoga C630 inherits from sdm845 and breaks it.

Welp, qcom decided to give laptops +5 sdm points and that made me overlook it :P


If the rest of the patch looks good, could you add this diff Bjorn to fix that?:


diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index a3b61cb3cfad..b96ecf537ff1 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -343,7 +343,12 @@ &gcc {
                           <GCC_LPASS_SWAY_CLK>;
 };
 
+&gmu {
+       status = "okay";
+};
+
 &gpu {
+       status = "okay";
        zap-shader {
                memory-region = <&gpu_mem>;
                firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
@@ -461,6 +466,7 @@ &mdss {
 };
 
 &mss_pil {
+       status = "okay";
        firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
 };
 
@@ -722,6 +728,10 @@ &usb_2_qmpphy {
        vdda-pll-supply = <&vdda_usb2_ss_core>;
 };
 
+&venus {
+       status = "okay";
+};
+
 &wcd9340{
        pinctrl-0 = <&wcd_intr_default>;
        pinctrl-names = "default";


Konrad

