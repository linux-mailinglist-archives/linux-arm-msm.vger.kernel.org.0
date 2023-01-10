Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB88A663E6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 11:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235755AbjAJKly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 05:41:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237639AbjAJKlw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 05:41:52 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F093FC8F
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:41:51 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so9513288wms.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Kmdl2LRYEGA5pFWSBndyZ1ax7Mwo+8rsWyqZk3yHkQ=;
        b=x8Z6WFaLc+Tf+szGOGM2YiP1hDHMVrS1/gTASAw+UoXbI2Op0mHHrm0dbREMeGAHCQ
         i/dSWrl7PUfR5MZAZexV84J/2sovJ36CuVhKpiOxmyqq4H8tvwRDy/v2xfHar++VXaVR
         Es7MUJF5IZykhZDwMBHAMAJbv5aRJKGktg2ffhHcE6WTVbKQLaOfr98PXtwCQG1ibxJD
         GFusjOZpuCENE8EUJsKbpKr97oLnzmLfx+aSY2v+Us/mRR+i0clhxdNmeHnUufVjxrgN
         cOuGUQPndLoErhmrtu5VpWns+SzhgdlCZUd5BDm5nbUtpbu8uNFO9sX0MWX9fEWbl5gj
         vKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Kmdl2LRYEGA5pFWSBndyZ1ax7Mwo+8rsWyqZk3yHkQ=;
        b=jGyr8iCThM1WPjH4QL72zC0gMIE0PnE5lXAa5HAJNvuQcoTTP9L+zTvHbVBoBnceUD
         2/0MDkkiu7Xy1j17ldfEgsuKMpvCp5f7zZCs+LduR6RaephaE+08/ZpOK0Js6LaEgPcx
         WwYQ5jt/Kf+5eZKujL9/TRjOEtGOiMncbE9OQjrZvz0vAdWODY880mMJv2dHAr/ukmOC
         G0i6wcwYy7btOmR2fb6jSM0P7CUjHUrYFkUokRTc5P3/bhmF077p2FsyYuoIuchqBH8X
         w29Onc8CayqmFh29DNf2UuVEK5trwOm6lcHVU0+QA+QtKsUy8PSuxIaoFrb0gpa9sL+2
         W8RQ==
X-Gm-Message-State: AFqh2kpujlAHvL5UVa+V0wIIarjWB25QF8efROaVvnWL0YxKcdXEb4RC
        YHCrEncFdrRe30LlH+VX+/gIWw==
X-Google-Smtp-Source: AMrXdXvf5LKuTqr46UY49CJoNObxmFOm3A377GNRsSc/sRVbgdTpLhc9xKMeXVHMl1l7QG3LB//zeA==
X-Received: by 2002:a1c:7c0f:0:b0:3d5:816e:2fb2 with SMTP id x15-20020a1c7c0f000000b003d5816e2fb2mr51661389wmc.14.1673347309738;
        Tue, 10 Jan 2023 02:41:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003d998412db6sm20422459wmn.28.2023.01.10.02.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:41:49 -0800 (PST)
Message-ID: <4fdded13-f433-0e79-13de-299d0a7aa025@linaro.org>
Date:   Tue, 10 Jan 2023 11:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 02/10] arm64: dts: qcom: sc8280xp: move
 #{address,size}-cells on i2c nodes
Content-Language: en-US
To:     Brian Masney <bmasney@redhat.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.co
References: <20230103182229.37169-1-bmasney@redhat.com>
 <20230103182229.37169-3-bmasney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103182229.37169-3-bmasney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 19:22, Brian Masney wrote:
> Move the #address-cells and #size-cells properties on the existing
> i2c nodes below the reg property so that all of the address-related
> properties are grouped together.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Link: https://lore.kernel.org/lkml/Y6Wnh+tXPhF6aC1b@hovoldconsulting.com/
> ---
> New patch introduced in v4

No, because we do not have conclusion about their location. Also,
re-sorting should be done for all properties, not just few.

https://github.com/konradybcio-work/dt_review

Best regards,
Krzysztof

