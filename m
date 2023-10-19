Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E2E7CFF2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 18:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345139AbjJSQLd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 12:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235449AbjJSQL3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 12:11:29 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5820130
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 09:11:26 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32d80ae19f8so6277648f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697731885; x=1698336685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Okldv9hZ54B+G0kuiw5hRod4eG8R+B5eCHg41GgfuYk=;
        b=K5zgwdmxVNoHmLgOwoGFsbyOnn+WBZ2h8VoHvY88h2OyW0T9hCFkQf43dEYTwNoGTr
         2O9nuVSOh0RaT4PtHvRA7wtVuXgncgogHCXo9NPLmlMEbXCp2E7SIXNtP0QYPp9udQb6
         ReW71Q6cwZtwq7tZX4sNFIyO/JMEDMHuGCb1+ziILGBRVip7hXf2J1J62NL844FjiYC/
         Yu1EICCxwbUj4P0tmXWioCcRSkrC+e+gCLQIRMLTgS8EtjM7xecK7uVGG1Lya9VdIeAQ
         eFMASX4iG3e9wPJu6F8C6rG4gjDIRW1d0qdq2RLY0W+PMy9XoSUOehMAEzVUGa4VqjWh
         wgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697731885; x=1698336685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Okldv9hZ54B+G0kuiw5hRod4eG8R+B5eCHg41GgfuYk=;
        b=R7ads9Qy1Mvq47Q+QkkfqhiRH3IYtZqGGkIW687mToGTLyI/84UrysM/xe70mG+Ks3
         4E4vlbJY031MmEAdi7UboMH9phMkvuwVppt6GnYo3RWYfJI/8pjsVUoNEDYnoHoKOIC4
         MDhTHyuH02SRwTjrYVAsZUP0NaYydJdlVGRVIWb6ReqS5bDdNSkhF4wUcN3fFSa2OAX/
         G8/8dFH3SajCSgOuFNdvHfZl7kuLkkzyKHNL04Z33JCdKg4fOnK8aY4Zi2PTW5e7AQK1
         +Z527TxJ67fkYL1hG2SEI5QRP6s8qx9UkA2/jvWD8tASkvCqjvkXl5yWQfhvCfgH0Tqf
         ibXw==
X-Gm-Message-State: AOJu0YyWzpbOPF4s4uGGa2xASERw3cOqx1w2SsqyWNGddfB1ZFKqUpAC
        cc1bX7bt8nN6qT0GpnSDxQlxxQ==
X-Google-Smtp-Source: AGHT+IHbCqiAIMmFl08/akkHQAdhgxFvzRCdX7jUwWZGSb4sVsmqsz8K8QqgmI6nhLO4ow5ds48WSQ==
X-Received: by 2002:a05:6000:1102:b0:32d:81f7:43e4 with SMTP id z2-20020a056000110200b0032d81f743e4mr1988393wrw.51.1697731884913;
        Thu, 19 Oct 2023 09:11:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:6dcf:7c4b:2bce:3cb2? ([2a05:6e02:1041:c10:6dcf:7c4b:2bce:3cb2])
        by smtp.googlemail.com with ESMTPSA id a14-20020adfe5ce000000b003296b488961sm4802109wrn.31.2023.10.19.09.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 09:11:24 -0700 (PDT)
Message-ID: <dc72872b-24e3-47bc-af9b-4f1c0257f15c@linaro.org>
Date:   Thu, 19 Oct 2023 18:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/qcom/tsens: drop ops_v0_1
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20231019144311.1035181-1-dmitry.baryshkov@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231019144311.1035181-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/10/2023 16:43, Dmitry Baryshkov wrote:
> Since the commit 6812d1dfbca9 ("thermal/drivers/qcom/tsens-v0_1: Fix
> mdm9607 slope values") the default v0.1 implementation of tsens options
> is unused by the driver. Drop it now to stop compiler complaining about
> the unused static const. If the need for the default v0.1 ops struct
> arives, this commit can be easily reverted without further
> considerations.
> 
> Fixes: 6812d1dfbca9 ("thermal/drivers/qcom/tsens-v0_1: Fix mdm9607 slope values")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

