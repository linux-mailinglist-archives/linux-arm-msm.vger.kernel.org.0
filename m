Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4D06D9C37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 17:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239550AbjDFP0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 11:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239318AbjDFPZ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 11:25:57 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8131186B8
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 08:25:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id br6so51269359lfb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680794751;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QseBQLy8TtMrmO07Qs/JRVxTi2zIfcjTE6wwfQJ+AhM=;
        b=DnNXfWd03uXqT0o2IsSiDvfsHJiYlA/365R+ayRxxIV6l+U9IWpcDXCX7qcpw/xbvx
         eIL0RJdbEqn3YeXZRYEUQSmacRyfUuz+YcZ7LQsoJ42pe68TwkvJRMVA+7qHBId8H6wf
         MhvrjEZ9Got9ZmovLyQPNtxuV8BPkeubWyKGCoBYxKotzw5Anz3jnTOP26sHm1KbP4hz
         mUahIOKmZipHhy3HCDzryDvBHO6fH+lLc/pjHgQ4/DJagcw9GoA6Pn/prrBjKE5NErZd
         GGworHAIST7yXoXK4Vcra4W1LfXM/R/Sv9Mh/QFf95TfIavtyF+xXmxRx5ZpKnaqHP5G
         MaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794751;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QseBQLy8TtMrmO07Qs/JRVxTi2zIfcjTE6wwfQJ+AhM=;
        b=cMosPJHm77sbs8vo6hO4ja1TLD2/ECQR3Mg2WvfLVo+pBviIiE16KiVLf7V79wtrAp
         Nn9/O3w6NiV6dgEemyNEQ+wStowi5AgQ3Qumr0RThL085tHLmcLLIu7f0dV6ksMiAXvl
         b479WKo2q53I+N6YQ+aF6zPtq3AxptpP7UmjRNb9bqjX0wM1fhTh/fVP5WwjfU1OttM0
         7b1k/R5dVokW1ztMV1ZoQv2k2+qvC33KOFg3uQeHSB0gQ3C2jjwdevBF8RHhOVL3ygeC
         EadJpeYRmcKjKS51WBohRIMdo/oNZgCdtM/UX/E9MCnGHpa4qqwwhpnEtoNc8SrwYjpg
         oLWQ==
X-Gm-Message-State: AAQBX9cepGaPF7vhaXQFIqMkvbGg5CDCce37erphg1cU559zW3YdhUSW
        BtNPGXlV0YEA0Oa+t8jnxGpYsCeaNWmZt2kMvCA=
X-Google-Smtp-Source: AKy350YvcZx8qx/o+0RM0P+WGhn7PuM0G03nngoVhulexm2Tfn3ofwiyNavcDmIM7yeWSHcGxVwCng==
X-Received: by 2002:a19:ee18:0:b0:4db:3882:8f42 with SMTP id g24-20020a19ee18000000b004db38828f42mr2096473lfb.45.1680794751693;
        Thu, 06 Apr 2023 08:25:51 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id h4-20020a197004000000b004cc9042c9cfsm300103lfc.158.2023.04.06.08.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:25:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] Tab P11 features
Date:   Thu, 06 Apr 2023 17:25:49 +0200
Message-Id: <20230406-topic-lenovo_features-v1-0-c73a5180e48e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3kLmQC/4WNQQqDMBAAvyI5NyXRVqUn/1GkrMmqCyGRjYYW8
 e9N/UCPMzDMLiIyYRSPYheMiSIFn0FfCmFm8BNKsplFqcpK3VQt17CQkQ59SOE1IqwbY5S2US3
 etQFoUOR2gIhyYPBmzrXfnMtyYRzpfc6efeaZ4hr4c76T/tl/m6SlktZWurJQtm1Td448cLgGn
 kR/HMcXt8UFm9AAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680794750; l=808;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iHNEEA5Iv3dwjVQpoEQKxZ3jdgKnaMmyVgtYumaQYfI=;
 b=aN84IwOztKIO+Uo88gKhk7ikVnRwdJy746haXkCpvYhR0dylOkpkika1yziuUvQOQ2AC4fmjGxBa
 pxA/Xex1CIKFSUoRiDxbXfIgn4aOyCR100xlKLsJ5WXsgYVTNLgH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This short series brings a couple of "nice" features to the Tab P11:
- Wi-Fi
- remoteprocs (+RMTFS)
- ramoops

No external dependencies.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      arm64: dts: qcom: sm6115-j606f: Add ramoops node
      arm64: dts: qcom: sm6115: Add RMTFS
      arm64: dts: qcom: sm6115p-j606f: Enable remoteprocs
      arm64: dts: qcom: sm6115p-j606f: Enable ATH10K WiFi

 arch/arm64/boot/dts/qcom/sm6115.dtsi              | 10 +++++++
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts | 34 +++++++++++++++++++++++
 2 files changed, 44 insertions(+)
---
base-commit: e134c93f788fb93fd6a3ec3af9af850a2048c7e6
change-id: 20230406-topic-lenovo_features-d708e51caa7e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

