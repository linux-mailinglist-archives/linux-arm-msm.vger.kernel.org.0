Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819075FBADD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 20:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiJKS7f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 14:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiJKS73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 14:59:29 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0D886834
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 11:59:27 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id m6so4015967qkm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 11:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wCN5RZ+L8i/oN57QmIvmcE2DqsyjZQyxM8LL5Wvecw=;
        b=OYOpwA00168+Sn1npw1oL58Fo+MJaQyLFCqVdGdf7vXkNFi5pgDHeSYPE265v1fk3U
         43cUJtNVbasO+3J8ihdCrso3YZH+bnE97UgGQ+WJjjFdrITLESiIYyCVUuLH9IWdZQyJ
         +koIQr96yAJFGMwL99V3TmFC//4vyOQcXDoWqPklpIRVAivPFyT0IWAX2HdH7Zc6CUxz
         Cgf+zeA+6PeM8xj8bzTnIfnfvQ5a/QDGI4MxHIHPX97wz0remhhzrHMohvtAIPfLo4ET
         j0Gw2MOzKHFNiqpXycHEwEKkAuyJd9GrUdzArT3sOGgiq2ihXRyAoBwf0EeXn6kcEfT4
         9IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wCN5RZ+L8i/oN57QmIvmcE2DqsyjZQyxM8LL5Wvecw=;
        b=e/5aClhyNjRbpl7RnVtongkv25H6OM3J7c7UD0bmxjk4u5IMWJXfnBU4H2R/Hc1pOY
         jp/85MTdvPiJwi3lgM2/X8x3owAAXSitlBJeN0Z3ljcGqZFkFhjTLd6CA9bJR5431LVR
         2e1Jc19umObb8i0xWZMOLIgTflArXFim+vMoTGphvdxF6BB3QcL7qPkOudhfSJ2YZaCK
         +SxVVhMYCTayFDbGtQqbLJvVXI+/bODIV4H461JmZyWE7NfQ7coWGPc61BaFRG2RUlUL
         ZIzSk2P5wTb6uvH+H8vuXxjypB1byMfrwRdQDyDsZnZjblu2Z5qbxRShlN3Md8/GCntp
         BkMA==
X-Gm-Message-State: ACrzQf3FwdBr83uxyntQPn00tHl/a+NFfAn6Z897hEIcXHyVzXY5K7LF
        dZW2vI+AVwGc8PwlNS6scc9d9Q==
X-Google-Smtp-Source: AMsMyM6Bn+yZ7GM457z+pCMlyEfivAVrDfm1n7o3H+EW0SKcPQs+s0LIDrkPQj1pe2vx0w6xMzD1bw==
X-Received: by 2002:a05:620a:6017:b0:6ce:3c51:66b9 with SMTP id dw23-20020a05620a601700b006ce3c5166b9mr18110981qkb.605.1665514766652;
        Tue, 11 Oct 2022 11:59:26 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id c2-20020ac87dc2000000b0039a8b075248sm4688296qte.14.2022.10.11.11.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 11:59:25 -0700 (PDT)
Message-ID: <ddb4566f-b420-6ee8-b3f5-3eeb83ad2d8b@linaro.org>
Date:   Tue, 11 Oct 2022 14:57:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 03/19] arm64: dts: qcom: qdru1000: Add tlmm nodes
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221001030656.29365-1-quic_molvera@quicinc.com>
 <20221001030656.29365-4-quic_molvera@quicinc.com>
 <ad743621-8e2d-23f9-8c44-53f6681aa134@linaro.org>
 <7674b756-75d5-6ca3-d4fe-c54bd92a3fd7@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7674b756-75d5-6ca3-d4fe-c54bd92a3fd7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2022 14:48, Melody Olvera wrote:
> 
> 
> On 10/1/2022 2:14 AM, Krzysztof Kozlowski wrote:
>> On 01/10/2022 05:06, Melody Olvera wrote:
>>> Add tlmm node for the QDU1000 and QRU1000 SoCs and the uart pin
>>> configuration.
>> The patchset should be squashed with previous. There is no point in
>> bringing support piece by piece. You can bring support in steps if you
>> submissions are separate in time. But if you have everything ready -
>> your patch must be complete and bisectable.
> To be clear, does it make more sense to submit the base dt first, then submit each
> driver with all the dt changes as one patchset?

No, because you have DTS ready. There is no incremental work here.

Best regards,
Krzysztof

