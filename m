Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1D74FE05E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 14:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352005AbiDLMge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 08:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352260AbiDLMgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 08:36:01 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B58C5E762
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 04:54:55 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id lc2so16242828ejb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 04:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QHCIwf7uKojCa/2Ev85bnweKYQuMU3PscULOv/3SfH0=;
        b=DD4J/SiIfk70HC7aXDM4XEePvBUKdzzefIcgqBNThjAReDiodJEUxv0NPXpUdN4Kvw
         5GK38QtWhkafFiYN5PdU1rjp9aro7+WtQivpUph3krYiRej9dnybekWAPqZ7OAw9F8xL
         wNK5tQg9jnGDORnDvGQ8VgkSLX5FYQOqHwx3FAh9Ov0huiJqoLlT2vuI0KfWGVYBqxCW
         2IWQ1R+ATurd2bGH5iYdmSLgRVFDArfFNifG/UnU14tH8thrH521ohSzxTH0Mb70XYmd
         T8f7UVwyAEgO4OGSy7qDzscYWwIkGggVShOv5zJcBZ/+SU6h/uZEvJujeGPcbML/6rfT
         H1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QHCIwf7uKojCa/2Ev85bnweKYQuMU3PscULOv/3SfH0=;
        b=TYDNGI34DWjwphgAO2wCjFzFJSErB2WMZ/jNoQQlQ0a/xCYmSldwo6NbeLxNOB50JK
         6x/o6UAUxzPttq0Hxgnz4qDqKhys4GdhDPV4Wm25c8V2JsWdGtf/owTeI5TzF9GqMTx5
         jGjPTg1kIyVtKIT0KE6rUzErd/9iFRCQNcvcnKL1HsKdiV+dq6aXFiTSgsruf83+aFXJ
         gBlxlR/AlgpdW78Y7Vz8rcF3wBeYNsZvH8klFO5tn8jZ0YXzdGaMDxDoKEkgEliUTKxk
         W7azTEq5O40Fe8YeFpXOxjKAfd21mAwscWXWE9z/B7wu58rJHniWY85+QMRkX46CvEDD
         7jSA==
X-Gm-Message-State: AOAM531SrTJz9v8ccCkNAX2oUP+0RHzdjGBUygghpV2BN1Zivhoypg2t
        kzTgoxiJ6Aea5DFA8hR6XlHyqw==
X-Google-Smtp-Source: ABdhPJx9FE2flpben9B2OZUqjC1Vqv352+dinvZFdVtXqGLSmXzCHwsuwcdIhzcf0QGCra4M1rTYbQ==
X-Received: by 2002:a17:906:e87:b0:6df:8602:5801 with SMTP id p7-20020a1709060e8700b006df86025801mr34857117ejf.140.1649764494490;
        Tue, 12 Apr 2022 04:54:54 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id g4-20020a17090613c400b006e843330364sm5568236ejc.122.2022.04.12.04.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 04:54:54 -0700 (PDT)
Message-ID: <2f0ecdb6-97f0-213a-7ee7-d1fe0a7406a8@linaro.org>
Date:   Tue, 12 Apr 2022 13:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/7] dt-bindings: mmc: sdhci-msm: Document the SDX65
 compatible
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, ulf.hansson@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     manivannan.sadhasivam@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <1649670615-21268-1-git-send-email-quic_rohiagar@quicinc.com>
 <1649670615-21268-3-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1649670615-21268-3-git-send-email-quic_rohiagar@quicinc.com>
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

On 11/04/2022 11:50, Rohit Agarwal wrote:
> The SDHCI controller on SDX65 is based on MSM SDHCI v5 IP. Hence,
> document the compatible with "qcom,sdhci-msm-v5" as the fallback.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
