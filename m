Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6CB6788509
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 12:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243342AbjHYKiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 06:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244558AbjHYKiA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 06:38:00 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D852213F
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 03:37:50 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5256d74dab9so1164951a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 03:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692959868; x=1693564668;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/icMYJmMi2L15W4uUrSEH8FD47/NFImhAmKCvK4bdo=;
        b=TAzvHyvdUdcvqCo8cdCRlYdM5cuCX0l+ZNQuzlLUdA3aNEPLdFW23Ag5niJlpWJbqb
         qwdbnWSsi6sfO/z5+AkzRTUiBBr5YZ7Eb5ge3BH8B6CsZOO6Jib/pzXJmwWNsjiCgI/+
         0Ro+8JohCvklHnTu2Q9O6iF/X4Xte878jP8D/wdoEOTuJD4Kqze6lkOlGgtxXlgssePr
         9M0/pUVr5cEDTukrlhDsPO2IigeMpmDAe5ESLb2dNnXhN5d1u8gq/f7iAnMRQhjigel3
         kG8iAn6tuggt4B02VdQtwCtSgqQXBUjiDVt6ovPzfyWbNNKbo3E6jqypYnOHHU21lpzD
         TjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692959868; x=1693564668;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/icMYJmMi2L15W4uUrSEH8FD47/NFImhAmKCvK4bdo=;
        b=RA+e4OM7rxGfzuOq9A0xbc0lbjeb22z8GvwV+3FC8s3GaK/XlpSahklkwd04cVSylr
         DXJeEGWwi4/xc9AHpU6ijQ94xFcg823IKPPLVFwfhH2AgpbugSBe8AIZjvlx60TRTH92
         ZokpXZZG1P6d7+p0iiiEdlKnLWIDgyMxQtFh2qHnHXjKCl1lYpojSLE92DrBxZ1KWVrG
         Z8NICYo3LDf1l7sWaWWhZJ8s7vbJ4tTMSrMGbBlbdX9A4kODeyZ6FYP4mdfrWeptuwZe
         oMRcfsx8mnpRnjqlxD3+A6eULAjPqiJQ9P8dRlEkXWbCEQgiQt/UzGdfeUT/43DEN963
         FEkA==
X-Gm-Message-State: AOJu0Yy45qWJPK6VUts3yv2iR+zoJRgExyo4yERv0dzySZT4d78rZ38G
        k7lMNu6AXPqL8YVzyZ4DRyJXhQ==
X-Google-Smtp-Source: AGHT+IEKZISkdoI13Phz3FVeQUPDC2cLcqdNLr/eNlx1Js35MIHxmbeXSDuxAfaQAE8WJZno/i4YHw==
X-Received: by 2002:a17:906:2009:b0:994:54ff:10f6 with SMTP id 9-20020a170906200900b0099454ff10f6mr13630107ejo.30.1692959868327;
        Fri, 25 Aug 2023 03:37:48 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id pk18-20020a170906d7b200b00997e00e78e6sm815961ejb.112.2023.08.25.03.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 03:37:47 -0700 (PDT)
Message-ID: <3e4e03b6-380c-ce61-dd93-30669e6f9b5c@linaro.org>
Date:   Fri, 25 Aug 2023 12:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/5] dt-bindings: usb: dwc3: Add IPQ5018 compatible
Content-Language: en-US
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230825093531.7399-1-quic_nsekar@quicinc.com>
 <20230825093531.7399-3-quic_nsekar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825093531.7399-3-quic_nsekar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2023 11:35, Nitheesh Sekar wrote:
> Document the IPQ5018 dwc3 compatible.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>

Split the series per subsystem. You are making applying process
unnecessarily more cumbersome for the maintainers and as result - delay
your patchset without any single reason.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

