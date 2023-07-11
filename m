Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9B774E8A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 10:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjGKIHc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 04:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbjGKIHb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 04:07:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B331A8
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 01:07:29 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so707111166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689062848; x=1691654848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3LgKoARiFU5JchZVDITR0Fkx+2lgcxq9nSnVl/hDzY=;
        b=o1LjMs/2GzXxMOvMfzeQFx3ZbbUujJK3I1EsH7XNTzDuALP+vRoys58IvYcjG1wIgG
         0PpJZjzMGogOzHBjjZm7PEbWosF4wvhRLQloo94AgMijgd6YLQWFf4f5amcFL9Sbpsqm
         CHBbIUkHstrfgTzD02t5oGeZ/bI8cXaj7TmZ8kVskbrMDiJytYw5IbRqTT64kMif8+ku
         pq2ECeGvNsaddJfmpj50cpwqX3HX/IRVgNk+spLy50WtYAB5mISb5/oGyktOUWbVFt3v
         26t76Mj0nCB5aZfC1FnjhEyTafBXBeL1+t1EPRoPFSmNCP4Dkg58R73+gsK+jS59gedf
         ET/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689062848; x=1691654848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g3LgKoARiFU5JchZVDITR0Fkx+2lgcxq9nSnVl/hDzY=;
        b=MZTxFTXi2O8zvj9O66iLMPkLxSGRd4aHUy1wXAGw5wGMcOM5+Fs7kV19m765Ccb3Og
         Axvt8PgwsRYpR0w3ThDCCtvfKrJJPnDkl8QSxTzkK4q/5WaHB/dg/TNlJrXKHgri2B8f
         /tv4RBTJehVbjp58c/TP3zpP5p/PI2Ku/Q/P8/jge8FAh0qYLV18bkkEJ9Tc3Ntj35fU
         +HL3PbxEJ+b/4o1nDcJSBYZgpL+Xh73Ynqz99uiTfguJ4TwS8nH65Lin4oxGpJPS2rWi
         q5xMJDAMiHSJMdoWuoeeH/Az1DvLLVAeBto5xQEVBgqfyIcH6zLSlC4yjLlSw94bkmU4
         gTJg==
X-Gm-Message-State: ABy/qLabhM1zSf7YHrbPe2vQvXvQKqhNHJQAYN10Rf9z4ZcPgMp9DFGC
        s1VMPEtjZDPGG/vvxdcaORhdLQ==
X-Google-Smtp-Source: APBJJlEnktGhusk7CqQtZRWRrZLoCadCTrEY9RXcv4RWBUmlAxR917Yr2sq4NAecNJ5UWIzUIFRJwQ==
X-Received: by 2002:a17:906:7046:b0:992:ba2c:2e0c with SMTP id r6-20020a170906704600b00992ba2c2e0cmr12727322ejj.36.1689062848079;
        Tue, 11 Jul 2023 01:07:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906249600b00992dcae806bsm819717ejb.5.2023.07.11.01.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 01:07:27 -0700 (PDT)
Message-ID: <95545d55-b208-b464-9bea-b671f5aaa345@linaro.org>
Date:   Tue, 11 Jul 2023 10:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] regulator: dt-bindings: qcom,rpmh: Update PMX65
 entry
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1689062414-3654-1-git-send-email-quic_rohiagar@quicinc.com>
 <1689062414-3654-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1689062414-3654-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2023 10:00, Rohit Agarwal wrote:
> PMX65 does not have vdd-l18-supply separately and its
> already part of vdd-l2-l18-supply property specified.
> Updating this PMX65 dt-bindings entry accordingly.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

