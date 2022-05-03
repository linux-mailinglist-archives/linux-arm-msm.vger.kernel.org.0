Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9586F51843B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 14:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbiECM3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 08:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbiECM3a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 08:29:30 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E8136E38
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 05:25:57 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z19so19616367edx.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 05:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GCGJOVaFvPi2cdZAa6UPkRWwapZJfoD9FjLKsOzvOl8=;
        b=zZpYb09NzsULIdZvqjDWB34wsfCyTIW5qhy/Esiwqa0TJfdQ0n7LVmNrsNmV9pyYX/
         DOXjArMo3aj+3DszDWbmUxffbbzRcO+PfFNXvLHttb9IL3AsZ4t55iSPu5Kep3RbgDEI
         On09x1duQp/RjmK699DnwteUsXUHhTlQEUoRxhk2VrDxk3RpN38pfzvawTR0tWOjYm9M
         NsQGospBzheK8/z/zqufHgKDQv1LNN2yESPk6B4p4fhOF/kUPU3RIFmN0X0DTOwxxVbx
         J7mFj0hO6o6JoWysUrtCd3xUCy3izDNsJTqNfb6Cw4OqLBR3Y44FMnkLGAYLH4Gox31N
         zHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GCGJOVaFvPi2cdZAa6UPkRWwapZJfoD9FjLKsOzvOl8=;
        b=gsjWGeQK0mLL7uLO1MCTtgSngak9zxGX84XGBGOf+/X7Iw1HJCaVOIx+y8aOSy7lOX
         19pYzDgwsr7lZo9qSjhrgMAhMwLU2KkiAlC4/eXOYHzqPC0ipZHj3fN0liqBhaPwaWgO
         g96kkIbHAi2xr8dUVv1l8LXZrvf4l20ff7MKr1GAMSmR97wrEUS6ILB9SHZsU0AGoZde
         qv7caVvWBBBGVTZHb7h51MuOK4tbxbgYrcGXPh17RtcdT4rXFqZtB3OBu+IaeO2uP1Q3
         irT/sgSn868bU6L8wO7ad/1K6137MmsR5ZtloOOOTKQM8nIyJbNRZ2eZQ/+5v4sTGvJ3
         jJ0w==
X-Gm-Message-State: AOAM531WbgUwVs5BkzKLrqBIGwdeU+5nQO6evSyAFW5j2oqZCs3uj/Ls
        0FjjanGiZuoED1dfXLN8pWOruQ==
X-Google-Smtp-Source: ABdhPJxaIEfqBaZo/WyNo6ukWwIiffhWb+nMnmw0GMvJWG2DxptvaFbjV2ed02Ff/JuclfPWdiESsQ==
X-Received: by 2002:a05:6402:2554:b0:423:f3e3:81da with SMTP id l20-20020a056402255400b00423f3e381damr17651983edb.87.1651580756428;
        Tue, 03 May 2022 05:25:56 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ia15-20020a170907a06f00b006f3ef214e78sm4554780ejc.222.2022.05.03.05.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 05:25:55 -0700 (PDT)
Message-ID: <9868ae89-57fc-0f1a-89a5-5ee0cd9207aa@linaro.org>
Date:   Tue, 3 May 2022 14:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/4] dt-bindings: arm-smmu: Add binding for SDX65 SMMU
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, ulf.hansson@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        adrian.hunter@intel.com, bhupesh.sharma@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <1651480665-14978-1-git-send-email-quic_rohiagar@quicinc.com>
 <1651480665-14978-4-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1651480665-14978-4-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2022 10:37, Rohit Agarwal wrote:
> Add devicetree binding for Qualcomm SDX65 SMMU.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
