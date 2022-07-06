Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5621568496
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 12:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbiGFKFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 06:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbiGFKEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 06:04:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516AC24F12
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 03:04:52 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu42so5205288lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jOWI5FGVtw/ixLzBC8ndyrPyf2V1YZb2DgbRUAqX8k8=;
        b=c5v/TLBpZif5jKoI+hkZ+17AFj26Gnn9DHyCs2jUB7uEFwBY32pqpr2yHfDBI7PGvN
         3rlM+QhqvFMy+erwYAeEAYIi/keeK83s/fW4mZVW/AOCPBih7h9a8SgErfxQbakynLyV
         qlQpGMiZQxBHKFe4GJZ0w2FR105vGMoa9Oy+XFqKN7ZQiNRQ1Vdhn6DUsBe8XUkDZV9h
         vOgGb1n8TtDi8MQHh1Z95RdCUzbTNIv1mNoBPpbRTHKV/gTDVMokqznfZ77VJdj+zAF0
         sQjDiibGF8E331zBoDc+kQVXZc+iZ3Lt6wSiDfjWe6WyMSlomBQnh7/7V1tOUkVEgZam
         90sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jOWI5FGVtw/ixLzBC8ndyrPyf2V1YZb2DgbRUAqX8k8=;
        b=FS7wvoi6zSbbMzxBNVL6AnAc25990jS3pz/3kTE5OzYKHsWQoZ7eyuZ1ISZkV/P4Ge
         RCo4b9PnWAXfH9/keFWAtmd/7UEvA0jSamyn8Mvcq/1ATHwhPhkGGXQ1Rqf29PpLRlBQ
         86RP9oEWg6AzVlnyZS8Viz3hZSuN5FRQ3hCUvjoYWUABX3igu12oRVWp4V8+5Ei/KzrU
         oDjJp7x2LOPGIXYA9Ehx7HzCEmlqtTvL9SmneuLMMqgYGHb+oOz9Tepjsxgpi5ytEiMp
         HqnzpKwpPSKG+BTp+Nom+m9i2bBpYZwVloXrsvq/81bDKuRs7DjhQHXnMcz9d9idI807
         PdSQ==
X-Gm-Message-State: AJIora8Riju/gat9XCAgb8ht8XWezrF9E+9XJNUCCvYJHihBcgElM45f
        R5ba0IVd/YdGg1QnkkvWL9Z3H2jE9wZSow==
X-Google-Smtp-Source: AGRyM1uNagtuURx0cGgzKp82vsGEFu/cEuG3G54Di0lBF8Z5m3UsWaeZWfJnTLwPuInoek5ZCpX7BQ==
X-Received: by 2002:ac2:4bd5:0:b0:481:25b8:51af with SMTP id o21-20020ac24bd5000000b0048125b851afmr24554967lfq.686.1657101890693;
        Wed, 06 Jul 2022 03:04:50 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id y9-20020ac24e69000000b0047f647414efsm6194258lfs.190.2022.07.06.03.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:04:50 -0700 (PDT)
Message-ID: <8f9651b2-ca9a-413c-d94f-9ecf3717343c@linaro.org>
Date:   Wed, 6 Jul 2022 12:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] [V1,1/2] arm64: dts: qcom: Add LTE SKUs for
 sc7280-villager family
Content-Language: en-US
To:     Jimmy Chen <jinghung.chen3@hotmail.com>
Cc:     agross@kernel.org, alan-huang@quanta.corp-partner.google.com,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        dianders@chromium.org, konrad.dybcio@somainline.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
References: <cfc2c27a-444d-8bd8-84a7-b6b1f99258f9@linaro.org>
 <SG2PR03MB5006AB4C7E356CE321F628D9CC809@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SG2PR03MB5006AB4C7E356CE321F628D9CC809@SG2PR03MB5006.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2022 11:36, Jimmy Chen wrote:
> To keep the consistency of the format for Chromebook items,
> we basically add these items based on the rules discussed in the previous patch series here
> https://lore.kernel.org/all/20220520143502.v4.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid/.
> 
> We are little configured with “one entry - one enum “. Do you mean something like below example?
> We suggest keep items separated as it is more readable.
> 
>       - description: Google Villager
>         items:
>           - const: google,villager-rev0
>           - const: google,villager
>           - const: google,villager-rev0-sku0
>           - const: google,villager-sku0
>           - const: qcom,sc7280
> 

Is this a reply to something we discussed? There is no quote here, but I
remember pointing out some issues with one of Google patches recently.
Unfortunately my mailbox receives like 300 mails per day, so this does
not help...

Best regards,
Krzysztof
