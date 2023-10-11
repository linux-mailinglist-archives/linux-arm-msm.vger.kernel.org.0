Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30E7F7C5235
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 13:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234778AbjJKLfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 07:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234834AbjJKLfh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 07:35:37 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F2893
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:35:35 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c012232792so83748701fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697024134; x=1697628934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9KBqo9sUaaIeq2eS6WxMJ21+iTCVV6G7DUNCrNfoNHw=;
        b=zHVjRcDphPzJ9/o4VsD9nDgdW6CCUCDP6b0EN/Ed5VyJozB0XVZUCaprye1UCGCIgu
         6n1trpe31OaCRRQiXU0enTq7Rf2iGdJDfopMuixkAPqQqcumqHvh0chcNFynfs4xsL4E
         3fnMqs/UNXWkCEVzuuaUQrV/r7Q+05NLIUqg01OvMb0jHpMb1NFDLBKFqVrXvfPp5hWP
         nG8aCmF43E2NDrKmjbOz3AecMb0MdPdhyDfcal/ZdKKpPsOTiq+4FvUgDOirFeaZanvv
         uwOs0/BvCYqny3VnKQ5IjJBv5Wr4vNv392mxVqs1AT2n4SxvT3trEwFtJCKOTzC6Jx+x
         UTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697024134; x=1697628934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KBqo9sUaaIeq2eS6WxMJ21+iTCVV6G7DUNCrNfoNHw=;
        b=grR1ka8Nq7sGe0fvgXzwbmp2Yto1N2tfvdQsu/W2WIkTTKKIHHXVjvBiodi817NU2x
         zduKfmjDHGk4V6MZD5uFipzo7jbVAqOQUx6TZ1teXvd+pLYFZ2Nm6M18FaSaBAQ45sb/
         394HpCNwblH2Buw0uTkLEw0vofGGxwgO8b1nhWnkSEgr9wvLcITF1o8idWvke2FxBwEA
         Rcto1iWNOx7qq1G4JsJGml0g0APpgmxoGkirKUDfckrLLNfQnOXrXiAuZMHLU5hAzZRk
         J6IhwD1MWJiifT4Uaz9DvoxNG1aTkGZHOQ2urPUG+AnW+X4/X/ApHNPewp+wGEmV0wsq
         Pgwg==
X-Gm-Message-State: AOJu0YyeEXPaXDH9eO00hR4WA58gip5cn65NQTnATz1IUNJoAks64uzL
        VhgJbKpfDdjGtkzNgusMWE/qSyfEydNCBzXPa/g=
X-Google-Smtp-Source: AGHT+IHW+J6PRGt0JfgEVPGwtYvACOW1jf2O7QCJoaDm9aL0rZTciQIjadJGRkXGlL7dniI9Og9iaA==
X-Received: by 2002:a2e:3c19:0:b0:2c1:5645:2a45 with SMTP id j25-20020a2e3c19000000b002c156452a45mr20302202lja.3.1697024133787;
        Wed, 11 Oct 2023 04:35:33 -0700 (PDT)
Received: from [172.30.204.240] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c5-20020a2ea1c5000000b002bcbb464a28sm2882350ljm.59.2023.10.11.04.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 04:35:33 -0700 (PDT)
Message-ID: <88113ef7-5405-4c6e-83a9-3b4b87ad748b@linaro.org>
Date:   Wed, 11 Oct 2023 13:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/23 12:32, Dmitry Baryshkov wrote:
> Enable Qualcomm PMIC TCPM driver, it is used to handle Type-C ports on
> devices like Qualcomm Robotics RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
