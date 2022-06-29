Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 116FE56033D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 16:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbiF2OiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 10:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbiF2OiD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 10:38:03 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA92539686
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 07:38:01 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j21so28465193lfe.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=ghmi5jsmPnP+ojwHTepYzlKyG3gtdAz3TucYsEdGWMs=;
        b=d7nAx8GH5P30iidV+gOCv5+qTbaHk+5RhHFVnnUN8vnpf7EO5f1ZukxHVPi1Mz4LY1
         +xGKk/fqFZf/jGS4x1HLo5vEdFOrnjUp0Lh/z7CGMyC59ybdVBg0etM/tWU9qmHheBlW
         45tUL5vNNY4ABjYEj3UQy76z0l5h63ge09kzesgMpVUj0CF0XcGG0XDMebkfS+uvbcIy
         994wI+oqKjGqgxUhf5d9hqz2+QF/4uRwfZMa9t/58EoCcc3fUJDIQI6mEQjNbiYzKwAq
         FcCStgThmBMKJnA21G1jbyDEaS8i8hdIAYLrelxMWSUpZzsPqAFjFUqqkGXKyzY4AM7q
         kmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=ghmi5jsmPnP+ojwHTepYzlKyG3gtdAz3TucYsEdGWMs=;
        b=22qB1werD+bmkNeckES1jb4Vr5cpRCs25cBHyQifoQ/OGOYHyM8GtqWzq+mG3cBCz1
         84q5yRT++Rlf6lMjk9v16itGZMHER6CzoyOtnss4r3hkHiYBW4+xEqxzGj21MLqZQ4Uw
         qxeEFIGnQ7/hRyGpSvM0JDtFBQT0mYMC4bSHIgzA+LUUVwIUUX0kt0z07KOYUw56XTcS
         fgyHN8xa2WFm1BPfjOGwVwWxHSPAlcRVaSwBdKtBNM5XYGElUI71Re2wWnjMOlJvpKt8
         jL7rGqAi/tpAWf94I/ebBO3bU14UvYzw3rQ2AULE56QZ+Zzr4Wk3PdxVCov5PkV3gOCO
         N/Dg==
X-Gm-Message-State: AJIora9K/Pbg1rvFLptMrGK8VZoDi3+HrhYQnzqms+2wClv1IhGeSiM8
        34hKOzt6aPyoq+9TTvjlK9gGgQ==
X-Google-Smtp-Source: AGRyM1tgFmsHBNq3ULmSu/tJbaPShocOAJ/4be0pZToDLOU5TviLycqBaqEM/rW6CPkVvbV+9LcvLw==
X-Received: by 2002:ac2:4c19:0:b0:47f:9f39:768c with SMTP id t25-20020ac24c19000000b0047f9f39768cmr2310964lfq.285.1656513480049;
        Wed, 29 Jun 2022 07:38:00 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.229.210])
        by smtp.gmail.com with ESMTPSA id l7-20020a2e5707000000b0025a740b3c16sm2130692ljb.122.2022.06.29.07.37.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jun 2022 07:37:59 -0700 (PDT)
Date:   Wed, 29 Jun 2022 17:37:56 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_02/10=5D_dt-bindings=3A_PCI=3A?= =?US-ASCII?Q?_qcom=3A_Fix_msi-interrupt_conditional?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20220629141000.18111-3-johan+linaro@kernel.org>
References: <20220629141000.18111-1-johan+linaro@kernel.org> <20220629141000.18111-3-johan+linaro@kernel.org>
Message-ID: <9067A548-F8DF-484B-8DD4-94ACA581B191@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29 June 2022 17:09:52 GMT+03:00, Johan Hovold <johan+linaro@kernel=2Eor=
g> wrote:
>Fix the msi-interrupt conditional which always evaluated to false due to
>a misspelled property name ("compatibles" in plural)=2E
>
>Signed-off-by: Johan Hovold <johan+linaro@kernel=2Eorg>
>---
> Documentation/devicetree/bindings/pci/qcom,pcie=2Eyaml | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>


>
>diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie=2Eyaml b/Doc=
umentation/devicetree/bindings/pci/qcom,pcie=2Eyaml
>index ed9f9462a758=2E=2Ea1b4fc70e162 100644
>--- a/Documentation/devicetree/bindings/pci/qcom,pcie=2Eyaml
>+++ b/Documentation/devicetree/bindings/pci/qcom,pcie=2Eyaml
>@@ -628,7 +628,7 @@ allOf:
>     # On older chipsets it's always 1 msi interrupt
>   - if:
>       properties:
>-        compatibles:
>+        compatible:
>           contains:
>             enum:
>               - qcom,pcie-msm8996

--=20
With best wishes
Dmitry
