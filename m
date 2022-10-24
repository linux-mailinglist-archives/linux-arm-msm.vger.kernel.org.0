Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7323F60B3A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbiJXRNP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235285AbiJXRMq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:12:46 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160C1AB82C
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:48:02 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id t25so458565ejb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++QYeJg/+C+ik8WFdwtW/r8WZFhwmGFWmKV6qKEKsEI=;
        b=yhSVHZPb0ESj6C8xSmwXNvjOVvewdiIzyVKUX4mPny9lGtJ2BPg0u3DGSxAVCCUIm1
         bdtE1dIP7fWY5ExuowaZWT2rd/zZBPbKAzermaaykc+JyWRw2vQTAPwr5vxY0Ik06blA
         fJAP8vB9xqJsOp5jTN5lmi0I1QzdxvaeFza1r2Vhz23qyZWZEB01YlN4jpR3gevocrUs
         zYUJ2gtVxSe/D67RJoHil9/5iJlwNNlbvYVmeLMNxwkPaepPPoWgRlEvKMkzKZEaph9m
         iAgBvRaKtqzy+P3egka50v18xpITEwYl5kgrIQzUwF2/h1CT4qgznjUpA62h7Qe8s+H/
         DCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++QYeJg/+C+ik8WFdwtW/r8WZFhwmGFWmKV6qKEKsEI=;
        b=wOjFrjNxcd7fO6/GHRB6Z847wJfsvgFWZIqUDq4jGkdsnsGaUfRnEf6fiIYMy/gm6q
         IJlkVVoSDXGmUE3FnFZpPKrZNpEQMywdlIqfTkLk7MhVlBn/D8RDtyjFQYwbg2hw1pbf
         C4t8ekfww1b4iU9HR+dKRDs7/6Exu9DILvlOfck0XwhXhJBU3bXxyJc9KLqkVhIizCVE
         oN61fFNZ1/neg3Grltr1lVYYLUOzc1N4hQqm34arE7IGN8f0/4+o5IxjXVspEwawDCT6
         oK0u/QJ0pVMwsyReh1OEJJxsPA0/E4RW+lYaVCucl02sjoGHJtyYXYHDszeMxz5wo5IN
         MDMQ==
X-Gm-Message-State: ACrzQf176csjDNxZkR+WOAuxXbdoHqoayhm237gBm8MMhOKRP8JVW8I6
        xFKUpQFkG87vrTsonxabDBCruPJ0jK/zU0ML
X-Google-Smtp-Source: AMsMyM4GcW7E5WxrqWZrOBjhHWnWb9sXxY7y0kftJE13nf8nO3M9EScq/v7+TLu0j5Sskf6tDShnJw==
X-Received: by 2002:a2e:be08:0:b0:26f:ce4e:c659 with SMTP id z8-20020a2ebe08000000b0026fce4ec659mr11387111ljq.16.1666618252427;
        Mon, 24 Oct 2022 06:30:52 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 6-20020ac25f46000000b00492d064e8f8sm4518918lfz.263.2022.10.24.06.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:30:52 -0700 (PDT)
Message-ID: <a0acba21-647f-c031-4fd3-5c2a37d63812@linaro.org>
Date:   Mon, 24 Oct 2022 16:30:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 03/10] phy: qcom-qmp-ufs: clean up device-tree parsing
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024090041.19574-1-johan+linaro@kernel.org>
 <20221024090041.19574-4-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024090041.19574-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 24/10/2022 12:00, Johan Hovold wrote:
> Since the QMP driver split there will be at most a single child node so
> drop the obsolete iteration construct.
> 
> While at it, drop the verbose error logging that would have been
> printed also on probe deferrals.
> 
> Note that there's no need to check if there are additional child nodes
> (the kernel is not a devicetree validator), but let's return an error if
> there are no child nodes at all for now.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

