Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAD530F4BF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 15:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236477AbhBDORc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 09:17:32 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:35075 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236637AbhBDOR0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 09:17:26 -0500
Received: from [192.168.1.101] (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E97C71F881;
        Thu,  4 Feb 2021 15:16:24 +0100 (CET)
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and
 panel bits
To:     Amit Pundir <amit.pundir@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
References: <1612426177-6611-1-git-send-email-amit.pundir@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <889e6ed8-133a-9416-be3b-5b2a97ea7fbb@somainline.org>
Date:   Thu, 4 Feb 2021 15:16:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612426177-6611-1-git-send-email-amit.pundir@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!

>vreg_l14a_1p88: ldo14 {
>+			regulator-min-microvolt = <1800000>;
>+			regulator-max-microvolt = <1800000>;

Should probably be renamed to vreg_l14a_1p8 then.


>+	ports {
>+		port@1 {
>+			endpoint {
>+				remote-endpoint = <&tianma_nt36672a_in_0>;
>+				data-lanes = <0 1 2 3>;
>+			};
>+		};
>+	};

The endpoint has a label, you can simply use &dsi0_out {};.

>+		vddpos-supply = <&lab>;
>+		vddneg-supply = <&ibb>;

With Angelo's latest series [1] merged in, I reckon you should explicitly configure lab/ibb (like in [2]),
as wrong settings (which CAN BE SET BY THE BOOTLOADER in some instances!!) can lead to hardware damage.



Konrad

[1] https://lore.kernel.org/linux-arm-msm/20210119174421.226541-1-angelogioacchino.delregno@somainline.org/
[2] https://github.com/SoMainline/linux/commit/4f4853b2e252b5f9d03e90119110aac80258fc53
