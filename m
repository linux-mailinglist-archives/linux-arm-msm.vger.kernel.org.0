Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 028CB69913D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 11:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjBPKa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 05:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjBPKaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 05:30:22 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305F8474FA
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:30:06 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id n20so2291138edy.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=trMy19lCfoNQKMYhTv+urc84CG0y8L9modeItMkODVw=;
        b=Mv8q6XBJEV3iD/szEGMfFVC45l6lbFtsFxQmNKoFSQsOLucCqN9WzaOlpGx5dyuTRh
         Rx7N0AfF1nCubrdjTYIKfn8ygSA63Bie+E49HgVYrMVAcfd9Xl94ltPW/+p1RF33MVKK
         YnTLvV+y6ogWtctt4qk4tQRscpRXtgMyp2FwhlWqtBRC0w2wEkFYBEdd0ZtiHHrf5Nc1
         3NCJQNb2SXbeqMisY+SbUN8yWn+whlhJIysz8rb7MnkdtXKzf36ry5ndLhZBNSZKVnq7
         xepfCLyzHpxvmBk6PITESzTxtOz1ITo34HUUlgpuefwN37dVY1JzXrOJi1bc0d5NEhbh
         NCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=trMy19lCfoNQKMYhTv+urc84CG0y8L9modeItMkODVw=;
        b=AlaSsBxAAdjvYuHIusaIsKwHsbfwYjCnZCR9f2IyVUpIRPlSeo/cyPu5YVgRVMrRII
         +XjphJYJ57yOkJTiLFts4hqVfN5T+zr3Ocq+V/FQnJJivQhEPxPcb82LMLgGaR1K9g4W
         diKF25JpdCu1rx8sOORND6vvz4FUVX5eC3Q7Br6xQOElWqEIQu1w9wANMQt7e7ol60G1
         yzj9gYhZ9qt20bX8DPgXyLiqgWpmyUOUxLjy95sgNhRTZZLReMjBovUXHuj7tX+HyYvO
         /NQLPjNC0fPxi/asa0+5O7uppC3ih3UXReQ6OwfeqTmnTEV1bwqnraGCVBCTDTpLzDdF
         4gbQ==
X-Gm-Message-State: AO0yUKWjxdWas73jqclPw0aFnUXXis3izeZGKQ91+gkB3RHLTVb8ZFkj
        0qqYQX0dHr15+xaE5Yh6sA6oaQ==
X-Google-Smtp-Source: AK7set+e6/QJL3lGLViNLI1RrrQJkAnhpGCZU/48DSywTKjOFl3uP6B32GFpz+Yqmal9PtkGNSwEkw==
X-Received: by 2002:aa7:da88:0:b0:4aa:f910:c21c with SMTP id q8-20020aa7da88000000b004aaf910c21cmr4671262eds.3.1676543404709;
        Thu, 16 Feb 2023 02:30:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v9-20020a509549000000b004acc6cbc451sm643303eda.36.2023.02.16.02.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:30:04 -0800 (PST)
Message-ID: <a1d93b17-ccd5-fc90-1450-b0b900e00916@linaro.org>
Date:   Thu, 16 Feb 2023 11:30:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/7] dt-bindings: phy: qcom,qmp-pcie: Add ipq9574
 compatible
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, mani@kernel.org, p.zabel@pengutronix.de,
        svarbanov@mm-sol.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com
References: <20230214164135.17039-1-quic_devipriy@quicinc.com>
 <20230214164135.17039-4-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214164135.17039-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2023 17:41, Devi Priya wrote:
> Add the compatible for the PCIe QMP PHYs found on IPQ9574
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

