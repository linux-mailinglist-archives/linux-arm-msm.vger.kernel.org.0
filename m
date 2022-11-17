Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6678062CFB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 01:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbiKQAcu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 19:32:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234155AbiKQAcs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 19:32:48 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A711252893
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 16:32:47 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id v1so249118wrt.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 16:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQcr30bJP1FYEY+9bPzjICI4lLDqoYAjeySIr0YdZDc=;
        b=tZNT/ZwjsmTHBJ7QozvWWX+BmmVI1DlvlVLR1W3eaFlFL09/+kQX6clfmJA3cMbRG5
         HJFWrxSw9a5WIF9y2GiYX41D+OYewVOmxSGEZHBKZkoLwXZ9CAjobcloTNC8+gu6n7Hf
         exen9nPgZAG12Sa2E8YIspaKZNHPpv0bCqeLrCKXoAXDISxgJcIsf/WTxAHlyTxzxAJO
         SXwRRQo2DLiUjLIAcqHg82cgjgH9Akg0p1G7PNi57dS1sn4t7AMETCOmKxBTla1CqAHg
         Cv1ELX+ZYO6Qv4/1buZSwUERsaMyNUQ5YN3GeTcypIBmwSWPMGWid2f4fGAcekLrhE/p
         Ruaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQcr30bJP1FYEY+9bPzjICI4lLDqoYAjeySIr0YdZDc=;
        b=CkwQqxydM/7j08fcEuQNPmg4Ivxxa6iS8pY2Q7plLKysMj3wqudoyIT9PLKaSTmNRs
         jrtMHQ2Oraqs4OZhEPVebwjE2h8UQgO6umw9R+USPwC99xFLs6Avq0Z0koR5iWnVir/O
         6sb3yJSn2JUljXzWS5j96p0I1OLaznxTHMDmWp4wOYT+CDr7EBWSbfJcPlpaZGJOELJs
         xs5n5m/8ornIiwBB8U9dL8lvhTDYQvAGudZO3DerXUWjul4nwIc3DCul84to4DGnZvOk
         Dj7tHQUCDAtZZJybH9FrOHNGUcwj54yPJ13qGoP/t5lBMXOBTqiqXQgy5Mq50cPLYN0N
         VAKQ==
X-Gm-Message-State: ANoB5pmc2q3EeqHjz+YbxF/dHyHPzPJO/IwcZJBqYLq/eEh7+ORlQO3a
        8tp/+0oLpoHGVuVSWWwrbtt5sg==
X-Google-Smtp-Source: AA0mqf6e/GV5irgamuTCPec/NEXyzqwIkzhdd9VFF8XDTAFHpbntDfqoOzuSQfwxNWNMdhnVUt3cEQ==
X-Received: by 2002:adf:e986:0:b0:241:8435:ea7e with SMTP id h6-20020adfe986000000b002418435ea7emr40429wrm.103.1668645167318;
        Wed, 16 Nov 2022 16:32:47 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b00238df11940fsm16472703wrm.16.2022.11.16.16.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:32:46 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v7 3/7] arm64: dts: qcom: sdm845-db845c: Drop redundant reg = in port
Date:   Thu, 17 Nov 2022 00:32:28 +0000
Message-Id: <20221117003232.589734-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
References: <20221117003232.589734-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The reg for the port is specified in the dtsi. Remove from the db845c dts.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 7c88312333c22..8a98f3e86b41d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1186,7 +1186,6 @@ &camss {
 
 	ports {
 		port@0 {
-			reg = <0>;
 			csiphy0_ep: endpoint {
 				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&ov8856_ep>;
-- 
2.34.1

