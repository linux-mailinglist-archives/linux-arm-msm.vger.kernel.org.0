Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26313611D4E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 00:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiJ1WQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 18:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiJ1WQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 18:16:50 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6550624A546
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 15:16:49 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id h24so4372997qta.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 15:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnYlAKDE7Id/0+mYIu8Vu+E1SnnSzVg+K0/rkruZ2h8=;
        b=KHwk2RAuaECbC3I7NYokRNVpeeKvnlcV85rc9BRqkxuNJlkU2+lVRJXfJqZFDfM1tD
         FPistzLhKYj8sYn3DvAo1CqC/S7W4JqEJD56XQqUZjtYm/C2ymDinNrQ4rq5SnOF4dzq
         s3iTuqPV6qb+SdKUqqpld/8OMroRwU6Cqrrel1ZZlUgH/Y/aAjQ3hdm/rcnQ2Z07o1CO
         thqe8VfVj7/vhOIUQZk0RFINemife/mrT1/5eXAfVArDHO4V3yhn1eljUADT7uOBhtB3
         8In3Mv7oNC0I/MEK0dD49w6ktF3SPP+AzPOtzs3Qh0xn9f97/9CE9AFekFUiHMPmebCT
         F6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnYlAKDE7Id/0+mYIu8Vu+E1SnnSzVg+K0/rkruZ2h8=;
        b=hMmDBrmvQeHuJjcO0ghhkT7X6mS41ij4k0JAbt7NwWbY96Xoc9xBjNYMCle0Lash2u
         8qGNQE8p6oPukdq+SpTiGZpNU3nf1ATjOUX394WQFi8jx8aI7/EGHNFul/ld/GY4kugi
         P4K3lV1sPF3e0z9d0lXMuokFOd3fPEFmbwRNxUQQGoTgctq1qjrgipKNV2py5UpWQtyn
         orxSBmo0Kb6bTSNklrgmbmKbzZaHfsyb8sabIbgxl9UPO+bvfuLsfP2QFplQe+PhP9Z+
         dWVFOnGsunp08khVFvlOPzMNHYSrESQAflthbawC1QEY/itnFFJvucDXNt6LEtVMcEZK
         B3Tw==
X-Gm-Message-State: ACrzQf1S7fzf8JQ3JhH4VeDThC11CS03bY6HzRNec15LyQSpPh/0Qhac
        v1oNzbWVejLxlnUqTIQvM78tnw==
X-Google-Smtp-Source: AMsMyM4JqcQtQfto3gxhbFuFfIPXNDpMOLw+m+TMO83HEMc+0lwBFGtm0ISPPKKz6TltA+cegdORBA==
X-Received: by 2002:ac8:57cd:0:b0:39c:bb4c:565b with SMTP id w13-20020ac857cd000000b0039cbb4c565bmr1511242qta.115.1666995408600;
        Fri, 28 Oct 2022 15:16:48 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id v8-20020a05620a440800b006ec59941acasm4018380qkp.11.2022.10.28.15.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 15:16:47 -0700 (PDT)
Message-ID: <1e5b41c7-5f0d-68e7-ddbb-d2594998bd4f@linaro.org>
Date:   Fri, 28 Oct 2022 18:16:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sc8280xp: Add bwmon instances
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221028034155.5580-1-quic_bjorande@quicinc.com>
 <20221028034155.5580-11-quic_bjorande@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028034155.5580-11-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/10/2022 23:41, Bjorn Andersson wrote:
> Add the two bwmon instances and define votes for CPU -> LLCC and LLCC ->
> DDR, with bandwidth values based on the downstream DeviceTree.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Looks good (with compatible change to include "cpu" part):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

