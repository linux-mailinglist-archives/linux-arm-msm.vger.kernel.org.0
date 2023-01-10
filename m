Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D157E663D01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 10:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbjAJJgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 04:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237813AbjAJJgJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 04:36:09 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A67A4564B
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 01:36:07 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p3-20020a05600c1d8300b003d9ee5f125bso4821557wms.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 01:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfW3BgUygGqYK3dElv1L5r/IPO2b55nmV/OQUDIwrIM=;
        b=OzujUUwQQxzxvgbut6bLkyabWRG2o9NUBXisWkpfV92npqj4k0QTwlAXfObl/mwH8G
         T0kHJ/ZHDxTIJ2vH0N/SFbe7fRjiqceV3v5DnsIV27pwtqHpYB8vkrj/Sa2dVpmL96mk
         zWyHVfq88xsg7Oggri+Dz04JaW75BxOFoSTyaLnDwVMw2m5znELSRs8mPoG0ggTEIdxu
         Bhh8FN514LJwXkDChuR9e6mK0EseQ+r/dlftpnryhuP/o/5NAlx64Qf+uubl4v5uBOL5
         0muzeMEjV+WO+G5ZLGCEFWhszzpZachVh5uVVvAaRlQ0thW1YDdFEVf14HROGe95uJ7p
         Ku9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfW3BgUygGqYK3dElv1L5r/IPO2b55nmV/OQUDIwrIM=;
        b=6fhROdkae5PrxgyejMARyOuZI93o5RmpIe7LJR3imvzdhjN3+2+UbrU2/TggaLiOBI
         MiPyRfaQiFQWtI67j63AqmP7ADRuPi0c2TImcJOYsjOHsn4SS7hyz8JvqeYq2OmK3gFS
         GntC1zHvnnl8SwAGLthznRTibOU8jZfhOjNZfKLLsNMbVYsR2bxqhUVFjZDOsNi+DTkg
         +0TWIMeRuu7Ysfz5g//FJ25AMc80e/n30JILQdG3OZshMguDKGkQp39RNHZB5jpP/72t
         3e1kHeIkVHz9mnLi9EBh/rxDyuAgO6W9+WPen6QH6tOA6xrEoVKhwpQ0oiRaplpcC3v8
         wO/A==
X-Gm-Message-State: AFqh2koA1lZLjfBcBggsI6+ljlexoTCDWYr/Hdr8L8UDK1NL22rqVA/r
        AgX82SvF5KwR5M7G1+DvpY5Xvw==
X-Google-Smtp-Source: AMrXdXvg/7EJpB0PrI8QrD6VkmM8usFDgoZ5Dp7VqcpKEmUXh+Sb9uUNQBXmfOlaxizyl1qjOJUNbA==
X-Received: by 2002:a05:600c:3b0c:b0:3d9:e922:b417 with SMTP id m12-20020a05600c3b0c00b003d9e922b417mr6852582wms.41.1673343365731;
        Tue, 10 Jan 2023 01:36:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c358300b003d1f2c3e571sm20932824wmq.33.2023.01.10.01.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 01:36:05 -0800 (PST)
Message-ID: <ea057816-ae38-074e-43c8-011bc45b216a@linaro.org>
Date:   Tue, 10 Jan 2023 10:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2 03/11] dt-bindings: remoteproc: qcom,sc7180-mss-pil:
 Update memory-region
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, robin.murphy@arm.com
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, amit.pundir@linaro.org,
        regressions@leemhuis.info, sumit.semwal@linaro.org,
        will@kernel.org, catalin.marinas@arm.com
References: <20230109034843.23759-1-quic_sibis@quicinc.com>
 <20230109034843.23759-4-quic_sibis@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109034843.23759-4-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 04:48, Sibi Sankar wrote:
> The dynamic memory region used for metadata authentication would still
> be a part of the kernel mapping and any access to this region  by the

One space, not two before "by"


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

