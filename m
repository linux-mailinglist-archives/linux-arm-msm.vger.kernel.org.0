Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A415756981F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234925AbiGGCb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234933AbiGGCbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:45 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB222F64E
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:43 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so23610171fac.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FlZVePS47CQB2fLrsuYTYo7nXV1SeCYN43u6BIIpwag=;
        b=oWobDK4AJxR+fAUpb514GKNzQ2EGoC120X4ExMjisgW+rdPTqRp+tHdpNYt07KYNv4
         WxNap85AWfiQ2rxKfJbRhcGCFYlENtQVh1bUCXQjdPuGgG790gOtLP1mYa6+h3AeAxS/
         vVLA02wuK11K3ZpAwwnGgkr8/CkRJ0AUmKznTsss2RDL2g07dntfrVaX7IQYSmb6iS5D
         BGRKSCPaiJj/uBRIDphrNPMSIvm+On1QvWiGlmxxuzYV1hL8aPrxzccKjm4RQH7poKuC
         gDqpIwVavwMNAwAc/2czK5lr1fChsLQ6/kP3q+ouwoMCylM2uOfJW/4iEa4a5GumNUjx
         UCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FlZVePS47CQB2fLrsuYTYo7nXV1SeCYN43u6BIIpwag=;
        b=rq7yxRf8yD9SgZiDYkQHIWXa3Eu3XF97qRlXI7fuEfFOkDicef+jw7F4IMTzkwmJQx
         SkQTZjo+1iBlpIXuLYl5oncXyGrgLxxUhtWBJlk0dle92OCpfsBeeKas8ij9aZoRpYHT
         W7dN+202LwsldDJsydRfUQVs2bX3ARZPF+MVzaJgZv8wVee52ihpdTZeHsI5CRzT6Y9/
         +7+MPcE62XT/lKV59s62sgQYV2cFBZev64VvWdGsKKlXVKyGIrNFr/hdYMYR/PS0Ee2q
         c7lzZ9VRmkuvJgc6p6ZIinmKEA8mSYDXJ8YX5wLNeQ+7rTilnq9QYABi/5g68n/yEuv6
         8gTg==
X-Gm-Message-State: AJIora/BxrIl/SNqGj92cfqSNWzX3lBoXRkvyCyD6IxguFLyd+BBDsD8
        Izgf5JIhQ4fipXeq3XN3wHQClzpKMdPp2g==
X-Google-Smtp-Source: AGRyM1vd4NmRpUxaeieBA7/sWpTryt5OaUYEpF1qRSyIkhZ0rJiOsWdZMKsB6MkPUBrC/6cotMeapA==
X-Received: by 2002:a05:6870:4344:b0:10b:8499:395d with SMTP id x4-20020a056870434400b0010b8499395dmr1245950oah.214.1657161102210;
        Wed, 06 Jul 2022 19:31:42 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@somainline.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>
Subject: Re: (subset) [PATCH v8] arm64: dts: qcom: sm8350: Replace integers with rpmpd defines
Date:   Wed,  6 Jul 2022 21:31:19 -0500
Message-Id: <165716107314.864223.15017336421009703415.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220706152830.2021197-1-robert.foss@linaro.org>
References: <20220706152830.2021197-1-robert.foss@linaro.org>
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

On Wed, 6 Jul 2022 17:28:30 +0200, Robert Foss wrote:
> Replace &rpmhpd power domain integers with their respective defines
> in order to improve legibility.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8350: Replace integers with rpmpd defines
      commit: d0e285c3d8d3b9c0a103760668f481a28aa16dd0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
