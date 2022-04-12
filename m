Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94AFE4FDC82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 13:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbiDLKbR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 06:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379562AbiDLKTp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 06:19:45 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983C0DFAB
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 02:21:27 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z99so12982400ede.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JaTsKAtJSNi54rHJhG+hyScjwgHDH7ka4b7b1ta/ySE=;
        b=iJelTY48iYoGFyhaVFKLSxyokhQc4j93X9lAO5VhyZM9gCgpC+PF7tZeerg9RneIfw
         Eb70dzcx4VMDRiJEbpiXy+8uVTAXBY4jhu2+7BeoSYso4U5tRiab2Gj1RA3qgIUUyhl1
         mvn5o+J92QpBLV223Feml/8T2wb9WuAYrl9wiGwC6fL/hU8FsDjTbSSLWc36Jp6oaVHy
         EvfxX6ySNbJzY4TAoWCpUnP3I1iU5aUbqERMjyiRfzpGxWBBLlv6zs1sRXdREAHlFj7A
         Q9b8ze2DYdv3O4yZ+CMXhYuNm4K8ZmJptFpggymArTWdcckk5aCVuDck954SAUZ6JpuF
         UsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JaTsKAtJSNi54rHJhG+hyScjwgHDH7ka4b7b1ta/ySE=;
        b=ss1+RgVTBS8v5AAFiP/t6+8Wz5czks93/pDKyRJEqagf+dfHb7YK1ZCd/VMGQ2Dp/K
         MonJve9UiODIL3JiJbo+U7dZzjlQscFvGkz4NVbPCxUZ1Eb+5DAFsKAygWl8LzopbqK0
         4Bo5UppoCufKTcbSIjHKloLyvi1fNXcPKlHbppfNzh7GNz/NyfhIRGFtcs6KwT5YQIav
         KJaessm222lfHPx3l0GuDhAWCmPRzb2pbw+cJ8IQEqO2hCEY5NBKGcs6JowFeSkQlU2m
         viCgFWyWeL395fE3fYnGnfpz+23xt38yV9PwLgujNKM3Gq3ogm/bCQKs+2+Sevd07uK1
         cTOQ==
X-Gm-Message-State: AOAM530MQdCM8ld0+E5L9NaHovCNxbfrm2uWvXm3wfCJGG/I6mZz3vrI
        2PJGR3bseQiwHtK6ByxuTpBXgg==
X-Google-Smtp-Source: ABdhPJw5C5ynAEjOGwr/Emmjbh1RB5R+OcYH/bF0ZPE6x+rHILFMQ21c/S2l6KrpC8SuS8oQX3VIXQ==
X-Received: by 2002:a05:6402:3713:b0:41d:96f6:8a09 with SMTP id ek19-20020a056402371300b0041d96f68a09mr1070881edb.136.1649755286201;
        Tue, 12 Apr 2022 02:21:26 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id dd6-20020a1709069b8600b006df08710d00sm13200550ejc.85.2022.04.12.02.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 02:21:25 -0700 (PDT)
Message-ID: <2853deaa-324a-6c54-2fe3-3f4b78d110bb@linaro.org>
Date:   Tue, 12 Apr 2022 11:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add SDX65 USB PHY binding
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, kishon@ti.com, vkoul@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1649740652-17515-1-git-send-email-quic_rohiagar@quicinc.com>
 <1649740652-17515-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1649740652-17515-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2022 07:17, Rohit Agarwal wrote:
> Add devicetree YAML binding for Qualcomm QMP Super Speed (SS) PHY found
> in SDX65.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
