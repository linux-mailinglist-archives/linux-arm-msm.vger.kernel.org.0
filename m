Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4E05643DA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbiGCD5G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbiGCD5E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:04 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E8DB1EF
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:03 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so8767447fac.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o46B19FxktOfir2N/Lld/Vj2B5nLPwXFWhiJi8mgvvs=;
        b=cY0EM8oci2MQV6lsgVS5bpZ0tXcAVySC4Teynrm0XXk19QsST91TFlgKW3ZZ9Xfiw2
         TDeb1A+OICa46TkBQTXx+uYkVvCpemjYURIoQlMqXE3t8OX0h6aehV+c9wVTHXa0EASL
         YzF+WOqaBIftsM+cIOmT6/xkg9gJOzynw0Fk/EKes1ckM8nSAgME9mbInxqxdcCOkapX
         dLjeVhBWqLLZjNRcpOmYoHLX4iGgYDGgdvE+ZAS9UdbZNBQUtzmr9EoLTZ1sR1WiCMgz
         4irzWEhz4KJ342aKBqKmsvhRWjxVuMJl4JYDmlrdvs0Z+AHFEavsKabYvfvXJEvPj4e5
         t++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o46B19FxktOfir2N/Lld/Vj2B5nLPwXFWhiJi8mgvvs=;
        b=zIY9YbE5BuL6xKP08qbKPWPWof0nPnh92UUq0HWiddu0tptGVB5exZXgSnWlR0SXSG
         UyCwBJIj4c9XScEXNF8X0TuBWss+xzkRNhoxSRWuEmMkN7EnPGUEGnZYYiDC/62tbF4k
         97gYUzHuY8e756deliQxBXSqg+domBJSgofYML8xaCP2R00LU9VK7iEeCYpy1DOkGr0k
         cY4O9Xw2bfQ3TpDTq02a4qe1T5CdPSvyeHgJB1+c7tPlHrIZMAvc/Ul5g6qMxrLqsENo
         PNDrhYH7O9Qp5NHu+SwznShL7rpq0Cs7RtgZtqrqKdpwC4oBDbQ3RiB+xl5aI4rgeQr0
         dc9w==
X-Gm-Message-State: AJIora+bdrUv5EQGPUlb5bRJ+S35OjKjLcFj7xGpd3B4bWKs613cynD+
        MTKHjDgWlLYGKdtxZDvYdcjrZA==
X-Google-Smtp-Source: AGRyM1u2UrDXuVbfMAmVN/Do+AVtBEtgvx5iFTd1q75gjjLkQ7s29FhZPH0lSTVu4HKttFivqI2NCQ==
X-Received: by 2002:a05:6870:5494:b0:10b:8bc9:38aa with SMTP id f20-20020a056870549400b0010b8bc938aamr12019006oan.20.1656820623055;
        Sat, 02 Jul 2022 20:57:03 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:02 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: qcom: Introduce SC8280XP
Date:   Sat,  2 Jul 2022 22:55:59 -0500
Message-Id: <165682055967.445910.13013445534851803508.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629041438.1352536-1-bjorn.andersson@linaro.org>
References: <20220629041438.1352536-1-bjorn.andersson@linaro.org>
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

On Tue, 28 Jun 2022 21:14:33 -0700, Bjorn Andersson wrote:
> This series introduces the Qualcomm 8cx Gen 3 platform, with basic support for
> the CRD reference device and the SA8295P automotive development platform.
> 
> The Lenovo Thinkpad X13s dts was part of this series, but Johan reposed a
> polished version at [1], which I intend to merge on top of this series.
> 
> [1] https://lore.kernel.org/all/20220622132617.24604-1-johan+linaro@kernel.org/
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: qcom: Document additional sc8280xp devices
      commit: 05b90d240409240cbc40c2eb4a0f2b206a513e13
[2/5] dt-bindings: mailbox: qcom-ipcc: Add NSP1 client
      commit: 36a7b63f069630e854beb305e99c151cddd3b8e5
[3/5] arm64: dts: qcom: add SC8280XP platform
      commit: 152d1faf1e2f32cfb1956c7e5e42e8cb2c95ff18
[4/5] arm64: dts: qcom: sc8280xp: Add reference device
      commit: ccd3517faf18330c051068f07dd8ef79853238c7
[5/5] arm64: dts: qcom: add SA8540P and ADP
      commit: 519183af39b2cac56614c14f5e710f8caa0bc32a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
