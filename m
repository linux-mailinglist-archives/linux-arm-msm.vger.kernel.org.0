Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B77F6BCA08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 09:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjCPIxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 04:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjCPIwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 04:52:31 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54893B79C3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:51:33 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id y14so853841ljq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678956686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeylFVo7UbFotxXKN5Jk9AW63WMsXe+ARjqLamdFW7w=;
        b=Z3AAdZzei69KEGBWwngVymIGtG0e2xa+U+6TbMOtWfK1l1cEV5wJ3Oi6sWJ2+TKL/q
         EhbRSkMaKzivAqA3RZWQnkPaHiOfK2UGbG7XX2LIL2jZ0m1zoDIBejQRIix5sOlIEWO3
         Lk5ajq/5dDxD6snISzP1DGsPSF+aKSyMSzV/0qaIp8v2bUJctOrfujVAgmf8YGpHVFAh
         TPw6v4TvssRhGP1vj2JBl0iLXDDdTxn7CAV1hmWLjlMD73AbTLWbzW7IGO1HAsNjGkfx
         jpKtSQrYiR5YMhj03+49lnFb+XsB9v5hB+i5F+FQIzD6kM+SvhdsIWn6pjl7bmyjs/i2
         gYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678956686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeylFVo7UbFotxXKN5Jk9AW63WMsXe+ARjqLamdFW7w=;
        b=rtYdJeHClFezD66Vi23Hvko/Srisd6MP5CdJjn55W3ZQikLr2Ai8yZh7k31a5svluo
         mzkuNhsOOtIcYX8hL8Y99Vf4ErIdFn8m3aqN7c7RHDMJxk/QShtzkwn+i3gnAcTlWx2t
         SYcXgDzaA+yWtUaUMWeFHIP7lL8G5whgoXJnAEW3qFiy8JOdhT1We/yO3sQdiiU3GxeL
         N1TVg4hdoIzEfrLkcw7lBVZ59lpqBnbs4TTluCPpAkNJpL+LiwtEu+PwZqe8LUlCA9P/
         /FKrYjpvdMoE/WBAZYDBeqa2QTDtEV4URLkbtY3Cyal3W1/5gXaEJnZ1gQRTAHGqspcb
         4taA==
X-Gm-Message-State: AO0yUKWYbRTbGPhDuvlGvWNcLzP/GfbhIIpaJIBmhIVZ/AfcRIinAhwn
        iPgpttD/BEYembVs+u1kpGyabQ==
X-Google-Smtp-Source: AK7set/0NJerC8vUaJNQ2tyW8LwLWSp5G6DBTMCvwIABzlv+WcmetLF/tmCq3vX0+utRYHtmPqbJeA==
X-Received: by 2002:a2e:9c8c:0:b0:295:a96c:f77c with SMTP id x12-20020a2e9c8c000000b00295a96cf77cmr1644721lji.3.1678956686536;
        Thu, 16 Mar 2023 01:51:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 01:51:26 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 16 Mar 2023 09:51:16 +0100
Subject: [PATCH v5 10/10] arm64: dts: qcom: sm6115: Use the correct DSI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-10-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=835;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=fTDJ/Pk/K83TEsz8nt+gatYoQ7InKrC5bjtKXy4Z9Sw=;
 b=6dVPWc6fouGLAtAlDaU7jHpfHzCJJY89FA5mqEAD5VXJxPTs5FZju6xUdRCpTHYgRqkK04rKeJ9v
 GWYlKOQLDjLJlUaQssq0kx9ZMu1bZssR7Q1yyKs82T4JnyTfzVY5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the non-deprecated, SoC-specific DSI compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index fbd67d2c8d78..18c7eedff300 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1219,7 +1219,7 @@ opp-384000000 {
 			};
 
 			mdss_dsi0: dsi@5e94000 {
-				compatible = "qcom,dsi-ctrl-6g-qcm2290";
+				compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x0 0x05e94000 0x0 0x400>;
 				reg-names = "dsi_ctrl";
 

-- 
2.39.2

