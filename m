Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B13BB6D7E92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 16:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238116AbjDEOE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 10:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238436AbjDEOEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 10:04:22 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1656F769F
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 07:02:02 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id ek18so141402365edb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680703319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6YcgOwTkOYEHTfHh+36jDI0bPjFfgqXenK5KF9BN1M=;
        b=woR8DJocTeoGjM0ctksEiVKlmKWuFzKBD6nfTHY9BV3mRzezalDDkRf2u/8fDEp3SA
         UKDqWfarz5kfAzX9AmXvkpS8cFJwENbxtvlP8Z9mcE3BVdaW+cnnOzlqUUUzh8IKcUIe
         SVGTG1tzJIfi2ftcqyhyBXjlOXEBeZh0CW+aOL18HrU7FxeOlgutMCbL/BC7qzQhVzAK
         iUCMQ9kW+u0qnMg5GSbLw3PbMBjl300VrldjddgI4mgFppNYlGD7KyFkyEjnUq2issnM
         Lo1HGJTMCfcIwuDFIAlDz55owkx1UmEtcSlBn3N/0odTyKa0XB53gLXYSbHrdoMUV77P
         x+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680703319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6YcgOwTkOYEHTfHh+36jDI0bPjFfgqXenK5KF9BN1M=;
        b=Ik0lui+ZFcAqsnyBKRTeyXd37BUoOAO8gTX8MKnw3yZZ/VUorwZigL2QIjE+IKrixw
         PFqDGZwOyVqZbI0e3K8qbxSu0b5+EvMZ/MxfQ2r2WsubtOfEzwz9+qQHs63mmqclYt6t
         Bf944unuufPDKn6VykPKUzt3NKntoW7rXMpgYnxRsO6PDw1QVTCsa8o74ttZlYeFkawH
         3mf57ngLwOhlw0Q0a1Vn8uRYErAf8eYeH5niMAFLHjl8YJW6Au03n3+hwr9Uc3tvugIP
         cLjHOhlMx2Rj00IzFXGOCbVycDHRdwnq/L+C4SWmRKj7GBrBFkS/j+Sw2e0fcKIfLsXk
         upfA==
X-Gm-Message-State: AAQBX9cssar/h2e4kTK9VZKqXTgt/1E+I46BcgUMIF8INTepjUXYhMVi
        ljfAR1sS+ZXtgFRDPo5gu0Bycw==
X-Google-Smtp-Source: AKy350Z9vKsl9+aosw4V6+XeX7OHHsd0XKQdC3YrbCaIX3n+HmSKQuxFRqpPIkqhUfYyY+dMeRLrFg==
X-Received: by 2002:a17:906:2e82:b0:925:1d1d:6825 with SMTP id o2-20020a1709062e8200b009251d1d6825mr2720161eji.42.1680703319728;
        Wed, 05 Apr 2023 07:01:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id q23-20020a170906389700b00926b944676esm7321357ejd.131.2023.04.05.07.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 07:01:59 -0700 (PDT)
Message-ID: <63bfaa1e-c627-bfe1-0bef-d001dae41014@linaro.org>
Date:   Wed, 5 Apr 2023 16:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 1/8] dt-bindings: usb: Add bindings for multiport
 properties on DWC3 controller
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_wcheng@quicinc.com, quic_jackp@quicinc.com,
        quic_harshq@quicinc.com, ahalaney@redhat.com,
        quic_shazhuss@quicinc.com,
        Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20230405125759.4201-1-quic_kriskura@quicinc.com>
 <20230405125759.4201-2-quic_kriskura@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230405125759.4201-2-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 14:57, Krishna Kurapati wrote:
> Add bindings to indicate properties required to support multiport
> on Snps Dwc3 controller.
> 
> Suggested-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
> Link to v5: https://lore.kernel.org/all/20230310163420.7582-2-quic_kriskura@quicinc.com/

You did not test it at v4 and you got report for this. Your changelog in
commit msg does not mention fixing it.

It looks like you did not test it for the second time (or sixth time).

Best regards,
Krzysztof

