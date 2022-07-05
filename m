Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C5E566779
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 12:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbiGEKK5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 06:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiGEKK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 06:10:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A05B13F9F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 03:10:55 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z25so2145886lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ol86STMqgAKp+0F1Lxowaa3JS8aP5AgYqpMap6ZZFtM=;
        b=zzu5W00IQ5hUD8rl4I7b8Vaa5O9BXFsj1UWT9yxwlP64l+XldCO7gk1cnHrtK7OsQN
         /KZrGkRVUFbjiV1GUyGTtDzl2K8j5rVIZtrH1CH1yMVxnzFe39Uk0Kxw+zy3fK6vkt3s
         uuYc9ZiYeUqK1NYudDbNA0bmwlny1aKFnTb+Ddy3EJ1Ht+CAzrpsZ9in+sub6hd8Cwys
         zpr777mvOpIFIL5N7/UsOOzBtqEEXl4y/RXmvGRs+Ne2foZn/pMLWzy4Ml6VzEtFgw3f
         zql/vH6hR7weGmzGR6nv4cspFgaQLk493vo0SmIfMbn7bzPpy+sCM1bDynZmqhIXsycT
         vmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ol86STMqgAKp+0F1Lxowaa3JS8aP5AgYqpMap6ZZFtM=;
        b=XF/zT8k5Ob5aN8NYOLmQ6jHj2gSNUTU9BjozTCKYohmYte6M/JUksvhzIueppswC//
         eus59IEsa8qsh+CRJxqrfuR91Lzgwq2X0ad5Q/vLOREzYoF6YuXkZtKiBa3l0vvWkqW9
         FiFq+hpmD7VXsXd+X/3Ra97RaCwHh+htzHeafW3LTY2LrWxRlS8ouONPlG7dFGmilQxH
         RSPa5+/XYwBO78pP5eeYIGhhigd3hEsCBs2jZ50yLjv3YBmkSGcheTUpEgAXJ9t+b8NI
         SSg6EHVo1QAJjccwwPXwnA4uVdmVqV0H+exkPoKYvE6COqsisQI20vYYKyTJSFTf9Q4p
         M8MQ==
X-Gm-Message-State: AJIora8UrOM8g6h/27ocKhDZptAj4c9kMq7+8thCcsMfDwbEvx6wXHQV
        TLqKxZSwSwFWQFbNB+xs2aVNPg==
X-Google-Smtp-Source: AGRyM1suh63veqOs9l5dpz5zDtMw1oH5sjt9T9R/ZkuzMhoMEQP61ZP6vHfmU/bcEB5jnEX6RmA6nQ==
X-Received: by 2002:a05:6512:2154:b0:484:b0b7:d319 with SMTP id s20-20020a056512215400b00484b0b7d319mr131270lfr.12.1657015853849;
        Tue, 05 Jul 2022 03:10:53 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id t26-20020a05651c205a00b0025583eb9becsm5271605ljo.69.2022.07.05.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:10:53 -0700 (PDT)
Message-ID: <bd294bfa-e7d8-0e4a-4108-705fc1ebcb77@linaro.org>
Date:   Tue, 5 Jul 2022 12:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/43] dt-bindings: phy: qcom,msm8996-qmp-pcie: deprecate
 PIPE clock names
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705094239.17174-1-johan+linaro@kernel.org>
 <20220705094239.17174-11-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705094239.17174-11-johan+linaro@kernel.org>
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

On 05/07/2022 11:42, Johan Hovold wrote:
> Drop the unnecessary "lane" suffix from the PHY PIPE clock names and
> mark the old names as deprecated.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
