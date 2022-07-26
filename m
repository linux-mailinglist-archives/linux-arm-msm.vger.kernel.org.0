Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897A65811AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 13:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbiGZLKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 07:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238770AbiGZLKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 07:10:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D2531222
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:10:43 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t1so22101168lft.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/gVsxDRvhf7UN6aoVco2tQLHspKhkHUI4EyoT3bQKdI=;
        b=AfqLw07swmMsDTGXqKJS88WfLHAQvmcJMW9agznPEJB+PJd1KV4YcuQ3ezRT3o/sQ8
         Qi0Ik9iksIHXi8TER4sIKSUcJc6B0TL+tmFfbCu0BejvWq43ePJl3rnpRL3uB66gSoTy
         NBkovWu4AvsB0cJw7/aCf++vKrX5wJnnTdElaTdpM5G4taGxr9za4zwLccjxFjqEHnfP
         uXVaqq57YvUJD5P6AtOzIlgxmqsFpMEhM/lIpRd1xBK/sFkxys3iInuf81Fb3PLQbH6+
         O87dP5vnQv4Wkx9m48Zg/TkLB51Buon7NTb9jJVZOkXXHQoV2wagfO/JDgrsBupqtK/t
         p5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/gVsxDRvhf7UN6aoVco2tQLHspKhkHUI4EyoT3bQKdI=;
        b=PuEHIMxRTJ+tW9i8tQqZmPTdYK6si6LH/SWbiG6UWPsFMqjoJmb9n15tFTDlSJ0dPF
         YyRVRqoHS/odwZVNl3iX0EcDGCtxdkW87rE5pPK6nLWL2ajLAFuq+dekXd1j6JzKhjm0
         oQ3bYC+GCOLcWKId7ROhtoWUqGPWleRk+pVI66yZLrXdjkCi7tNmM8pNoEMHFW0I0Mrf
         HOxdHMowkfV9WZD+qt3HMZqNQy2k88TES5WBRq0ukXz8Vc5Ce7GHHcfqvCksOB7oX54b
         KUd0n1lHEMAuxbxIpg95zjmpR3qyR2ZTkDyid5vbqM/ftoIsSR/tNGnR/9J7kz7koNzJ
         fzgg==
X-Gm-Message-State: AJIora9ZQlu5KtvuPH2JO0HZ+E9dh7bxImux+vvV6Lk+4Bxzatt+Nsh7
        AtY3SBqq6z3MfSGGBBdWtNfKZA==
X-Google-Smtp-Source: AGRyM1vvVg7azGF7pulgSeMTkOv0DvQvG63cXTXUtyIIdhvhK1UI9J4KLX+uotNNvorVGnvc5hGeaA==
X-Received: by 2002:a19:490c:0:b0:481:4b9e:cbdb with SMTP id w12-20020a19490c000000b004814b9ecbdbmr6795726lfa.350.1658833841897;
        Tue, 26 Jul 2022 04:10:41 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id o1-20020ac25e21000000b0048a8586293asm1550874lfg.48.2022.07.26.04.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 04:10:41 -0700 (PDT)
Message-ID: <93ae1e3d-d352-d92d-c04a-18fc9f7b01a3@linaro.org>
Date:   Tue, 26 Jul 2022 13:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/7] arm64: dts: qcom: msm8996: add support for speed bin
 3
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
 <20220724140421.1933004-6-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220724140421.1933004-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2022 16:04, Dmitry Baryshkov wrote:
> Add support for msm8996, speed bin 3. It supports full range of
> frequencies on the power cluster, but is limited to 1.8 GHz on
> performance cluster.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
