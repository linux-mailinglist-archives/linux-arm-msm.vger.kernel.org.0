Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F2E51F803
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 11:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237091AbiEIJQX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 05:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236327AbiEIImf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 04:42:35 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C8214A253
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 01:38:40 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id kq17so25374878ejb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rntni4SQyiBF3kclcH/uwuYNMjc+0Gav6ahcVT8jLWA=;
        b=bk1/jNFbKZ6drKaeIveJ1CWelZ1cpTEL75vlQwdj0IW7KioIx5N2FF24J+6CabFZBY
         9NdXBECWmNbxBwTqEsM1kj8T3e9YtCVZgXvnEZb3hZQFdTBLszNu62WRo52m1w71bXR1
         vk3KLowS2Qo7EgsaCjkpnFpzkSQvQzSW1BdBhcBvCJICOKhOAPs5UFK7EX01pcQat99Z
         dyJgo7BYeFTdiqRdcfwC0/H4SpgNIg9gONcl/WW4TxzYaxqVuzHT+/ZrNkCiabCxqRJ8
         ncmwUOB7q4OexlrPbVI9z5H5BFXuzT02OwX8ptniWXjnyiwxT1ZcfTO/bB/feE8FIc/1
         pO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rntni4SQyiBF3kclcH/uwuYNMjc+0Gav6ahcVT8jLWA=;
        b=4ws7DYI9eJoaxvguOcoSlmGwYMiBSXzEAJV5xSsEXZKC64b+wuHHcmXZoE1Dy/x7S6
         ZKxUWzWEAAr8LLRSDH9NkQ1Xch6hvYFjrymbYfJ407HUDt3cj3HiIiTSqlI/SWxgGLiI
         hL/psqLypA/6AIYNUIw3u0toj57KCpnDf6wCmfquEXx1xmOM9aqxPw4zytuwIx1F9wLc
         SnZS2fk2Mp9ju1XCVRd/FA6T4scVlLDRjUem5BypNayHkBs60qGCMANj0uPY/3CSJTYS
         Z2DXxaMkM11xmFENRjfqhukkIhrGozD8wfcVEFVdsUNjhcvsIhNojByijM7hRHex86mm
         Ymmg==
X-Gm-Message-State: AOAM533dHFCCY++EV60shGYt6Se92ZIxTdZs3j6dENlObstx/q/SuCll
        ydO55V0mds36D796NAE04+M7Pg==
X-Google-Smtp-Source: ABdhPJwv83eNKe0k4LJHVdnwRwqZaK6uzaa5/2ImTxiD3IfkbrSYsnyFetysu+O+gxXXo2FrjJVEtQ==
X-Received: by 2002:a17:906:a05a:b0:6ef:a44d:2f46 with SMTP id bg26-20020a170906a05a00b006efa44d2f46mr13457193ejb.192.1652085519443;
        Mon, 09 May 2022 01:38:39 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p9-20020a170906140900b006f3ef214dcdsm4840869ejc.51.2022.05.09.01.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 01:38:38 -0700 (PDT)
Message-ID: <bef4922d-4a32-f184-44a1-8f5430190938@linaro.org>
Date:   Mon, 9 May 2022 10:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: convert to YAML
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220103074348.6039-1-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220103074348.6039-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2022 08:43, Luca Weiss wrote:
> Convert the PDC interrupt controller bindings to YAML.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v1:
> * Adjust description of second reg-name as suggested by Maulik Shah
> 
> @Rob Herring: Hope it's ok to keep your R-b given the above changes
> 
> This patch depends on the following patch, which fixed sm8250 & sm8350
> compatibles and adds sm6350.
> https://lore.kernel.org/linux-arm-msm/20211213082614.22651-4-luca.weiss@fairphone.com/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Luca,
I think this needs resending as dependency was merged. Alternatively,
maybe Bjorn could pick it up through QCom SoC?

Best regards,
Krzysztof
