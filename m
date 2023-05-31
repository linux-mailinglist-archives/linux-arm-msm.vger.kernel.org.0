Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F159F717BD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234145AbjEaJZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235559AbjEaJZC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:25:02 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B746E6
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:25:01 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so41246035e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685525100; x=1688117100;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Va+eWZi2uLo9F99GJo8IumrvbwwllLELRegYwCB2G7g=;
        b=KrlIc+T4nwlhRheAQ20Rg63SC1LrUwcKrgsZv1zunGJIEUlK4Z61iaSFqUnBOMx/Qi
         zSadPvooyvqtH2Z/r+8gnsRXJ8hRLIOYqeOVf6c8AmVOEtfCPccxoYhr26OXFIEvr9+r
         glikUxlwr42/RSYppiz2kVp262udNlqGLfUKbg7th9gb4CwgbSEfhcMm9qmDn30UAakM
         s18bRcjB46GZ5uYjyaQgZCb7K4d67h0eVC1wkSsF1wJeuJ4iOTWXDJnxKGpZxv0NRorI
         RP/oPSjJOJGi97gpr0PMkenhWmnoMfU919VZyLB54qp5Dh7EAMd3iy0MaluBYTjHfrSy
         /0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685525100; x=1688117100;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Va+eWZi2uLo9F99GJo8IumrvbwwllLELRegYwCB2G7g=;
        b=JGjjEoR7T0Z1haP8M0Xcdi5KBMMQxCXWJWjL1SpmIYNWPnP82PK1EZPKBrgZ2sigA7
         quLNOncGWEH5u8P7m21Ib63inbC8APgNbte72tZaAM1fNvgRJX0icVv/wuBsAzekuRjF
         Z5CFQhj5ZXgHAObNVNe+vklxaN8lzj/OSx/UY9ZprDddwtsn5qV0t15OY12Li2bvf4y+
         27RRLDoYEPaiGG9gXYlXsbj+c8fTBv7V2Lult8SdCYNJM233KcBNMbql1AbinPhmKijQ
         MpQGgWcK4AIe3I4C3wGOKXiJgRgq0uleqA20FCAuJo0iUqlT3XRyEtsOW3NxzqM4fT9T
         vTAQ==
X-Gm-Message-State: AC+VfDz38lZwpYAG9AZaaZ9I2VSTEkflMSTZnRBcBm7BVDvckSXQ+lrR
        QII0OtwBZKC7eho513LqQOXmKQ==
X-Google-Smtp-Source: ACHHUZ4ofPLi7HPrByG9DJoBSCZNlWjijRrg8aTJMcUMR9JTA5Iy6UPz3xnS/1uS1TtgIaZXcvJgFg==
X-Received: by 2002:a05:600c:2219:b0:3f6:8ca:ed52 with SMTP id z25-20020a05600c221900b003f608caed52mr3910358wml.34.1685525099874;
        Wed, 31 May 2023 02:24:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779? ([2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c24cd00b003f4dde07956sm23645163wmu.42.2023.05.31.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:24:59 -0700 (PDT)
Message-ID: <57af6b8f-63b9-8748-035b-ce26add07e99@linaro.org>
Date:   Wed, 31 May 2023 11:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop undocumented "svid" property
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230531024944.4105769-1-quic_bjorande@quicinc.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230531024944.4105769-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/05/2023 04:49, Bjorn Andersson wrote:
> The Linux typec_mux implementation required that a property named "svid"
> was present in the remote node of the of_graph for a match to be found.
> 
> With the introduction of commit '4aebc4f89f00 ("usb: typec: mux: Clean up
> mux_fwnode_match()")', the implementation is aligned with the binding
> and this property can be dropped - and the associated DeviceTree
> validation warning resolved.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> The referred to patch is present in usb-next.
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
