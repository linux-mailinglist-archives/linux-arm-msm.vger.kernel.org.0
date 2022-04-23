Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F7250CC2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 18:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236335AbiDWQGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 12:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236317AbiDWQGv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 12:06:51 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E610E7A99C
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 09:03:51 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-e67799d278so7939726fac.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7o5bBB5GgX8EoqCNZToNmwfASMxI14Z5hpHYNq96As4=;
        b=EQA6aKQZpH5STkOXkKcitH7bGOtZAj1DUoEZHGGjkRVvqYaox2naLwBo+So/R8yqfU
         PN96G1g/p7st4+tkep5m4WhYvW5SLxWMNSbDvHlDgSVMwVqWv1mpRnLlfXQKtBTFMvj8
         YI827C7c9seP3hF28q/1+9NMMncqU6iGYvR013kqvRyuu5h8K0k9+y2vDx/WFNrHAfPW
         Ju986I/G4r4GzpJA2NGOi/SSweC7iQbA8yef9IYC3aFzViP09EmLCHtsnLKO3s/2ztlt
         Vmk8n5JL9oFEeHTYFAGcfb3+rl88hdMhIf3dXuRDvERs/uf2WQaqx5+EvLU+5oHJZ6CT
         ytqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7o5bBB5GgX8EoqCNZToNmwfASMxI14Z5hpHYNq96As4=;
        b=EHvYhyaiOSfQYQuMTHnkNseOfy8MQ3q0UVXOG5NgzjmMIYndfaiFbaDW1kQBtg+YE5
         7jK6Kp+qmhNQ3y8TFM3IEhArYQGYFFLliXHcZd8wq6vAT9RvAK9kon7QsW8E0gsJVJvd
         CaS/opbWyrw2QomokKrCL3ZoGCII7fLOO2PSOziY3D1mY9dH0UxilOMLSrlQI+Scw4Is
         nxYT9KLhBf8UnOahk/zVDOjJILESJXgbIJDmRvw1AOEIe16VqvvisKfsKK3VlRo5lpUE
         Raa2zEEpfoiLZV5y4ghAdRB7EXgS6WcTRr+jPNDlf4HL3DOb0ZO4KMVG2zsJwT+4Ju9O
         f0oA==
X-Gm-Message-State: AOAM533bdRHV/hKgQ0wQIi8O+JElCRfF+IhDBP0S7GH40xFO1ijqysi7
        eNEtsydaVIC7G4yAupJHKsVnUA==
X-Google-Smtp-Source: ABdhPJygheWAMz7nia23TPB0ynk6AIOq/2SF+3A/ce7jSvCnbzwwVG2SMcmTPbPSc/o22WESzddMSA==
X-Received: by 2002:a05:6870:b686:b0:dc:a9f4:90a2 with SMTP id cy6-20020a056870b68600b000dca9f490a2mr8210421oab.243.1650729831191;
        Sat, 23 Apr 2022 09:03:51 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c9-20020a4a8ec9000000b0032438ba79b0sm2123856ool.0.2022.04.23.09.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 09:03:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH v3] arm64: dts: qcom: db845c: Add support for MCP2517FD
Date:   Sat, 23 Apr 2022 11:03:46 -0500
Message-Id: <165072980563.2810336.10302652654505667532.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220421073438.1824061-1-vkoul@kernel.org>
References: <20220421073438.1824061-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Apr 2022 13:04:38 +0530, Vinod Koul wrote:
> Add support for onboard MCP2517FD SPI CAN transceiver attached to
> SPI0 of RB3.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: db845c: Add support for MCP2517FD
      commit: cb29e7106d4ee7bc3860fc65d28b6d7d0b71c0f8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
