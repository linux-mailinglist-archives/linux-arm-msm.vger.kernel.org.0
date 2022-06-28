Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C5155EF4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbiF1UXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbiF1UV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:58 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6103DA46
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:48 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id bd16so18754590oib.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w9akEpWjpFO6hjhyJx9Y+tDRi/S2EVK4TDjKFYDvfs0=;
        b=wpQUk82d9u+De26Krts5vTw3aFP+/sFRqhKM6bR5Rt0bo7K8mODmavPRQjlJ21LVpZ
         tNeHxK0wGqcm0Sd+iR/w1iF0ATN5RvSAg+QTCgV3/OQEiFqE3l26ggM8KBBIyUbfRtws
         FW4STg2ATuE/JCH+vazOpOvWU0yoe+rrrI3htYj0tX/FTTf5qMCP3yvtCJt3OicwFo/t
         wj842ASlcJubglx83ENzBOpXBDCTOjgLOFuPBmIBHyk2CNB6bNNCwpQxL1MfosD8jlGv
         4tsktTLGjW3MTQT+jAmInIWiFhanRDdCO+CYFOLoTryHd4Nuklr702SGVCnUMMsUf/p/
         kyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w9akEpWjpFO6hjhyJx9Y+tDRi/S2EVK4TDjKFYDvfs0=;
        b=30tQ2TM+hz2PNHRULe9bL2tTJr/peIGAgm6DPtlfQPg5naRJLNCookO8rqKPtRf5RH
         eqMIZxPmuUYle0waTsFEA9ZP28zr4LAFtzwRMjxqP9DchyWyOGZ7oim6rE9xA7gd9nlI
         N5wGe3HpNNGdELobMRWfQhgtppVcFgWQvrltHYs1lbFAwdbCSGdymE9MrKESDOEgxy0H
         wQhZY2hoPVn7toOCMS3s6/EIisJ8f9XpHeSTxev6Szq3gYh/7U6/1XwyLUK1P4ykcVI3
         mX7WsuDTVuY/bt6V2tAUatGyU/3e/KAbCtM4INuV1ouCZA1LiIkiFvI1x9lIHuTkkty2
         4e3w==
X-Gm-Message-State: AJIora+x2jA2b0/8YuodmmeXgW3lV/ADh3Ncw/QJC5cWNcwCI0Fr0l73
        lK3wMILnA1v+XoekLr8SueTfuw==
X-Google-Smtp-Source: AGRyM1tBCCsVOK0J4ehYUt1GzQHkwGzVqAxQ+RwgiuwWLynjvWMrEyglSK38onq6bXg7jcl0NaeWvg==
X-Received: by 2002:a05:6808:1392:b0:335:a45d:81fe with SMTP id c18-20020a056808139200b00335a45d81femr920778oiw.213.1656447587385;
        Tue, 28 Jun 2022 13:19:47 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:46 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo
Date:   Tue, 28 Jun 2022 15:19:13 -0500
Message-Id: <165644753306.10525.17050921216384493070.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220627135938.2901871-1-stephan.gerhold@kernkonzept.com>
References: <20220627135938.2901871-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Jun 2022 15:59:38 +0200, Stephan Gerhold wrote:
> "make dtbs_check" complains about the missing "-supply" suffix for
> vdd_lvs1_2 which is clearly a typo, originally introduced in the
> msm8994-smd-rpm.dtsi file and apparently later copied to
> msm8992-xiaomi-libra.dts:
> 
> msm8992-lg-bullhead-rev-10/101.dtb: pm8994-regulators: 'vdd_lvs1_2'
> does not match any of the regexes:
>   '.*-supply$', '^((s|l|lvs|5vs)[0-9]*)|(boost-bypass)|(bob)$', 'pinctrl-[0-9]+'
> From schema: regulator/qcom,smd-rpm-regulator.yaml
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo
      commit: 5fb779558f1c97e2bf2794cb59553e569c38e2f9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
