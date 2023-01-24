Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFA167972B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 13:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjAXMDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 07:03:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjAXMDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 07:03:03 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E062330C
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 04:03:02 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so10761242wms.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 04:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISTCJcjbLGCkxi1WzMVFDYPcStcahi6jM3lIYNX8/yA=;
        b=B0k1sMQcXln6PcErJ+2ndH8jtVY5tRps6KchPF7SGjzSvxQlHycQhoYkWsG0Fppi54
         68rGelGR/kkwvpFnK5TeDeOfyaCmehp3h7U9VPmOMXl/SWKtt2SwMK7xAiARW5JbQbQo
         X6JnGDOR5kEuFJKxLL0iA0+ybInyNNh/ymMFAy4aoNp4+JsoNDQVTMpx5oDXIYYw4ERM
         /Uv4is4fUdVQDkIk8dHuNzE1E5Rp0Y+z3tdSzmFRpG6hJPs0C9pCdLjiwHECGpWjmjOv
         /DlTfJ6KahRHg+hWO3jxrIHBYBsFKfBppB5S+DTjwnzU14+zO228vAqlWd66IeQTIIGQ
         6ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISTCJcjbLGCkxi1WzMVFDYPcStcahi6jM3lIYNX8/yA=;
        b=SCPW+eFUNPtY0ihGgHsA6WJ01cPsfGtbtVn0Iuaixj4JFTDHfivqU+U+jpOcvmZsLL
         FWhLCdzFI30OkNUdaJtDf5u4iq3s2Nvp2Pspdw8s+i+cls5swfxzT+3MUifTGF388Mu6
         kMJl5hNMHk0veHG1ATJ42MJyEM2aRUEjvyeHsiHue6E6/IYaFxZMRn1kPHrJPWPRKeqE
         z9hINxToH7iL6E0jQrfUDatI1lMho4SNKfGKVZEPTceOaRRMRliyh7Pduf+GjOeVVbt+
         1ZLDx/RvY8nf2DFHTqrQV+9UAQXa7hJ1Yya5PX0BOuBMPQhESA6OQ66m2l3PAWVZX9vP
         MyzA==
X-Gm-Message-State: AFqh2kpW+AnPhHzCSJKgNnNApZAKO4re6xc8ccFNA9/pGIKPZ8Pyf5WL
        L7wQ29W88LkXhm6Mbyo5yEhcYg==
X-Google-Smtp-Source: AMrXdXsI90Fm0RpPJXDRWI68hcd9HwX8m+wKszpWhj5+htx3G1Fpiy/xW0/1s7wOAv4T6BkAQISXVQ==
X-Received: by 2002:a05:600c:2108:b0:3cf:98e5:f72 with SMTP id u8-20020a05600c210800b003cf98e50f72mr35556429wml.3.1674561780785;
        Tue, 24 Jan 2023 04:03:00 -0800 (PST)
Received: from [192.168.1.146] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b003d9aa76dc6asm17995939wmq.0.2023.01.24.04.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 04:03:00 -0800 (PST)
Message-ID: <e5bffb1d-f9d6-0799-bb7b-03dc8dfa0355@linaro.org>
Date:   Tue, 24 Jan 2023 12:02:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFT PATCH v3 4/6] arm64: dts: qcom: sdm845: move codec to
 separate file
Content-Language: en-GB, en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123084300.22353-1-krzysztof.kozlowski@linaro.org>
 <20230123084300.22353-4-krzysztof.kozlowski@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
Organization: Linaro
In-Reply-To: <20230123084300.22353-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/23/23 08:42, Krzysztof Kozlowski wrote:
> Re-organize SDM845 audio codec into separate, audio DTSI which
> should be included and customized by the SDM845 boards wanting audio.
> The codec node is anyway not a property of the SoC, but the boards.
> 
> On all others boards not using audio, keep the Slimbus node disabled as
> it is empty.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>

I'll give this a spin later and resend OnePlus 6 support.

> 
> ---
> 
> Changes since v2:
> 1. Drop sound node in DTSI - affects devices.
> 2. Drop "audio" from DTSI file name.
> 
> Changes since v1:
> 1. Move also sound node.
> 2. Rewrite commit msg.
> 
> RFC - please kindly test the boards.

--
Kind Regards,
Caleb (they/them)
