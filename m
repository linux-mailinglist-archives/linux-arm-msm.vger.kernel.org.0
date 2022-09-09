Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F5E5B3CFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbiIIQaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbiIIQaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:30:19 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31A63ECC1
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 09:30:14 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a14so373331ljj.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KS7Ek8iCN3lrgl4YnrQljjj+R07+91jXLXTWcqOkyNo=;
        b=CIJfHiBa9Gun3EcbV+AjzzytebfMe0I288IQ4TB1dgXBrMkio6UpCdO74mF1lZxQiy
         KNtr4ZEETiaHJPYB+JSh5NKxlfuRO1BSB0V75pSKViGoK12Ci+cb/UwnJqoGppP/5Kkt
         2cT3Vkb/9JmZaQ99r2PrcVKHCvk9sycYGjSM3Qkas8MTlZhwUN/esIcgJErhJPvHSw7H
         Xn1wyYv7FqH9SaLwwb1dJawAyR5PFCbYGsQfAAlaRFLamLFIZCADmGzRCwEYS310xtQg
         a8w4WLoUwZOR++kgk6X8lDWGIKKqV0IJmfTe0botCFmOn3JSM2mObegzxkce5/qEjCcE
         PXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KS7Ek8iCN3lrgl4YnrQljjj+R07+91jXLXTWcqOkyNo=;
        b=yO5Co1kW06jQLRfKBgpZcCcUcQTsgvMta+roIiC1oylHfsXnPJQpYz0OW6FEBoLg2p
         Gj22yln+RSQ7aitJRD8S5yEt5/2ovcuqiDQL8TWhxpCMc6TKkUpJbDC7N0XbHFXaT0PP
         IELXEM9bhLu9BW9iMBKZjSfLapmUeU6MLScCNPHUgwiSePnvorOgDc9W/sQ0sa1wbxsu
         2ft1z2Zbcxt1WqrcQbIojur/u/Q39qPi6Llw0f2UI9jXYA3JZWM0VwZYxpwz2pwKsq3I
         hZQ1KvIja568cztRDOqS64ueEC8AQRPtVxqyiqxtVWpza4WI1OFy0d0D3420XAITjt2I
         nP1g==
X-Gm-Message-State: ACgBeo250z4zZzLX2kP+keL5Vx0qCFQYAFSrOz8B0B4+g8UWEKPLpXhu
        QYcVXcxUSUpZkZDCSd1XDKMBYQ==
X-Google-Smtp-Source: AA6agR5w4gFACKfJPJ3tzC07YwCiKgef6NFVfH2ae44Tqx4vvxcBvLlpPsXfVflocWv30PxupwXH6w==
X-Received: by 2002:a2e:8e90:0:b0:264:65ed:8c14 with SMTP id z16-20020a2e8e90000000b0026465ed8c14mr4027803ljk.24.1662741012858;
        Fri, 09 Sep 2022 09:30:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y24-20020a199158000000b00498f67cbfa9sm145231lfj.22.2022.09.09.09.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:30:12 -0700 (PDT)
Message-ID: <0b6f5b4b-247e-7573-04fd-05d037533aa3@linaro.org>
Date:   Fri, 9 Sep 2022 18:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
 <20220909161652.GA1448908-robh@kernel.org>
 <CAL_JsqKVb54yckiky79mK5FdEf-Vf7SyVU01Jdpo9whOqq0spQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqKVb54yckiky79mK5FdEf-Vf7SyVU01Jdpo9whOqq0spQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 18:22, Rob Herring wrote:
> On Fri, Sep 9, 2022 at 11:16 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Thu, 08 Sep 2022 20:14:32 +0200, Stephan Gerhold wrote:
>>> Similar to qcom,glink-edge.yaml the smd-edge can also contain
>>> apr/fastrpc nodes for functionality exposed by the modem or audio DSP.
>>>
>>> These nodes are already used in existing device trees, adding them
>>> fixes the following dtbs_check warnings after converting
>>> qcom,msm8916-mss-pil to DT schema:
>>>
>>> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: remoteproc@4080000: smd-edge:
>>> Unevaluated properties are not allowed ('fastrpc' was unexpected)
>>>   From schema: remoteproc/qcom,msm8916-mss-pil.yaml
>>>
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
>>> ---
>>> Since qcom,fastrpc.yaml only exists in Rob's tree right now and
>>> a similar change for qcom,glink-edge.yaml was applied there it is
>>> probably easiest if this patch goes through Rob's tree as well.
>>> ---
>>>  .../devicetree/bindings/remoteproc/qcom,smd-edge.yaml  | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>
>> Applied, thanks!
> 
> And dropped for Krzysztof's series instead.

Technically Stephan was first and his patch solves it in partial way,
yet still self-contained way. I am fine rebasing my patchset on top of it.

Best regards,
Krzysztof
