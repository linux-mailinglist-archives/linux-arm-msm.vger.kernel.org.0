Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB4169B954
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Feb 2023 11:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjBRKVI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Feb 2023 05:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjBRKVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Feb 2023 05:21:07 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC97227AC
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Feb 2023 02:21:03 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id d14so1563768eda.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Feb 2023 02:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pSfFkBb+h8UfhaMr8NtiNGoC3ySi+UMvn8rGDTSHoA=;
        b=jVld9puc/WjoLtWRj8w8q6A5hcMBByB9fRDHCJXg9jTSG2sEQg4oZTFVefqlTqStxp
         ZZhznYuexKdX3AnON8Bht6Q9o3zPJwNDOagaQxCLmkLMR39AGxsSmsZCRhraFJZnbDT8
         AH+/yTbPaWxqFhA70g0hA/HLOqOpNQugJ4Zx2DphiHVNC3LNHqw1Thq+kLsbmcL6HaKB
         yRNnGrMVlMm2HDgEbSLFNWCbB7aMFmMnyOVDgyXLuuxxhDgKneSWEg+uI3n/6qmRmf/D
         iMQLiEPpzHWXMeOudb93WUObJhTCDhp6lreeuCxfwLXBTScUvqxb8khG990N3LHz2lYr
         tPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pSfFkBb+h8UfhaMr8NtiNGoC3ySi+UMvn8rGDTSHoA=;
        b=2s3+K0OZdAPPPzHJkS0Zh4t77GyXY4M4UhrE0fri5Jw5hfLnki512ynrnnshbMXpOa
         JAShfWVKNbpX85Kd1jIH3UUugomGoM0SSuaNPThFKWeJO+vfhuUpax8mXTpwF6pxx7jq
         dERZKs71cDiJ0ovdgTurINeLb1wfYYNqGcg9lzNtGnMZp6ADzUl8ne0jAsd58UjZUW1d
         vOknSY3LexRd2kMBXTJoiJfLn3RwArFmo9ygTbcwFmnTe2FNFnN6OsD6C/u1JfXN4MS9
         JqSw0oaL+RFSAVYSBqL4SGjZ9xk5H5pHIt/TpCnupaPaITDCketOJuvH3jFjhWat1SO6
         mwbA==
X-Gm-Message-State: AO0yUKUpAC7QEva+LyB28Pm+nO0LNDvtlW96xaBlDiR+Lc9ALUKUvPgU
        XHof/mF+ZITz6V2Ec1oygN0ykQ==
X-Google-Smtp-Source: AK7set8Yboxvm+uOELSqZmn6POlW6SQK/ITBbnOSGb5Zr97RrFiAdSUHskFkmZM9K4Q+/zftULZpJQ==
X-Received: by 2002:a17:906:f212:b0:8a9:f870:d25b with SMTP id gt18-20020a170906f21200b008a9f870d25bmr2109972ejb.15.1676715662191;
        Sat, 18 Feb 2023 02:21:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id rp19-20020a170906d97300b008b14b63d3besm3180594ejb.197.2023.02.18.02.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 02:21:01 -0800 (PST)
Message-ID: <ab66077c-e641-2cde-3216-eb31e7d58350@linaro.org>
Date:   Sat, 18 Feb 2023 11:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 1/6] dt-bindings: soc: qcom: smd-rpm: Add IPQ9574
 compatible
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_ipkumar@quicinc.com
References: <20230217142030.16012-1-quic_devipriy@quicinc.com>
 <20230217142030.16012-2-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217142030.16012-2-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/02/2023 15:20, Devi Priya wrote:
> Document the compatible for RPM communication
> over SMD for IPQ9574 SoC
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

