Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF9065675E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 19:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbiGERkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 13:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiGERkb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 13:40:31 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71BED17E14
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 10:40:30 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q8so2979944ljj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 10:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Rf+PUR5D5pZBIwyOSdcFqeRgcRBF7HX/FvmmUwl6cU8=;
        b=EwHCeFn6kVexzlg0spOMiDQXVDpp+Vtk9J7Q0+LYFILwADYNUdNesenbLctK7Vi7HD
         HC1WaNwOOs3v+iaSxMzIr3O96bgoCMby/nEli9mGcVYtbOWJ9SwkpUmTZcG55hrdB9iq
         cmJWLdKzU4WlWtiBKaG5N5OFxzPIh6sB7U1HsQ+nTabzdtk2ExmTNKQpamTaNLGjhksv
         TdwG08NKQ6x9WfHCCuAlrOQZAFCR9oJdzSwlnJPdpCeYRRFfcY4H7xFJCQgLfug9/SG5
         nHuAS0PNixenp58Zq7Mo1Z27yDoI8COhlLVUxR7JQQz6lH7aZA0KfTgL57usWn86ds+x
         Vi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Rf+PUR5D5pZBIwyOSdcFqeRgcRBF7HX/FvmmUwl6cU8=;
        b=fxq9+g7Jwqb5YQ/yV00bYCFCMTxWScNVeIC6ty3F9SrrPF1GqGsTLQiA/KdZg1ZoYd
         SE28J1owrzZZcR42m+L8rq4JjYw/zeFTc0NWmMl/+56F20iYqxKoqd6QBfsfdjyjJl3y
         iPeq/cmBRX91fHgm3wQXvzF6L2I2kp6/i0+MbCNKIo8Ax9YZVtl9vjOP1mlQxDlDicwq
         f+Nazp57iKhQ9IAkdX4MFbBWfzKEv5O36v2YBno4ZY8ys5dPKZAOKn6wwK+r9/QJREUJ
         V7zIQBR/DzKDmChc9BbP9/SfZ4Rl7t6OeUo6tTz7j/4ID1Vkwk9asTtxhHlxIOwHnXtb
         UiEA==
X-Gm-Message-State: AJIora/IP6hSPDkLcVML7QXRTbOKqq9OQnC9EYmu1K13UDdT030mRu3l
        3rmEoDve6O+G37GWlxNjhGgd+g==
X-Google-Smtp-Source: AGRyM1utsUYanEwT5N/s7CyZQAyFSvDKoUZfQ77MggTrRm+yHhhuEHcO7uLN39wDA9XMrWd94D9zLQ==
X-Received: by 2002:a2e:b94e:0:b0:25b:b99f:4f58 with SMTP id 14-20020a2eb94e000000b0025bb99f4f58mr19770803ljs.263.1657042828762;
        Tue, 05 Jul 2022 10:40:28 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id c17-20020a056512075100b00479112bb555sm5818285lfs.60.2022.07.05.10.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 10:40:28 -0700 (PDT)
Message-ID: <004843a8-f4b8-1fe7-8d16-0d64c83c6998@linaro.org>
Date:   Tue, 5 Jul 2022 19:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] dt-bindings: qcom: document preferred compatible
 naming
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20220705161301.493364-1-krzysztof.kozlowski@linaro.org>
 <YsRysg0Wm97iOgWo@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YsRysg0Wm97iOgWo@gerhold.net>
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

On 05/07/2022 19:19, Stephan Gerhold wrote:
> On Tue, Jul 05, 2022 at 06:13:01PM +0200, Krzysztof Kozlowski wrote:
>> Compatibles can come in two formats.  Either "vendor,ip-soc" or
>> "vendor,soc-ip".  Qualcomm bindings were mixing both of usages, so add a
>> DT schema file documenting preferred policy and enforcing it for all new
>> compatibles, except few existing patterns.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> [...]
>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> new file mode 100644
>> index 000000000000..0be18c1d2961
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> [...]
>> +      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
> 
> FWIW: There is also the "qcm" prefix, used e.g. in "qcom,qcm2290-tlmm".
> 
> Also, the APQ equivalent of "sdm" would be "sda", e.g. SDA845 which is
> used in the DB845c. (Not sure if someone will ever use the SDA variant
> in a compatible though.)

I expect the list/pattern to grow, but of course I can add these now.

Best regards,
Krzysztof
