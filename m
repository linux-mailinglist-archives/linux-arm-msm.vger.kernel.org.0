Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD9855EF6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbiF1UX0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiF1UVt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:49 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FC43D49E
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:39 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 7-20020a9d0107000000b00616935dd045so10551150otu.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=drePDoRqqbzl6prpyVgk7AYX37yHicKnxyQR1OBjzI4=;
        b=moXgRC1ZCmtAk43r30IRkCVOlO3m0Lgmoyisbtq3SUSBCEMyi6gvW1oUVWJiXmUfIc
         6QtUcPpq/lDTeec6ygeym0stD3jSPRZ5J7RkMhqhLxOzTyTrw7AO0g7PH6An9eqMksyl
         Ydj0GgrPhK4gfvM0wtSqoErrAjAx9jofILHyuntEs1Xyk7g+n4956V8AvZCN8oVgwn7P
         qef3jWopwTNWnh6ho/WJuw93S9/3UdFe/rrZECqPDYCXAl49CjS5ZXRef73v7kqRB0/Q
         JH4vUc2cm6xEcnud8rqSLSIMWMiQ5f8wDRQXw76WEk/Z8lPqcjtgUXSmbI67xkH/X1DJ
         Nk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=drePDoRqqbzl6prpyVgk7AYX37yHicKnxyQR1OBjzI4=;
        b=IeOWTLF/eAPZfNZccWNi6lxCMbeRpVX8mQgAjClLYIfSZxqoLjhVv9FoBnwHm6SX9J
         xOn7njreUROfTlFDwvRik1fTdGDv0LXiCpXsaZm/Hjy+/VCndu1Zu+dpqEkIFoJNjir/
         Z4Mo84qWB9xMNdpDnO4nFL397R3POd4QKPC4+Mtxy2T1EKTN08VGBq+tJCSJ+Cg2Hro2
         P23UFOdtJau7+C6DqDNX+cZoQWA0xlLJTAYgPzVkTKezWgFP3r/g05/qZHOJjWhHFSqO
         rSvUdhbLUq3xyjFhZAqCdgs7RVtXBmrXo60Ko//zEHgfvHINc62D2qmDxC6byJ0KUFn7
         YOPg==
X-Gm-Message-State: AJIora+W5VzUlO7W8yKBf5fWSJ9cAgXz45MxptCBG8ml7+8HDYobFpM4
        uoiTTLro8sWfntnqDo33FuMtNQ==
X-Google-Smtp-Source: AGRyM1tu7bDrRegeRjhgYkK5mcokV3KE8Y2lqVgXT/4kP1CoErcxfekA6u2mEhkTco3Or0B5ePUSkg==
X-Received: by 2002:a9d:6750:0:b0:616:8fd5:bfdc with SMTP id w16-20020a9d6750000000b006168fd5bfdcmr9811390otm.322.1656447578602;
        Tue, 28 Jun 2022 13:19:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:37 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kaushal Kumar <quic_kaushalk@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        manivannan.sadhasivam@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add QPIC BAM and QPIC NAND devicetree support for SDX65
Date:   Tue, 28 Jun 2022 15:19:07 -0500
Message-Id: <165644753307.10525.12384572322800872400.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1651511286-18690-1-git-send-email-quic_kaushalk@quicinc.com>
References: <1651511286-18690-1-git-send-email-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2 May 2022 10:08:02 -0700, Kaushal Kumar wrote:
> This series adds and enables devicetree nodes for QPIC BAM
> and QPIC NAND for Qualcomm SDX65 platform.
> 
> Changes since v2:
>  - Modify status as "okay" for the nodes added for sdx65-mtp.
> 
> Changes since v1:
>  - Sort the nodes added for sdx65-mtp in alphabetical order.
>  - Rebased on top of 5.18-rc5.
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: qcom: sdx65: Add QPIC BAM support
      commit: ab11b74d87ddadb1e6e6d8dc36f3145a26158ef2
[2/4] ARM: dts: qcom: sdx65: Add QPIC NAND support
      commit: 0ec15b6f7621c2e5ded3d3d1a67361da1895c26b
[3/4] ARM: dts: qcom: sdx65-mtp: Enable QPIC BAM support
      commit: eae61fddd64861fc496a7786b02449abe8188145
[4/4] ARM: dts: qcom: sdx65-mtp: Enable QPIC NAND support
      commit: 59e73f67e14b95eddbbff2f009c98a55cef47f8a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
