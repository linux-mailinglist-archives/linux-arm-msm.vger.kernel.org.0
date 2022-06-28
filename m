Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B73E55CD1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245183AbiF1IWA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 04:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244415AbiF1IT6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 04:19:58 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE6F2DD42
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 01:19:56 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o19-20020a05600c4fd300b003a0489f414cso3534024wmq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2RluQ/L1sN2XN4qAMgu7HWEvzSUWSILILWR4s/Bogvc=;
        b=ooqY0pnK8R71VO+7Ww0uB5MQh1agwoZIC8aZTPQKa2MkQc+iFYSAFT+X9Dfz623HUM
         BHHavib7dxrxW13FwpV0BwL4Rsz7Og1K04cE1HuG3rrytbMcPW23zrn5erjbHCFQONH+
         jg+fzzg4LGgalcDL6Mx7g3/HYeQn64WSTV5hRh/P7HgkoWhGZw6C4qQHwb+r07daxqJB
         MTRvqeX5qPKB27BpkB8nskNR7rUuQ+iSMiRouGAqNC6Xm/ECrPx02+Efez4F7sm59JXE
         amhvq+MUDxs/g/g7UlaB+8uoKmA6AqwlaURewYpkpOkrnBvQxD2Ty+s/ndL8sN6qr0NG
         AuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2RluQ/L1sN2XN4qAMgu7HWEvzSUWSILILWR4s/Bogvc=;
        b=A7te3kQ+cQ8gB2M+6QjbsA3NQlaWKLFegtWmPQwC6Y/SqMKpWUTcgAcIRM9FB9AF7Q
         Np0LWNBjMsdRVxyfKjO7tiwMp5SWzlKkd/TJvFWJDDLBl5BeA1YrtZ3dRRjGpxmva8fV
         A2VQ6tAFqSVeng8QiMXK5mks/GOBtfp51eYux0PJC1U1bJ5unq0SakPaaz5y3SeKMGYp
         SQc+oB7OzX7tD/54R7/dVsJmdbY+dqlXnao5oWaYWh2f/46khazxWKHjmY6ZTUF2g/xG
         wg1Q3KkYdavugU+HLVHjDxzRs0Zd0A7n71tX0xoExfC+OiORoVpmn1T8IGC8E3pzJjEu
         5TJA==
X-Gm-Message-State: AJIora/djYjU+heKhjmckPmwYNrOdUr9OfmoxWVl57XOl993za69PjXV
        qfgF/NQ6B+QRPSTpfyTg7HTD1A==
X-Google-Smtp-Source: AGRyM1uAuKwujR1uouFcWum/Ytu8Qs/dMIQzH8FZfWG03qE+T2DBwc9Jj2/F5MWtm13KaATykAk/Dw==
X-Received: by 2002:a05:600c:3493:b0:39c:8731:84c3 with SMTP id a19-20020a05600c349300b0039c873184c3mr25767140wmq.45.1656404395011;
        Tue, 28 Jun 2022 01:19:55 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d44c2000000b0021a3d94c7bdsm12917841wrr.28.2022.06.28.01.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 01:19:54 -0700 (PDT)
Message-ID: <30badf7e-6e5c-16f9-9e46-566981a40e22@linaro.org>
Date:   Tue, 28 Jun 2022 10:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: add Lenovo Thinkpad X13s
 devicetree
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <YrMVqifgV4kZaP7F@hovoldconsulting.com>
 <20220622132617.24604-1-johan+linaro@kernel.org>
 <96394aa2-aefc-63c4-d86f-15c06d092d75@somainline.org>
 <Yrq1FAscp+jE7GQs@hovoldconsulting.com>
 <00aefa9b-5d91-629b-9fa6-fadd6df5a469@somainline.org>
 <Yrq4eOWAeKyGrQPo@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yrq4eOWAeKyGrQPo@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2022 10:14, Johan Hovold wrote:
> On Tue, Jun 28, 2022 at 10:09:57AM +0200, Konrad Dybcio wrote:
>> On 28.06.2022 10:00, Johan Hovold wrote:
>>> On Mon, Jun 27, 2022 at 01:38:47PM +0200, Konrad Dybcio wrote:
>>>> On 22.06.2022 15:26, Johan Hovold wrote:
>>>>> Add an initial devicetree for the Lenovo Thinkpad X13s with support for
>>>>> USB, backlight, keyboard, touchpad, touchscreen (to be verified), PMICs
>>>>> and remoteprocs.
>>>>>
>>>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Krzysztof's tag wasn't here in the version I posted.
>> Patchwork recently started pulling them in automatically when
>> downloading a mbox file.

Uh, this can be a bit confusing. :)

> 
> Please consider using b4 instead if you need to reply to patches.

+1
or find it on lore and save mbox from browser


Best regards,
Krzysztof
