Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCA467FE6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jan 2023 12:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjA2LIm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Jan 2023 06:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjA2LIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Jan 2023 06:08:41 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E041C5A5
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jan 2023 03:08:38 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso7486830wmb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jan 2023 03:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=efubKMvWfrd4LP5LHAcichChi11fqqmftCbLrF0d7BQ=;
        b=dHBTwmmnEpfL+HTen9nimha3UxbiMdQGL1KCdR79axLVHODJbBLNcsQsP3dQ4PFriA
         b7Ia2CnHXH5efdqrsIAz2nkFzXe5L+bgTfsIAkOIcSuQJhAPlEF0znzTPrKXC23z32da
         95jTIt9flq7WiHD6Gdznf4BI1FtquCKKNuuBsdEUDpEm+5V+WSSdUoAMvCTxwUzoLyf+
         6aylHP74uSdD5Pr2Mc+jnuiXlTJTDfFVNVjF7Q/tRbfSgrHs7iSefjUDZC3W1Lm7WHSn
         sHCVB4wOzxnMLy8cMGsBe5ezeTYj7AQWkFM/7B/3ZfBjqxVEicCWIh7BCTBhtDic7ih+
         WRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efubKMvWfrd4LP5LHAcichChi11fqqmftCbLrF0d7BQ=;
        b=FAhd3XWvP3N6xrG+Z0/q5PkYr3sbmgQIOYAB/IhNS2+qP7YZ6/oagOwmyeiLgmZFac
         CJV5yPMzuL+IIMc8/KRDUO0HLr2FuN/NqLjo2zNyxaEmbfQ7TCaHgjmRt9/JVoEIrcfY
         EPAVtQgFOSN1JLKwj00P9kF1rZmhLE8WdU61DvPcdMuaF6cH3+HT8iMHizMds8NyV34x
         VQqLJgJtoBmAwcBMQflxdiQX9fBwgaS6aKhddH6Hu5Kk9VtMhTDoN8PoGctekw8wHhFr
         NYN4zhE/tcMYagodhlrRHo08wPcWSFsDCA4S+grKBpoIM78pQ9ZiAksAUY6y2+aZkZM/
         UPZQ==
X-Gm-Message-State: AO0yUKWHkso+ULWaqQQ6a1piSkE3fCz3LpNBNeBYHFGZdVNj0OJ+4Qh+
        DZmALmfTUfBDySkGy7Vbz9QeDA==
X-Google-Smtp-Source: AK7set8wlmz0KdXxTFAC3ncKV//zQS6LC+B/If4WyhUu9yUhINaZupYsuJw3bb/zcPBPTCxA6qHSaA==
X-Received: by 2002:a05:600c:4e02:b0:3dc:50dd:361b with SMTP id b2-20020a05600c4e0200b003dc50dd361bmr3010328wmq.5.1674990517044;
        Sun, 29 Jan 2023 03:08:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z24-20020a1cf418000000b003dc36981727sm7404688wma.14.2023.01.29.03.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 03:08:36 -0800 (PST)
Message-ID: <8c954218-bba4-54c8-59a2-86371610aa03@linaro.org>
Date:   Sun, 29 Jan 2023 12:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] dt-bindings: remoteproc: qcom: Add sm6115 pas yaml
 file
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mathieu.poirier@linaro.org, mani@kernel.org, robh+dt@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230128053504.2099620-1-bhupesh.sharma@linaro.org>
 <20230128053504.2099620-2-bhupesh.sharma@linaro.org>
 <167491555142.2364868.11831106421472878617.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167491555142.2364868.11831106421472878617.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/01/2023 15:20, Rob Herring wrote:
> 
> On Sat, 28 Jan 2023 11:05:04 +0530, Bhupesh Sharma wrote:
>> This documents the aDSP, cDSP and MPSS DSPs present
>> on the SM6115 SoC.
>>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
>>  .../bindings/remoteproc/qcom,sm6115-pas.yaml  | 143 ++++++++++++++++++
>>  1 file changed, 143 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/remoteproc/qcom,pas-common.yaml

This is expected - the qcom,pas-common.yaml is in remoteproc repo.

Best regards,
Krzysztof

