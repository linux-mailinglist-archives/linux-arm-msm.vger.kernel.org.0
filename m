Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDEA649ED3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 13:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbiLLMfY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 07:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbiLLMfA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 07:35:00 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A8212621
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:34:21 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so15533141pjs.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 04:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfIwNI7T0psn5lDqNEX4WmRlkGqyl7ZmRdxDmkjkE3o=;
        b=uUzlkjM9xadP/wsfePCnqjzwimre9NyLsWAauCXIMA4K2H4sdT5xEbloK1SqvMpiI1
         RbnWr8fQlEusmTFxO97E6HQ1SY+VLLpx6sUhuDJqsaXMoJP0o5up0rCoTYybXD16bjSA
         aShFXmtsF5KPZSAIn9B2I/d31rGvMztJVH6vtfl/b++okd4nu9Kk9FPoR8TXLQATuheJ
         r7UTt35dMuC18r94SFLCEwbfYUALLkwJ6XlpjFzImo2IStVCik4eblWALX0L9c+bkNeQ
         GGFJuMsb9mYhEuTkKtqKmMrm0wzFYLXUM8ja/vhaEuUngg7DDEcLEW3cLBDuCMUUESHN
         k2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfIwNI7T0psn5lDqNEX4WmRlkGqyl7ZmRdxDmkjkE3o=;
        b=FAtV9aF/nuHlYXajO0eHxSIFzp6g8ljjMP+HFr9OrU2vU8LXFSbzv6tvE3MHuqUuAP
         4J5MptVfLfvzLw5uvBEgppnS3nWECclNwkD9Q4gxCkRS8HPFkG7D9saG8oTzD5UXEvbx
         ye+fy6QkGP31o4sfQXclpSUOPxmiE7RfAc9sXjlJmimNAcQcA9LJ4RYnzw/J3IjSZtB0
         2og6NtivVwZibwg0BKwUgcbt/2ciuflPbyL1ny6QOsfxXB59ed7d5fJ6CncHnj8phg7f
         oDaTRosY2nKQ//ftMdyptHiAF+3pMatvszqkVxZ9hrbXSYP2eMEKJRDbDJ0TeyU1IZKw
         ME3A==
X-Gm-Message-State: ANoB5pmllSEthfE2SKcIz3h2hKY0F+5yljP6ZsUEowaAp11E3f1Vm9xw
        6HVm4OsF5J+0TrwZwdSFM5UP
X-Google-Smtp-Source: AA0mqf4rE6OP22oNrLonHgu1sGCKwOejdojpWXX0Em5PntzhDOwfs6CtZJREOlEYmIQSwLoJpiBijw==
X-Received: by 2002:a17:902:6bc8:b0:188:d2b3:26c1 with SMTP id m8-20020a1709026bc800b00188d2b326c1mr15270890plt.10.1670848437579;
        Mon, 12 Dec 2022 04:33:57 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.33])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b00189c93ce5easm6252557plx.166.2022.12.12.04.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 04:33:56 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v2 06/13] arm64: dts: qcom: sc8280xp: Fix the base addresses of LLCC banks
Date:   Mon, 12 Dec 2022 18:03:04 +0530
Message-Id: <20221212123311.146261-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Also, let's get rid of reg-names property as it is not needed anymore.
The driver is expected to parse the reg field based on index to get the
addresses of each LLCC banks.

Cc: <stable@vger.kernel.org> # 6.0
Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 109c9d2b684d..f8731cbccce9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1856,8 +1856,11 @@ opp-6 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc8280xp-llcc";
-			reg = <0 0x09200000 0 0x58000>, <0 0x09600000 0 0x58000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09300000 0 0x58000>, <0 0x09380000 0 0x58000>,
+			      <0 0x09400000 0 0x58000>, <0 0x09480000 0 0x58000>,
+			      <0 0x09500000 0 0x58000>, <0 0x09580000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

