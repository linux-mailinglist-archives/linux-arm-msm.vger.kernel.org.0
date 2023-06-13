Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8270172EAD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 20:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236810AbjFMSXN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 14:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238881AbjFMSXM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 14:23:12 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE91D19BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 11:23:09 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5187aa14e3bso901894a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 11:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686680588; x=1689272588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZJW1DeQPT9YPPiVm1IXSKe/Dm77TXuyqrPz1vnbabQ=;
        b=CPmH9WAfzRMcoS8+g9AfTE++ftq90raXp+7LBnACMlD8ZH2sv0ZNx1y4WFudFtSzRs
         AVllW7I4lrcgSN/wBrAjNWDqyeELDqAI4VtzQY+BLhPBKXNl3fb4q5Tr63iBgkYMhx4+
         z3gOuwSbGQ+weVEZ7B4WqJWLFMFijR8tUnFWco+ttPQzJli8c0OWu7BJrxDhX5nV1D0j
         8P7+KQTZOar2OA4RgcPOJbVXvrMVW18LLtaj8U62L/ubylclkDqX3StPfSIJ6Mzg8Hfg
         aPmCJ2J2AcsCstwEtPjoj287p0KYLHG0IuyTraMe5/O00+xUxsn2n//hBz63Cl3m63ai
         SKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686680588; x=1689272588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZJW1DeQPT9YPPiVm1IXSKe/Dm77TXuyqrPz1vnbabQ=;
        b=PslPHxwvm25xMgUkPhR+TUYau6i5miLrAKDCG7zB2GRxctucLlEznDgzx4c6QWpVrM
         c7RifV7g5UYbpv8taR5awdJn44W1pwJPWHxrw+MChkwyQYmQ7OS3cPg/IFHFFKEBarZc
         XK1eEwe225vD5HT0rpKKuhSKD+aOqdHFHUBEzXf3OiYYeRv9G1VGsEoOP7slZnQOstdI
         1wGfW7OuRIf+KtN39SkDrOUB0gKpHKI4fNTIjzT+Fej6JgbQiitAG0XOnrX4F0EW+v8D
         PfcQAlwxaq6TAi13qBiA0UAVV5CoYj4V9GcYd6gu+YG3zqSSfLGSL198owp37FC3cOkF
         5gRA==
X-Gm-Message-State: AC+VfDx8HK0fQOJsE1tHOdv/yRs/a/7NSuoUZfj0ppiyAbfdhFIlHScJ
        MEuY5/haiWQpstlBbLsPoKw4JA==
X-Google-Smtp-Source: ACHHUZ4vbuaPKh0MKiVRYDJOeZpGiJI7K3xMIzJTlI5eXenj6RlbBuSnhdQ1w7tmyRp11ZXHxELj4Q==
X-Received: by 2002:a17:907:c09:b0:96b:48d2:1997 with SMTP id ga9-20020a1709070c0900b0096b48d21997mr14447425ejc.65.1686680588091;
        Tue, 13 Jun 2023 11:23:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n3-20020a170906840300b0097456b4085fsm6931491ejx.190.2023.06.13.11.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:23:07 -0700 (PDT)
Message-ID: <b7cd6f93-1118-1498-d245-a5b8e4a21c96@linaro.org>
Date:   Tue, 13 Jun 2023 20:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add ON Semiconductor nb7vpq904m
 Type-C Linear Redriver bindings
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230601-topic-sm8x50-upstream-redriver-v3-0-988c560e2195@linaro.org>
 <20230601-topic-sm8x50-upstream-redriver-v3-1-988c560e2195@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601-topic-sm8x50-upstream-redriver-v3-1-988c560e2195@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 13/06/2023 16:50, Neil Armstrong wrote:
> Document bindings for this ON Semiconductor Type-C USB SuperSpeed
> and DisplayPort ALT Mode Linear Redriver.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

