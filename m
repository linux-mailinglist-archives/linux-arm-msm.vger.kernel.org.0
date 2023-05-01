Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB0D6F32C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 17:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbjEAPVv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 11:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbjEAPVt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 11:21:49 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27699D
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 08:21:47 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f1763ee8f8so15360295e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1682954506; x=1685546506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKiWqYh9XO5qAQM1s+Ma3p+jBCI9gPE5d3tSqh6MCa0=;
        b=1wg14JkhVroeNJwAGykMLmL84VsdXQW2riCt13yjf5fCspUhukwPLkrLeWvZtdx6Y+
         hzIgqfTops1iGoSXM1ALRKuqLRRUDF8Sfcxi/Wd1lPYJGiPyf2pDKBGPbKg3I5/oYPsV
         soWnBr0Eh9Zw/BnzhUsBOJThdpVjOmwraxZJkeiEi52n/EY8zScjjgAaHhLsN7b/jjLL
         HDby8pTefmIN2AXWePyjq6rWKEB5n8W/XOKGsy4XJPG5ruR/L8qg5iI97t+o6TRAga5u
         R5iBRhDsidLv15aQkVC7qdNs1BCDdBhJCjcVDGB98uLleP/UDJa274sJfdnnueTsd/Mj
         FUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682954506; x=1685546506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKiWqYh9XO5qAQM1s+Ma3p+jBCI9gPE5d3tSqh6MCa0=;
        b=Lz1VK9HF1KyiRvUD2bk1N4RxecWaXDld2VDTAbCJ5Qp7J3APK+i9s9TkoYVjZDB2gh
         ILfamAmTWI9d6opWLWG+I2ca/WMWO9eYjgZBJdgFHF+yL+TC3r6lLNtuPZFU4zLmUgJ2
         7pyhpGEp/hFr3X2aDcYdvZVjGJjXPYZdCM9AD7HCdVzHrZUmggMPyZ9Y+TgODoqBma37
         1aUtJC/1sVz34yMDMghb0L1R/2POFvRWZC/JSP/D8mgKf+d6YxTf6MLjqTmRJoaZcDBo
         BSrH8aw+BE+ikvBhhtsTbHbMq/5hVVepm8Uqg0QBGFlar8ijtLoeFcvL/n6dJY33Fe94
         rdXg==
X-Gm-Message-State: AC+VfDxpOv9awlY9pt7GV8lIpUJzPlrWFgDYbadBtyQAdFLSL2BN4SLt
        qAcpMRaZAjFSjCcl8z+nlVpv+I0e5rkk0n4gFLA=
X-Google-Smtp-Source: ACHHUZ4exJkxnm7bFLNwMG7ossO2cAt9qLl8HLKC4o6ACSLrL7hVkj+nwqOwptyhBk9cG5GIKSEGpA==
X-Received: by 2002:a7b:cd09:0:b0:3f2:507f:25a4 with SMTP id f9-20020a7bcd09000000b003f2507f25a4mr10024730wmj.30.1682954506144;
        Mon, 01 May 2023 08:21:46 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm32626835wmj.35.2023.05.01.08.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 08:21:45 -0700 (PDT)
Message-ID: <b22d9fe0-b39e-75e4-fb1d-a74d45d667b8@nexus-software.ie>
Date:   Mon, 1 May 2023 16:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2] clk: qcom: camcc-sc7180: Add parent dependency to all
 camera GDSCs
Content-Language: en-US
To:     Taniya Das <quic_tdas@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_skakitap@quicinc.com,
        quic_cponnapa@quicinc.com
References: <20230501142932.13049-1-quic_tdas@quicinc.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230501142932.13049-1-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 15:29, Taniya Das wrote:
> Camera titan top GDSC is a parent supply to all other camera GDSCs. Titan
> top GDSC is required to be enabled before enabling any other camera GDSCs
> and it should be disabled only after all other camera GDSCs are disabled.
> Ensure this behavior by marking titan top GDSC as parent of all other
> camera GDSCs.
> 
> Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller driver for SC7180")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

